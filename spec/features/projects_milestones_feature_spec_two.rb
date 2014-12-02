require 'rails_helper'
require 'byebug'

describe 'On the project view page 2' do

  before do
    @hello = Project.create(name: "Hello")
    visit "/projects/#{@hello.id}"
  end

  context 'A single project' do

    it 'should save the value of the frontdev checkbox to the database', js: true do
      check("frontdev")
      wait_for_ajax
      expect(Project.find_by_name('Hello').frontdev).to eq true
    end

    it 'should save the value of the backdev checkbox to the database', js: true do
      check("backdev")
      wait_for_ajax
      expect(Project.find_by_name('Hello').backdev).to eq true
    end

    it 'should save the value of the presentation checkbox to the database', js: true do
      check("presentation")
      wait_for_ajax
      expect(Project.find_by_name('Hello').presentation).to eq true
    end

  end

  context "multiple projects" do

    xit "checking one project's box shouldn't affect another's", js: true do
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
