# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

class QuestionTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_question_must_have_all_attributes_1
    clean_database

    question = Question.new(name: 'Sky Question')

    assert_equal question.valid?, false
  end

  def test_question_must_have_all_attributes_2
    clean_database

    question = Question.new(description: 'Is the sky blue?')

    assert_equal question.valid?, false
  end

  def test_question_must_have_all_attributes_3
    clean_database

    question = Question.new(number: 1)

    assert_equal question.valid?, false
  end

  def test_question_must_have_all_attributes_4
    clean_database

    question = Question.new(type: 'YES/NO')

    assert_equal question.valid?, false
  end

  def test_question_must_have_all_attributes_5
    clean_database

    question = Question.new(name: 'Sky question', description: 'Is the sky blue?', number: 1, type: 'YES/NO')

    assert_equal question.valid?, true
  end

  def test_question_has_many_choices
    clean_database

    question = Question.create(name: 'Sky question', description: 'Is the sky blue?', number: 1, type: 'YES/NO')
    Choice.create(text: 'YES', question_id: question.id)
    Choice.create(text: 'NO', question_id:  question.id)

    assert_equal question.choices.count, 2
  end

  def test_question_has_many_responses
    clean_database

    question = Question.create(name: 'Question about personal preferences', description: 'Breaking Bad or Game of Thrones?', number: 2, type: 'Multiple choice')
    ch1 = Choice.create(text: 'Breaking Bad', question_id: question.id)
    ch2 = Choice.create(text: 'Game of Thrones', question_id: question.id)
    ch3 = Choice.create(text: 'Both', question_id: question.id)
    ch4 = Choice.create(text: 'Neither, Vikings', question_id: question.id)
    s1 = Survey.create(name: 'Axel')
    s2 = Survey.create(name: 'Tereza')
    Response.create(question_id: question.id, choice_id: ch1.id, survey_id: s1.id)
    Response.create(question_id: question.id, choice_id: ch2.id, survey_id: s2.id)
    assert_equal question.responses.count, 2
  end

  def test_question_number_must_be_unique
    clean_database

    Question.create(name: 'Sky question', description: 'Is the sky blue?', number: 3, type: 'YES/NO')
    assert_equal Question.new(name: 'Question for teacher', description: 'Can i go to the bathroom?', number: 3, type: 'YES/NO').valid?, false
  end
end
