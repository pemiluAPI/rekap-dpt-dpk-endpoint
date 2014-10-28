class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string   :nama
      t.string   :nama_lengkap
      t.string   :nama_inggris
      t.integer :jumlah_kursi
      t.integer :jumlah_penduduk
      t.integer :pro_id
    end
  end
end
