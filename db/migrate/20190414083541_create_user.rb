class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :email, null: false
      t.text :password, null: false
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
