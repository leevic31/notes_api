require "test_helper"

class NoteTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_one)
    @note = Note.new(content: "note content", user_id: @user.id)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "content should be present" do
    @note.content = ""
    assert_not @note.valid?
  end
end
