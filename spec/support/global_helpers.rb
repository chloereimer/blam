module GlobalHelpers
  def described_class_symbol
    described_class.name.downcase.to_sym
  end
end
