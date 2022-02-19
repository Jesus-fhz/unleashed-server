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

# create users with random names

print "Creating Users..."

20.times do |u|
    user = 'user'+(u+1).to_s
    user = User.create!(password:'chicken')
    user.name = (random_first_names.sample + ' ' + random_last_names.sample)
    user.profile_image = 'http://www.fillmurray.com/400/400'
    user.email = 'testuser'+(u).to_s+'@gmail.com'
    if rand() < 0.4
        user.user_type = 1
    else
        user.user_type = 0
    end
    if rand() < 0.1
        user.is_available = false
    else
        user.is_available = true
    end
    user.earnings = rand(100..2000)

    user.address = rand(100..300).to_s + ' New South Head Road, Sydney NSW, Australia'
    coords = User.address_to_geocode(user.address)
    user.geocode_lat = coords["lat"]
    user.geocode_lng = coords["lng"]

    user.save
end

puts "Success! We have #{User.owner.count} owners in the DB.".green
puts "Success! We have #{User.walker.count} walkers in the DB".green
puts "Success! #{ User.count } random users created.".green

puts "Creating seed pets...".yellow

Pet.destroy_all

random_male_pet_names = ['Bailey', 'Max', 'Charlie', 'Buddy', 'Rocky', 'Jake', 'Jack', 'Simba', 'Toby', 'Buster', 'Duke', 'Cooper', 'Riley', 'Harley', 'Bear', 'Oscar', 'Teddy', 'Winston', 'Sammy', 'Rusty', 'Gizmo', 'Bandit', 'Jackson', 'Milo', 'Gus']
random_female_pet_names = ['Zoey', 'Belle', 'Madison', 'Lily', 'Brandy', 'Roxie', 'Ruby', 'Neela', 'Princess', 'Bella', 'Lucy', 'Pea', 'Jia', 'Angela', 'Cassie', 'Ro', 'Maggie', 'Sophie', 'Ginger', 'Coco', 'Sasha', 'Angel', 'Princess']
random_dog_breeds = ['Akita', 'Beagle', 'Boxer', 'Chihuahua', 'Dachshund', 'Dingo', 'Kelpie', 'Leonberg', 'Maltese', 'Papillon', 'Pekinese', 'Pug', 'Shiba', 'Shihtzu', 'Weimaraner']

# Create the Pet 
(User.owner.count).times do |p|
    
    randomPet = 'pet'+(p+1).to_s
    randomPet = Pet.create!

    # Give the pet a user with user_type: owner
    randomPet.user_id = User.owner[p].id
    
    # Is the pet male or female?
    if rand() < 0.5
        randomPet.is_male = true
    else
        randomPet.is_male = false
    end

    # If male, give it a male name. If else, give it a female name
    if randomPet.is_male
        randomPet.name = random_male_pet_names.sample
    else
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
    special_instruction: 'he is aggressive with other larger dogs.'
)

w2 = Walk.create!(
    pet_id: Pet.second.id,
    user_id: User.walker.second.id,
    status: 2,
    cost: 11,
    duration: 30,
    special_instruction: 'he is aggressive with other larger dogs.'
)

w3 = Walk.create!(
    pet_id: Pet.third.id,
    user_id: User.walker.third.id,
    status: 0,
    cost: 100,
    duration: 60,
    special_instruction: 'he is aggressive with other larger dogs.'
)

puts "Success! #{ Walk.count } random walks created.".blue


#TODO: figure out how to exactly when the location duration infor needs to be devised etc.