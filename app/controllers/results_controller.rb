class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    if current_user && current_user.role == "admin"
        @nav = "results"
    @results = Result.all
      if params[:sort_by] == "user_id"
        @results = Result.all.sort_by { |result| result.user_id }
      end
      if params[:sort_by] == "exam_id"
        @results = Result.all.sort_by { |result| result.exam_id }
      end
      if params[:sort_by] == "date"
        @results = Result.all.sort_by { |result| result.created_at }
      end
      if params[:sort_by] == "user_id"
        @results = Result.all.sort_by { |result| result.user_id }.reverse!
      end
      if params[:sort_by] == "exam_id"
        @results = Result.all.sort_by { |result| result.exam_id }.reverse!
      end
      if params[:sort_by] == "date"
        @results = Result.all.sort_by { |result| result.created_at }.reverse!
      end
    else
      redirect_to root_url
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    if current_user.role == "admin" || current_user.id == @result.user_id
      if current_user.role == "admin"
        @nav = "results"
      else
        @nav = "users"
      end
    else
      redirect_to root_url
    end
  end

  # GET /results/new
  def new
    @nav = "results"
    if params != nil
      @result = Result.new
      @result.user_id   = params[:user_id]
      @result.exam_id   = params[:exam_id]
      @result.settings  = params[:exam_settings]
      @result.questions = params[:exam_questions]
      @result.result    = params[:exam_result]
      @result.time      = params[:exam_time]
      @result.save!
      redirect_to user_path(current_user)
    end
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    if current_user && current_user.role == "admin"
      respond_to do |format|
        if @result.update(result_params)
          format.html { redirect_to @result, notice: 'Result was successfully updated.' }
          format.json { render :show, status: :ok, location: @result }
        else
          format.html { render :edit }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    if (current_user && current_user.id == @result.user_id) || current_user && current_user.role == "admin"
      @result.destroy
      respond_to do |format|
        format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:user_id, :exam_id, :settings, :questions, :time, :result)
    end
end
