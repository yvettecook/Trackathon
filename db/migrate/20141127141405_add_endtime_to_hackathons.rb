class AddEndtimeToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :end_time, :datetime
  end
end
