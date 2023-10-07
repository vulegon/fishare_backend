ActiveRecord::Base.transaction do
  (1..10).each_with_index do |user, i|
    name = "tester#{i}"
    password = "Password#{1}"
    email = "example#{i}@example.com"
    User.create!(name: name, password: password, email: email)
  end
end

fish = FISH::NAMES.map { |fish_name| Fish.new(name: fish_name) }
Fish.import fish

fishing_types = FishingType::NAMES.map { |fishing_type_name| FishingType.new(name: fishing_type_name) }
FishingType.import fishing_types
