require 'rails_helper'
require 'byebug'

describe "On the project view page" do
  before do
    @hello = Project.create(name: "Hello", product: false)
  end

  it "Should show the project name" do
    visit "/projects/#{@hello.id}"
    expect(page).to have_content 'Hello'
  end

  it "Should show the project milestones" do
    visit "/projects/#{@hello.id}"
    expect(page).to have_content 'Design'
  end

  it "should have a checkbox" do
    visit "/projects/#{@hello.id}"
    expect(page).to have_css("#product")
  end

  it "the checkbox starts off unchecked" do
    visit "/projects/#{@hello.id}"
    expect(find(:css, "#product[value='product']").checked?). to eq nil
  end

  it "should be able to check a checkbox" do
    visit "/projects/#{@hello.id}"
    check("product")
    expect(find(:css, "#product[value='product']").checked?).to eq "checked"
  end

  xit "Should save the value of the checkbox to the database", js: true do
    visit "/projects/#{@hello.id}"
    find('#product').trigger('click')
    expect(Project.find_by_name('Hello').product).to eq true
  end

end
