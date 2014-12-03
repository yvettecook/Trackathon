current_count = 0

Dashing.scheduler.every '2s' do
  last_count     = current_count
  current_count  =  current_count + rand(5)


  Dashing.send_event('counter', { current: current_count, last: last_count })
end
