
class Survey < Sequel::Model
	plugin :validation_helpers
    one_to_many    :responses
    many_to_one    :career
    def validate 
    	super
    	validates_presence :name
    end
end

