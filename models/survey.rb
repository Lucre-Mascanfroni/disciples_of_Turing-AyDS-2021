
class Survey < Sequel::Model
    plugin :validation_helpers
    one_to_many    :responses
    many_to_one    :career

    def validate 
    	super
    	validates_presence :name
    end

    def result(careers)
        h = {}
        careers.each do |career|
            h[career] = 0
        end

        responses.each do |response|
            response.choice.outcomes.each do |outcome|
                h[outcome.career] += 1
            end
        end

        h.sort_by { |career, outcomes| outcomes }
    end
end

