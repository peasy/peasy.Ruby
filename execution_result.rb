class ExecutionResult
  attr_reader :success, :value, :errors

  def initialize(success, value, errors)
    @success = success
    @value = value
    @errors = errors
  end
end
