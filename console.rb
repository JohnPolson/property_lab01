require_relative('models/property')
require('pry')


property_1 = Property.new({
  'address' => '1 Main Street',
  'valuation' => '700000',
  'rooms' => 5,
  'build' => 'detached'
  })

property_2 = Property.new({
  'address' => '20 Queen Street',
  'valuation' => '850000',
  'rooms' => 7,
  'build' => 'loft'
  })

property_1.save
property_2.save


property_1.rooms = 10
property_1.update


# property_2.delete

p result_1 = Property.find_by_id(1)


p result_2 = Property.find_by_address('20 Queen Street')

  binding.pry
  nil
