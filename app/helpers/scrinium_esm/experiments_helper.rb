module ScriniumEsm
  module ExperimentsHelper
    def get_experiment_type experiment
      ScriniumEsm::Experiment::TypeMap.each do |k, v|
        if v == experiment.experimentable_type
          return k
        end
      end
    end

    def get_experimentable experiment
      experiment.experimentable_type.classify.constantize.find(experiment.experimentable_id)
    end

    def get_experimentable_id experiment
      get_experimentable(experiment).id if experiment.experimentable_type
    end
  end
end
