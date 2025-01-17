class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      car.registration_date = Date.today
      @registered_vehicles << car
      if car.antique?
        @collected_fees += 25
      elsif car.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? == true && registrant.age >=16
      registrant.license_data[:written] = true
      return true
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      return true
    else
      return false
    end
  end

  def renew_drivers_license(registrant)
    if services.include?('Renew License') && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
      return true
    else
      return false
    end
  end
end
