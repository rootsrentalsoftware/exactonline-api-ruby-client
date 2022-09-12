# frozen_string_literal: true

module Elmas
  module Utils
    def self.demodulize(class_name_in_module)
      class_name_in_module.to_s.sub(/^.*::/, "")
    end

    def self.pluralize(word)
      word.to_s.sub(/([^s])$/, '\1s')
    end

    def self.modulize(class_name)
      "Elmas::#{class_name}"
    end

    def self.collection_path(class_name)
      (Utils.pluralize Utils.demodulize class_name).downcase
    end

    def self.camelize(word, uppercase_first_letter = true)
      if uppercase_first_letter
        word.to_s.gsub(%r{//(.?)/}) { "::#{$1.upcase}" }.gsub(/(^|_)(.)/) { $2.upcase }
      else
        word[0] + Utils.camelize(word)[1..]
      end
    end

    def self.normalize_hash_key(key)
      if key.is_a? String
        key = key.gsub(/::/, "/")
        key = key.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        key = key.gsub(/([a-z\d])([A-Z])/, '\1_\2')
        key = key.tr("-", "_")
        key = key.split("_").map(&:downcase_exact).join("_")
        return key.intern
      end
      key
    end

    def self.normalize_hash(hash)
      hash&.transform_keys { |k| Utils.normalize_hash_key(k) }
    end

    def self.parse_key(key)
      # TODO: Peter, why is this?
      "VATCode" if key.casecmp "vat_code"
      Utils.camelize(key)
    end
  end
end

class String
  def downcase_exact
    if /[[:upper:]]/.match(self[0]) && /[[:upper:]]/.match(self[1])
      self
    else
      downcase
    end
  end
end
