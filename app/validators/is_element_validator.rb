class IsElementValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && value <= Element::Base
      record.errors.add attribute, "is not a subclass of Element::Base"
    end
  end
end
