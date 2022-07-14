class AddOrderToServices < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :order, null: false, foreign_key: true, index: true
  end
end
