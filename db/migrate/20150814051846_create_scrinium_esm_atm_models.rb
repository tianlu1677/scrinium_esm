class CreateScriniumEsmAtmModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_atm_models do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.integer :contact_id
      t.integer :organization_id
      t.string :repository_url
      t.string :affiliation
      t.string :simulation_region
      t.string :simulation_type
      # Atmosphere model specific columns.
      t.boolean :is_hydrostatic
      t.boolean :is_shallow
      t.string :horizontal_mesh
      t.string :vertical_coordinate
      t.string :vertical_mesh
      t.string  :dynamical_core_scheme
      t.string  :advection_scheme
      t.string  :radiation_scheme
      t.string  :convection_scheme
      t.string  :microphysics_scheme
      t.string  :planet_boundary_layer_scheme
      t.string  :gravity_drag_scheme

      t.timestamps null: false
    end
    ScriniumEsm::AtmModel.create_translation_table!({
      description: :string
    })
  end
  def down
    drop_table :scrinium_esm_atm_models
    ScriniumEsm::AtmModel.drop_tranlation_table!
  end
end
