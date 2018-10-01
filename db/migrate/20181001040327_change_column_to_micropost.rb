class ChangeColumnToMicropost < ActiveRecord::Migration[5.2]
  def change
    change_column :microposts, :in_reply_to, :int, default: 0
  end
end
