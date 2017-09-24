class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :company_name, null: false
      t.integer :value, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
