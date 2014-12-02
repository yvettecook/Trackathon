#!/bin/bash
echo "**************"
echo "Tests starting"
echo "**************"

rspec spec/features/hackathon_start_feature_spec.rb
rspec spec/features/homepage_feature_spec.rb
rspec spec/features/new_project_feature_spec.rb
rspec spec/features/user_management_spec.rb
rspec spec/features/dashboard/multiple_projects_feature_spec.rb
rspec spec/features/dashboard/widgets/new_project_link_widget_spec.rb
rspec spec/features/dashboard/widgets/new_project_widget_spec.rb
rspec spec/features/dashboard/widgets/project_progress_link_widget_spec.rb
rspec spec/features/dashboard/widgets/project_progress_widget_spec.rb
rspec spec/features/dashboard/widgets/timer_widget_spec.rb
rspec spec/features/dashboard/widgets/update_project_widgets_spec.rb
rspec spec/features/dashboard/widgets/welcome_widget_spec.rb
rspec spec/features/project_view_page/projects_milestones_feature_spec.rb
rspec spec/features/project_view_page/projects_milestones_feature_spec_two.rb
rspec spec/features/project_view_page/project_view_page_spec.rb


echo "**************"
echo "Tests finished"
echo "**************"
