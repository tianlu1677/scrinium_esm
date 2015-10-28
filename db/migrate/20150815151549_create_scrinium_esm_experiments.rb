class CreateScriniumEsmExperiments < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiments do |t|
      t.string     :name,                  null: false
      t.text       :description
      t.integer    :contact_id,            null: false
      t.integer    :organization_id
      t.string     :experiment_type,       null: false
      t.references :experimentable, polymorphic: true, null: false
      t.integer    :log_ids, array: true, default: []

      t.timestamps null: false
    end

    add_index :scrinium_esm_experiments, [
      :experimentable_type, :experimentable_id
    ], name: :esm_exp_model_type_and_model_id
  end
end
