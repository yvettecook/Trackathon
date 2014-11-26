require 'rails_helper'

describe 'On the dashboard page' do

  context 'welcome widget' do

    before do
      Hackathon.create(name: :september, id: 1 )
    end

    it 'should have welcome widget' do
      visit '/hackathons/1'
      expect(page).to have_css('#welcome-widget')
    end

    it 'should have a title of hello' do
      visit '/hackathons/1'
      expect(page).to have_css('#welcome-widget[data-title="Hello September"]')
    end

    it 'should have a clock widget' do
      visit 'hackathons/1'
      expect(page).to have_css('#clock-widget')
    end


  end


end
