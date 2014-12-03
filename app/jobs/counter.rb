current_count = 0
beer_current_count = 0

Dashing.scheduler.every '2s' do
  last_count     = current_count
  current_count  = current_count + rand(5) 

  Dashing.send_event('counter', { current: current_count, last: last_count })

end


Dashing.scheduler.every '3s' do
  beer_last_count     = beer_current_count
  beer_current_count  = rand(100)
  Dashing.send_event('beer', { current: beer_current_count, last: beer_last_count })
end
