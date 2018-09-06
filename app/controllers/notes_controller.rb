class NotesController < ApplicationController

  def new
  end

  def create
    if logged_in?
      @note = current_user.notes.build(note_params)
      if @note.save
        redirect_to '/'
      else
        redirect_to new_note_path
      end
    else
      redirect_to '/'
    end
  end

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find_by_id(params[:id])
  end

  def edit

  end

  def update
    @note = Note.find_by_id(params[:id])
    @note.update(note_params)
    @note.save
    redirect_to '/'
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end 



end
