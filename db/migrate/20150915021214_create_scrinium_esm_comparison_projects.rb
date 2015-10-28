class CreateScriniumEsmComparisonProjects < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_comparison_projects do |t|
      t.string  :name,       index: true, null: false
      t.string  :short_name, index: true, null: false
      t.text    :description
      t.integer :contact_id,              null: false
      t.integer :organization_id
      t.string  :logo

      t.timestamps null: false
    end
  end
end
