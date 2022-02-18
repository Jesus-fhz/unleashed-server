require 'colorize'

puts "Creating seed users...".green

User.destroy_all

random_first_names = ['Olivia', 'Liam', 'Emma', 'Noah', 'Amelia', 'Oliver', 'Ava', 'Elijah', 'Sophia', 'Lucas', 'Charlotte', 'Levi', 'Isabella', 'Mason', 'Mia', 'Asher', 'Luna', 'James', 'Harper', 'Ethan', 'Gianna', 'Mateo', 'Evelyn', 'Leo', 'Aria', 'Jack', 'Ella', 'Benjamin', 'Ellie', 'Aiden', 'Mila', 'Logan']
random_last_names = ['Doyle', 'Lord', 'Qi', 'Song', 'Flores', 'Zhang', 'Hammer', 'Schumacher', 'West', 'de Santa Maria', 'Qi-Doyle', 'Wu', 'Jones', 'Prabhakaran']

owner_array = []
walker_array = []

20.times do |u|
    randomUser = 'user'+(u+1).to_s
    randomUser = User.create!
    randomUser.name = (random_first_names.sample + ' ' + random_last_names.sample)
    if rand() < 0.4
        randomUser.user_type = 1
        owner_array.push randomUser.id
    else
        randomUser.user_type = 0
        walker_array.push randomUser.id
    end
    if rand() < 0.1
        randomUser.is_available = false
    else
        randomUser.is_available = true
    end
    randomUser.earnings = rand(100..2000)
    randomUser.address = rand(100..200).to_s + ' New South Head Road, Sydney NSW'

    randomUser.save
end

puts "Success! We have #{owner_array.count} owners in the DB: #{owner_array}".green
puts "Success! We have #{walker_array.count} walkers in the DB: #{walker_array}"
puts "Success! #{ User.count } random users created.".green

puts "Creating seed pets...".yellow

Pet.destroy_all

random_male_pet_names = ['Bailey', 'Max', 'Charlie', 'Buddy', 'Rocky', 'Jake', 'Jack', 'Simba', 'Toby', 'Buster', 'Duke', 'Cooper', 'Riley', 'Harley', 'Bear', 'Oscar', 'Teddy', 'Winston', 'Sammy', 'Rusty', 'Gizmo', 'Bandit', 'Jackson', 'Milo', 'Gus']
random_female_pet_names = ['Zoey', 'Belle', 'Madison', 'Lily', 'Brandy', 'Roxie', 'Ruby', 'Neela', 'Princess', 'Bella', 'Lucy', 'Pea', 'Jia', 'Angela', 'Cassie', 'Ro', 'Maggie', 'Sophie', 'Ginger', 'Coco', 'Sasha', 'Angel', 'Princess']
random_dog_breeds = ['French Bulldog', 'King Charles Spaniel', 'German Shepherd', 'Beagle', 'Rottweiler', 'Dachshund', 'Yorkshire Terrier', 'Great Dane', 'Doberman Pinscher', 'Shih Tzu', 'Pomeranian', 'Shetland Sheepdog', 'Pug', 'Chihuahua', 'Maltese', 'Shiba Inu', 'Newfoundland', 'Irish Wolfhound', 'Akita', 'St Bernard']

(owner_array.count).times do |p|

    randomPet = 'pet'+(p+1).to_s
    randomPet = Pet.create!

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

    randomPet.image = 'http://placedog.com/300/300'

    randomPet.user_id = owner_array[p]

    randomPet.breed = random_dog_breeds.sample
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
    status: 1,
    cost: 10,
    duration: 30,
    special_instruction: 'he is aggressive with other larger dogs.'
)

puts "Success! #{ Walk.count } random walks created.".blue



#TODO: figure out how to exactly when the location duration infor needs to be devised etc. 
