class AddFormIdToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :form_id, :integer
  end
end
