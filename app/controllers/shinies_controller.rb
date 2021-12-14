class ShiniesController < ApplicationController
  def index
    @shinies = Attempt.where(is_shiny: true, is_false_positive: false)
  end

  def confirm
    @shiny = Attempt.find(params[:shiny_id])
    @shiny.update(is_false_positive: false)
    redirect_to shinies_path
  end

  def false_positive
    @shiny = Attempt.find(params[:shiny_id])
    @shiny.update(is_false_positive: true)
    redirect_back fallback_location: shinies_path
  end

  def unsure
    @shinies = Attempt.where(is_shiny: true, is_false_positive: nil)
  end
end
