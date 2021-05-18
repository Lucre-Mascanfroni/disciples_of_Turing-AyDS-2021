class Choice < Sequel::Model
    # Uses singular form of associated model name
    many_to_one     :question
    # Uses plural form of associated model name
    one_to_many     :outcomes
    one_to_many      :responses

end
