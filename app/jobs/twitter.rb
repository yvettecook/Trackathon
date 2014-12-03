require 'twitter'

twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = Rails.application.secrets.twitter_consumer_key
  config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
  config.access_token = Rails.application.secrets.twitter_access_token
  config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
end

search_term = URI::encode('#septmakers')


Dashing.scheduler.every '5s', :first_in => 1 do |job|

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
