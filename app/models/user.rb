class User < ActiveRecord::Base
    def create_user! input
        input[:session_token] = SecureRandom.base64
        User.create!(input)
    end
end
