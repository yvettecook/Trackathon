class AddHackathonIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :hackathon, index: true
  end
end
