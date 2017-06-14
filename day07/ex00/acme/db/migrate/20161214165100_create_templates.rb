class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.String :name
      t.String :password

      t.timestamps null: false
    end
  end
end
