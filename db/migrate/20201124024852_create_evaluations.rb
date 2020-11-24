class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :student_evaluated
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
