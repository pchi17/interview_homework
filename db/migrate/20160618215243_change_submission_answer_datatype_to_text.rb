class ChangeSubmissionAnswerDatatypeToText < ActiveRecord::Migration
  def change
    change_column :submissions, :answer, :text, null: false
  end
end
