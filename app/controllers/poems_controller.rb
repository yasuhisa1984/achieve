class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
  end

    private
    def poems_params
      params.require(:contact).permit(:title, :content, :auther)
    end
end
