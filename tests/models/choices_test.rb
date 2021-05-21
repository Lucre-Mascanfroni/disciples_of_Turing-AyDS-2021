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
end