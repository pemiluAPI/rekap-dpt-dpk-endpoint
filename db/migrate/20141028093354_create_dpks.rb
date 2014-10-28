class CreateDpks < ActiveRecord::Migration
  def change
    create_table :dpks do |t|
      t.integer   :jumlah_laki_laki
      t.integer   :jumlah_perempuan
      t.string     :jumlah_nihil
      t.integer   :total
      t.integer   :provinsi_id
    end
    add_index :dpks, :provinsi_id
  end
end
