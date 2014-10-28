class CreateDpts < ActiveRecord::Migration
  def change
    create_table :dpts do |t|
      t.integer   :jumlah_tps
      t.integer   :jumlah_laki_laki
      t.integer   :jumlah_perempuan
      t.string     :jumlah_nihil
      t.integer   :total
      t.string     :jumlah_tanggal_lahir_nihil
      t.string     :jumlah_status_kawin_nihil
      t.string     :jumlah_dibawah_umur
      t.integer   :provinsi_id
    end
    add_index :dpts, :provinsi_id
  end
end
