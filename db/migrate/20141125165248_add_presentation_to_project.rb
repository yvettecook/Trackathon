class AddPresentationToProject < ActiveRecord::Migration
  def change
    add_column :projects, :presentation, :boolean
  end
end
