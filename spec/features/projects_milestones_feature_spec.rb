require 'rails_helper'
require 'byebug'

describe 'On the project view page' do

  before do
    @hello = Project.create(name: "Hello")
    visit "/projects/#{@hello.id}"
  end

  context 'A single project' do

    it 'should show the project name' do
      expect(page).to have_content 'Hello'
    end

    it 'should show the project milestones' do
      expect(page).to have_content 'Design'
    end

    it 'should have a checkbox' do
      expect(page).to have_css("#product")
    end

    it 'the checkbox starts off unchecked' do
      expect(find(:css, "#product[value='product']").checked?). to eq nil
    end

    it 'should be able to check a checkbox' do
      check("product")
      expect(find(:css, "#product[value='product']").checked?).to eq "checked"
    end

    it 'should save the value of the product checkbox to the database', js: true do
      check("product")
      wait_for_ajax
      expect(Project.find_by_name('Hello').product).to eq true
    end

    it 'should save the value of the design checkbox to the database', js: true do
      check("design")
      wait_for_ajax
      expect(Project.find_by_name('Hello').design).to eq true
    end


  end



end
