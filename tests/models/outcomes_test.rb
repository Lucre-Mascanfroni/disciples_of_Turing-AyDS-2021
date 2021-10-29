# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

# Class OutcomeTest
class OutcomeTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_outcome_has_one_choice
    clean_database
    outcome = Outcome.create
    choice = Choice.create(text: 'Me interesa poco')
    outcome.choice_id = choice.id
    assert_equal outcome.choice, choice
  end

  def test_outcome_has_one_career
    clean_database
    career = Career.create(name: 'Licenciatura en Analisis de Capitulos de Teletubbies')
    outcome = Outcome.create
    outcome.career_id = career.id
    assert_equal outcome.career, career
  end
end
