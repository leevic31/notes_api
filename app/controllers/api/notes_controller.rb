class Api::NotesController < ApplicationController
    before_action :set_note, only: [:show, :update, :destroy]

    def index
        @notes = current_user.notes
        render json: @notes
    end

    def show
        render json: @note
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Note not found" }, status: :not_found
    end

    def create
        @note = Note.new(note_params)

        if @note.save
            render json: @note, status: :created
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    def update
        if @note.update(note_params)
            render json: @note
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @note.destroy
    end

    private

    def note_params
        params.require(:note).permit(:content, :user_id)
    end
    
    def set_note
        @note = current_user.notes.find(params[:id])
    end
end
