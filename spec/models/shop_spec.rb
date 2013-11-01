require 'spec_helper'

describe Shop do
  it { should belong_to(:category) }
  it { should have_many(:servings).dependent(:destroy) }
  it { should accept_nested_attributes_for(:servings).allow_destroy(true) }
  it { should have_many(:foods).through(:servings) }
  it { should have_attached_file(:photo) }

  it { should allow_value(nil).for(:name) }
  it { should allow_value(1).for(:name) }
  it { should allow_value("abc").for(:name) }

  it { should allow_value(nil).for(:prefecture) }
  it { should allow_value(1).for(:prefecture) }
  it { should allow_value("abc").for(:prefecture) }

  it { should allow_value(nil).for(:city) }
  it { should allow_value(1).for(:city) }
  it { should allow_value("abc").for(:city) }

  it { should allow_value(nil).for(:address) }
  it { should allow_value(1).for(:address) }
  it { should allow_value("abc").for(:address) }

  it { should allow_value(nil).for(:url) }
  it { should allow_value(1).for(:url) }
  it { should allow_value("abc").for(:url) }

  it { should allow_value(nil).for(:category_id) }
  it { should allow_value(1).for(:category_id) }
  it { should_not allow_value("abc").for(:category_id) }
end