module ScriniumEsm
  class Datum < ActiveRecord::Base
    extend Enumerize

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
