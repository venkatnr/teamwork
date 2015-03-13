
$('#project_users').html("<%= j render partial: 'project_members', locals: {project_members: @project_members, project: @project} %>");