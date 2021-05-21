class Choice < Sequel::Model
    plugin :validation_helpers
    # Uses singular form of associated model name
    many_to_one     :question
    # Uses plural form of associated model name
    one_to_many     :outcomes
    one_to_many      :responses
    def validate 
    	super
    	errors.add(:text,'text can not be empty') if !text || text.empty?
    end

end
