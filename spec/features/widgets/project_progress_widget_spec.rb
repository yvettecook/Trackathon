require 'rails_helper'


describe 'Project progress widget' do

  before do
    @september = Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")
    @september.projects.create(name: 'Trackathon')
    visit "/hackathons/#{@september.id}"
  end

    it 'should have a project progress widget' do
      expect(page).to have_css('#project-progress-widget1')
    end

    xit 'should display the completed project percentage', js: true do
      expect(page).to have_css('#project-progress-widget1 input.project[data-bind-value="20"]')
    end

    it 'should display the project name from the database', js: true do
      expect(page.find('#project-progress-widget2 h1')).to have_content('Trackathon')
    end

    it 'should display the starting project percentage', js: true do
      expect(page.find('#project-progress-widget1 .project').value).to eq('0')
    end

end