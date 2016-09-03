class CreateNaturesoftProjectsProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_projects_projects do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :status, :default => "active"
      t.references :user, references: :naturesoft_users, index: true

      t.timestamps
    end
  end
end
