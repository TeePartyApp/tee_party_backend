class DropTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :conversations, force: :cascade
  end
end
