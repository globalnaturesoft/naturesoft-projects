class AddColumnsInvestorStartDateEndDateToNaturesoftProjectsProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_projects_projects, :investor, :string
    add_column :naturesoft_projects_projects, :start_date, :string
    add_column :naturesoft_projects_projects, :end_date, :string
  end
end
