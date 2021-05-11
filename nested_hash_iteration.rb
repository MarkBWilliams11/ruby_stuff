contacts = {
  'Jon Snow' => {
    name: 'Jon',
    email: 'jon_snow@thewall.we',
    favorite_ice_cream_flavors: ['chocolate', 'vanilla', 'mint chip'],
    knows: nil
  },
  'Freddy Mercury' => {
    name: 'Freddy',
    email: 'freddy@mercury.com',
    favorite_ice_cream_flavors: ['strawberry', 'cookie dough', 'mint chip']
  }
}

contacts.each do |person, data|
  puts "#{person}: #{data}"
end

p 'another iteration to get the data key/value pairs'

contacts.each do |_person, data|
  # at this level, "person" is Jon Snow or Freddy Mercury and "data" is a hash of
  # key/value pairs to iterate over the "data" hash, we can use the following line:

  data.each do |attribute, value|
    puts "#{attribute}: #{value}"
  end
end

p 'another step to get the attributes value'
contacts.each do |_person, data|
  # at this level, "person" is Jon Snow or Freddy and "data" is a hash of
  # key/value pairs to iterate over the "data" hash, we can use the following
  # line:

  data.each do |attribute, value|
    # at this level, "attribute" describes the key of :name, :email,
    #:favorite_ice_cream_flavors, or :knows we need to first check and see if
    # the key is :favorite_ice_cream_flavors, if it is, that means the VALUE is
    # an array that we can iterate over to print out each element

    next unless attribute == :favorite_ice_cream_flavors

    value.each do |flavor|
      # here, each index element in an ice cream flavor string
      puts flavor.to_s
    end
  end
end

p 'Stack overflow Example of Nested array of hashes'
#
# accessing the nested hash array to have the primary role key in the array changed
# to industry instead
p nested_hash = [
  { 'id' => '1', 'properties' => { 'name' => 'Google', 'stock_symbol' => 'GOOG', 'primary_role' => 'company' } },
  { 'id' => '2', 'properties' => { 'name' => 'Facebook', 'stock_symbol' => 'FB', 'primary_role' => 'company' } }
]

# removing the element we no longer need
nested_hash.each do |company|
  company['properties'].delete('primary_role')
end
# adding elements to a hash You assign new hash values simply with hash[key] = value
nested_hash.each do |company|
  company['properties']['industry'] = 'Advertising/Privacy Invasion'
end
p nested_hash
