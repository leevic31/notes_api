require "test_helper"

class Api::NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
    @note = notes(:one)
    @token = JwtService.encode_token(user_id: @user.id)
    @auth_headers = { 'Authorization' => "Bearer #{@token}" }
  end

  test "should get index" do
    get api_notes_url, headers: @auth_headers, as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @user.notes.count, json_response.length
  end

  test "should get show" do
    get api_note_url(@note), headers: @auth_headers, as: :json
    assert_response :success    
  end
  
  test "should create note" do
    assert_difference('Note.count') do
      post api_notes_url, params: { note: { content: 'Test Note', user_id: @user.id} }, headers: @auth_headers, as: :json
    end
    assert_response :created
  end

  test "should update note" do
    patch api_note_url(@note), params: { note: { content: "updated content"} }, headers: @auth_headers, as: :json
    assert_response :success
    @note.reload
    assert_equal "updated content", @note.content
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete api_note_url(@note), headers: @auth_headers, as: :json
    end

    assert_response :no_content
  end
end
