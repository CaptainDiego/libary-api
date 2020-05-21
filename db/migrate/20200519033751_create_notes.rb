class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :user
      t.text :body
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end
