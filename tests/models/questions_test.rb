require File.expand_path '../../test_helper.rb', __FILE__

class QuestionTest < MiniTest::Unit::TestCase
   MiniTest::Unit::TestCase

   def test_question_must_have_all_attributes_1
     #Arrange
     question = Question.new(name: 'Sky Question')
     #Act
     
     #Assert
     assert_equal question.valid?, false
   end
   
   def test_question_must_have_all_attributes_2
     #Arrange
     question = Question.new(description: 'Is the sky blue?')
     #Act
     
     #Assert
     assert_equal question.valid?, false
   end
   
   def test_question_must_have_all_attributes_3
     #Arrange
     question = Question.new(number: 1);
     #Act
     
     #Assert
     assert_equal question.valid?, false
   end
   
   def test_question_must_have_all_attributes_4
     #Arrange
     question = Question.new(type: 'YES/NO')
     #Act
     
     #Assert
     assert_equal question.valid?, false
   end
   
   def test_question_must_have_all_attributes_5
     #Arrange
     question = Question.new(name: 'Sky question', description: 'Is the sky blue?', number: 1, type: 'YES/NO')
     #Act
     
     #Assert
     assert_equal question.valid?, true
   end
   
   def test_question_number_must_be_unique
      #Creamos la question en la base de datos
      Question.create(name: 'Sky question', description: 'Is the sky blue?', number: 1, type: 'YES/NO')
      assert_equal Question.new(name: 'Question for teacher', description: 'Can i go to the bathroom?', number: 1, type: 'YES/NO').valid?, false
   end
end









































