
class Survey < Sequel::Model
    plugin :validation_helpers
    one_to_many    :responses
    many_to_one    :career

    def validate 
    	super
    	validates_presence :name
    end

    def survey_result(careers)
        career_weights = {}
        careers.map { |career| career_weights[career] = 0 }

        responses.each do |response|
            response.choice.outcomes.each do |outcome|
                career_weights[outcome.career] += 1
            end
        end

        career_weights.sort_by { |career, outcomes| outcomes }
    end
end

