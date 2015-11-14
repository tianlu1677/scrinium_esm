module ScriniumEsm
  class Metric < ActiveRecord::Base
    include Resourceable

    mount_uploader :logo, ImageUploader
    acts_as_tenant(:organization)

    acts_as_taggable
    acts_as_taggable_on :categories

    has_many :comments, as: :commentable, dependent: :destroy
    has_many :collections, as: :collectable, dependent: :destroy
    has_many :diagnostic_results, dependent: :destroy

    validates :name, :short_name, uniqueness: true
    validates :name, :short_name, :contact_id, presence: true
    validates :logo, file_size: { less_than_or_equal_to: 2.megabytes },
                     file_content_type: { allow: [ 'image/jpeg', 'image/png' ] }

    def contact
      User.find(self.contact_id)
    end

    def user
      contact
    end
  end
end
