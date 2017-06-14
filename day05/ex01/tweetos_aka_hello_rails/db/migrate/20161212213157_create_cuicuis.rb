class CreateCuicuis < ActiveRecord::Migration
  def change
    create_table :cuicuis do |t|
      t.text :content
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
