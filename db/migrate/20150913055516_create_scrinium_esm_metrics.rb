class CreateScriniumEsmMetrics < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_metrics do |t|
      t.string :name, index: true
      t.string :short_name, index: true
      t.text :description
      t.integer :contact_id
      t.integer :organization_id
      t.string :logo

      t.timestamps null: false
    end
  end
end
