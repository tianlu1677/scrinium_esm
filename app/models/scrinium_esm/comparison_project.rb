module ScriniumEsm
  class ComparisonProject < ActiveRecord::Base
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :collections, as: :collectable, dependent: :destroy

    has_attached_file :logo, styles: { medium: '150x150', thumb: '100x100', small: '20x20' }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

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
