#
#
class Place
  attr_accessor :name, :max_today, :min_today, :max_avg, :min_avg

  #
  #
  def initialize( name, max_today, min_today, max_avg, min_avg )
     @name = name
     @max_today = max_today
     @min_today = min_today
     @max_avg = max_avg
     @min_avg = min_avg
  end

  #
  #
  def Place.verify_and_get_temperatures( place, places_list )
    place = place.to_sym_city
    city_values = Place.get_array_from_xml( place, places_list ) if places_list.has_key?( place )
    return city_values
  end

  #
  #
  def Place.get_array_from_xml( place, places_list )
    aff_id = "&affiliate_id=fvzoaihj8486"
    necessary_data = [ :temperaturaminima, :temperaturamaxima ]
    city_values = {}

    place_url = ( places_list[place].sub( "&amp;", "&" ) + aff_id )
    doc = Nokogiri::XML( open( place_url ) )
    data_city = doc.xpath( "//var" )
    data_city.each do |weather_param|
      city_values[ weather_param.children.children[0].to_s.to_sym_city ] = weather_param.children.children[2..-1].map{ |att| att.attributes['value'].value.to_f }
    end
    city_values = city_values.select{ |key, value| necessary_data.include?( key ) }
    return city_values
  end

  #
  #
  def Place.get_places_list
    begin
      doc = Nokogiri::XML(open("http://api.tiempo.com/index.php?api_lang=es&division=102&affiliate_id=fvzoaihj8486"))
      data_cities = doc.xpath( "//data" )
      places = {}
      names = []
      data_cities.each do |data_city|
        places[ data_city.children.children[0].to_s.to_sym_city ] = data_city.children.children[1].to_s
        names << data_city.children.children[0].to_s
      end
      return places, names
    rescue
      return false, false
    end
  end

  #
  #
  def Place.set_temperatures( place, places )
    place_data = Place.verify_and_get_temperatures( place.to_s, places )

    place = ( Place.new( place,
      place_data[ :temperaturamaxima ][0],
      place_data[ :temperaturaminima ][0],
      ( place_data[ :temperaturamaxima ].sum / place_data[ :temperaturamaxima ].length ).round( 2 ),
      ( place_data[ :temperaturaminima ].sum / place_data[ :temperaturaminima ].length ).round( 2 ) ) rescue nil )
  end

end

#
#
class String
  def to_sym_city
    I18n.config.available_locales = :en
    begin
      return_string =  I18n.transliterate( self ).tr( " ", "" ).downcase.to_sym
      return return_string
    rescue Encoding::CompatibilityError => e
      puts "An error of type #{e.class} occured. Message #{e.message}"
      raise unless return_string =  I18n.transliterate( self.encode( "UTF-8", "IBM437", invalid: :replace, undef: :replace ) ).tr( " ", "" ).downcase.to_sym
    end
  end
end
