class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :role
      t.string :email
      t.string :phone
      t.boolean :decision_maker
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
