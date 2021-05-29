class Career < Sequel::Model
	plugin :validation_helpers
	one_to_many :outcomes
	one_to_many :surveys
	def validate
		super 
		validates_presence :name
	end

	def doesHaveFullDescription?
		full_description && !full_description.empty?
	end

	def update_attribute(name, value)
		send(name.to_s + "=", value)
		save
	end
end