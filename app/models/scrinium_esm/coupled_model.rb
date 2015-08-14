module ScriniumEsm
  class CoupledModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
  end
end
