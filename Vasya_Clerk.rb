def tickets(people)
  # Your solution here...
  change = []

  people.each do |payment|
    case payment
    when 25
      change << 25
    when 50
      change << 50
      change.delete_at(change.index 25) if change.include?(25)
    when 100
      change << 100
      if change.include?(25) && change.include?(50)
        change.delete_at((change.index 25))
        change.delete_at((change.index 50))
      elsif (change.select { |bill| bill == 25 }).count >= 3
        3.times do
          change.delete_at((change.index 25))
        end
      end
    end
  end

  case people.last
  when 25
    puts 'YES1'
  when 50
    if change.include?(25)
      change.delete_at((change.index 25))
      puts 'YES2'
    else
      puts 'NO3'
    end
  when 100
    if change.include?(25) && change.include?(50)
      change.delete_at((change.index 25))
      change.delete_at((change.index 50))
      puts 'YES4'
    elsif (change.select { |bill| bill == 25 }).count >= 3
      3.times do
        change.delete_at((change.index 25))
      end
      puts 'YES5'
    else
      puts 'NO6'
    end
  else
    puts 'WRONG AMOUNT'
  end
end

# p tickets([25, 25, 50]) # => YES
# tickets([25, 100]) # => NO. Vasya will not have enough money to give change to 100 dollars
tickets([25, 25, 50, 50, 100]) # => NO. Vasya will not have the right bills to give 75 dollars of change (you can't make two bills of 25 from one of 50)