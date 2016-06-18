class AddUniqueIndexToSubmissionAnswersScopedToAssignment < ActiveRecord::Migration
  def up
    execute(
      <<-SQL
        ALTER TABLE submissions
        ADD CONSTRAINT index_submissions_on_assignment_id_and_answer UNIQUE
        (assignment_id, answer)
      SQL
    )
  end
  
  def down
    execute('ALTER TABLE submissions DROP INDEX index_submissions_on_assignment_id_answer')
  end
end
