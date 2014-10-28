module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :rekapitulasi_dpt do
      desc "Return all dpt"
      get do
        dpts = Array.new

        # Prepare conditions based on params
        valid_params = {
          provinsi: 'provinsi_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        Dpt.includes(:province)
          .where(conditions)
          .each do |dpt|
            dpts << {
              id: dpt.id,
              provinsi: {
                id: dpt.province.id,
                nama: dpt.province.nama_lengkap
              },
              jumlah_tps: dpt.jumlah_tps,
              laki_laki: dpt.jumlah_laki_laki,
              perempuan: dpt.jumlah_perempuan,
              nihil: dpt.jumlah_nihil,
              total: dpt.total,
              tanggal_lahir_nihil: dpt.jumlah_tanggal_lahir_nihil,
              status_kawin_nihil: dpt.jumlah_status_kawin_nihil,
              dibawah_umur: dpt.jumlah_dibawah_umur
            }
          end

        {
          results: {
            count: dpts.count,
            dpt: dpts
          }
        }
      end
    end

    resource :rekapitulasi_dpk do
      desc "Return all rekapitulasi DPK"
      get do
        dpks = Array.new

        # Prepare conditions based on params
        valid_params = {
          provinsi: 'provinsi_id'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        Dpk.includes(:province)
          .where(conditions)
          .each do |dpk|
            dpks << {
              id: dpk.id,
              provinsi: {
                id: dpk.province.id,
                nama: dpk.province.nama_lengkap
              },
              laki_laki: dpk.jumlah_laki_laki,
              perempuan: dpk.jumlah_perempuan,
              nihil: dpk.jumlah_nihil,
              total: dpk.total
            }
          end

        {
          results: {
            count: dpks.count,
            dpk: dpks
          }
        }
      end
    end
  end
end