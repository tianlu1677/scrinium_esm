module ScriniumEsm
  class Experiment < ActiveRecord::Base
    validates :name, uniqueness: { scope: :experimentable_id }
    validates :name, :contact_id, :experimentable_id, :experimentable_type, presence: true
    belongs_to :experimentable, polymorphic: true
    acts_as_taggable
    acts_as_taggable_on :categories

    TypeMap = {
      'AMIP' => 'ScriniumEsm::AtmModel',
      'OMIP' => 'ScriniumEsm::OcnModel',
      'CMIP' => 'ScriniumEsm::CoupledModel'
    }
    ActionTypeMap = {
      0 => I18n.t('experiment.action_types.change_parameter'),
      1 => I18n.t('experiment.action_types.replace_scheme'),
      2 => I18n.t('experiment.action_types.change_scheme'),
      3 => I18n.t('experiment.action_types.change_code'),
      4 => I18n.t('experiment.action_types.add_compiler_option'),
      5 => I18n.t('experiment.action_types.delete_compiler_option'),
      6 => I18n.t('experiment.action_types.change_compiler_option'),
      7 => I18n.t('experiment.action_types.change_space_resolution'),
      8 => I18n.t('experiment.action_types.change_time_step_size')
    }
  end
end
