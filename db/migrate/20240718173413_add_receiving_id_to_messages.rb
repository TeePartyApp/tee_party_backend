class AddReceivingIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :receiver_id, :bigint
  end
end
