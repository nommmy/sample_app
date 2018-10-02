class RanameSendIdColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :sender_id, :user_id
  end
end
