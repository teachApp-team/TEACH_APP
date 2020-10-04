class WordbooksController < ApplicationController
  def new
    @wordbook = Wordbook.new
    @wordbooks = Wordbook.all
  end

  def create
    @wordbook = Wordbook.new(wordbook_params)
    if @wordbook.save
      redirect_to '/wordbooks/new'
    else
      redirect_to '/wordbooks/new'
    end
  end

  def edit
    @wordbook = Wordbook.find(params[:id])
  end

  def update
    @wordbook = Wordbook.find(params[:id])
    if @wordbook.update(wordbook_params)
      redirect_to '/wordbooks'
    else
      redirect_to edit_wordbook_path(@wordbook)
    end
  end

  def destroy
    @wordbook = Wordbook.find(params[:id])
    @wordbook.destroy
    redirect_to '/wordbooks'
  end

  private

  def wordbook_params
    params.require(:wordbook).permit(:name)
  end
end
