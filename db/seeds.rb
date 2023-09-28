# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Clear existing data
# Clear existing data
Reminder.destroy_all
Task.destroy_all
Goal.destroy_all
User.destroy_all
# Create fake users
reminder_names = ["Call the doctor", "Pay utility bills", "Finish the report"]
# goal_names = ["Run a marathon", "Learn how to code", "Get fit"]
userFirst = User.create!(
    email: "achievo@test.com",
    password: "password"
)
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "Creating users"
  # Create fake goals for each user
  3.times do
    goal = Goal.create!(
      user: user,
      name: Faker::Lorem.sentence(word_count: 4),  # name: goal_names.sample,
      description: Faker::Lorem.sentence(word_count: 4),
      start_date: Faker::Date.backward(days: 14),
      end_date: Faker::Date.forward(days: 14)
    )
    puts "Creating goals"
    last_task = nil  # Initialize this variable to keep track of the last task for each goal
    # Create fake tasks for each goal
    5.times do
      last_task = Task.create!(
        goal: goal,
        description: Faker::Lorem.sentence(word_count: 3),
        completed: Faker::Boolean.boolean
      )
      puts "Creating tasks"
    end
    # Create fake reminders for each user using the last task for each goal
    3.times do
      Reminder.create!(
          task: last_task,
          user: user,
          name: reminder_names.sample
      )
    end
    puts "Creating reminders"
  end
end
puts "Seeded database with #{User.count} users, #{Goal.count} goals, #{Task.count} tasks, and #{Reminder.count} reminders."
