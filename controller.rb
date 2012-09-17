ignore /\.git/
ignore /\/_.*/
ignore /(Procfile|Gemfile|README*|config\.ru)/

before /.*html\.erb/ do
  #{wall}-#{location}
  @walls = %w(north south east west floor ceil)
  @locations = %w(interior exterior)
  @sensors = {
    'north-interior'  => 58,
    'north-exterior'  => 15,
    'south-interior'  => 34,
    'south-exterior'  => 9,
    'east-interior'   => 30,
    'east-exterior'   => 6,
    'west-interior'   => 54,
    'west-exterior'   => 11,
    'floor-interior'  => 64,
    'floor-exterior'  => 22,
    'ceil-interior'   => 60,
    'ceil-exterior'   => 19,
    'air-north'       => 66,
    'air-south'       => 42,
  }
end

# @walls = %w(north south east west floor ceil)
# @locations = %w(interior exterior)
#
# @walls.product(@locations).each do |s|
#   puts "'#{s.join("-")}' => "
# end