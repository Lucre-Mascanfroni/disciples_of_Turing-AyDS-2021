class Career < Sequel::Model
	plugin :validation_helpers
	one_to_many :outcomes
	one_to_many :surveys
	def validate
		super 
		validates_presence :name
	end	
	
	def s_for_dates(firstDate,lastDate)
		if  Time.parse(lastDate) <Time.parse(firstDate)
			raise ArgumentError.new("fistDate is greater than the lastDate.")
		end
		result = {}
		if Time.parse(firstDate.to_s) <= Time.parse(lastDate.to_s)
			result["name"]=name
			result["number"]=0
			surveys.each do |survey|
				if Time.parse(firstDate.to_s) <= survey.created_at && survey.created_at <= Time.parse(lastDate.to_s)
					result["number"]+=1
				end
			end
		end
		return result
	end		
end

