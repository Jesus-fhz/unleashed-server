require 'colorize'
require 'json'

# Dog breed JSON hashes
#TODO: we can probably loop over all the files in a folder to do this. 
akita_json = File.read('db/json/akita.json')
akita_images = JSON.parse(akita_json)

beagle_json = File.read('db/json/beagle.json')
beagle_images = JSON.parse(beagle_json)

boxer_json = File.read('db/json/boxer.json')
boxer_images = JSON.parse(boxer_json)

chihuahua_json = File.read('db/json/chihuahua.json')
chihuahua_images = JSON.parse(chihuahua_json)

dachshund_json = File.read('db/json/dachshund.json')
dachshund_images = JSON.parse(dachshund_json)

dingo_json = File.read('db/json/dingo.json')
dingo_images = JSON.parse(dingo_json)

kelpie_json = File.read('db/json/kelpie.json')
kelpie_images = JSON.parse(kelpie_json)

leonberg_json = File.read('db/json/leonberg.json')
leonberg_images = JSON.parse(leonberg_json)

maltese_json = File.read('db/json/maltese.json')
maltese_images = JSON.parse(maltese_json)

papillon_json = File.read('db/json/papillon.json')
papillon_images = JSON.parse(papillon_json)

pekinese_json = File.read('db/json/pekinese.json')
pekinese_images = JSON.parse(pekinese_json)

pug_json = File.read('db/json/pug.json')
pug_images = JSON.parse(pug_json)

shiba_json = File.read('db/json/shiba.json')
shiba_images = JSON.parse(shiba_json)

shihtzu_json = File.read('db/json/shihtzu.json')
shihtzu_images = JSON.parse(shihtzu_json)

weimaraner_json = File.read('db/json/weimaraner.json')
weimaraner_images = JSON.parse(weimaraner_json)

puts "Creating seed users...".green

User.destroy_all

random_first_names = ['Olivia', 'Liam', 'Emma', 'Noah', 'Amelia', 'Oliver', 'Ava', 'Elijah', 'Sophia', 'Lucas', 'Charlotte', 'Levi', 'Isabella', 'Mason', 'Mia', 'Asher', 'Luna', 'James', 'Harper', 'Ethan', 'Gianna', 'Mateo', 'Evelyn', 'Leo', 'Aria', 'Jack', 'Ella', 'Benjamin', 'Ellie', 'Aiden', 'Mila', 'Logan']
random_last_names = ['Doyle', 'Lord', 'Qi', 'Song', 'Flores', 'Zhang', 'Hammer', 'Schumacher', 'West', 'de Santa Maria', 'Qi-Doyle', 'Wu', 'Jones', 'Prabhakaran']
addresses = [
    "Royal Sydney Golf Club, Kent Road, Rose Bay, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2029, Australia",
    "The Central Synagogue, 11-17, Bon Accord Avenue, Bondi Junction, Sydney, Waverley Council, Eastern Suburbs, New South Wales, 2026, Australia",
    "MacPherson Street, Bronte, Sydney, Waverley Council, Eastern Suburbs, New South Wales, 2024, Australia",
    "Boundary Street, Paddington, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2021, Australia",
    "Comrie Memorial Fountain, Federation Way, Moore Park, Sydney, Council of the City of Sydney, New South Wales, 2021, Australia",
    "Fred Hollow Reserve, Alison Road, Randwick, Sydney, Randwick City Council, Eastern Suburbs, New South Wales, 2031, Australia",
    "Powell Lane, Coogee, Sydney, Randwick City Council, Eastern Suburbs, New South Wales, 2034, Australia",
    "Joongah Street, Randwick, Sydney, Randwick City Council, Eastern Suburbs, New South Wales, 2031, Australia",
    "Shark Island Wharf, Wunulla Road, Woollahra Point, Point Piper, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2027, Australia",
    "Clark Island, Lindsay Avenue, Darling Point, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2027, Australia",
    "Waverley Reservoir No. 3, Paul Street, Bondi Junction, Sydney, Waverley Council, Eastern Suburbs, New South Wales, 2022, Australia",
    "Rose Bay Seaplane Base, Vickery Avenue, Rose Bay, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2029, Australia",
    "Shark Island Wharf, Wunulla Road, Woollahra Point, Point Piper, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2027, Australia",
    "Ben Buckler, North Bondi, Sydney, Waverley Council, Eastern Suburbs, New South Wales, 2026, Australia",
    "Kuk Thai, 144, Queen Street, Woollahra, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2025, Australia",
    "Rainbow Street, South Coogee, Sydney, Randwick City Council, Eastern Suburbs, New South Wales, 2034, Australia",
    "Onslow Street, Rose Bay, Sydney, Waverley Council, Eastern Suburbs, New South Wales, 2029, Australia",
    "Hermitage Foreshore Walk, Vaucluse, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2030, Australia",
    "Black Street, Vaucluse, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2030, Australia",
    "Royal Sydney Golf Club, Kent Road, Rose Bay, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2029, Australia",
    # "Shark Island Wharf, Wunulla Road, Woollahra Point, Point Piper, Sydney, Woollahra Municipal Council, Eastern Suburbs, New South Wales, 2027, Australia",
]
center = {lat: -33.895962, lng: 151.247408} 
# TODO: make a function that generates codes within a range from a center point

