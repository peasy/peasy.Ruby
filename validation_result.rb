class ValidationResult
  attr_accessor :member, :error_messages

  def initialize
    @error_messages = []
  end
end
