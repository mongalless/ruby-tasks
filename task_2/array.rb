# frozen_string_literal: true

class Array
  def rebuild!
    map! do |element|
      case element
      when Integer
        yield(element, added_number = size)
      when Array
        element.map! do |element_value|
          yield(element_value, added_number = element.size)
        end
      end
    end
  end
end
