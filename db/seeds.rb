User.destroy_all
puts "Destroying all users"
Goal.destroy_all
puts "Destroying all goals"
Task.destroy_all
puts "Destroying all tasks"
Reminder.destroy_all
puts "Destroying all reminders"
MotivationalQuote.destroy_all
puts "Destroying all quotes"

# Create fake users
tasks_names = ["Run 2 min on the spot", "Drink 1L by noon", "Run for an hour"]
reminder_names = ["Call the doctor", "Pay utility bills", "Finish the report"]
# goal_names = ["Run a marathon", "Learn how to code", "Get fit"]
userFirst = User.create!(
    email: "achievo@test.com",
    password: "password"
)
3.times do
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
        name: tasks_names.sample,
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

puts "creating motivational quotes"

quotes = [
        "Distance brings perspective. - Justin Terblanche",
        "Keep going, without fear. - Ricardo Nelumba",
        "Team work makes the dream work. - Carine Rugorirwera",
        "Dream big, start small. - Jenovi Wayela",
        "For the light to shine brightly there must be darkness. - Jono Watkins",
        "Fake til you make it! - Olivier Girardot",
        "In war, victory does not come to the one who plays by the rules, but to the one who makes the rules and imposes them on the enemy. - Kiki Kennedy",
        "Comparison is the theif of joy. - Justin Terblanche ",
        "If you want to get better, do the things that no-one else wants to do. Do the things that no-one is even thinking about doing. - Sebastian Carr",
        "In the morning, either you go back to bed to continue dreaming, or you get up to make your dreams come true. - Olivier Girardot",
        "Don't be sleepwalking through life, set your goals, make them happen and watch as you create your best life ever. - Jenovi Wayela",
        "What is yours will find you if you make space for it. - Lisbeth Purrucker"

        ]

quotes.each do |quote|
  MotivationalQuote.create(text: quote)
end
