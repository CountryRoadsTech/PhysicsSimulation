# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

s = Simulation.new(name: "#{Faker::Science.unique.scientist}s Simulation",
                   description: Faker::Lorem.paragraphs(number: 2).join("\n"))

u = Universe.new(start_time: 0.0, end_time: 100.0, timestep: 0.5, simulation: s)

u.save!
s.save!

8.times do
  PhysicsBody.create!(name: Faker::Space.unique.planet,
                      description: Faker::Lorem.paragraphs(number: 2).join("\n"),
                      initial_mass: Faker::Number.positive,
                      initial_position_x: Faker::Number.positive,
                      initial_position_y: Faker::Number.positive,
                      initial_position_z: Faker::Number.positive,
                      initial_velocity_x: Faker::Number.positive,
                      initial_velocity_y: Faker::Number.positive,
                      initial_velocity_z: Faker::Number.positive,
                      simulation: s)
end

17.times do
  PhysicsBody.create!(name: Faker::Space.unique.moon,
                      description: Faker::Lorem.paragraphs(number: 2).join("\n"),
                      initial_mass: Faker::Number.positive,
                      initial_position_x: Faker::Number.positive,
                      initial_position_y: Faker::Number.positive,
                      initial_position_z: Faker::Number.positive,
                      initial_velocity_x: Faker::Number.positive,
                      initial_velocity_y: Faker::Number.positive,
                      initial_velocity_z: Faker::Number.positive,
                      simulation: s)
end
