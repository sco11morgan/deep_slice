class Hash
  def deep_slice(*elements)
    result = {}
    elements.each do |element|
      if element.is_a?(Hash)
        element.keys.each do |sub_element|
          if has_key?(sub_element)
            result[sub_element] = self[sub_element].deep_slice(*Array(element[sub_element]))
          end
        end
      elsif has_key?(element)
        result[element] = self[element]
      end
    end
    result
  end
end