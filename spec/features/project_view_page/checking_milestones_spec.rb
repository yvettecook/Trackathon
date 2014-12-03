require 'rails_helper'

describe 'Checking project milestones' do

  before do
    @hello = Project.create(name: "Hello")
    visit "/projects/#{@hello.id}"
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