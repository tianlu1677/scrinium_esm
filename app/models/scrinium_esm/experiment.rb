module ScriniumEsm
  class Experiment < ActiveRecord::Base
    validates :name, uniqueness: { scope: :experimentable_id }
    validates :name, :contact_id, :experimentable_id, :experimentable_type, presence: true

    belongs_to :experimentable, polymorphic: true
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :diagnostic_results, dependent: :destroy
    has_many :experiment_ensembles
    has_many :members, through: :experiment_ensembles

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

    def user
      User.find(self.contact_id)
    end

    def title
      self.name
    end

    def logs
      # 删除内容为空的日志。
      self.log_ids.each do |i|
        next if not Article.exists? i
        a = Article.find(i)
        a.destroy if a.content.empty?
      end
      # 检查日志是否还存在，否则从log_ids中删除之。
      self.update(log_ids: self.log_ids.delete_if { |i| not Article.exists? i })
      Article.find(self.log_ids)
    end
  end
end
