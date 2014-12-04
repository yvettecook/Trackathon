require 'net/http'
require 'json'

# repos = []
# hackathon = Hackathon.last
# hackathon.projects.each do |project|
#   repo = {}
#   url = project.gitrepo.split('/')
#   repo[:owner] = url[3]
#   repo[:name] = url[4]
#   repos.push(repo)
# end
#
#
# repo_info = Hash.new{}
# total_lines = 0
#
#   Dashing.scheduler.every '60s' do
#
#     repos.each do |repo|
#
#       response = Net::HTTP.get(URI("https://api.github.com/repos/#{repo[:owner]}/#{repo[:name]}/stats/code_frequency?access_token=244b19a62812ffda9640451deb1dbc87c14d618b"))
#       data = JSON.parse(response)
#
#       number = 0
#
#       data.each do |week|
#         number += week[1] if week[1]
#         number += week[2] if week[2]
#       end
#
#       name = repo[:name]
#
#       repo_info[name] = { label: name, value: number }
#
#     Dashing.send_event('gitlines', { items: repo_info.values })
#
#   end
#
#
# end
