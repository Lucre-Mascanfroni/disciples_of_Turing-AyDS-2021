# frozen_string_literal: true

# Class Choice
class Choice < Sequel::Model
  plugin :validation_helpers
  many_to_one :question
  one_to_many :outcomes
  one_to_many :responses
  def validate
    super
    errors.add(:text, 'El campo texto no puede ser vacio.') if !text || text.empty?
  end
end
