class AddIpToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :ip, :string
  end
end
