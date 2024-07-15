class User < ApplicationRecord
    has_secure_password

    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    
    # Associations
    has_many :notes
    has_many :shared_notes
end
