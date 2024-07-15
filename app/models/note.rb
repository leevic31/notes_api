class Note < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_content, against: :content

    # Validations
    validates :content, presence: true

    # Associations
    belongs_to :user
    has_many :shared_notes
    has_many :shared_with_users, through: :shared_notes, source: :user
end
                                                                                                                                                                                                                                         