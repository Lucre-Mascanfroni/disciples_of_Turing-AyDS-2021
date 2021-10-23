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
		if Time.parse(initial_date.to_s) <= Time.parse(final_date.to_s)
			result = {"name" => name, "number" => 0}
			surveys.each do |survey|
				result["number"] += 1 if survey.is_created_at_between(initial_date, final_date)
			end
		end
		return result
	end		
end

