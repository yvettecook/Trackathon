require 'rails_helper'


describe 'On the dashboard page' do

  before do
    @september = Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")
    @september.projects.create(name: 'Trackathon')
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

    it 'should be able to read the time from the database' do
      expect(@september.end_time).to eq "05-Dec-2014 17:00:00"
    end

    it 'should exctract the finish time of the hackathon from the database ' do
      expect(page).to have_css('[data-end="2014-12-05 17:00:00 UTC"]')
    end

  end

  context 'project progress widget' do

    it 'should have a project progress widget' do
      expect(page).to have_css('#project-progress-widget')
    end

    # it 'display the title of the widget on the screen', js: true do
    #   expect(page.find('#project-progress-widget h1')).to have_content('Trackathon')
    # end

    xit 'should display the completed project percentage', js: true do
      expect(page).to have_css('#project-progress-widget input.project[data-bind-value="20"]')
    end

    xit 'should display the project name from the database', js: true do
      expect(page.find('#project-progress-widget h1')).to have_content('Trackathon')
    end

    it 'should display the starting project percentage', js: true do
      expect(page.find('#project-progress-widget .project').value).to eq('0')
    end

  end

end

xdescribe 'Timecop tests for countdown widget' do

  let(:hackathon) { Hackathon.create(name: "september", end_time: "05-Dec-2014 17:00:00") }

  before do
    visit "/dashing/dashboards/september"
  end

  before do
    Timecop.travel(Time.local(2014, 11, 26, 10, 38, 0))
  end

  after do
    Timecop.return
  end

  it 'should display the time remaining for the hackathon', js: true do
    expect(page.find('#countdown-widget h1')).to have_content('Time remaining')
    # expect(page).not_to have_errors
  end

end


