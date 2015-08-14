class CreateScriniumEsmOcnModels < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_ocn_models do |t|
      t.string :name
      t.string :short_name
      t.integer :contact_id
      t.string :repository_url
      t.text :description

      t.timestamps null: false
    end
  end
end
