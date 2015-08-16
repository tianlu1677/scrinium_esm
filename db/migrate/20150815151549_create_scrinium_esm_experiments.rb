class CreateScriniumEsmExperiments < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiments do |t|
      t.string :name
      t.text :description
      t.integer :contact_id
      t.references :experimentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
