class Object
  def should(matcher=nil)
    MSpec.actions :expectation, MSpec.current.state
    if matcher
      unless matcher.matches?(self)
        raise Expectation.fail_with(*matcher.failure_message)
      end
    else
      PositiveOperatorMatcher.new(self)
    end
  end
  
  def should_not(matcher=nil)
    MSpec.actions :expectation, MSpec.current.state
    if matcher
      if matcher.matches?(self)
        raise Expectation.fail_with(*matcher.negative_failure_message)
      end
    else
      NegativeOperatorMatcher.new(self)
    end
  end
end
