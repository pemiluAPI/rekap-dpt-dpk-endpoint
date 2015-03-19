module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :rekap_dpt do
      desc "Return all rekapitulasi DPT"
      get do
        dpts = Array.new

        # Prepare conditions based on params
        valid_params = {
          provinsi: 'provinsi_id',
          tipe: 'tipe'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 33 : params[:limit]

        Dpt.includes(:province)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |dpt|
            dpts << {
              id: dpt.id,
              provinsi: {
                id: dpt.province_id,
                nama: dpt.province_nama_lengkap
              },
              jumlah_tps: dpt.jumlah_tps,
              laki_laki: dpt.jumlah_laki_laki,
              perempuan: dpt.jumlah_perempuan,
              nihil: dpt.jumlah_nihil,
              total: dpt.total,
              tanggal_lahir_nihil: dpt.jumlah_tanggal_lahir_nihil,
              status_kawin_nihil: dpt.jumlah_status_kawin_nihil,
              dibawah_umur: dpt.jumlah_dibawah_umur,
              tipe: dpt.tipe
            }
          end

        {
          results: {
            count: dpts.count,
            total: Dpt.where(conditions).count,
            dpt: dpts
          }
        }
      end
    end

    resource :rekap_dpk do
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

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 33 : params[:limit]

        Dpk.includes(:province)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |dpk|
            dpks << {
              id: dpk.id,
              provinsi: {
                id: dpk.province_id,
                nama: dpk.province_nama_lengkap
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
            total: Dpk.where(conditions).count,
            dpk: dpks
          }
        }
      end
    end
  end
end