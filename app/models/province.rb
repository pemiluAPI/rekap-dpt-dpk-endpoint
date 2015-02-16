class Province < ActiveRecord::Base
  self.primary_key = 'id'
  has_one :dpts, foreign_key: :provinsi_id
  has_one :dpks, foreign_key: :provinsi_id
end
