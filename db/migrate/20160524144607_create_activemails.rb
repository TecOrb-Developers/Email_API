class CreateActivemails < ActiveRecord::Migration
  def change
    create_table :activemails do |t|
      t.references :defaultemail, index: true, foreign_key: true
      t.references :admin_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
