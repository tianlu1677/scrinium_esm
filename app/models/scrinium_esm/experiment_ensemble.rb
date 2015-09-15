module ScriniumEsm
  class ExperimentEnsemble < ActiveRecord::Base
    belongs_to :experiment
    belongs_to :member, class_name: 'Experiment'
  end
end
