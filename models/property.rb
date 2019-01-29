require('pg')

class Property

  attr_accessor :address, :valuation, :rooms, :build

  def initialize(prop_det)
    @id = prop_det["id"].to_i if prop_det["id"]
    @address = prop_det['address']
    @valuation = prop_det['valuation'].to_i
    @rooms = prop_det['rooms'].to_i
    @build = prop_det['build']
  end



  def save
    db = PG.connect({dbname: 'property', host: 'localhost'})
    sql = "INSERT INTO property(
    address,
    valuation,
    rooms,
    build
  ) VALUES ($1, $2, $3, $4)
  RETURNING id
    "
    values = [@address, @valuation, @rooms, @build]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close
  end

  def update()
    db = PG.connect({ dbname: 'property', host: 'localhost'})
    sql = "UPDATE property SET (address,
    valuation,
    rooms,
    build) = ($1, $2, $3, $4 )
    WHERE id = $5"
    values = [@address, @valuation, @rooms, @build, @id ]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

  def delete()
    db = PG.connect({ dbname: 'property', host: 'localhost'})
    sql = "DELETE FROM property WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close
  end


  def Property.find_by_id(prop_id)
    db = PG.connect({ dbname: 'property', host: 'localhost'})
    sql = "SELECT * FROM property WHERE id = $1"
    values = [prop_id]
    db.prepare("find_by_id", sql)
    property = db.exec_prepared("find_by_id", values)
    db.close
    return property.map{ |property_hash| Property.new(property_hash)}
  end

  def Property.find_by_address(prop_address)
    db = PG.connect({ dbname: 'property', host: 'localhost'})
    sql = "SELECT * FROM property WHERE address = $1"
    values = [prop_address]
    db.prepare("find_by_address", sql)
    property = db.exec_prepared("find_by_address", values)
    db.close
    return property.map{ |property_hash| Property.new(property_hash)}
  end


end
