class CreateScriniumEsmSeaIceModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_sea_ice_models do |t|
      t.string  :name,                   null: false
      t.string  :short_name,             null: false
      t.integer :contact_id,             null: false
      t.integer :organization_id
      t.string  :repository_url
      t.text    :description
      t.string  :affiliation
      t.string  :simulation_region
      t.string  :simulation_type

      t.timestamps null: false
    end
  end
end
