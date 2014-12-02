require 'rails_helper'

describe 'on the dashboard page' do

  let!(:september){Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")}

  before do
    september.projects.create(name: "Drone Army")
    visit "/hackathons/#{september.id}"
  end

  it 'should have a link to the project page', js: true do
    expect(page).to have_css('#new-project[onclick]')
  end

  it 'should redirect to the new project page when clicked', js: true do
    find('#new-project[onclick]').click
    expect(current_path).to eq "/hackathons/#{@september.id}/projects/new"
  end

end