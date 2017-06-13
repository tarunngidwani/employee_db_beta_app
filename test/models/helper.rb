# Helper method:
# Asserts that the specified attribute value
# for obj under test cannot be nil or empty
def assert_not_nil_empty(obj, attr_symbol)
  assert obj.invalid?
  assert obj.errors[attr_symbol].any?
  assert_equal [(I18n.translate 'errors.messages.blank')],
               obj.errors[attr_symbol]
end
