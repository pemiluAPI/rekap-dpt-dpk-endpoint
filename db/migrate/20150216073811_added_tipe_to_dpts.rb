class AddedTipeToDpts < ActiveRecord::Migration
  def change
    add_column :dpts, :tipe, :string
  end
end
