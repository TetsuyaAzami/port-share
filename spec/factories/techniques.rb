FactoryBot.define do
  factory :technique do
    technique {Technique.find(1).technique}
  end
end
