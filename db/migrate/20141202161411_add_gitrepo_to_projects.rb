class AddGitrepoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :gitrepo, :text
  end
end
