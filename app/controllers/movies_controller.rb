class MoviesController < ApplicationController

  def index
  end

  def search
    params.permit(:query)
    @spar = params[:query]
    @lastarr = SearchMovie.new(@spar).perform
  end


  private

   def user_params
     params.permit(:query)
   end

end
