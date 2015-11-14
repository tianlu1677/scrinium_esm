module ScriniumEsm
  class ExperimentEnsemble < ActiveRecord::Base
    acts_as_tenant(:organization)

    belongs_to :experiment
    belongs_to :member, class_name: 'Experiment'
  end
end
