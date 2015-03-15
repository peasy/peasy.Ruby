class RuleBase
  attr_reader :error_message, 
              :successor, 
              :if_valid_then_execute, #The action to perform once when this rule passes validation.
              :if_invalid_then_execute #The action to perform once when this rule fails validation.

  def validate
    @valid = true
    on_validate
    if valid?
      if successor
        successor.validate
        invalidate(successor.error_message) if !successor.valid?
      end
      if @if_valid_then_execute
        @if_valid_then_execute.call(self)
        @if_valid_then_execute = nil
      end
    else
      if @if_invalid_then_execute
        @if_invalid_then_execute.call(self)
        @if_invalid_then_execute = nil
      end
    end
    return self
  end

  def valid?
    @valid
  end

  def if_valid_then_validate(rule)
    @successor = rule
    self
  end

  def if_valid_then_execute(method)
    @if_valid_then_execute = method
    self
  end

  def if_invalid_then_execute(method)
    @if_invalid_then_execute = method 
    self
  end

  protected 

  def on_validate
    raise "on_validate must be implemented"
  end

  def invalidate(message)
    @error_message = message
    @valid = false
  end

end
