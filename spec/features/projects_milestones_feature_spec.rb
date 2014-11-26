require 'rails_helper'
require 'byebug'

describe 'On the project view page' do
  before do
    @hello = Project.create(name: "Hello") 
  end

  context 'A single project' do
    it 'should show the project name' do
      visit "/projects/#{@hello.id}"
      expect(page).to have_content 'Hello'
    end

    it 'should show the project milestones' do
      visit "/projects/#{@hello.id}"
      expect(page).to have_content 'Design'
    end

    it 'should have a checkbox' do
      visit "/projects/#{@hello.id}"
      expect(page).to have_css("#product")
    end

    it 'the checkbox starts off unchecked' do
      visit "/projects/#{@hello.id}"
      expect(find(:css, "#product[value='product']").checked?). to eq nil
    end

    it 'should be able to check a checkbox' do
      visit "/projects/#{@hello.id}"
      check("product")
      expect(find(:css, "#product[value='product']").checked?).to eq "checked"
    end

    it 'should save the value of the product checkbox to the database', js: true do
      visit "/projects/#{@hello.id}"
      check("product")
      wait_for_ajax
      expect(Project.find_by_name('Hello').product).to eq true
    end

    it 'should save the value of the design checkbox to the database', js: true do
      visit "/projects/#{@hello.id}"
      check("design")
      wait_for_ajax
      expect(Project.find_by_name('Hello').design).to eq true
    end

    it 'should save the value of the frontdev checkbox to the database', js: true do
      visit "/projects/#{@hello.id}"
      check("frontdev")
      wait_for_ajax
      expect(Project.find_by_name('Hello').frontdev).to eq true
    end

    it 'should save the value of the backdev checkbox to the database', js: true do
      visit "/projects/#{@hello.id}"
      check("backdev")
      wait_for_ajax
      expect(Project.find_by_name('Hello').backdev).to eq true
    end

    it 'should save the value of the presentation checkbox to the database', js: true do
      visit "/projects/#{@hello.id}"
      check("presentation")
      wait_for_ajax
      expect(Project.find_by_name('Hello').presentation).to eq true
    end
  end

  context "multiple projects" do
    it "checking one project's box shouldn't affect another's", js: true do
      @new = Project.create(name: "New Project")
      visit "/projects/#{@new.id}"
      expect(page).to have_content "New Project"
      check("product")
      wait_for_ajax
      expect(Project.find_by_name('New Project').product).to eq true
      expect(Project.find_by_name('Hello').product).to eq false
    end

  end

end
