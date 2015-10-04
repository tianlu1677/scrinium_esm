module ScriniumEsm
  class Datum < ActiveRecord::Base

    enum datum_type: [
      :invalid,
      :station_data,
      :reanalysis_data,
      :satellite_data,
      :model_data,
      :cmip5_data
    ].map { |x| I18n.t("data.types.#{x}") }

    enum datum_format: [
      :invalid,
      :grib,
      :netcdf,
      :hdf4,
      :hdf5,
      :binary
    ].map { |x| I18n.t("data.formats.#{x}") }

    validates :datum_type, exclusion: {
      in: [ I18n.t('data.types.invalid') ],
      message: I18n.t('data.type_is_empty')
    }
    validates :datum_format, exclusion: {
      in: [ I18n.t('data.formats.invalid') ],
      message: I18n.t('data.format_is_empty')
    }

    def contact
      User.find(self.contact_id)
    end
  end
end
