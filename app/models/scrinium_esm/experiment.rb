module ScriniumEsm
  class Experiment < ActiveRecord::Base
    extend Enumerize

    validates :name, uniqueness: { scope: :experimentable_id }
    validates :name, :contact_id, :experimentable_id, :experimentable_type, presence: true

    belongs_to :experimentable, polymorphic: true
    has_many :experiment_actions, dependent: :destroy
    accepts_nested_attributes_for :experiment_actions, allow_destroy: true
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :diagnostic_results, dependent: :destroy
    has_many :experiment_ensembles
    has_many :members, through: :experiment_ensembles

    acts_as_taggable
    acts_as_taggable_on :categories

    enumerize :experiment_type, in: [ :amip, :omip, :cmip ]
    ModelType = {
      :amip => 'ScriniumEsm::AtmModel',
      :omip => 'ScriniumEsm::OcnModel',
      :cmip => 'ScriniumEsm::CoupledModel'
    }

    def contact
      User.find(self.contact_id)
    end

    def user
      User.find(self.contact_id)
    end

    def title
      self.name
    end

    def logs
      # 删除内容为空的日志。
      self.log_ids.each do |id|
        next if not Article.exists? id
        article = Article.find(id)
        article.destroy if article.content.empty?
      end
      # 检查日志是否还存在，否则从log_ids中删除之。
      self.update(log_ids: self.log_ids.delete_if { |i| not Article.exists? i })
      Article.find(self.log_ids)
    end
  end
end
