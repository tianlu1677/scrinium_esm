module ScriniumEsm
  class SeaIceModel < ActiveRecord::Base
    extend Enumerize

    enumerize :simulation_region, in: [ :global, :regional ]
    enumerize :simulation_type, in: [ :climate, :weather ]

    has_many :experiments, as: :experimentable, dependent: :destroy

    validates :name, :short_name, uniqueness: true
    validates :name, :short_name, :contact_id, presence: true

    def contact
      User.find(self.contact_id)
    end
  end
end
