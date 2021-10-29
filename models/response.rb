# frozen_string_literal: true

# Class Response
class Response < Sequel::Model
  many_to_one     :question
  many_to_one     :survey
  many_to_one	    :choice
end
