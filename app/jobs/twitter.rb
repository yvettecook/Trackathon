require 'twitter'


twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']

  # config.consumer_key = 'W7KEItDGKLjM6zWoNOPdIYdPP'
  # config.consumer_secret = 'UrUFLMkigqw6U1pz3hYC9MMW4OGjOwwtsCNmjzTpbxz618Ex9s'
  # config.access_token = '122639798-4Nga2ptCMZmruyY3c6WNnxM4HrCQGJDezlAsiZvJ'
  # config.access_token_secret = '0nYttdbRztAuTuTKwz38OOd0j7039Jw6kgArEp2Mbm2CI'

end

search_term = URI::encode('@makersacademy')

# Dashing.scheduler.every '5s', :first_in => 0 do |job|
Dashing.scheduler.every '1s' do

  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text }
      end
      p tweets
      Dashing.send_event('twitter_mentions', comments: tweets)
    end

  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end

end
