class System

  @@all_systems = []


  attr_reader :bodies, :masses
  def initialize
    @bodies = []
    @@all_systems.push(self)
  end

  def self.total_mass_gal
    total_mass_gal = 0

    @@all_systems.each do |system|
      total_mass_gal += system.total_mass
      puts "Systems = #{@@all_systems}"
    end

    total_mass_gal
  end


  def add(body)
    @bodies.each do |x|
      if x.name == body.name
        return "This body already exists!"
      end
    end
    puts "adding body #{body.name} to system"
    @bodies << body
    @bodies
  end


  def total_mass
    total_mass = 0
    @bodies.each do |body|

      total_mass += body.mass
    end
    total_mass
  end

end



class Body

  attr_reader :name, :mass

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end


class Planet < Body

  # @@planet_count = 0

  attr_reader :day, :year
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end

  # def self.planet_count
  #   @@planet_count
  # end

  def self.all(sys)
    planet_count = 0
    sys.bodies.each do |body|
      if body.class == Planet
        planet_count += 1
      end
    end
    return planet_count
  end
end

class Star < Body

  # @@star_count = 0

  attr_reader :type

  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end

  # def self.star_count
  #   @@star_count
  # end

  def self.all(sys)
    star_count = 0 
    sys.bodies.each do |body|
      if body.class == Star
        star_count += 1
      end
    end
    return star_count
  end

end

class Moon < Body

  # @@moon_count = 0

  attr_reader :month, :planet
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end
  #
  # def self.moon_count
  #   @@moon_count
  # end

  def self.all(sys)
    moon_count = 0
    sys.bodies.each do |body|
      if body.class == Star
        moon_count += 1
      end
    end
    return moon_count
  end
end


# DO THESE THINGS -----------------------------

earth = Planet.new("earth", 50, 24, 365)
mars = Planet.new("mars", 80, 30, 400)
bars = Planet.new("mars", 40, 30, 200)
sun = Star.new("sun", 90, "g-star")
titan = Moon.new("titan", 30, 20, "earth")

system = System.new
puts system.add(earth)
puts system.add(mars)
puts system.add(mars)
puts system.add(sun)
puts system.add(titan)
puts "System total mass is #{system.total_mass}"

# alpha = System.new
# puts alpha.add(earth)
# puts "Alpha's total mass is #{alpha.total_mass}"
puts Planet.all(system)
puts "System galatic mass is #{System.total_mass_gal}"
puts "Number of moons in system is #{Moon.all(system)}"
