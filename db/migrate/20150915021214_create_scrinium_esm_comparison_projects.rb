class CreateScriniumEsmComparisonProjects < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_comparison_projects do |t|
      t.string :name, index: true
      t.string :short_name, index: true
      t.text :description
      t.integer :contact_id
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
