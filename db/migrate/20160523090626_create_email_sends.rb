class CreateEmailSends < ActiveRecord::Migration
  def change
    create_table :email_sends do |t|
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
