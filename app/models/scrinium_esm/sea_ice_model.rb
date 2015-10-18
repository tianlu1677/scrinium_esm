module ScriniumEsm
  class SeaIceModel < ActiveRecord::Base
    extend Enumerize

    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    has_many :experiments, as: :experimentable, dependent: :destroy

    enumerize :simulation_region, in: [ :global, :regional ]
    enumerize :simulation_type, in: [ :climate, :weather ]

    def contact
      User.find(self.contact_id)
    end
  end
end
