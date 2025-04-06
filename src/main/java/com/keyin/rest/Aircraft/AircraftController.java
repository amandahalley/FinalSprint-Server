package com.keyin.rest.Aircraft;

import com.keyin.rest.Airport.Airport;
import com.keyin.rest.Airport.AirportService;
import com.keyin.rest.Passenger.Passenger;
import com.keyin.rest.Passenger.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/aircraft")
public class AircraftController {

    @Autowired
    private AircraftService aircraftService;

    @Autowired
    private AirportService airportService;

    @Autowired
    private PassengerService passengerService;

    @GetMapping
    public List<Aircraft> getAllAircraft() {
        return aircraftService.getAllAircraft();
    }

    @GetMapping("/{id}")
    public Aircraft getAircraftById(@PathVariable Long id) {
        return aircraftService.getAircraftById(id);
    }

    @PostMapping
    public Aircraft createAircraft(@RequestBody Aircraft aircraft) {
        if (aircraft.getAirports() != null) {
            Set<Airport> fullAirports = aircraft.getAirports().stream()
                    .map(a -> airportService.getAirportById(a.getId()))
                    .collect(Collectors.toSet());
            aircraft.setAirports(fullAirports);
        }

        if (aircraft.getPassengers() != null) {
            Set<Passenger> fullPassengers = aircraft.getPassengers().stream()
                    .map(p -> passengerService.getPassengerById(p.getId()))
                    .collect(Collectors.toSet());
            aircraft.setPassengers(fullPassengers);
        }

        return aircraftService.createAircraft(aircraft);
    }

    @DeleteMapping("/{id}")
    public void deleteAircraft(@PathVariable Long id) {
        aircraftService.deleteAircraft(id);
    }

    @GetMapping("/{id}/airports")
    public List<Airport> getAirportsForAircraft(@PathVariable Long id) {
        Aircraft aircraft = aircraftService.getAircraftById(id);
        return aircraft != null ? aircraft.getAirports().stream().toList() : List.of();
    }


    @GetMapping("/{id}/passengers")
    public List<Passenger> getPassengersForAircraft(@PathVariable Long id) {
        Aircraft aircraft = aircraftService.getAircraftById(id);
        return aircraft != null ? aircraft.getPassengers().stream().toList() : List.of();
    }
}
