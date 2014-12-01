require 'rails_helper'

describe 'Link between dashboard and project view page' do

  before do
    @september = Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")
    @project = @september.projects.create(name: 'Trackathon')
    visit "/hackathons/#{@september.id}"
  end

  it 'should have a link to the project page', js: true do
    expect(page).to have_css('#project_view')
  end

  it 'should redirect to the project view page when clicked', js: true do
    click_link('project_view')
    expect(page).to have_css('#project_link[onclick]')
  end

  it 'should redirect to the project view page when clicked', js: true do
    find('#project_link[onclick]').click
    expect(current_path).to eq "/projects/#{@project.id}"
  end

end

