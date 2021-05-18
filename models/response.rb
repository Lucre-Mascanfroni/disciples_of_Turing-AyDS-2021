class Response < Sequel::Model
    many_to_one     :question
    many_to_many	:surveys
	many_to_many	:choices
end