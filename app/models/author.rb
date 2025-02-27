class Author < ApplicationRecord
    attr_accessor :password
    validates_confirmation_of :password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    before_save :encrypt_password

    has_many = true

    def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def self.authenticate(email, password)
        @author = Author.find_by("email =?", email)
        if @author && @author.password_hash == BCrypt::Engine.hash_secret(password, @author.password_salt)
           json_response(@author)
        else
            json_response({message: "Invalid email or password"})
        end
    end
end
