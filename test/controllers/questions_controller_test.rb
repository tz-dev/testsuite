require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { exam: @question.exam, q_answer001: @question.q_answer001, q_answer001_active: @question.q_answer001_active, q_answer001_correct: @question.q_answer001_correct, q_answer002: @question.q_answer002, q_answer002_active: @question.q_answer002_active, q_answer002_correct: @question.q_answer002_correct, q_answer003: @question.q_answer003, q_answer003_active: @question.q_answer003_active, q_answer003_correct: @question.q_answer003_correct, q_answer004: @question.q_answer004, q_answer004_active: @question.q_answer004_active, q_answer004_correct: @question.q_answer004_correct, q_answer005: @question.q_answer005, q_answer005_active: @question.q_answer005_active, q_answer005_correct: @question.q_answer005_correct, q_answer006: @question.q_answer006, q_answer006_active: @question.q_answer006_active, q_answer006_correct: @question.q_answer006_correct, q_answer007: @question.q_answer007, q_answer007_active: @question.q_answer007_active, q_answer007_correct: @question.q_answer007_correct, q_answer008: @question.q_answer008, q_answer008_active: @question.q_answer008_active, q_answer008_correct: @question.q_answer008_correct, q_answer009: @question.q_answer009, q_answer009_active: @question.q_answer009_active, q_answer009_correct: @question.q_answer009_correct, q_answer010: @question.q_answer010, q_answer010_active: @question.q_answer010_active, q_answer010_correct: @question.q_answer010_correct, q_text: @question.q_text, q_type: @question.q_type } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { exam: @question.exam, q_answer001: @question.q_answer001, q_answer001_active: @question.q_answer001_active, q_answer001_correct: @question.q_answer001_correct, q_answer002: @question.q_answer002, q_answer002_active: @question.q_answer002_active, q_answer002_correct: @question.q_answer002_correct, q_answer003: @question.q_answer003, q_answer003_active: @question.q_answer003_active, q_answer003_correct: @question.q_answer003_correct, q_answer004: @question.q_answer004, q_answer004_active: @question.q_answer004_active, q_answer004_correct: @question.q_answer004_correct, q_answer005: @question.q_answer005, q_answer005_active: @question.q_answer005_active, q_answer005_correct: @question.q_answer005_correct, q_answer006: @question.q_answer006, q_answer006_active: @question.q_answer006_active, q_answer006_correct: @question.q_answer006_correct, q_answer007: @question.q_answer007, q_answer007_active: @question.q_answer007_active, q_answer007_correct: @question.q_answer007_correct, q_answer008: @question.q_answer008, q_answer008_active: @question.q_answer008_active, q_answer008_correct: @question.q_answer008_correct, q_answer009: @question.q_answer009, q_answer009_active: @question.q_answer009_active, q_answer009_correct: @question.q_answer009_correct, q_answer010: @question.q_answer010, q_answer010_active: @question.q_answer010_active, q_answer010_correct: @question.q_answer010_correct, q_text: @question.q_text, q_type: @question.q_type } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
