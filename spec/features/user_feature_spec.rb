require 'rails_helper'

describe 'The user journey' do

    before do
      @hackathon = Hackathon.create(name: "September", end_time: "2014-12-05 17:00:00 UTC")
      visit '/'
    end

  context 'on the homepage the user' do

    it 'should see Welcome to the Hackathon Tracker' do
      expect(page).to have_content 'Welcome to the Hackathon Tracker'
    end

    it 'should see link to create a new Hackathon' do
      expect(page).to have_link 'New Hackathon'
    end

    it 'should be taken to the new hackathons page when they click the link' do
      click_link 'New Hackathon'
      expect(current_path).to eq '/hackathons/new'
    end

    it 'should have a link for each hackathon' do
      expect(page).to have_link 'September'
    end

    it 'should take user to hackathon dashboard when they click on the link' do
      click_link 'September'
      expect(current_path).to eq "/dashing/dashboards/september"
    end

  end

  context 'The project page' do

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

end
