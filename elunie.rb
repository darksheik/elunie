require_relative 'lib/Agent'
require_relative 'lib/Rule'

rule = Rule.new    # choose a rule once
agent = Agent.new  # initial pull of a game agent is random.  Refers to a combination of Size, Color, and Figure.

#puts "Uncomment to cheat and see that the rule # is: " + (rule.chosen_rule).to_s

# Welcome message

puts "Welcome to Elunie!"
puts "The first 3 moves are"
puts

# Print first three moves
puts agent
2.times { 
  agent = rule.computerpick(agent)
  puts agent
 }

# Iterate five times to get user responses

5.times do |i| 

  print("Guess #" + (i+1).to_s + ". What is your move? ")

  usermove = gets.chomp
  useragent = Agent.new(*usermove.split)

  if rule.user_smart?(agent,useragent) then 
    puts "Correct!"
    agent = useragent  # Prepare next move
  else
    puts "Sorry, you lose!"
    Kernel.exit
  end
end
