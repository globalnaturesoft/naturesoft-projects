class CreateNaturesoftProjectsImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_projects_images do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :status, :default => "active"
      t.boolean :is_main, :default => false
      t.references :user, references: :naturesoft_users, index: true
      t.references :project, references: :naturesoft_projects_projects, index: true

      t.timestamps
    end
  end
end
