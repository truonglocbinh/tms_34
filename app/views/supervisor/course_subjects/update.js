<% if @not_supervisor.nil? %>
  $("tbody").html("")
  $("tbody").append("<%= escape_javascript(render @course_subjects) %>")
<% else %>
  $(".errors").addClass("alert alert-danger")
  $(".errors").html("<%= @not_supervisor %>")
<% end %>
