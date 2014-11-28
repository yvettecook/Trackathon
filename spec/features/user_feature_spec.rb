require 'rails_helper'

describe 'The user journey' do

  context 'on the homepage the user' do
    before do
      Hackathon.create(name: "September", end_time: "2014-12-05 17:00:00 UTC")
      visit '/'
    end

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

end
