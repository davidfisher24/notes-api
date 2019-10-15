class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    # get current user notes
    @notes = current_user.notes.paginate(page: params[:page], per_page: 20)
    json_response(@notes)
  end

  # GET /notes/:id
  def show
    json_response(@note)
  end

  # POST /notes
  def create
    # create notes belonging to current user
    @note = current_user.notes.create!(note_params)
    json_response(@note, :created)
  end

  # PUT /notes/:id
  def update
    @note.update(note_params)
    head :no_content
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
    head :no_content
  end

  private

  # remove `created_by` from list of permitted parameters
  def note_params
    params.permit(:title, :text)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end

