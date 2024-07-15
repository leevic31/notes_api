class ApplicationController < ActionController::API
    before_action :authorized, unless: :login_action?

    def authorized
        render json: { error: 'Unauthorized' }, status: :unauthorized unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= authenticate_user if decoded_token
    end

    private

    def authenticate_user
        user_id = decoded_token[0]['user_id']
        User.find_by(id: user_id)
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ').last
            begin
                JWT.decode(token, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def auth_header
        request.headers['Authorization']
    end

    def login_action?
        params[:controller] == 'api/auth' && (params[:action] == 'login' || params[:action] == 'signup')
    end
end
