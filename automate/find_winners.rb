# Automates drawing folks names out of a hat.
# Expects a CSV file like:
#
# Name, item_1, item_2, . . ., item_N
# some_name,,'x', . . ., 'x'
# some_other_name,'x',, . . .,

require 'csv'

table = CSV.read("drawing.csv", headers: true)
# Replace 4 with N
items_to_give_away = (1..4).to_a

items_by_people = {}
items_to_give_away.each do |item|
  items_by_people[item] = []
  table.each do |row|
    if row[item] == 'x'
      items_by_people[item].append(row[0])
    end
  end
end

results = {}
items_to_give_away.each { |item| results[item] = Hash.new(0) }

1_000_000.times do |i|
  if i % 1000 == 0
    puts "Number of iterations completed #{i}."
  end
  items_by_people.each do |i, p|
    selection = p.shuffle.pop
    results[i][selection] += 1
  end
end

final = results.map do |item, distribution|
  sorted = distribution.sort_by {|n, v| v }
  [item, sorted]
end

final.each do |item, sorted|
  puts "For #{item}, the distribution is: #{sorted}."
end

final.each do |item, sorted|
  winner = sorted.pop
  puts "For #{item}, the winner is: #{winner[0]} with a score of #{winner[1]}."
end
