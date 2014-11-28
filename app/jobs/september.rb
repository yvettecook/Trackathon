Dashing.scheduler.every '1s' do
	project_value = get_project_status
  Dashing.send_event('project', { value: project_value })
end

def get_project_status
	project = Project.last.product
	return 0 if project.nil? || project == false
	return 20 if !project.nil?
end