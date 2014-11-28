require 'rails_helper'

describe 'The user journey' do

  context 'on the homepage the user' do

    it 'should see Welcome to the Hackathon Tracker' do
      visit '/'
      expect(page).to have_content 'Welcome to the Hackathon Tracker'
    end

    it 'should see link to create a new Hackathon' do
      visit '/'
      expect(page).to have_link 'New Hackathon'
    end

  end

end
