require 'rails_helper'

describe "New project page" do

  before do
    @september = Hackathon.create(name: 'September')
    visit "/hackathons/#{@september.id}/projects/new"
  end

  it 'visiting the new project page' do
    expect(page).to have_content 'Project name'
  end

  it 'has a new project form' do
    expect(page).to have_field 'project_name'
  end

  it 'creates a new project' do
    fill_in :project_name, with: 'Robot Army'
    click_on 'Create'
    expect(Project.all.count).to eq 1 
  end

end