class AddStatusToActivemails < ActiveRecord::Migration
  def change
    add_column :activemails, :status, :boolean
  end
end
