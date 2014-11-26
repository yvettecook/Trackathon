require 'rails_helper'

describe 'On the dashboard page' do
    before do
      Hackathon.create(name: :september, id: 1 )
      visit '/hackathons/1'
    end

  context 'welcome widget' do

    it 'should have welcome widget' do
      expect(page).to have_css('#welcome-widget')
    end

    it 'should have a title of hello' do
      expect(page).to have_css('#welcome-widget[data-title="Hello September"]')
    end

  end

  context 'countdown timer widget' do

    it 'should have a countdown widget' do
      expect(page).to have_css('#countdown-widget')
    end

    it 'should have a title of time remaining' do
      expect(page).to have_css('#countdown-widget[data-title="Time remaining"]')
    end

    it 'should have the finish time of the hackathon' do
      expect(page).to have_css('#countdown-widget[data-finishtime="05-Dec-2014 17:00:00"]')
    end

  end


end
