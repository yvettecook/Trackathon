require 'rails_helper'
require 'byebug'

describe 'On the project view page 2' do

  before do
    @hello = Project.create(name: "Hello")
    visit "/projects/#{@hello.id}"
  end

  context "multiple projects" do

    it "checking one project's box shouldn't affect another's", js: true do
      @new = Project.create(name: "New Project")
      visit "/projects/#{@new.id}"
      expect(page).to have_content "New Project"
      check("product")
      wait_for_ajax
      expect(Project.find_by_name('New Project').product).to eq true
      expect(Project.find_by_name('Hello').product).to eq nil
    end

  end

end
