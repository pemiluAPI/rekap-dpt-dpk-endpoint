# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150216073811) do

  create_table "dpks", force: true do |t|
    t.integer "jumlah_laki_laki"
    t.integer "jumlah_perempuan"
    t.string  "jumlah_nihil"
    t.integer "total"
    t.integer "provinsi_id"
  end

  add_index "dpks", ["provinsi_id"], name: "index_dpks_on_provinsi_id", using: :btree

  create_table "dpts", force: true do |t|
    t.integer "jumlah_tps"
    t.integer "jumlah_laki_laki"
    t.integer "jumlah_perempuan"
    t.string  "jumlah_nihil"
    t.integer "total"
    t.string  "jumlah_tanggal_lahir_nihil"
    t.string  "jumlah_status_kawin_nihil"
    t.string  "jumlah_dibawah_umur"
    t.integer "provinsi_id"
    t.string  "tipe"
  end

  add_index "dpts", ["provinsi_id"], name: "index_dpts_on_provinsi_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string  "nama"
    t.string  "nama_lengkap"
    t.string  "nama_inggris"
    t.integer "jumlah_kursi"
    t.integer "jumlah_penduduk"
    t.integer "pro_id"
  end

end
