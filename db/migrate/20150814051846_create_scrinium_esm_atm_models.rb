class CreateScriniumEsmAtmModels < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_atm_models do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
