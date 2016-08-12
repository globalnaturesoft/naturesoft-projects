class CreateNaturesoftProjectsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_projects_categories do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.string :status, :default => "active"
      t.references :user, references: :naturesoft_users, index: true

      t.timestamps
    end
  end
end
