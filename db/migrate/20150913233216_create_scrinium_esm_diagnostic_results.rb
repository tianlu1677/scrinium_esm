class CreateScriniumEsmDiagnosticResults < ActiveRecord::Migration
  def change
    create_table :scrinium_esm_diagnostic_results do |t|
      t.belongs_to :metric,          null: false
      t.belongs_to :experiment,      null: false
      t.integer    :contact_id,      null: false
      t.integer    :organization_id

      t.timestamps null: false
    end
  end
end
