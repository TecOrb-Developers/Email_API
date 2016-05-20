class CreateEmailRecords < ActiveRecord::Migration
  def change
    create_table :email_records do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
