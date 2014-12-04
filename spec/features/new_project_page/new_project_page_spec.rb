require 'rails_helper'

describe 'New project page' do

  before do
    @september = Hackathon.create(name: 'September', end_time: "2014-12-05 17:00:00 UTC")
    visit "/hackathons/#{@september.id}/projects/new"
  end

  it 'visiting the new project page' do
    expect(page).to have_content 'Name'
  end

  it 'has a new project form' do
    expect(page).to have_field 'project_name'
    expect(page).to have_field 'project_description'
    expect(page).to have_field 'project_gitrepo'
  end

end
