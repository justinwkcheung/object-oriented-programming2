class System

  attr_reader :bodies, :total_mass, :masses
  def initialize
    @bodies = []
    @masses = []
    @total_mass = 0
  end


  def add(body)
    @bodies << body.name
    @masses << body.mass
    return "the list of bodies is #{@bodies}"
  end


  def total_mass
    @masses.each do |body|

      @total_mass += body
    end
    return "the total mass of the system is #{@total_mass}"
  end

end

system = System.new


class Body

  attr_reader :name, :mass

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end


class Planet < Body
  attr_reader :day, :year
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end
end

class Star < Body
  attr_reader :type
  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end
end

class Moon < Body
  attr_reader :month, :planet
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end
end

earth = Planet.new("earth", 50, 24, 365)
mars = Planet.new("mars", 80, 30, 400)
# puts earth.name, earth.mass, earth.day, earth.year
puts system.add(earth)
puts system.add(mars)
# puts system.total_mass(earth)
# puts system.total_mass(mars)
puts system.total_mass