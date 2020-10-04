class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to '/words'
    else
      redirect_to '/words/new'
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to '/words'
    else
      redirect_to edit_word_path(@word)
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to '/words'
  end

  def demo_select_books
  end

  def demo_select_levels
    @wordbook = Wordbook.find(params[:wordbook_id])
  end

  def demo_test
    @wordbook = Wordbook.find(params[:wordbook_id])
    @limit = params[:words_limit]
    @level = params[:level]
    @seleced_words = Word.where(wordbook_id: @wordbook, level: @level).order("RAND()").limit(5)
  end

  private

  def word_params
    params.require(:word).permit(:english, :japanese, :part, :level, :wordbook_id)
  end
end
