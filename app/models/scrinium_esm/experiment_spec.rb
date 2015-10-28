module ScriniumEsm
  class ExperimentSpec < ActiveRecord::Base
    mount_uploader :logo, ImageUploader

    acts_as_taggable
    acts_as_taggable_on :categories

    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :collections, as: :collectable, dependent: :destroy
    belongs_to :comparison_project

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
