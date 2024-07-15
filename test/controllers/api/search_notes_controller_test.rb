require "test_helper"

class Api::SearchNotesControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:user_one)
        @note = notes(:one)
        @token = JwtService.encode_token(user_id: @user.id)
        @auth_headers = { 'Authorization' => "Bearer #{@token}" }
    end

    test "should search notes by keyword" do
        keyword = "text"
        get api_search_notes_url(q: keyword), headers: @auth_headers, as: :json
        assert_response :success
        assert_equal [@note.id], response.parsed_body.map { |note| note['id'] }
    end
end
