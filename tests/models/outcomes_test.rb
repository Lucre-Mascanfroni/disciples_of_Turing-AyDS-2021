require File.expand_path '../../test_helper.rb', __FILE__

class OutcomeTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_outcome_has_one_choice
    clean_database
    outcome= Outcome.create()
    choice = Choice.create(text: 'Me interesa poco')
    outcome.choice= choice
    assert_equal outcome.choice,choice
    
  end
end