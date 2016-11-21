FactoryGirl.define do
  factory :token do
    expires_at "2016-11-19 14:00:47"    
    association :user, factory: :user    
  end
end
