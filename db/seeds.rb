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


puts "Creating users"
userFirst = User.create!(
  email: "achievo@test.com",
  password: "password"
)
puts "#{User.count} user created"

puts "Creating goals"

goal1 = Goal.create!(
  name: "Study Web Development with Le Wagon",
  description: "I want to learn to code and create cool web applications",
  user: userFirst,
  start_date: Date.today - 59,
  end_date: Date.today
)

task1 = Task.create!(
  description: "1. Complete prepwork",
  completed: true,
  goal: goal1
)

# Journal Entry 1 for Task 1 (Goal 1)
journal_1 = JournalEntry.create!(
  entry_text: "Starting the prepwork was a bit overwhelming, but I pushed through it. It's exciting to embark on this journey to learn web development. I can't wait to see how far I'll come!",
  entry_date: Date.today - 300,
  task: task1
)
task2 = Task.create!(
  description: "2. Learn the basics of programming (variables, loops, functions, data
  structure)",
  completed: true,
  goal: goal1
)
journal_2 = JournalEntry.create!(
  entry_text: "Learning the basics of programming has been a rollercoaster of challenges and breakthroughs. It's like deciphering a secret code that unlocks the world of web development. I'm determined to conquer it!",
  entry_date: Date.today - 250,
  task: task2
)
task3 = Task.create!(
  description: "3. Extract data through web-scraping or APIs",
  completed: true,
  goal: goal1
)
journal_3 = JournalEntry.create!(
  entry_text: "Web scraping and working with APIs has been an adventure into the digital wilderness. I've extracted data from the web, and it feels like I've unlocked a hidden treasure trove. The possibilities are endless!",
  entry_date: Date.today - 200,
  task: task3
)
task4 = Task.create!(
  description: "4. Master software design models (MVC)",
  completed: true,
  goal: goal1
)
journal_4 = JournalEntry.create!(
  entry_text: "Mastering software design models like MVC was like learning to compose music. Each component plays a unique role in the symphony of web development. I'm becoming the conductor of my own web orchestra!",
  entry_date: Date.today - 150,
  task: task4
)
task5 = Task.create!(
  description: "5. Use SQL (CRUD, JOIN) to manage databases",
  completed: true,
  goal: goal1
)
journal_5 = JournalEntry.create!(
  entry_text: "SQL, the language of databases, initially felt like a foreign dialect, but now it's becoming my second language. CRUD and JOIN operations have opened doors to database wizardry. I'm becoming a data magician!",
  entry_date: Date.today - 120,
  task: task5
)
task6 = Task.create!(
  description: "6. Code with HTML, CSS and Bootstrap 5",
  completed: true,
  goal: goal1
)
journal_6 = JournalEntry.create!(
  entry_text: "Coding with HTML, CSS, and Bootstrap 5 is like painting with pixels. I'm crafting digital landscapes and bringing my creative visions to life. Each line of code is a brushstroke on my canvas of the web!",
  entry_date: Date.today - 90,
  task: task6
)

task7 = Task.create!(
  description: "7. Practise key JavaScript frameworks, including Vue.js, React and
  Stimulus.js",
  completed: true,
  goal: goal1
)
journal_7 = JournalEntry.create!(
  entry_text: "Practicing with JavaScript frameworks like Vue.js, React, and Stimulus.js is like learning to dance to a new beat. I'm grooving to the rhythm of interactive web development. It's a dance party in my code!",
  entry_date: Date.today - 60,
  task: task7
)

task8 = Task.create!(
  description: "8. Master the development of Web applications from design to
  deployment",
  completed: true,
  goal: goal1

)
journal_8 = JournalEntry.create!(
  entry_text: "Mastering the development of web applications from design to deployment is like building a digital skyscraper from the ground up. I'm the architect, engineer, and builder of my web dreams!",
  entry_date: Date.today - 45,
  task: task8
)
task9 = Task.create!(
  description: "9. Code using Ruby on Rails for your app",
  completed: true,
  goal: goal1
)
journal_9 = JournalEntry.create!(
  entry_text: "Coding with Ruby on Rails for my app is like sculpting with digital clay. I'm molding my ideas into functional web applications. It's both a challenge and a rewarding creative process!",
  entry_date: Date.today - 30,
  task: task9
)
task10 = Task.create!(
  description: "10. Code with JavaScript and develop your skills",
  completed: true,
  goal: goal1
)
journal_10 = JournalEntry.create!(
  entry_text: "Continuing to improve my JavaScript skills is like sharpening a versatile tool. JavaScript is the Swiss Army knife of web development, and I'm honing my skills to build amazing web experiences!",
  entry_date: Date.today - 15,
  task: task10
)
task11 = Task.create!(
  description: "11. Code your own marketplace in teams",
  completed: true,
  goal: goal1
)
journal_11 = JournalEntry.create!(
  entry_text: "Working on a team project to create a marketplace has been a thrilling group expedition. We're architects of a digital marketplace, and our collaboration is shaping the future of online commerce!",
  entry_date: Date.today - 7,
  task: task11
)
task12 = Task.create!(
  description: "12. Final Project",
  completed: true,
  goal: goal1
)
journal_12 = JournalEntry.create!(
  entry_text: "I've reached the pinnacle of my web development journey with the final project. It's like planting a flag on the summit of a mountain. I'm proud of what I've achieved!",
  entry_date: Date.today,
  task: task12
)

