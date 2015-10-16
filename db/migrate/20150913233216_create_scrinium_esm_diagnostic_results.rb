class CreateScriniumEsmDiagnosticResults < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_diagnostic_results do |t|
      t.belongs_to :metric
      t.belongs_to :experiment
      t.integer :contact_id
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
