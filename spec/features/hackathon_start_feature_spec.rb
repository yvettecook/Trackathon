require 'rails_helper'

describe 'creating a new hackathon' do

	it 'visiting the new hackethon page' do
		visit 'hackathons/new'
    expect(page).to have_content 'Create Your Hackathon'
  end

  it 'has a new hackathon form' do
  	visit 'hackathons/new'
    expect(page).to have_field 'hackathon_name'
  end


	end