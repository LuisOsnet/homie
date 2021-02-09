# Properties
20.times do
  Rake::Task['create:published_properties'].execute
  Rake::Task['create:rented_roperties'].execute
  Rake::Task['create:removed_roperties'].execute
end

# Users
Rake::Task['create:users'].execute