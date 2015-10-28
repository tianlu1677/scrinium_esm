module ScriniumEsm
  class AtmModel < ActiveRecord::Base
    extend Enumerize

    enumerize :simulation_region, in: [ :global, :regional ]
    enumerize :simulation_type, in: [ :climate, :weather ]
    enumerize :horizontal_mesh, in: [ :lat_lon, :cubed_sphere ]
    enumerize :vertical_coordinate, in: [
      :classic_sigma_pressure,
      :hybrid_sigma_pressure,
      :float_lagrangian_pressure
    ]

    has_many :experiments, as: :experimentable, dependent: :destroy

    validates :name, :short_name, uniqueness: true
    validates :name, :short_name, :contact_id, presence: true
    validates :simulation_region, :simulation_type, presence: true
    validates :horizontal_mesh, :vertical_coordinate, presence: true

    def contact
      User.find(self.contact_id)
    end
  end
end
