require 'colorize'

puts "Creating seed users...".green

User.destroy_all

# Walker
walker = User.create!( 
  name: 'Suraj Sharma',
  email: 'suraj@ga.com',
  password: 'chicken',
  address: '1 Dummy Street',
  latitude: -33.895962,
  longitude: 151.247408,
  profile_image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645676463/suraj_wtfgsw.jpg',
  user_type: 0 
)

# Owner
owner = User.create(
  name: 'Rowena Leung',
  email: 'rowena@ga.com',
  password: 'chicken',
  address: '1 Dummy Street',
  latitude: -33.858399,
  longitude: 150.978422,
  profile_image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645675903/rowena_wxmany.jpg',
  user_type: 1
)

puts "Success! We have #{User.owner.count} owners in the DB.".green
puts "Success! We have #{User.walker.count} walkers in the DB".green
puts "Success! #{ User.count } random users created.".green

puts "Creating seed pets...".yellow

Pet.destroy_all

# Ethan's Dog
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/c_scale,w_800/v1645676790/ethansDog1_pabgty.jpg',
  name: 'Xiao Bai',
  breed: 'Moodle',
  age: 1,
  is_male: true,
  size: 'Small',
  desexed: true,
  can_walk_offleash: false,
  can_be_petted: true,
  can_walk_with_other_dogs: true
)

# Ste's cat
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645680318/monty_cevj5y.jpg',
  name: 'Monty',
  breed: 'British Shorthair',
  age: 5,
  is_male: true,
  size: 'Medium',
  desexed: true,
  can_walk_offleash: false,
  can_be_petted: true,
  can_walk_with_other_dogs: true
)

# Cassie's dog
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645680873/cassiesDog_eyrumf.png',
  name: 'Simba',
  breed: 'Bichon Frise',
  age: 10,
  is_male: true,
  size: 'Small',
  desexed: true,
  can_walk_offleash: true,
  can_be_petted: false,
  can_walk_with_other_dogs: false
)

# Dan Yip's dog
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645680668/danyipsfriendsdog_ymcllb.png',
  name: 'Sprite',
  breed: 'Samoyoid',
  age: 1,
  is_male: false,
  size: 'Medium',
  desexed: true,
  can_walk_offleash: false,
  can_be_petted: true,
  can_walk_with_other_dogs: true
)

# Cam's dog
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645680543/camsDog_tw5ymi.png',
  name: 'Skeddy',
  breed: 'Jack Russell',
  age: 1,
  is_male: true,
  size: 'Small',
  desexed: false,
  can_walk_offleash: false,
  can_be_petted: true,
  can_walk_with_other_dogs: true
)

# Lawrence's dog
Pet.create!(
  user_id: owner.id,
  image: 'https://res.cloudinary.com/metaverse-fc/image/upload/v1645680979/lawrencesDog_drhleu.png',
  name: 'Monkey',
  breed: 'Maltese Poodle',
  age: 2,
  is_male: true,
  size: 'Small',
  desexed: true,
  can_walk_offleash: false,
  can_be_petted: true,
  can_walk_with_other_dogs: false
)

Walk.destroy_all

puts "Success! #{ Pet.count } random pets created.".yellow