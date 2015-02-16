class Dpk < ActiveRecord::Base
  self.primary_key = 'id'
  belongs_to :province, -> { select('id, nama_lengkap') }, foreign_key: :provinsi_id
end
