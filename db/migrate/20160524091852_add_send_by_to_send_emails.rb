class AddSendByToSendEmails < ActiveRecord::Migration
  def change
    add_column :send_emails, :send_by, :string
  end
end
