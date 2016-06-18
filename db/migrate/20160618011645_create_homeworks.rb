class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title,    null: false
      t.string :question, null: false
      t.date   :due_date, null: false
      t.timestamps null: false
    end
  end
end
