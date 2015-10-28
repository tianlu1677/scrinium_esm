class CreateScriniumEsmOcnModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_ocn_models do |t|
      t.string  :name
      t.string  :short_name
      t.integer :contact_id
      t.integer :organization_id
      t.string  :repository_url
      t.text    :description
      t.string  :affiliation
      t.string  :simulation_region
      t.string  :simulation_type
      # Atmosphere model specific columns.
      t.string  :horizontal_mesh
      t.string  :vertical_coordinate
      t.string  :vertical_mesh
      t.string  :dynamical_core_scheme
      t.string  :advection_scheme

      t.timestamps null: false
    end
  end
end
