class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :role, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.boolean :decision_maker, null: false
      t.references :client, foreign_key: true, null: false

      t.timestamps
    end
  end
end
