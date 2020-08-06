class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, charset: :utf8, limit: 191
      t.string :email, null: false, charset: :utf8, limit: 191

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
