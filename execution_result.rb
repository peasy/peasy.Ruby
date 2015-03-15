class ExecutionResult
  attr_reader :value, :errors

  def initialize(success, value, errors)
    @success = success
    @value = value
    @errors = errors
  end

  def success?
    @success
  end
end
