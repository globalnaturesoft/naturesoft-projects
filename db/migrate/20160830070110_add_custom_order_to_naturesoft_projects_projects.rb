class AddCustomOrderToNaturesoftProjectsProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_projects_projects, :custom_order, :integer, default: 0
  end
end
