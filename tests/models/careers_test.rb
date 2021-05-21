require File.expand_path '../../test_helper.rb', __FILE__

class CareerTest < MiniTest::Unit::TestCase
   MiniTest::Unit::TestCase

   def test_career_has_many_surveys
        career = Career.create(name: 'Licenciatura en Analisis de Capitulos de Teletubbies')
        Survey.create(name: 'U1', career_id: career.id)
        Survey.create(name: 'U2', career_id: career.id)
        Survey.create(name: 'U3', career_id: career.id)
        assert_equal career.surveys.count, 3
   end
   def test_career_name_must_not_be_empty
        c = Career.new
        c.name = ''
        assert_equal c.valid?, false
   end
end
