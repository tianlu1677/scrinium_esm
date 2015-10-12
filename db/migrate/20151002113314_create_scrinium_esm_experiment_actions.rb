class CreateScriniumEsmExperimentActions < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_experiment_actions do |t|
      t.belongs_to :experiment, index: true
      t.integer :order
      t.string :action_type
      t.string :action_object
      t.string :content1
      t.string :content2
      t.string :content3
      t.text :content4
      t.text :content5

      t.timestamps null: false
    end
  end
end
