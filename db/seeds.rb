# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

s = Simulation.new(name: 'Solar System Simulation',
                   description: 'Uses Runge-Kutta 45 to solve the system of ordinary differential equations '\
                                'representing the gravitational forces on all physics bodies in this simulation.')

u = Universe.new(start_time: 0.0, end_time: 100.0, timestep: 1.0, simulation: s)

u.save!
s.save!

# NASA JPL Horizons position and velocity vectors as of May 9, 2022.

PhysicsBody.create!(name: 'Sun',
                    description: 'The central body of the solar system, around which the planets orbit.',
                    initial_mass: 1_988_500_000_000_000_000_000_000_000_000,
                    radius: 695_700,
                    initial_position_x: -1_335_700.940489147,
                    initial_position_y: 335_244.0612257546,
                    initial_position_z: 28_450.60346135426,
                    initial_velocity_x: -0.003547850757558514,
                    initial_velocity_y: -0.01541174748681092,
                    initial_velocity_z: 0.0002060362167601529,
                    simulation: s)

PhysicsBody.create!(name: 'Mercury',
                    description: 'The first planet in the solar system and closest to the Sun.',
                    initial_mass: 330_200_000_000_000_000_000_000,
                    radius: 2440,
                    initial_position_x: -59_517_104.13782500,
                    initial_position_y: -22_600_607.53423680,
                    initial_position_z: 3_490_946.896223569,
                    initial_velocity_x: 7.785254691162497,
                    initial_velocity_y: -43.22688056951478,
                    initial_velocity_z: -4.245435994015281,
                    simulation: s)

PhysicsBody.create!(name: 'Venus',
                    description: 'The hot, cloudy, and gassy twin to Earth.',
                    initial_mass: 4_868_500_000_000_000_000_000_000,
                    radius: 6051.84,
                    initial_position_x: 54_814_506.25548101,
                    initial_position_y: -92_895_630.40511699,
                    initial_position_z: -4_491_381.454719789,
                    initial_velocity_x: 29.76101474015024,
                    initial_velocity_y: 17.93335032561871,
                    initial_velocity_z: -1.470892037804834,
                    simulation: s)

PhysicsBody.create!(name: 'Earth',
                    description: 'The third planet from the Sun, home to life.',
                    initial_mass: 5_972_190_000_000_000_000_000_000,
                    radius: 6371.01,
                    initial_position_x: -102_240_959.9613338,
                    initial_position_y: -111_999_141.7592420,
                    initial_position_z: 34_176.37607526779,
                    initial_velocity_x: 21.67987925082859,
                    initial_velocity_y: -20.02662990836543,
                    initial_velocity_z: 0.001061551510624703,
                    simulation: s)

PhysicsBody.create!(name: 'Mars',
                    description: 'The last inner planet in the solar system, hopefully the first planet humans settle '\
                                 'in the future.',
                    initial_mass: 641_710_000_000_000_000_000_000,
                    radius: 3389.92,
                    initial_position_x: 129_161_500.7700544,
                    initial_position_y: -162_336_652.3404006,
                    initial_position_z: -6_581_875.476561479,
                    initial_velocity_x: 19.8109939412232,
                    initial_velocity_y: 17.22540797568040,
                    initial_velocity_z: -0.1245115720460861,
                    simulation: s)

PhysicsBody.create!(name: 'Jupiter',
                    description: 'The first gas giant, and largest planet in the solar system.',
                    initial_mass: 1_898_187_220_000_000_000_000_000_000_000,
                    radius: 69_911,
                    initial_position_x: 731_843_327.6028167,
                    initial_position_y: -122_034_775.7987643,
                    initial_position_z: -15_866_886.43140736,
                    initial_velocity_x: 1.995094262431752,
                    initial_velocity_y: 13.50194378316595,
                    initial_velocity_z: -0.1005691208073962,
                    simulation: s)

PhysicsBody.create!(name: 'Saturn',
                    description: 'The second largest planet and second gas giant, with some spectacular rings.',
                    initial_mass: 568_340_000_000_000_000_000_000_000,
                    radius: 58_232,
                    initial_position_x: 1_107_434_486.292505,
                    initial_position_y: -979_359_718.1257732,
                    initial_position_z: -27_062_962.85197204,
                    initial_velocity_x: 5.859289815861508,
                    initial_velocity_y: 7.217393749570705,
                    initial_velocity_z: 0.3592073361040140,
                    simulation: s)

PhysicsBody.create!(name: 'Uranus',
                    description: 'The first of the ice giants.',
                    initial_mass: 86_813_000_000_000_000_000_000_000,
                    radius: 25_362,
                    initial_position_x: 2_099_846_929.206541,
                    initial_position_y: 2_067_693_932.292411,
                    initial_position_z: -19_524_437.56227052,
                    initial_velocity_x: -4.828167775173648,
                    initial_velocity_y: 4.535236771003778,
                    initial_velocity_z: 0.07972014251673687,
                    simulation: s)

PhysicsBody.create!(name: 'Neptune',
                    description: 'The second and final ice giant, and final planet.',
                    initial_mass: 102_409_000_000_000_000_000_000_000,
                    radius: 24_624,
                    initial_position_x: 4_439_205_451.591208,
                    initial_position_y: -551_492_618.0538659,
                    initial_position_z: -90_949_306.00933376,
                    initial_velocity_x: 0.634229182283463,
                    initial_velocity_y: 5.426057785689691,
                    initial_velocity_z: -0.1264626304275709,
                    simulation: s)

PhysicsBody.create!(name: 'Pluto',
                    description: 'Pluto is technically a dwarf planet, but remains an honary planet in many hearts.',
                    initial_mass: 13_070_000_000_000_000_000_000,
                    radius: 1188.3,
                    initial_position_x: 2_316_962_903.168992,
                    initial_position_y: -4_610_628_994.442314,
                    initial_position_z: -176_837_936.5023060,
                    initial_velocity_x: 4.997419715074188,
                    initial_velocity_y: 1.257349358411336,
                    initial_velocity_z: -1.600678088790377,
                    simulation: s)
