class CreateDefaultemails < ActiveRecord::Migration
  def change
    create_table :defaultemails do |t|
      t.string :email
      t.string :pass

      t.timestamps null: false
    end
  end
end
