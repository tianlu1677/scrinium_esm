class CreateScriniumEsmData < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_data do |t|
      t.string  :name, index: true, null: false
      t.text    :description
      t.string  :logo
      t.string  :datum_type
      t.string  :datum_format
      t.string  :source
      t.string  :home_page
      t.string  :local_store
      t.integer :contact_id,        null: false
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
