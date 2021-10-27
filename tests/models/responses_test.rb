# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

class ResponsesTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_response_has_one_question
    clean_database
    response = Response.create
    question = Question.create(name: 'How old are you?', description: 'years to person', number: 9, type: 'NUMERIC')
    response.question_id = question.id
    assert_equal response.question, question
  end

  def test_response_has_one_choice
    clean_database
    response = Response.create
    choice = Choice.create(text: 'No me interesa la politica')
    response.choice_id = choice.id
    assert_equal response.choice, choice
  end

  def test_response_has_one_survey
    clean_database
    response = Response.create
    survey = Survey.create(name: 'El periodismo es mi segunda opción')
    response.survey_id = survey.id
    assert_equal response.survey, survey
  end
end
