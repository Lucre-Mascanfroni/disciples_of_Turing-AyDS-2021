
class Survey < Sequel::Model
	plugin :validation_helpers
    one_to_many    :responses
    many_to_one    :career

    def validate 
    	super
    	validates_presence :name
    end

    def id_career_result(careers)
        h = {}
        careers.each do |career|
            h[career.id] = 0
        end

        responses.each do |response|
            response.choice.outcomes.each do |outcome|
                h[outcome.career_id] = h[outcome.career_id] + 1
            end
        end

        h.key(h.values.max)
    end
end

