require 'rails_helper'

describe "New project page" do

  before do
    @september = Hackathon.create(name: 'September')
  end

  it 'visiting the new project page' do
    visit "/hackathons/#{@september.id}/projects/new"
    expect(page).to have_content 'Project name'
  end

end