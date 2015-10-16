class CreateScriniumEsmExperimentSpecs < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiment_specs do |t|
      t.belongs_to :comparison_project, index: true
      t.string :name, index: true
      t.string :short_name, index: true
      t.string :description
      t.integer :contact_id
      t.integer :organization_id
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
