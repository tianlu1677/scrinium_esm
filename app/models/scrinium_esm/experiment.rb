module ScriniumEsm
  class Experiment < ActiveRecord::Base
    belongs_to :experimentable, polymorphic: true

    TypeMap = {
      'AMIP' => 'ScriniumEsm::AtmModel',
      'OMIP' => 'ScriniumEsm::OcnModel',
      'CMIP' => 'ScriniumEsm::CoupledModel'
    }
  end
end
