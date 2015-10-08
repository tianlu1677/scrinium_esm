module ScriniumEsm
  class Datum < ActiveRecord::Base
    extend Enumerize

    has_attached_file :logo, styles: { medium: '150x150', thumb: '100x100', small: '20x20' }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
    validates_presence_of :name, message: I18n.t('data.name_is_empty')
    validates_presence_of :contact_id, message: I18n.t('data.contact_is_empty')

    enumerize :datum_type, in: [
      :station_data,
      :reanalysis_data,
      :satellite_data,
      :model_data,
      :cmip5_data
    ]
    enumerize :datum_format, in: [
      :grib,
      :netcdf,
      :hdf4,
      :hdf5,
      :binary
    ]

    def contact
      User.find(self.contact_id)
    end
  end
end
