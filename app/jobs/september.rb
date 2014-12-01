# Dashing.scheduler.every '1s' do
# 	project_value = get_project_status
#   Dashing.send_event('project1', { value: project_value })
# end
#
#
# def get_project_status
# 	project = Project.last
#
# 	project_status = 0
#
# 	milestones = [project.product, project.design, project.frontdev, project.backdev, project.presentation]
#
# 	milestones.each do |milestone|
# 		project_status += 20 if milestone == true
# 	end
#
# 	return project_status
# end

Dashing.scheduler.every '1s' do
	
	Project.all.each do |project| 
		id = project.id
		project_value = get_project_status(id)
		Dashing.send_event("project#{id}", { value: project_value })
	end

	# project_value2 = get_project_status(2)
	# Dashing.send_event('project2', { value: project_value2 })
end

def get_project_status(id)

	project = Project.find_by(id: id)
	puts "***************"
	puts project
	puts project.product
	puts "***************"

	project_status = 0

	milestones = [project.product, project.design, project.frontdev, project.backdev, project.presentation]

	milestones.each do |milestone|
		project_status += 20 if milestone == true
	end

	return project_status
end
