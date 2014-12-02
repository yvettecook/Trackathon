require 'rails_helper'

describe 'updating project widgets' do

	let!(:september){Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")}
	let!(:trackathon){september.projects.create(name: "Trackathon", product: true)}

	# before do
	# 	trackathon.update(product: true)
	# end

	context "project progress widget", js: true do

		it 'displays current project completion percentage' do
			visit "/hackathons/#{september.id}"
			# time = Time.now
			# wait = Selenium::WebDriver::Wait.new(:timeout => 5)
			# wait.until { Time.now == time + 4 }
			expect(page.find("#project-progress-widget1 .project").value).to eq '20'
		end
	end
end
