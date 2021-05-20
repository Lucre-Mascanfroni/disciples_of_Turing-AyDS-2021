class Question < Sequel::Model
  plugin :validation_helpers
  one_to_many		:choices
  one_to_many		:responses
  
  def validate
     super
     validates_presence [:name, :description, :number, :type]
     validates_unique :number
  end
end
