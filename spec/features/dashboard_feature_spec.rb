require 'rails_helper'

describe 'On the dashboard page' do



  context 'welcome widget' do

    it 'should have welcome widget' do
      Hackathon.create(name: :september, id: 1 )
      visit '/hackathons/1'
      expect(page).to have_css('#welcome-widget')
    end

    it 'should have a title of hello' do
      Hackathon.create(name: :september, id: 1 )
      visit '/hackathons/1'
      expect(page).to have_css('#welcome-widget[data-title="Hello September"]')
    end

  end


end
