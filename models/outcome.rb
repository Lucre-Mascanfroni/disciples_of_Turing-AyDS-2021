# frozen_string_literal: true

# Class Outcome
class Outcome < Sequel::Model
  many_to_one :choice
  many_to_one :career
end
