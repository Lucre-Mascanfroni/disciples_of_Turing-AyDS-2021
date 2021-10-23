require File.expand_path '../../test_helper.rb', __FILE__

class CareerTest < MiniTest::Unit::TestCase
   MiniTest::Unit::TestCase

   def test_career_has_many_surveys
        clean_database
        career = Career.create(name: 'Licenciatura en Analisis de Capitulos de Teletubbies')
        Survey.create(name: 'U1', career_id: career.id)
        Survey.create(name: 'U2', career_id: career.id)
        Survey.create(name: 'U3', career_id: career.id)
        assert_equal career.surveys.count, 3
   end
   def test_career_name_must_not_be_empty
        clean_database
        c = Career.new
        c.name = ''
        assert_equal c.valid?, false
   end
   def test_method_s_for_dates
     clean_database
     career = Career.create(name: 'Microbiología')
     Survey.create(name: 'U1', career_id: career.id, created_at:Time.parse('2021-10-11'))
     Survey.create(name: 'U2', career_id: career.id, created_at:Time.parse('2021-10-15'))
     Survey.create(name: 'U3', career_id: career.id, created_at:Time.parse('2021-10-18'))
     Survey.create(name: 'U4', career_id: career.id, created_at:Time.parse('2021-10-19'))
     c1 = Career.find(id:career.id)
     firstDate = '2021-10-11'
     lastDate = '2021-10-19'
     result = c1.s_for_dates(firstDate,lastDate)['number']
     assert_equal result, 4

   end
end
