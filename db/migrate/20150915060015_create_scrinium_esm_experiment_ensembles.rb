class CreateScriniumEsmExperimentEnsembles < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiment_ensembles do |t|
      t.integer :experiment_id, null: false
      t.integer :member_id,     null: false

      t.timestamps null: false
    end
  end
end
