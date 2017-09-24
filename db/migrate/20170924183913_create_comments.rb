class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body, null: false
      t.references :client, foreign_key: true, null: false

      t.timestamps
    end
  end
end
