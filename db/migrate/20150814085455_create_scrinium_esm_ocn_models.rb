class CreateScriniumEsmOcnModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_ocn_models do |t|
      t.string :name
      t.string :short_name
      t.integer :contact_id
      t.string :repository_url
      t.text :description
      t.string :affiliation
      t.integer :simulation_region
      t.integer :simulation_type
      # Atmosphere model specific columns.
      t.integer :horizontal_mesh
      t.integer :vertical_coordinate
      t.integer :vertical_mesh
      t.string  :dynamical_core_scheme
      t.string  :advection_scheme

      t.timestamps null: false
    end
    ScriniumEsm::OcnModel.create_translation_table!({
      description: :string
    })
  end
  def down
    drop_table :scrinium_esm_ocn_models
    ScriniumEsm::OcnModel.drop_tranlation_table!
  end
end
