require 'rails_helper'  

  describe 'The project page' do

    before do
      @hackathon = Hackathon.create(name: "September", end_time: "2014-12-05 17:00:00 UTC")
      visit '/'
    end

    it 'has a link to the hackathon dashboard' do
      @project = Project.create(name: "Pringle", hackathon_id: "#{@hackathon.id}")
      visit "/projects/#{@project.id}"
      expect(page).to have_link 'Hackathon dashboard'
    end

    it 'redirects to the hackathon dashboard when clicked', js: true do
      @project = Project.create(name: "Pringle", hackathon_id: "#{@hackathon.id}")
      visit "/projects/#{@project.id}"
      click_link 'Hackathon dashboard'
      expect(page.find("#project-progress-widget#{@project.id} h1")).to have_content('Pringle')
    end

end