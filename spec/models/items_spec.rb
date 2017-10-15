# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the item model
RSpec.describe Item, type: :model do
  # Association test
  # ensure an item record belongs to a single bill record
  it { should belong_to(:bill) }
  # Validation test
  # ensure column name is present before saving
  # it { should validate_presence_of(:firstName) }
  # it { should validate_presence_of(:lastName) }
  it { should validate_presence_of(:name)}

end
