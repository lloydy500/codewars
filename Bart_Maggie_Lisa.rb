# Given: an array containing hashes of names

# Return: a string formatted as a list of names separated by commas except for the last two names, which should be separated by an ampersand.

# Example:

# list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# # returns 'Bart, Lisa & Maggie'

# list([ {name: 'Bart'}, {name: 'Lisa'} ])
# # returns 'Bart & Lisa'

# list([ {name: 'Bart'} ])
# # returns 'Bart'

# list([])
# # returns ''

def list names

  if names.empty?
    ''
  elsif names.length == 1
    names.map { |hash| hash[:name] }.join
  else
    hash_list = names.map { |hash| hash[:name] }
    last_name = " & #{hash_list.last}"
    hash_list.pop
    hash_list.join(', ') + last_name
  end

end