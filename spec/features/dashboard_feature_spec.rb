require 'rails_helper'

describe 'On the dashboard page' do
    before do
      @september = Hackathon.create(name: :september)
      visit "/hackathons/#{@september.id}"
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

describe 'Timecop tests for countdown widget' do

  before do
    @september = Hackathon.create(name: :september)
    visit "/hackathons/#{@september.id}"
  end

  before do
    Timecop.travel(Time.local(2014, 11, 26, 10, 38, 0))
  end

  after do
    Timecop.return
  end

  it 'should display the time remaining for the hackathon', js: true do
    expect(page).to have_content('Time remaining')
  end

end
