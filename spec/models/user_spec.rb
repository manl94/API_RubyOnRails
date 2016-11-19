require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email  }
  it { should_not allow_value("uriel@codigofacilito").for :email}
  it { should allow_value("uriel@codigofacilito.com").for :email}
  it { should validate_presence_of :uid }
  it { should validate_presence_of :provider }
end
