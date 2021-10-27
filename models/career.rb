# frozen_string_literal: true

class Career < Sequel::Model
  plugin :validation_helpers
  one_to_many :outcomes
  one_to_many :surveys
  def validate
    super
    validates_presence :name
  end

  def number_of_surveys_between_two_dates(initial_date, final_date)
    result = {}
    if the_dates_are_valid?(initial_date, final_date)
      result = { 'name' => name, 'number' => 0 }
      surveys.map { |survey| survey.is_created_at_between(initial_date, final_date) && result['number'] += 1 }
    end
    result
  end

  def the_dates_are_valid?(initial_date, final_date)
    Time.parse(initial_date.to_s) <= Time.parse(final_date.to_s)
  end
end
