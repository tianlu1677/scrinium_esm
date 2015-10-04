module ScriniumEsm
  class DiagnosticResult < ActiveRecord::Base
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    belongs_to :metric
    belongs_to :experiment
    acts_as_taggable
    acts_as_taggable_on :categories

    validates :metric_id, inclusion: { in: ScriniumEsm::Metric.all.map { |x| x.id } }
    validates_presence_of :contact_id
    validates_uniqueness_of :metric_id, scope: :experiment_id

    def contact
      User.find(self.contact_id)
    end

    def user
      contact
    end
  end
end
