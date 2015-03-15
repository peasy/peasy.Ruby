require_relative "execution_result"

class CommandBase

  def initialize(execute_method, rules_method)
    @execute_method = execute_method
    @rules_method = rules_method
  end

  def can_execute?
    !get_validation_errors.any?
  end

  def execute
    errors = get_validation_errors
    if errors.any?
      return ExecutionResult.new(false, nil, errors)
    end

    execution_result = @execute_method.call
    return ExecutionResult.new(true, execution_result, nil)
  end

  protected

  def get_validation_errors
    rules =  @rules_method.call
    errors = rules.select { |rule| rule.validate; !rule.valid? }
                  .map { |error| error.error_message }               
  end

end
