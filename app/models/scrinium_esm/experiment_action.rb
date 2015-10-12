module ScriniumEsm
  class ExperimentAction < ActiveRecord::Base
    extend Enumerize

    belongs_to :experiment

    enumerize :action_type, in: [
      :change, :add, :delete
    ]
    enumerize :action_object, in: [
      :parameter,
      :compiler,
      :compiler_option,
      :code,
      :parallel_setting
    ]
  end
end
