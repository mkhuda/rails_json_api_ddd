class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
