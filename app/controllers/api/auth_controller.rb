class Api::AuthController < ApplicationController
    def signup
        user = User.new(user_params)
        if user.save
            render json: { status: "User created successfully" }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          # Generate JWT token
            token = JwtService.encode_token(user_id: user.id)
          
            render json: { token: token }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:email, :password)
    end
end
