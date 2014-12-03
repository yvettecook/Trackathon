require 'rails_helper'  

  describe 'The project page' do

    before do
      @hackathon = Hackathon.create(name: "September", end_time: "2014-12-05 17:00:00 UTC")
      @hello = @hackathon.projects.create(name: "Hello")
      visit "/projects/#{@hello.id}"
    end

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

    it 'has a link to the hackathon dashboard' do
      expect(page).to have_link 'Hackathon dashboard'
    end

    it 'redirects to the hackathon dashboard when clicked', js: true do
      click_link 'Hackathon dashboard'
      expect(page.find("#project-progress-widget#{@hello.id} h1")).to have_content('Hello')
    end

end