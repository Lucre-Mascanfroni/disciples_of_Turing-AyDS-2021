class Outcome < Sequel::Model
    many_to_one :choice
end
