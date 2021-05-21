require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase
  def test_survey_name_must_not_be_empty
    survey = Survey.new
    survey.name = ''
    assert_equal survey.valid?, false
  end

  def test_survey_name_must_not_be_nil
    survey = Survey.new
    survey.name = nil
    assert_equal survey.valid?, false
  end
end