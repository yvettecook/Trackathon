# :first_in sets how long it takes before the job is first run. In this case, it is run immediately



current_karma = 0

Dashing.scheduler.every '2s' do
  last_karma     = current_karma
  current_karma     = rand(200000)

  Dashing.send_event('karma', { current: current_karma, last: last_karma })
end