# spec/models/billed_spec.rb
require 'rails_helper'

# Test suite for the billed model
RSpec.describe Billed, type: :model do
  # Association test
  # ensure an billed record belongs to a single bill record
  it { should belong_to(:bill) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:firstName) }
  it { should validate_presence_of(:lastName) }

end
