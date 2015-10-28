module ScriniumEsm
  class ExperimentAction < ActiveRecord::Base
    extend Enumerize

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

    belongs_to :experiment

    validates :action_type, :action_object, presence: true
  end
end
