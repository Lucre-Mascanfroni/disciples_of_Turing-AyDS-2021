# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

# Class SurveyTest
class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase
  def test_survey_name_must_not_be_empty
    clean_database
    survey = Survey.new
    survey.name = ''
    assert_equal survey.valid?, false
  end

  def test_survey_name_must_not_be_nil
    clean_database
    survey = Survey.new
    survey.name = nil
    assert_equal survey.valid?, false
  end

  def test_survey_has_many_responses
    clean_database
    survey = Survey.create(name: 'survey 1')
    Response.create(survey_id: survey.id)
    Response.create(survey_id: survey.id)
    Response.create(survey_id: survey.id)
    Response.create(survey_id: survey.id)
    assert_equal survey.responses.count, 4
  end

  def test_survey_has_one_career
    clean_database
    survey = Survey.create(name: 'survey 1')
    c = Career.create(name: 'Prof. en Ciencias de la Computación')
    survey.career_id = c.id
    assert_equal survey.career, c
  end
end
