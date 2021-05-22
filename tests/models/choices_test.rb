require File.expand_path '../../test_helper.rb', __FILE__

class ChoiceTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase
  def test_choice_must_has_text
    # Arrange
    choice = Choice.new
    # Act
    choice.text = ''
    # Assert
    assert_equal choice.valid?, false
  end

  def test_choice_has_many_outcomes
    question = Question.create(name:"Pregunta 1",description:"¿Cuáles son tus gustos musicales?",number:1,type:"preferencias")
    choice = Choice.create(text:'estoy de acuerdo')

    Outcome.create(choice_id: choice.id)
    Outcome.create(choice_id: choice.id)
    Outcome.create(choice_id: choice.id)
    assert_equal choice.outcomes.count, 3
  end
  
end