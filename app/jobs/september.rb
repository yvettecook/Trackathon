Dashing.scheduler.every '2s' do

	Project.all.each do |project|
		id = project.id
		project_value = get_project_status(id)
		Dashing.send_event("project#{id}", { value: project_value })
	end

end

def get_project_status(id)

	project = Project.find_by(id: id)

	project_status = 0

	milestones = [project.product, project.design, project.frontdev, project.backdev, project.presentation]

	milestones.each do |milestone|
		project_status += 20 if milestone == true
	end

	return project_status
end
