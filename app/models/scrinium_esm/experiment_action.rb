module ScriniumEsm
  class ExperimentAction < ActiveRecord::Base
    extend Enumerize
    acts_as_tenant(:organization)

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
