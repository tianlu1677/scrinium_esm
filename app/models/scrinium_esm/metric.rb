module ScriniumEsm
  class Metric < ActiveRecord::Base
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :diagnostic_results, dependent: :destroy

    acts_as_taggable
    acts_as_taggable_on :categories

    validates_uniqueness_of [ :name, :short_name ]
    validates_presence_of [ :name, :short_name, :contact_id ]

    def contact
      User.find(self.contact_id)
    end

    def user
      contact
    end
  end
end
