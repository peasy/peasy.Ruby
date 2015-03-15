require_relative '../rule_base'

class FieldRequiredRule < RuleBase
  def initialize(entity, field)
    @entity = entity
    @field = field
  end

  def on_validate
    if @entity[@field].to_s.empty?
      invalidate("#{@field} is a required field")
    end
  end
end
