class RemoveMessagesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :messages, force: :cascade
  end
end
