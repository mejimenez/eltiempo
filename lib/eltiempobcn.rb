require 'thor'
require 'nokogiri'
require 'open-uri'
require 'i18n'
require 'byebug'
require_relative 'place.rb'

class ElTiempoCLI < Thor
  @@places, @@places_names = Place.get_places_list

  #
  #
  desc "today PLACE", "Returns the forcast temperature for today for PLACE"
  def today( place_name )
    place = Place.set_temperatures( place_name.to_s, @@places )
    if place.kind_of?( Place )
      puts "Today's temperatures for #{ place.name } are: [ min: #{ place.min_today }, max: #{ place.max_today } ] celsius"
    else
      puts "Couldn't find the city #{ place_name } or its data."
    end
  end

  #
  #
  desc "av_max PLACE", "Returns the average of the Maximums for the week in PLACE"
  def av_max( place_name )
    place = Place.set_temperatures( place_name.to_s, @@places )
    if place.kind_of?( Place )
      puts "The average temperature for the Maximums this week in #{ place.name } are: #{ place.max_avg } celsius degrees"
    else
      puts "Couldn't find the city #{ place_name } or its data."
    end
  end

  #
  #
  desc "av_min PLACE", "Returns the average of the minimums for the week in PLACE"
  def av_min( place_name )
    place = Place.set_temperatures( place_name.to_s, @@places )
    if place.kind_of?( Place )
      puts "The average temperature for the minimuims this week in #{ place.name } are: #{ place.min_avg } celsius degrees"
    else
      puts "Couldn't find the city #{ place_name } or its data."
    end
  end

  #
  #
  desc "list", "Returns the list of places"
  def list
    puts @@places_names.join( " | " )
  end


  #
  #
  def self.start( args )
    if @@places
      clean_args = args
      clean_args[ 0 ] = args[ 0 ].sub( /^-*/, "" ) unless clean_args[ 0 ].nil? # remove the leading dashes before execuing the start method
      super( clean_args )
    else
      puts "Couldn't connect with the server, please check your connection and try again later"
    end
  end

  #
  #
  def self.exit_on_failure?
    true
  end
end