task13 = Task.create!(
  description: "13. DEMO DAY",
  completed: false,
  goal: goal1
)

goal2 = Goal.create!(
  name: "Run a 21km marathon",
  description: "Be super fit in 3 months, just in time for summer",
  user: userFirst,
  start_date: Date.today - 100,
  end_date: Date.today + 20
)
task1 = Task.create!(
  description: "1. Exercise daily",
  completed: true,
  goal: goal2
)
journal_2 = JournalEntry.create!(
  entry_text: "Joined the gym club today, excited to start!",
  entry_date: Date.today - 90,
  task: task1
)
task3 = Task.create!(
  description: "3. Run 2km every morning",
  completed: false,
  goal: goal2
)
task4 = Task.create!(
  description: "4. Run 2km every morning",
  completed: false,
  goal: goal2
)
task5 = Task.create!(
  description: "5. Join shorter marathons",
  completed: false,
  goal: goal2
)
task6 = Task.create!(
  description: "6. Light cross training Swimming or cycling",
  completed: false,
  goal: goal2
)

task7 = Task.create!(
  description: "7. Run the 21km marathon",
  completed: false,
  goal: goal2
)

goal3 = Goal.create!(
  name: "Build my own portfolio website",
  description: "Build a sick website to attract potential employers and clients",
  user: userFirst,
  start_date: Date.today - 300,
  end_date: Date.today - 150
)

task1 = Task.create!(
  description: "1. Build user story",
  completed: true,
  goal: goal3
)

task2 = Task.create!(
  description: "2. Build figma design",
  completed: true,
  goal: goal3
)
journal_2 = JournalEntry.create!(
  entry_text: "Created the Figma design for my portfolio site.",
  entry_date: Date.today - 280,
  task: task2
)

task3 = Task.create!(
  description: "3. Set up controllers, models and views",
  completed: true,
  goal: goal3
)
journal_3 = JournalEntry.create!(
  entry_text: "Web scraping and working with APIs was a fascinating experience.",
  entry_date: Date.today - 200,
  task: task3
)

task4 = Task.create!(
  description: "4. Front end Design",
  completed: true,
  goal: goal3
)

task_5 = Task.create!(
  description: "5. Launch my beautiful website",
  completed: true,
  goal: goal3
)

puts "Creating tasks"
#   journal_1 = JournalEntry.create!(
#   entry_text: "This was tough to get started!",
#   entry_date: Date.today - 300,
#   task: task1
# )

puts "Seeded database with #{User.count} users, #{Goal.count} goals, #{Task.count} tasks, and #{Reminder.count} reminders."

puts "creating motivational quotes"

quotes = [
        "Distance brings perspective. - Justin Terblanche",
        "Keep going, without fear. - Ricardo Nelumba",
        "Team work makes the dream work. - Carine Rugorirwera",
        "Dream big, start small. - Jenovi Wayela",
        "For the light to shine brightly there must be darkness. - Jono Watkins",
        "Fake it til you make it! - Olivier Girardot",
        "In war, victory does not come to the one who plays by the rules, but to the one who makes the rules and imposes them on the enemy. - Kiki Kennedy",
        "Comparison is the theif of joy. - Justin Terblanche ",
        "If you want to get better, do the things that no-one else wants to do. Do the things that no-one is even thinking about doing. - Sebastian Carr",
        "In the morning, either you go back to bed to continue dreaming, or you get up to make your dreams come true. - Olivier Girardot",
        "Don't be sleepwalking through life, set your goals, make them happen and watch as you create your best life ever. - Jenovi Wayela",
        "What is yours will find you if you make space for it. - Lisbeth Purrucker",
        "What is yours will find you if you make space for it. - Lisbeth Purrucker"
        ]

quotes.each do |quote|
  MotivationalQuote.create(text: quote)
end
