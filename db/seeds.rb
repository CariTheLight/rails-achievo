Reminder.destroy_all
puts "Destroying all reminders"
JournalEntry.destroy_all
puts "Destroying all journal entries"
Task.destroy_all
puts "Destroying all tasks"
Goal.destroy_all
puts "Destroying all goals"
User.destroy_all
puts "Destroying all users"
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


puts "Creating users"

puts "Creating goals"

goal = Goal.create!(
  name: "Study Web Development with Le Wagon",
  description: "I want to learn to code and create cool web applications",
  user: userFirst,
  start_date: Date.today - 59,
  end_date: Date.today
)

goal2 = Goal.create!(
  name: "Run a 21km marathon",
  description: "Be super fit in 3 months, just in time for summer",
  user: userFirst,
  start_date: Date.today - 100,
  end_date: Date.today - 20

)

goal3 = Goal.create!(
  name: "Build my own portfolio website",
  description: "Build a sick website to attract potential employers and clients",
  user: userFirst,
  start_date: Date.today - 300,
  end_date: Date.today - 150
)
#     last_task = nil  # Initialize this variable to keep track of the last task for each goal
#     # Create fake tasks for each goal
#     5.times do
#       last_task = Task.create!(
#         goal: goal,
#         name: tasks_names.sample,
#         description: Faker::Lorem.sentence(word_count: 3),
#         completed: Faker::Boolean.boolean
#       )
#
puts "Creating tasks"

task1 = Task.create!(
  description: "1. Complete prepwork",
  completed: true,
  goal: goal,
)

task2 = Task.create!(
  description: "2. Learn the basics of programming (variables, loops, functions, data
  structure)",
  completed: true,
  goal: goal,
)

task3 = Task.create!(
  description: "3. Extract data through web-scraping or APIs",
  completed: true,
  goal: goal,
)

task4 = Task.create!(
  description: "4. Master software design models (MVC)",
  completed: true,
  goal: goal,
)

task5 = Task.create!(
  description: "5. Use SQL (CRUD, JOIN) to manage databases",
  completed: true,
  goal: goal,
)

task6 = Task.create!(
  description: "6. Code with HTML, CSS and Bootstrap 5",
  completed: true,
  goal: goal,
)

task7 = Task.create!(
  description: "7. Practise key JavaScript frameworks, including Vue.js, React and
  Stimulus.js",
  completed: true,
  goal: goal,
)

task8 = Task.create!(
  description: "8. Master the development of Web applications from design to
  deployment",
  completed: true,
  goal: goal,
)

task9 = Task.create!(
  description: "9. Code using Ruby on Rails for your app",
  completed: true,
  goal: goal,
)

task10 = Task.create!(
  description: "10. Code with JavaScript and develop your skills",
  completed: true,
  goal: goal,
)

task11 = Task.create!(
  description: "11. Code your own marketplace in teams",
  completed: true,
  goal: goal,
)

task12 = Task.create!(
  description: "12. Final Project",
  completed: true,
  goal: goal,
)

task13 = Task.create!(
  description: "13. DEMO DAY",
  completed: false,
  goal: goal,
)


task1 = Task.create!(
  description: "1. Exercise daily",
  completed: true,
  goal: goal2,
)

task2 = Task.create!(
  description: "2. Join a gym club",
  completed: true,
  goal: goal2,
)

task3 = Task.create!(
  description: "3. Run 2km every morning",
  completed: false,
  goal: goal2,
)

task4 = Task.create!(
  description: "4. Run 2km every morning",
  completed: false,
  goal: goal2,
)

task5 = Task.create!(
  description: "5. Join shorter marathons",
  completed: false,
  goal: goal2,
)

task6 = Task.create!(
  description: "6. Light cross training Swimming or cycling",
  completed: false,
  goal: goal2,
)

task7 = Task.create!(
  description: "7. Run the 21km marathon",
  completed: false,
  goal: goal2,
)


task1 = Task.create!(
  description: "1. Build user story",
  completed: true,
  goal: goal3,
)

task2 = Task.create!(
  description: "2. Build figma design",
  completed: true,
  goal: goal3,
)

task3 = Task.create!(
  description: "3. Set up controllers, models and views",
  completed: true,
  goal: goal3,
)

task4 = Task.create!(
  description: "4. Front end Design",
  completed: true,
  goal: goal3,
)


task5 = Task.create!(
  description: "5. Launch my beautiful website",
  completed: true,
  goal: goal3,
)
    # end
    # Create fake reminders for each user using the last task for each goal
#     3.times do
#       Reminder.create!(
#           task: last_task,
#           user: user,
#           name: reminder_names.sample
#       )
#     end
# puts "Creating reminders"

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







