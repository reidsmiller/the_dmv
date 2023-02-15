require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :county,
              :plate_type
  attr_accessor :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @county = vehicle_details[:county]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = self.plate_gen
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_gen
    if self.antique?
      :antique
    elsif self.electric_vehicle?
      :ev
    else
      :regular
    end
  end
end
