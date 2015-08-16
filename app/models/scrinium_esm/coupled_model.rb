module ScriniumEsm
  class CoupledModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    has_many :experiments, as: :experimentable, dependent: :destroy
  end
end
