class NotesController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@notes = Note.order("created_at DESC")

    @notes = Note.where(:user_id => current_user.id)
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create

    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to notes_path, notice: "The note has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      redirect_to notes_path, notice: "The note has been successfully updated."
    else
      render action: "edit"
    end
  end


private

  def note_params
    params.require(:note).permit(:title, :body, :host, :shared)
  end
end
