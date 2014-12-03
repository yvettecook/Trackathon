require 'rails_helper'

describe 'multiple project widgets' do
  it "should display all of a hackathon's projects", js: true do
    september = Hackathon.create(name: "September", end_time: "2014-12-05 17:00:00 UTC")
    september.projects.create(name: "Yashing")
    september.projects.create(name: "Trackathon")
    september.projects.create(name: "Seans Jumper")
    visit "/hackathons/#{september.id}"
    expect(page.find('#project-progress-widget1 h1')).to have_content('Yashing')
    expect(page.find('#project-progress-widget2 h1')).to have_content('Trackathon')
    expect(page.find('#project-progress-widget3 h1')).to have_content('Seans Jumper')

  end
end
