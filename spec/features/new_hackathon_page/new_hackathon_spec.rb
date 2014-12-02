require 'rails_helper'

describe 'creating a new hackathon form' do

	before do
		visit 'hackathons/new'
	end

	it 'visiting the new hackethon page' do
    expect(page).to have_content 'Create Your Hackathon'
  end

  it 'has a new hackathon form' do
    expect(page).to have_field 'hackathon_name'
  end

  it 'has a date time form for hackathon' do
    expect(page).to have_content 'End time'
  end

  context 'selecting and filling out the form' do

  	it 'create a hackathon' do
  		fill_in "Name", with: "Hackathon awesome"
  		select "2014", from: "hackathon[end_time(1i)]"
  		select "December", from: "hackathon[end_time(2i)]"
  		select "5", from: "hackathon[end_time(3i)]"
  		select "17", from: "hackathon[end_time(4i)]"
  		select "00", from: "hackathon[end_time(5i)]"
  		click_button "Create Hackathon"
  	end

  end

end