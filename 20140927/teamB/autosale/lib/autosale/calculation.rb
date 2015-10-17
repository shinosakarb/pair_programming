class Calculation
  def displayshow(money=[])
    money.inject { |mem, var| mem + var }
  end
end
