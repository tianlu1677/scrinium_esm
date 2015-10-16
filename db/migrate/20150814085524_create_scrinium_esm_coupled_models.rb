class CreateScriniumEsmCoupledModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_coupled_models do |t|
      t.string :name
      t.string :short_name
      t.integer :contact_id
      t.integer :organization_id
      t.string :repository_url
      t.text :description
      t.string :affiliation
      t.string :simulation_region
      t.string :simulation_type

      t.timestamps null: false
    end
    ScriniumEsm::CoupledModel.create_translation_table!({
      description: :string
    })
  end
  def down
    drop_table :scrinium_esm_coupled_models
    ScriniumEsm::CoupledModel.drop_tranlation_table!
  end
end
