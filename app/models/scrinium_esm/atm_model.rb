module ScriniumEsm
  class AtmModel < ActiveRecord::Base
    extend Enumerize

    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    has_many :experiments, as: :experimentable, dependent: :destroy

    enumerize :simulation_region, in: [ :global, :regional ]
    enumerize :simulation_type, in: [ :climate, :weather ]
    enumerize :horizontal_mesh, in: [ :lat_lon, :cubed_sphere ]
    enumerize :vertical_coordinate, in: [
      :classic_sigma_pressure,
      :hybrid_sigma_pressure,
      :float_lagrangian_pressure
    ]
  end
end
