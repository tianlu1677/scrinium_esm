class CreateScriniumEsmLndModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_lnd_models do |t|
      t.string  :name
      t.string  :short_name
      t.integer :contact_id
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
