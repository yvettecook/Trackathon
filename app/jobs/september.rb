Dashing.scheduler.every '1s' do
	project_value = get_project_status
  Dashing.send_event('project', { value: project_value })
end

def get_project_status
	project = Project.last
	product_status = project.product
	return 0 if product_status.nil? || product_status == false
	return 20 if product_status == true
end