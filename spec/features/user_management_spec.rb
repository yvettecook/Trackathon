require 'rails_helper'

describe 'User management' do

	context "user not signed in and on the homepage" do

		it "should see 'sign in' and 'sign up' links" do
			visit '/'
			expect(page).to have_link 'Sign in'
			expect(page).to have_link 'Sign up'
		end

		it "should not see 'sign out' link" do
			visit '/'
			expect(page).not_to have_link 'Sign out'
		end

	end

	context "user signed in on the homepage" do

		before do
			visit '/'
			click_link 'Sign up'
			fill_in 'Email', with: "test@example.com"
			fill_in 'Password', with: "testpassword"
			fill_in 'Password confirmation', with: "testpassword"
			click_button 'Sign up'
		end

		it "should see 'sign out' link" do
			visit '/'
			expect(page).to have_link 'Sign out'
		end

		it "should not see 'sign in' and 'sign up' links" do
			visit '/'
			expect(page).not_to have_link 'Sign up'
			expect(page).not_to have_link 'Sign in'
		end
	end

end