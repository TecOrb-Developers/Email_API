class CreateSendEmails < ActiveRecord::Migration
  def change
    create_table :send_emails do |t|
      t.string :email
      t.string :subject
      t.text :description

      t.timestamps null: false
    end
  end
end
