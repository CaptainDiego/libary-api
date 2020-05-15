class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :first
      t.string :last
      t.string :email
      t.timestamps
    end
  end
end
