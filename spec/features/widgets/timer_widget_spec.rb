require 'rails_helper' 

describe 'Timer widget' do

  let!(:september){Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC")}
  let!(:trackathon){september.projects.create(name: 'Trackathon')}

  before do
    visit "/hackathons/#{september.id}"
  end


    it 'should have a countdown widget' do
      expect(page).to have_css('#countdown-widget')
    end

    it 'should have a title of time remaining' do
      expect(page).to have_css('#countdown-widget[data-title="Time remaining"]')
    end

    it 'should be able to read the time from the database' do
      expect(september.end_time).to eq "05-Dec-2014 17:00:00"
    end

    it 'should exctract the finish time of the hackathon from the database ' do
      expect(page).to have_css('[data-end="2014-12-05 17:00:00 UTC"]')
    end

end


# describe 'Timecop tests for countdown widget' do
#
#   let(:hackathon) { Hackathon.create(name: "september", end_time: "2014-12-05 17:00:00 UTC") }
#
#   before do
#     visit "/dashing/dashboards/september"
#   end
#
#   before do
#     Timecop.travel(Time.local(2014, 11, 26, 10, 38, 0))
#   end
#
#   after do
#     Timecop.return
#   end
#
#   it 'should display the time remaining for the hackathon', js: true do
#     expect(page.find('#countdown-widget h1')).to have_content('Time remaining')
#     # expect(page).not_to have_errors
#   end
#
# end

