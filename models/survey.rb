
class Survey < Sequel::Model
    plugin :validation_helpers
    one_to_many    :responses
    many_to_one    :career

    def validate 
    	super
    	validates_presence :name
    end

    def survey_result(careers)
        evaluate_responses(careers).sort_by { |career, outcomes| outcomes }
    end

    def evaluate_responses(careers)
        career_weights = {}
        careers.map { |career| career_weights[career] = 0 }
        responses.map { |response| response.choice.outcomes.map { |outcome| career_weights[outcome.career] += 1 } }
        career_weights
    end
end

