class Calculator

  def add *numbers
    numbers.inject(:+)
  end
  
  def sub *numbers
    numbers.inject(:-)
  end
  
end
