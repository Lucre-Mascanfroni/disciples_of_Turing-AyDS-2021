class Career < Sequel::Model
	plugin :validation_helpers
	one_to_many :outcomes
	one_to_many :surveys
	def validate
		super 
		validates_presence :name
	end	
	
	def number_of_surveys_between_two_dates(initial_date, final_date)
		if  Time.parse(final_date) < Time.parse(initial_date)
			raise ArgumentError.new("initial date is greater than the final date.")
		end
		if Time.parse(initial_date.to_s) <= Time.parse(final_date.to_s)
			result = {"name" => name, "number" => 0}
			surveys.each do |survey|
				if Time.parse(initial_date.to_s) <= survey.created_at && survey.created_at <= Time.parse(final_date.to_s)
					result["number"]+=1
				end
			end
		end
		return result
	end		
end

