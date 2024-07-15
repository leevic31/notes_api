# config/initializers/rack_attack.rb
class Rack::Attack
    # Allow all requests from localhost
    safelist('allow from localhost') do |req|
      '127.0.0.1' == req.ip || '::1' == req.ip
    end
  
    # Limit login attempts from the same IP address to 5 per minute
    throttle('login/ip', limit: 5, period: 1.minute) do |req|
      if req.path == '/api/auth/login' && req.post?
        req.ip
      end
    end
  
    # Customize response when throttled
    self.throttled_responder = ->(env) {
      retry_after = (env['rack.attack.match_data'] || {})[:period]
      [
        429,
        { 'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s },
        [{ error: 'Throttle limit reached. Retry later.' }.to_json]
      ]
    }
  end
  