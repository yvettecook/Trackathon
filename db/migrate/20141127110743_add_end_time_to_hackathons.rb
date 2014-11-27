class AddEndTimeToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :endTime, :string
  end
end
