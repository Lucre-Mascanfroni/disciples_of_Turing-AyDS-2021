# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

# Class CareerTest
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

  def test_method_number_of_surveys_between_two_dates
    clean_database
    career = Career.create(name: 'Microbiología')
    Survey.create(name: 'U1', career_id: career.id, created_at: Time.parse('2021-10-11'))
    Survey.create(name: 'U2', career_id: career.id, created_at: Time.parse('2021-10-19'))
    initial_date = '2021-10-11'
    final_date = '2021-10-19'
    result = career.number_of_surveys_between_two_dates(initial_date, final_date)['number']
    assert_equal result, 2
  end
end
