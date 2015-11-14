module ScriniumEsm
  class Datum < ActiveRecord::Base
    extend Enumerize
    acts_as_tenant(:organization)

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

    mount_uploader :logo, ImageUploader

    validates :name, uniqueness: true
    validates :name, :contact_id, presence: true
    validates :logo, file_size: { less_than_or_equal_to: 2.megabytes },
                     file_content_type: { allow: [ 'image/jpeg', 'image/png' ] }

    def contact
      User.find(self.contact_id)
    end
  end
end
