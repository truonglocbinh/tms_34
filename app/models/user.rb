class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :remember_token
  enum role: [:trainee, :supervisor, :admin]
  has_many :activities, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks


  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  before_save :downcase_email
  has_secure_password

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(self.remember_token)
  end

  def authenticated? attribute_token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    self.remember_token = nil
    update_attributes remember_digest: nil
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
