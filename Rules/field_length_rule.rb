require_relative '../rule_base'

class FieldLengthRule < RuleBase
  def initialize(entity, field, length, display="")
    @entity = entity
    @field = field
    @length = length
    @display = display
  end

  def on_validate
    if @entity[@field].length > @length
      invalidate("#{@field} must be equal to or less than #{@length} characters")
    end 
  end
end
