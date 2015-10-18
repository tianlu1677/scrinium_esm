module ScriniumEsm
  class OcnModel < ActiveRecord::Base
    extend Enumerize

    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    has_many :experiments, as: :experimentable, dependent: :destroy

    enumerize :simulation_region, in: [ :global, :regional ]
    enumerize :simulation_type, in: [ :climate, :weather ]
    enumerize :horizontal_mesh, in: [
      :lat_lon,
      :tripole,
      :rotation
    ]
    enumerize :vertical_coordinate, in: [
      :height,
      :hybrid_sigma_height,
      :isopycnic
    ]

    def contact
      User.find(self.contact_id)
    end
  end
end
