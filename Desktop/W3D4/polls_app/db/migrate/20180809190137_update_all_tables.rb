class UpdateAllTables < ActiveRecord::Migration[5.2]
  def change
    change_table :polls do |t|
      t.integer :user_id
    end

    change_table :questions do |t|
      t.integer :poll_id
    end

    change_table :answer_choices do |t|
      t.integer :question_id
    end

    change_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :user_id
    end


  end
end
