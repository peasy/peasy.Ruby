class ValidationResult
  attr_accessor :entity, :error_messages

  def initialize(entity, error_messages = [])
    @entity = entity
    @error_messages = error_messages 
  end
end
