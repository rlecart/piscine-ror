class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :cuicui_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
