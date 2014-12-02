require 'rails_helper'

describe "New project page" do

  before do
    @september = Hackathon.create(name: 'September', end_time: "2014-12-05 17:00:00 UTC")
    visit "/hackathons/#{@september.id}/projects/new"
  end

  it 'visiting the new project page' do
    expect(page).to have_content 'Name'
  end

  it 'has a new project form' do
    expect(page).to have_field 'project_name'
  end

  it 'creates a new project' do
    fill_in :project_name, with: 'Robot Army'
    save_and_open_page
    click_button 'create'
    save_and_open_page
    expect(Project.all.count).to eq 1 
  end

  it "should redirect to the project view page when a project's created" do
    fill_in :project_name, with: 'Robot Army'
    click_button 'Create'
    expect(current_path).to eq '/projects/2'
  end

end