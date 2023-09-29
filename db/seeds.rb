Reminder.destroy_all
Task.destroy_all
Goal.destroy_all
User.destroy_all
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
    "Procrastination is the art of keeping up with yesterday.- Don Marquis",
    "Don't watch the clock; do what it does. Keep going.- Sam Levenson",
    "The only way to do great work is to love what you do.- Steve Jobs",
    "Success is stumbling from failure to failure with no loss of enthusiasm.- Winston S. Churchill",
    "The road to success is dotted with many tempting parking spaces.- Will Rogers",
    "Opportunities don't happen. You create them.- Chris Grosser",
    "The harder you work for something, the greater you'll feel when you achieve it.- Unknown",
    "You're never too old to set another goal or to dream a new dream.- C.S. Lewis",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.- Winston S. Churchill",
    "The only place where success comes before work is in the dictionary.- Vidal Sassoon",
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.- Christian D. Larson",
    "It does not matter how slowly you go as long as you do not stop.- Confucius",
    "The secret to getting ahead is getting started.- Mark Twain",
    "Dream big and dare to fail.- Norman Vaughan",
    "Life is what happens when you're busy making other plans.- John Lennon",
    "The future belongs to those who believe in the beauty of their dreams.- Eleanor Roosevelt",
    "The only thing that stands between you and your dream is the will to try and the belief that it is actually possible.- Joel Brown",
    "The best way to predict the future is to create it.- Peter Drucker",
    "Don't count the days, make the days count.- Muhammad Ali",
    "The only thing standing between you and your goal is the story you keep telling yourself as to why you can't achieve it.- Jordan Belfort",
    "Don't be afraid to give up the good to go for the great.- John D. Rockefeller",
    "The elevator to success is out of order. You'll have to use the stairs... one step at a time.- Joe Girard",
    "The more I want to get something done, the less I call it work.- Richard Bach",
        ]

quotes.each do |quote|
  MotivationalQuote.create(text: quote)
end
