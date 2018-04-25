class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login_id
      t.string :password
      t.text :profile
      t.string :icon_name
      t.string :header_name

      t.timestamps
    end
  end
end
