class StatsController < ApplicationController
  def index
    

    @starter = Starter.first_or_create
    @alolan = Alolan.first_or_create
    @fossil = Fossil.first_or_create

    respond_to do |format|
      format.html { render :index }
    end
  end
end