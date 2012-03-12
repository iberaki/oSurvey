class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :issues
      t.integer :type
      t.text :options

      t.timestamps
    end
  end
end
