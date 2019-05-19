class CreateAnsweredForm < ActiveRecord::Migration[5.1]
  def change
    create_table :answered_forms do |t|
      t.integer :user_id
      t.integer :form_id

      t.timestamps
    end
  end
end
