require 'net/http'
require 'json'

repos = [{owner: "yvettecook", name: "trackathon"}, {owner: "annaschechter", name: "stack-overtube-back-end"}, {owner: "MadameSardine", name: "pandapop"}]

total_lines = 0

repos.each do |repo|
  response = Net::HTTP.get(URI("https://api.github.com/repos/#{repo[:owner]}/#{repo[:name]}/stats/code_frequency"))
  data = JSON.parse(response)

  number = data[0][1] + data[0][2] + data[1][1] + data[1][2]
  
  total_lines += number
end

puts total_lines

