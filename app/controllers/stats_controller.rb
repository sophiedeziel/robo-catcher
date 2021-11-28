class StatsController < ApplicationController
  def index
    

    @starter = Starter.instance
    @alolan = Alolan.instance
    @fossil = Fossil.instance

    respond_to do |format|
      format.json {  render json: {
          starter: @starter,
          alolan: @alolan,
          fossil: @fossil
        } }
      format.html { render :index }
    end
  end
end