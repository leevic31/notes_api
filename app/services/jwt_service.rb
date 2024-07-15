class JwtService
    def self.encode_token(payload)
        secret_key = ENV['SECRET_KEY_BASE']
        JWT.encode(payload, secret_key)
    end
end