package com.keyin.rest.Passenger;

import com.keyin.rest.Aircraft.Aircraft;
import com.keyin.rest.Aircraft.AircraftService;
import com.keyin.rest.Airport.Airport;
import com.keyin.rest.Airport.AirportService;
import com.keyin.rest.City.City;
import com.keyin.rest.City.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/passenger")
public class PassengerController {

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private CityService cityService;

    @Autowired
    private AircraftService aircraftService;

    @Autowired
    private AirportService airportService;

    @GetMapping
    public List<Passenger> getAllPassengers() {
        return passengerService.getAllPassengers();
    }

    @GetMapping("/{id}")
    public Passenger getPassengerById(@PathVariable Long id) {
        return passengerService.getPassengerById(id);
    }

    @PostMapping
    public Passenger createPassenger(@RequestBody Passenger passenger) {
        // Hydrate city
        if (passenger.getCity() != null && passenger.getCity().getId() != null) {
            City fullCity = cityService.getCityById(passenger.getCity().getId());
            passenger.setCity(fullCity);
        }

        // Hydrate aircrafts
        if (passenger.getAircrafts() != null) {
            Set<Aircraft> fullAircrafts = passenger.getAircrafts().stream()
                    .map(a -> aircraftService.getAircraftById(a.getId()))
                    .collect(Collectors.toSet());
            passenger.setAircrafts(fullAircrafts);
        }

        // Hydrate airports
        if (passenger.getAirportsUsed() != null) {
            Set<Airport> fullAirports = passenger.getAirportsUsed().stream()
                    .map(a -> airportService.getAirportById(a.getId()))
                    .collect(Collectors.toSet());
            passenger.setAirportsUsed(fullAirports);
        }

        return passengerService.createPassenger(passenger);
    }

    @DeleteMapping("/{id}")
    public void deletePassenger(@PathVariable Long id) {
        passengerService.deletePassenger(id);
    }

    @GetMapping("/{id}/aircraft")
    public List<Aircraft> getAircraftForPassenger(@PathVariable Long id) {
        Passenger passenger = passengerService.getPassengerById(id);
        return passenger != null ? passenger.getAircrafts().stream().toList() : List.of();
    }

    @GetMapping("/{id}/airports")
    public List<Airport> getAirportsUsedByPassenger(@PathVariable Long id) {
        Passenger passenger = passengerService.getPassengerById(id);
        return passenger != null ? passenger.getAirportsUsed().stream().toList() : List.of();
    }
}
