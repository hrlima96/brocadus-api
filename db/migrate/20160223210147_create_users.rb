class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :access_token
      t.timestamp :access_token_generated_at

      t.timestamps null: false
    end
  end
end
