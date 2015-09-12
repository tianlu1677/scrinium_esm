class CreateScriniumEsmData < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_data do |t|
      t.string  :name
      t.text    :description
      t.attachment :logo
      t.integer :datum_type
      t.integer :datum_format
      t.string  :source
      t.string  :home_page
      t.string  :local_store
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
