class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    if current_user
      @nav = "exams"
      @exams = Exam.all.sort_by { |exam| exam.name }
    else redirect_to root_url
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @questions = Question.where(exam: @exam.id).all
    @questions = @questions.drop(@questions.count - @exam.questions)
    if @exam.shuffle_questions
      @questions = @questions.shuffle
    end
    render :layout => 'exam'
  end

  # GET /exams/new
  def new
    if current_user
      @nav = "exams"
      @exam = Exam.new
      @questions = Question.where(exam: @exam.id).all.count
    else redirect_to root_url
    end
  end

  # GET /exams/1/edit
  def edit
    if current_user
      @nav = "exams"
      @questions = Question.where(exam: @exam.id).all.count
    else redirect_to root_url
    end
  end

  # POST /exams
  # POST /exams.json
  def create
    if current_user
      @nav = "exams"
      @exam = Exam.new(exam_params)

      respond_to do |format|
        if @exam.save
          format.html { redirect_to exams_path, notice: 'Exam was successfully created.' }
          format.json { render :show, status: :created, location: @exam }
        else
          format.html { render :new }
          format.json { render json: @exam.errors, status: :unprocessable_entity }
        end
      end
    else redirect_to root_url
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    if current_user
      respond_to do |format|
        if @exam.update(exam_params)
          format.html { redirect_to exams_path, notice: 'Exam was successfully updated.' }
          format.json { render :show, status: :ok, location: @exam }
        else
          format.html { render :edit }
          format.json { render json: @exam.errors, status: :unprocessable_entity }
        end
      end
    else redirect_to root_url
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    if current_user
      @exam.destroy
      respond_to do |format|
        format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
        format.json { head :no_content }
      end
    else redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:name, :description, :questions, :checks, :hints, :shuffle_answers, :shuffle_questions, :timer, :navigation)
    end
end
