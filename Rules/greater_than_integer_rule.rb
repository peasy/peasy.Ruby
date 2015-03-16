require_relative '../rule_base'

class GreaterThanIntegerRule < RuleBase
  def initialize(field, value, size)
    @field = field
    @value = value
    @size = size
  end

  def on_validate
    if @value <= @size 
      invalidate("#{@field} must be greater than #{@size}")
    end
  end
end
