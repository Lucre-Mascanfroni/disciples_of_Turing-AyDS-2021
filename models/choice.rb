class Choice < Sequel::Model
    # Uses singular form of associated model name
    many_to_one :question
end
