class AddProductToProject < ActiveRecord::Migration
  def change
    add_column :projects, :product, :boolean
  end
end
