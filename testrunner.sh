#!/bin/bash
echo "**************"
echo "Tests starting"
echo "**************"

rspec spec/features/dashboard/multiple_projects_spec.rb
rspec spec/features/dashboard/widgets/new_project_link_widget_spec.rb
rspec spec/features/dashboard/widgets/new_project_widget_spec.rb
rspec spec/features/dashboard/widgets/project_progress_link_widget_spec.rb
rspec spec/features/dashboard/widgets/project_progress_widget_spec.rb
rspec spec/features/dashboard/widgets/timer_widget_spec.rb
rspec spec/features/dashboard/widgets/update_project_widgets_spec.rb
rspec spec/features/dashboard/widgets/welcome_widget_spec.rb
rspec spec/features/homepage/homepage_spec.rb
rspec spec/features/new_hackathon_page/new_hackathon_spec.rb
rspec spec/features/new_project_spec/new_project_spec.rb
rspec spec/features/project_view_page/checking_milestones_multi_project_spec.rb
rspec spec/features/project_view_page/checking_milestones_spec.rb
rspec spec/features/project_view_page/project_view_page_spec.rb
rspec spec/features/users/user_management_spec.rb

echo "**************"
echo "Tests finished"
echo "**************"
