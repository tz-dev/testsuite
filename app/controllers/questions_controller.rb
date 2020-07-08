class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if current_user && current_user.role == "admin"
      @questions = Question.all.sort_by { |question| question.exam }
      if params[:sort_by] == "ID"
        @questions = Question.all.sort_by { |question| question.id }
      end
      if params[:sort_by] == "exam"
        @questions = Question.all.sort_by { |question| question.exam }
      end
      if params[:sort_by] == "type"
        @questions = Question.all.sort_by { |question| question.q_type }
      end
      if params[:sort_by] == "text"
        @questions = Question.all.sort_by { |question| question.q_text }
      end
      @nav = "questions"
    else
      redirect_to root_url
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if current_user && current_user.role == "admin"
      @nav = "questions"
    else
      redirect_to root_url
    end
  end

  # GET /questions/new
  def new
    if current_user && current_user.role == "admin"
      @nav = "questions"
      @question = Question.new
      @form = true;
    else
      redirect_to root_url
    end
  end

  # GET /questions/1/edit
  def edit
    if current_user && current_user.role == "admin"
      @nav = "questions"
      @form = true;
    else
      redirect_to root_url
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    if current_user && current_user.role == "admin"
      @question = Question.new(question_params)

      respond_to do |format|
        if @question.save
          format.html { redirect_to Exam.find(question_params[:exam]), notice: 'Question was successfully created.' }
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
    if current_user && current_user.role == "admin"
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to Exam.find(@question.exam), notice: 'Question was successfully updated.' }
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
    if current_user && current_user.role == "admin"
      @question.destroy
      if params[:exam_id].include?("questions")
        url = questions_path
      else
        url = Exam.find(params[:exam_id])
      end
      respond_to do |format|
        format.html { redirect_to url, notice: 'Question was successfully destroyed.' }
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
