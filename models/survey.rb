class Survey < Sequel::Model
    many one_to_many    :responses
end