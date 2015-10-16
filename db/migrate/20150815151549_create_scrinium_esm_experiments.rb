class CreateScriniumEsmExperiments < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiments do |t|
      t.string :name
      t.text :description
      t.integer :contact_id
      t.integer :organization_id
      t.string :experiment_type
      t.references :experimentable, polymorphic: true
      t.integer :log_ids, array: true, default: []

      t.timestamps null: false
    end

    add_index :scrinium_esm_experiments, [
      :experimentable_type, :experimentable_id
    ], name: :esm_exp_model_type_and_model_id
  end
end
