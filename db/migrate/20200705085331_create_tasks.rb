class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.jsonb :args
      t.jsonb :results
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
