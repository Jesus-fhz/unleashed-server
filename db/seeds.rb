# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).




Walk.destroy()

puts ('Creating a testing walk seed.')







w1 = Walk.create!(
    cost: 10,
    duration: 30,
    special_instruction: 'he is aggressive with other larger dogs.'
)