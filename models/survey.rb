# frozen_string_literal: true

# Class Survey
class Survey < Sequel::Model
  plugin :validation_helpers
  one_to_many    :responses
  many_to_one    :career

  def validate
    super
    validates_presence :name
  end

  def survey_result(careers)
    evaluate_responses(careers).sort_by { |_career, outcomes| outcomes }
  end

  def evaluate_responses(careers)
    career_weights = {}
    careers.map { |career| career_weights[career] = 0 }
    responses.map { |response| response.choice.outcomes.map { |outcome| career_weights[outcome.career] += 1 } }
    career_weights
  end

  def created_at_between?(initial_date, final_date)
    Time.parse(initial_date.to_s) <= created_at && created_at <= Time.parse(final_date.to_s)
  end
end
