require 'rails_helper'

describe 'on the dashboard page' do

	let!(:september){Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")}

	before do
		september.projects.create(name: "Drone Army")
		visit "/hackathons/#{september.id}"
	end

	context 'create project widget' do

		it 'should have a widget that links to the create project page' do
			expect(page).to have_css('#new-project-widget')
		end

		it 'should have a title of new project' do
			expect(page).to have_css('#new-project-widget[data-title="Add a New Project"]')
		end

		it 'should display the title of the widget', js: true do
			expect(page.find('#new-project-widget h1')).to have_content('Add a New Project')
		end

	end

end
