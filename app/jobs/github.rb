require 'net/http'
require 'json'

repos = [{owner: "yvettecook", name: "trackathon"}, {owner: "jamesascarter", name: "stack-overtube-frontend"}, {owner: "MadameSardine", name: "pandapop"}, {owner: "Schlap", name: "project-noderover"}, {owner: "Scully87", name: "FATS_badgr"}, {owner: "karinnielsen", name: "Final-Project-POSTit"}]

repos.each do |repo|
  response = Net::HTTP.get(URI("https://api.github.com/repos/#{repo[:owner]}/#{repo[:name]}/stats/code_frequency"))
  data = JSON.parse(response)

  number = 0
  data.each do |week|
  	number += (week[1] + week[2])
  end
  
  puts repo[:name] + ": total lines of code = " + number.to_s
end

