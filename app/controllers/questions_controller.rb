class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if current_user
      @questions = Question.all.sort_by { |question| question.exam }
      @nav = "questions"
    else
      redirect_to root_url
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if current_user
      @nav = "questions"
    else
      redirect_to root_url
    end
  end

  # GET /questions/new
  def new
    if current_user
      @nav = "questions"
      @question = Question.new
    else
      redirect_to root_url
    end
  end

  # GET /questions/1/edit
  def edit
    if current_user
      @nav = "questions"
    else
      redirect_to root_url
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    if current_user
      @question = Question.new(question_params)

      respond_to do |format|
        if @question.save
          format.html { redirect_to @question, notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if current_user
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if current_user
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:exam, :q_type, :q_text, :q_answer001, :q_answer001_active, :q_answer001_correct, :q_answer002, :q_answer002_active, :q_answer002_correct, :q_answer003, :q_answer003_active, :q_answer003_correct, :q_answer004, :q_answer004_active, :q_answer004_correct, :q_answer005, :q_answer005_active, :q_answer005_correct, :q_answer006, :q_answer006_active, :q_answer006_correct, :q_answer007, :q_answer007_active, :q_answer007_correct, :q_answer008, :q_answer008_active, :q_answer008_correct, :q_answer009, :q_answer009_active, :q_answer009_correct, :q_answer010, :q_answer010_active, :q_answer010_correct)
    end
end
