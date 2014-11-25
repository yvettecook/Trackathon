require 'rails_helper'

describe "On the project view page" do
  before do
    @hello = Project.create(name: "Hello")
  end

  it "Should show the project name" do
    visit "/projects/#{@hello.id}"
    expect(page).to have_content 'Hello'
  end

  it "Should show the project milestones" do
    visit "/projects/#{@hello.id}"
    expect(page).to have_content 'Design'
  end

end
