class Api::SearchNotesController < ApplicationController
    def index
        query = params[:q]
        notes = current_user.notes.search_by_content(query)
        render json: notes
    end

    private

    def search_note_params
        params.require(:search_note).permit(:q)
    end
end
