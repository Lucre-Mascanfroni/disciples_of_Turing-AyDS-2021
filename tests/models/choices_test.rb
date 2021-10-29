# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

# Class ChoiceTest
class ChoiceTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase
  def test_choice_must_has_text
    clean_database
    choice = Choice.new
    choice.text = ''
    assert_equal choice.valid?, false
  end

  def test_choice_has_many_outcomes
    clean_database
    Question.create(name: 'Pregunta 1', description: '¿Cuáles son tus gustos musicales?', number: 1, type: 'preferencias')
    choice = Choice.create(text: 'estoy de acuerdo')

    Outcome.create(choice_id: choice.id)
    Outcome.create(choice_id: choice.id)
    Outcome.create(choice_id: choice.id)
    assert_equal choice.outcomes.count, 3
  end

  def test_choice_has_many_responses
    clean_database
    Question.create(name: 'Pregunta 2', description: '¿Te interesa el arte?', number: 2, type: 'preferencias')
    choice = Choice.create(text: 'No me interesa')

    Response.create(choice_id: choice.id)
    Response.create(choice_id: choice.id)
    Response.create(choice_id: choice.id)
    assert_equal choice.responses.count, 3
  end

  def test_choice_has_one_question
    clean_database
    choice = Choice.create(text: 'Me interesa poco')
    question = Question.create(name: 'Pregunta 3', description: '¿Te interesa el deporte', number: 2, type: 'preferencias')
    choice.question_id = question.id
    assert_equal choice.question, question
  end
end
