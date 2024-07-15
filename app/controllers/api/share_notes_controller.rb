class Api::ShareNotesController < ApplicationController
    def create
        note = current_user.notes.find(params[:id])
        receiver_user = User.find_by(id: params[:receiver_id])

        if receiver_user.nil?
            render json: { error: "Recipient not found" }, status: :not_found
            return
        end

        if note.shared_with_users.include?(receiver_user)
            render json: { error: "Note has already been shared with this user" }, status: :unprocessable_entity
            return
        end

        shared_note = SharedNote.new(note: note, user: receiver_user)

        if shared_note.save
            render json: { message: "Note shared successfully" }, status: :ok
        else
            render json: { error: "Failed to share note" }, status: :unprocessable_entity
        end
    end

    private

    def share_note_params
        params.require(:share_note).permit(:receiver_id)
    end
end
