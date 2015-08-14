class CreateScriniumEsmAtmModels < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_atm_models do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.integer :contact_id
      t.string :repository_url

      t.timestamps null: false
    end
  end
end