# create users with random names & addresses

print "Creating Users..."

i = 0;

# Custom admin user. Currently with no priveleges
User.create(
    name: 'walker',
    email: 'walker@outlook.com',
    password: 'chicken',
    latitude: -33.895962,
    longitude: 151.247408,
    profile_image: 'http://www.fillmurray.com/400/400',
    user_type: 0
)

User.create(
    name: 'owner',
    email: 'owner@outlook.com',
    password: 'chicken',
    latitude: -33.858399,
    longitude: 150.978422,
    profile_image: 'http://www.fillmurray.com/400/400',
    user_type: 1
)

20.times do |u|
    lat = center[:lat] + rand(-0.038..0.038)
    lng = center[:lng] + rand(-0.038..0.038)

    if rand() < 0.4
        user_type = 1 # for owner
    else
        user_type = 0 # for walker
        earnings = rand(100..500)
        if rand() < 0.1 
            is_available = false
        else
            is_available = true
        end

    end

    user = 'user'+(u+1).to_s
    user = User.create!(password:'chicken', 
        email:'testuser'+(u).to_s+'@unleashed.com',
        name: (random_first_names.sample + ' ' + random_last_names.sample),
        profile_image: 'http://www.fillmurray.com/400/400',
        user_type: user_type,
        earnings: earnings,
        is_available: is_available,
        address: addresses[u],
        latitude: lat,
        longitude: lng,
    )
    
end


puts "Success! We have #{User.owner.count} owners in the DB.".green
puts "Success! We have #{User.walker.count} walkers in the DB".green
puts "Success! #{ User.count } random users created.".green

puts "Creating seed pets...".yellow

Pet.destroy_all

random_male_pet_names = ['Bailey', 'Max', 'Charlie', 'Buddy', 'Rocky', 'Jake', 'Jack', 'Simba', 'Toby', 'Buster', 'Duke', 'Cooper', 'Riley', 'Harley', 'Bear', 'Oscar', 'Teddy', 'Winston', 'Sammy', 'Rusty', 'Gizmo', 'Bandit', 'Jackson', 'Milo', 'Gus']
random_female_pet_names = ['Zoey', 'Belle', 'Madison', 'Lily', 'Brandy', 'Roxie', 'Ruby', 'Neela', 'Princess', 'Bella', 'Lucy', 'Pea', 'Jia', 'Angela', 'Cassie', 'Ro', 'Maggie', 'Sophie', 'Ginger', 'Coco', 'Sasha', 'Angel', 'Princess']
random_dog_breeds = ['Akita', 'Beagle', 'Boxer', 'Chihuahua', 'Dachshund', 'Dingo', 'Kelpie', 'Leonberg', 'Maltese', 'Papillon', 'Pekinese', 'Pug', 'Shiba', 'Shihtzu', 'Weimaraner']
random_coords = []

