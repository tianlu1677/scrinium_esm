module ScriniumEsm
  class OcnModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
  end
end
