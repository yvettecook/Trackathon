#!/bin/bash
echo "**************"
echo "Tests starting"
echo "**************"

rspec spec/features/hackathon_start_feature_spec.rb
rspec spec/features/multiple_projects_feature_spec.rb
rspec spec/features/project_start_feature_spec.rb
rspec spec/features/projects_milestones_feature_spec.rb
rspec spec/features/projects_milestones_feature_spec_two.rb
rspec spec/features/user_feature_spec.rb
rspec spec/features/widgets/new_project_link_widget_spec.rb
rspec spec/features/widgets/new_project_widget_spec.rb
rspec spec/features/widgets/project_progress_link_widget_spec.rb
rspec spec/features/widgets/project_progress_widget_spec.rb
rspec spec/features/widgets/timer_widget_spec.rb
rspec spec/features/widgets/update_project_widgets_spec.rb
rspec spec/features/widgets/welcome_widget_spec.rb


echo "**************"
echo "Tests finished"
echo "**************"