# Create the Pet 
(User.owner.count).times do |p|
    
    randomPet = 'pet'+(p+1).to_s
    randomPet = Pet.create!

    # Give the pet a user with user_type: owner
    randomPet.user_id = User.owner[p].id
    
    # Is the pet male or female?
    # If male, give it a male name. If else, give it a female name
    if rand() < 0.5
        randomPet.is_male = true
        randomPet.name = random_male_pet_names.sample
    else
        randomPet.is_male = false
        randomPet.name = random_female_pet_names.sample
    end

    # What breed is the dog?
    randomPet.breed = random_dog_breeds.sample

    # Assign an image that is relevant to the dogs breed
    case randomPet.breed
    when 'Akita'
        randomPet.image = akita_images['message'][rand(akita_images.count)]
    when 'Beagle'
        randomPet.image = beagle_images['message'][rand(beagle_images.count)]
    when 'Boxer'
        randomPet.image = boxer_images['message'][rand(boxer_images.count)]
    when 'Chihuahua'
        randomPet.image = chihuahua_images['message'][rand(chihuahua_images.count)]
    when 'Dachshund'
        randomPet.image = dachshund_images['message'][rand(dachshund_images.count)]
    when 'Dingo'
        randomPet.image = dingo_images['message'][rand(dingo_images.count)]
    when 'Kelpie'
        randomPet.image = kelpie_images['message'][rand(kelpie_images.count)]
    when 'Leonberg'
        randomPet.image = leonberg_images['message'][rand(leonberg_images.count)]
    when 'Maltese'
        randomPet.image = maltese_images['message'][rand(maltese_images.count)]
    when 'Papillon'
        randomPet.image = papillon_images['message'][rand(papillon_images.count)]
    when 'Pekinese'
        randomPet.image = pekinese_images['message'][rand(pekinese_images.count)]
    when 'Pug'
        randomPet.image = pug_images['message'][rand(pug_images.count)]
    when 'Shiba'
        randomPet.image = shiba_images['message'][rand(shiba_images.count)]
    when 'Shihtzu'
        randomPet.image = shihtzu_images['message'][rand(shihtzu_images.count)]
    when 'Weimaraner'
        randomPet.image = weimaraner_images['message'][rand(akita_images.count)]
    end

    # Other pet details
    randomPet.age = rand(1..15)
    randomPet.size = ['Small', 'Medium', 'Large'].sample
    randomPet.desexed = [true, false].sample
    randomPet.can_walk_offleash = [true, false].sample
    randomPet.can_be_petted = [true, false].sample
    randomPet.can_walk_with_other_dogs = [true, false].sample
    randomPet.save

end

puts "Success! #{ Pet.count } random pets created.".yellow

Walk.destroy_all

puts ('Creating seed walks...').blue

w1 = Walk.create!(
    pet_id: Pet.first.id,
    user_id: User.walker.first.id,
    status: 1,
    cost: 10,
    duration: 30,
    address: '1 dummy street', 
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w2 = Walk.create!(
    pet_id: Pet.second.id,
    user_id: User.walker.second.id,
    status: 2,
    cost: 11,
    duration: 30,
    address: '1 dummy street', 
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w3 = Walk.create!(
    pet_id: Pet.third.id,
    user_id: User.walker.third.id,
    status: 0,
    cost: 100,
    duration: 60,
    address: '1 dummy street', 
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w4 = Walk.create!(
    pet_id: Pet.fourth.id,
    user_id: User.walker.fourth.id,
    status: 0,
    cost: 100,
    duration: 60,
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w5 = Walk.create!(
    pet_id: Pet.fifth.id,
    user_id: User.walker.fifth.id,
    status: 0,
    cost: 100,
    duration: 60,
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w6 = Walk.create!(
    pet_id: Pet.fifth.id,
    user_id: User.walker.fifth.id,
    status: 0,
    cost: 100,
    duration: 60,
    latitude: -33.8724236,
    longitude: 151.2591179,
    special_instruction: 'he is aggressive with other larger dogs.'
)

puts "Success! #{ Walk.count } random walks created.".blue


#TODO: figure out how to exactly when the location duration infor needs to be devised etc.