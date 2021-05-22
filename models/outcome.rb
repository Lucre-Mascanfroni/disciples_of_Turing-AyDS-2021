class Outcome < Sequel::Model
	Uses singular form of associated model name
    many_to_one :choice
    many_to_one :career
end
