class CreateScriniumEsmExperimentSpecs < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiment_specs do |t|
      t.belongs_to :comparison_project, index: true
      t.string     :name,               index: true, null: false
      t.string     :short_name,         index: true, null: false
      t.string     :description
      t.integer    :contact_id,                      null: false
      t.integer    :organization_id
      t.string     :logo

      t.timestamps null: false
    end
  end
end
