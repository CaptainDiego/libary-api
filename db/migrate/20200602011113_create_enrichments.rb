class CreateEnrichments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrichments do |t|
      t.json :clearbit_result
      t.references :lead, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
