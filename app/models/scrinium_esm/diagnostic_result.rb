module ScriniumEsm
  class DiagnosticResult < ActiveRecord::Base
    acts_as_tenant(:organization)

    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :collections, as: :collectable, dependent: :destroy
    belongs_to :metric
    belongs_to :experiment
    acts_as_taggable
    acts_as_taggable_on :categories

    validates :metric_id, inclusion: { in: ScriniumEsm::Metric.all.map { |x| x.id } }
    validates :contact_id, uniqueness: true
    validates :metric_id, uniqueness: { scope: :experiment_id }

    def contact
      User.find(self.contact_id)
    end

    def user
      contact
    end
  end
end
