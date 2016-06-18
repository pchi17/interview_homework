class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user,     null: false
      t.references :homework, null: false
      t.timestamps null: false
      
      t.index [:user_id, :homework_id], unique: true
    end
    
    add_foreign_key :assignments, :users,     on_delete: :cascade
    add_foreign_key :assignments, :homeworks, on_delete: :cascade
  end
end
