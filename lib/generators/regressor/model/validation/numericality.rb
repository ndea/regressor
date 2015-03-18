module Regressor
  module Model
    module Validation
      module Numericality
        def numericality_validators
          extract_validators(ActiveModel::Validations::NumericalityValidator).inject([]) do |result, validator|
            validator.options.each do |k, v|
              case k
                when :even
                  validator.attributes.each do |attribute|
                    result << "it { is_expected.to validate_numericality_of(:#{attribute}).even}"
                  end
                when :only_integer
                  validator.attributes.each do |attribute|
                    result << "it { is_expected.to validate_numericality_of(:#{attribute}).only_integer}"
                  end
                when :allow_nil
                  validator.attributes.each do |attribute|
                    result << "it { is_expected.to validate_numericality_of(:#{attribute}).allow_nil}"
                  end
              end
            end
            result
          end.uniq.join("\n\t")
        end
      end
    end
  end
end

# * <tt>:message</tt> - A custom error message (default is: "is not a number").
# * <tt>:only_integer</tt> - Specifies whether the value has to be an
#   integer, e.g. an integral value (default is +false+).
# * <tt>:allow_nil</tt> - Skip validation if attribute is +nil+ (default is
#   +false+). Notice that for fixnum and float columns empty strings are
#   converted to +nil+.
# * <tt>:greater_than</tt> - Specifies the value must be greater than the
#   supplied value.
# * <tt>:greater_than_or_equal_to</tt> - Specifies the value must be
#   greater than or equal the supplied value.
# * <tt>:equal_to</tt> - Specifies the value must be equal to the supplied
#   value.
# * <tt>:less_than</tt> - Specifies the value must be less than the
#   supplied value.
# * <tt>:less_than_or_equal_to</tt> - Specifies the value must be less
#   than or equal the supplied value.
# * <tt>:other_than</tt> - Specifies the value must be other than the
#   supplied value.
# * <tt>:odd</tt> - Specifies the value must be an odd number.
# * <tt>:even</tt> - Specifies the value must be an even number.
#
# There is also a list of default options supported by every validator:
# +:if+, +:unless+, +:on+, +:allow_nil+, +:allow_blank+, and +:strict+ .
# See <tt>ActiveModel::Validation#validates</tt> for more information
#
# The following checks can also be supplied with a proc or a symbol which
# corresponds to a method:
#
# * <tt>:greater_than</tt>
# * <tt>:greater_than_or_equal_to</tt>
# * <tt>:equal_to</tt>
# * <tt>:less_than</tt>
# * <tt>:less_than_or_equal_to</tt>
# * <tt>:only_integer</tt>
#