class AddBackdevToProject < ActiveRecord::Migration
  def change
    add_column :projects, :backdev, :boolean
  end
end
