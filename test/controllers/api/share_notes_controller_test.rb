require "test_helper"

class Api::ShareNotesControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:user_one)
        @receiver = users(:user_two)
        @note = notes(:one)
        @token = JwtService.encode_token(user_id: @user.id)
        @auth_headers = { 'Authorization' => "Bearer #{@token}" }
    end

    test "should share note with another user" do
        assert_difference('SharedNote.count') do
          post share_api_note_url(@note), params: { receiver_id: @receiver.id }, headers: @auth_headers, as: :json
        end
    
        assert_response :ok
    end
    
    test "should not share note with invalid receiver" do
        post share_api_note_url(@note), params: { receiver_id: -1 }, headers: @auth_headers, as: :json
        assert_response :not_found
    end

    test "should not share note if it's already been shared with the receiver" do
        SharedNote.create(note: @note, user: @receiver)
        post share_api_note_url(@note), params: { receiver_id: @receiver.id }, headers: @auth_headers, as: :json
        assert_response :unprocessable_entity
    end
end
