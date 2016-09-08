class AddContactToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :contact, :integer
  end
end
