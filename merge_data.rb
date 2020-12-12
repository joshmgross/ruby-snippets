# From https://twitter.com/wesbos/status/1337453660482187268

# Can you merge this data together?
arr1 = [
    ["name", "id", "age", "weight", "cool"],
    ["Susan", "3", "20", "120", true],
    ["John", "1", "21", "150", true],
    ["Bob", "2", "23", "90", false],
    ["Ben", "4", "20", "100", true],
];

arr2 = [
    ["name", "id", "height"],
    ["Bob", "2", "50"],
    ["John", "1", "45"],
    ["Ben", "4", "43"],
    ["Susan", "3", "48"],
];

arr3 = [
    ["name", "id", "parent"],
    ["Bob", "2", "yes"],
    ["John", "1", "yes"],
];

# Solution

# Returns a hash of people
def merge_arrays(arrays)
  people = {}

  arrays.each{ |array|
    key = array.shift
    id_index = key.index("id")
    next unless id_index

    array.each{|values| add_or_update_object(key, id_index, values, people)}
  }

  people
end

def add_or_update_object(keys, id_index, values, people_hash)
  id = values[id_index].to_i
  return unless id

  people_hash[id] ||= {}
  values.each_with_index{|value, index|
    key = keys[index].to_sym
    people_hash[id][key] = String === value ? (value.to_i || value) : value # Try to parse strings to int
  }
end

puts merge_arrays([arr1, arr2, arr3])
