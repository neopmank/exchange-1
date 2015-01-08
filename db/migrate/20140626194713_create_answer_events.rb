class CreateAnswerEvents < ActiveRecord::Migration
  def change
    create_table :answer_events do |t|
      t.references :task, null: false
      t.string :answer_type, null: false
      t.string :answer, null: false
      t.decimal :correctness

      t.timestamps null: false
    end

    add_index :answer_events, [:task_id, :answer_type]
    add_index :answer_events, [:task_id, :correctness]
  end
end
