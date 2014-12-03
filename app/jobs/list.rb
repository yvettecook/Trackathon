require 'net/http'
require 'json'

repos = [{owner: "yvettecook", name: "trackathon"}, {owner: "jamesascarter", name: "stack-overtube-frontend"}, {owner: "MadameSardine", name: "pandapop"}, {owner: "Schlap", name: "project-noderover"}, {owner: "Scully87", name: "FATS_badgr"}]

repo_info = Hash.new{}

  Dashing.scheduler.every '5s' do

    repo = repos.sample
      response = Net::HTTP.get(URI("https://api.github.com/repos/#{repo[:owner]}/#{repo[:name]}/stats/code_frequency?client_id=2e1dfe8b2f7b1c3608a6?client_secret=09f3b23d695d1ae79a174adb37d1e21a548f772b"))
      data = JSON.parse(response)

      number = 0

      data.each do |week|
        puts week[1]
        puts week[2]
        # number += week[1]
        # number += week[2]
      end

      name = repo[:name]

      repo_info[name] = { label: name, value: number }



    Dashing.send_event('gitlines', { items: repo_info.values })
    # buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }


end
