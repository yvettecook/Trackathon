class AddFrontdevToProject < ActiveRecord::Migration
  def change
    add_column :projects, :frontdev, :boolean
  end
end
