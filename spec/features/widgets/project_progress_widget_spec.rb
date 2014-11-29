require 'rails_helper'


describe 'Project progress widget' do

  before do
    @september = Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")
    @september.projects.create(name: 'Trackathon')
    visit "/hackathons/#{@september.id}"
  end

    it 'should have a project progress widget' do
      expect(page).to have_css('#project-progress-widget')
    end

    # it 'display the title of the widget on the screen', js: true do
    #   expect(page.find('#project-progress-widget h1')).to have_content('Trackathon')
    # end

    xit 'should display the completed project percentage', js: true do
      expect(page).to have_css('#project-progress-widget input.project[data-bind-value="20"]')
    end

    xit 'should display the project name from the database', js: true do
      expect(page.find('#project-progress-widget h1')).to have_content('Trackathon')
    end

    it 'should display the starting project percentage', js: true do
      expect(page.find('#project-progress-widget .project').value).to eq('0')
    end

end