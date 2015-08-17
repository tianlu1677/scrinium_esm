class CreateScriniumEsmExperiments < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiments do |t|
      t.string :name
      t.text :description
      t.integer :contact_id
      t.references :experimentable, polymorphic: true
      t.integer :action_types, array: true, default: []
      t.text :action_subjects, array: true, default: []

      t.timestamps null: false
    end

    add_index :scrinium_esm_experiments, [
      :experimentable_type, :experimentable_id
    ], name: :esm_exp_model_type_and_model_id
  end
end
