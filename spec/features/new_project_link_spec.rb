require 'rails_helper'

describe 'on the dashboard page' do

	let!(:september){Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")}

	before do
		september.projects.create(name: "Drone Army")
	end

	context "create project widget" do

		it "should have a widget that links to the create project page" do
			visit "/hackathons/#{september.id}"
			expect(page).to have_css('#new-project-widget')
		end

	end

end