require 'rails_helper'

describe 'The user journey' do

  context 'on the homepage' do

    it 'the user should see Welcome to the Hackathon Tracker' do
      visit '/'
      expect(page).to have_content 'Welcome to the Hackathon Tracker'
    end

  end

end
