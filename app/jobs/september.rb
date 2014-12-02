Dashing.scheduler.every '1s' do

	Project.all.each do |project|
		id = project.id
		project_value = get_project_status(id)
		Dashing.send_event("project#{id}", { value: project_value })
	end

end

def get_project_status(id)

	project = Project.find_by(id: id)

	project_status = 0

	milestones = [project.product, project.design, project.frontdev, project.backdev, project.presentation]

	milestones.each do |milestone|
		project_status += 20 if milestone == true
	end

	return project_status
end



require 'twitter'
#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
	config.consumer_key = 'W7KEItDGKLjM6zWoNOPdIYdPP'
	config.consumer_secret = 'UrUFLMkigqw6U1pz3hYC9MMW4OGjOwwtsCNmjzTpbxz618Ex9s'
	config.access_token = '122639798-4Nga2ptCMZmruyY3c6WNnxM4HrCQGJDezlAsiZvJ'
	config.access_token_secret = '0nYttdbRztAuTuTKwz38OOd0j7039Jw6kgArEp2Mbm2CI'
end

search_term = URI::encode('@makersacademy')

# Dashing.scheduler.every '5s', :first_in => 0 do |job|
Dashing.scheduler.every '20s' do

	begin
		tweets = twitter.search("#{search_term}")

		if tweets
			tweets = tweets.map do |tweet|
				{ name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
			end
			Dashing.send_event('twitter_mentions', comments: tweets)
		end

	rescue Twitter::Error
		puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
	end

end
