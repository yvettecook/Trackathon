require 'rails_helper'

  describe 'Welcome widget' do

  before do
    @september = Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")
    @september.projects.create(name: 'Trackathon')
    visit "/hackathons/#{@september.id}"
  end

    it 'should have welcome widget' do
      expect(page).to have_css('#welcome-widget')
    end

    it 'should have a title of hello' do
      save_and_open_page
      expect(page).to have_css('#welcome-widget[data-title="Hello September"]')
    end

end
