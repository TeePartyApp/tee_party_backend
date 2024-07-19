class ChangeColumnNameUserIdToSenderIdInMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :user_id, :sender_id
  end
end
