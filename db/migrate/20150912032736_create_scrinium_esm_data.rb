class CreateScriniumEsmData < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_data do |t|
      t.string :name, index: true
      t.text :description
      t.attachment :logo
      t.string :datum_type
      t.string :datum_format
      t.string :source
      t.string :home_page
      t.string :local_store
      t.integer :contact_id
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
