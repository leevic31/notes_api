class SharedNote < ApplicationRecord
    # Associations
    belongs_to :note
    belongs_to :user

    # Validations
    validates :note_id, uniqueness: { scope: :user_id, message: "already shared with this user" }
end
