class StatsController < ApplicationController
  def index
    

    @starter = Starter.instance
    @alolan = Alolan.instance
    @fossil = Fossil.instance

    respond_to do |format|
      format.html { render :index }
    end
  end
end