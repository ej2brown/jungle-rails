class User < ActiveRecord::Base
    has_secure_password
    
    before_validation :downcase_email
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { within: 5..50 }
    # :password_confirmation,

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.downcase.strip).try(:authenticate, password)
        if user
            return user;
        end

        return nil;
    end
          
    def downcase_email
        self.email = email.downcase if email.present?
    end
end
