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
    expect(page).to have_field 'project_description'
    expect(page).to have_field 'project_gitrepo'
  end

end

describe "Filling in form" do

  before do
    @september = Hackathon.create(name: 'September', end_time: "2014-12-05 17:00:00 UTC")
    visit "/hackathons/#{@september.id}/projects/new"
    fill_in :project_name, with: 'Robot Army'
    fill_in :project_description, with: 'Snozzas barmy army'
    fill_in :project_gitrepo, with: 'https://github.com/Schlap/project-noderover'
    click_button 'Create'
  end


  it 'creates a new project' do
    expect(Project.all.count).to eq 1 
  end

  it "should redirect to the project view page when a project's created" do
    expect(current_path).to eq '/projects/2'
  end

  it 'should show the project name' do
    expect(page).to have_content 'Robot Army'
  end

  it 'should show the project description' do
    expect(page).to have_content 'Snozzas barmy army'
  end

end