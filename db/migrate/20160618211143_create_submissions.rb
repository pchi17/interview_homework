class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :assignment, null: false, index: true
      t.string     :answer,     null: false
      t.datetime   :created_at, null: false
    end
    add_foreign_key :submissions,:assignments, on_delete: :cascade
  end
end
