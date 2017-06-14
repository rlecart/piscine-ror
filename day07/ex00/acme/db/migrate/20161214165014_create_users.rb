class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :name
      t.String :password

      t.timestamps null: false
    end
  end
end
