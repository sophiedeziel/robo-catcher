class TweetTemplatesController < ApplicationController
  before_action :set_tweet_template, only: [:show, :edit, :update, :destroy]

  # GET /tweet_templates
  # GET /tweet_templates.json
  def index
    @tweet_templates = TweetTemplate.all
  end

  # GET /tweet_templates/1
  # GET /tweet_templates/1.json
  def show
  end

  # GET /tweet_templates/new
  def new
    @tweet_template = TweetTemplate.new
  end

  # GET /tweet_templates/1/edit
  def edit
  end

  # POST /tweet_templates
  # POST /tweet_templates.json
  def create
    @tweet_template = TweetTemplate.new(tweet_template_params)

    respond_to do |format|
      if @tweet_template.save
        format.html { redirect_to @tweet_template, notice: 'Tweet template was successfully created.' }
        format.json { render :show, status: :created, location: @tweet_template }
      else
        format.html { render :new }
        format.json { render json: @tweet_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweet_templates/1
  # PATCH/PUT /tweet_templates/1.json
  def update
    respond_to do |format|
      if @tweet_template.update(tweet_template_params)
        format.html { redirect_to @tweet_template, notice: 'Tweet template was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet_template }
      else
        format.html { render :edit }
        format.json { render json: @tweet_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweet_templates/1
  # DELETE /tweet_templates/1.json
  def destroy
    @tweet_template.destroy
    respond_to do |format|
      format.html { redirect_to tweet_templates_url, notice: 'Tweet template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_template
      @tweet_template = TweetTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_template_params
      params.require(:tweet_template).permit(:event, :message)
    end
end
