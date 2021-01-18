# frozen_string_literal: true

module Truncate
  def truncate(attribute, length_hash)
    attr = attribute.to_s
    length = length_hash[:length]
    define_method(attr) do
      instance_variable_get("@#{attr}".to_sym)
        .then { |variable_value| variable_value.chomp[0...length] }
        .then { |variable_value| variable_value.concat('...') }
    end
  end
end
