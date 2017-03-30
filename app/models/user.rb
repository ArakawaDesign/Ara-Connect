class User < ActiveRecord::Base
    before_save { self.email = email.downcase if email.present? }
    
    def set_uppercase
        name_array = []
        if name != nil
            name.split.each do |name_part|
                next if name_part == nil
                name_array << name_part.capitalize
            end

            self.name = name_array.join(" ")
        end
    end

    after_save  :set_uppercase
    
    
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 254 }
    has_secure_password
end
