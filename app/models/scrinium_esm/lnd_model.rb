module ScriniumEsm
  class LndModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description
  end
end