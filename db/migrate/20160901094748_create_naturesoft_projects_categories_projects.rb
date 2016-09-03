class CreateNaturesoftProjectsCategoriesProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_projects_categories_projects do |t|
      t.references :category, index: true, references: :naturesoft_projects_categories
      t.references :project, index: true, references: :naturesoft_projects_projects

      t.timestamps
    end
  end
end
