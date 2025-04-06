package com.keyin.rest.Airport;

import com.keyin.rest.City.City;
import com.keyin.rest.City.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/airport")
public class AirportController {

    @Autowired
    private AirportService airportService;

    @Autowired
    private CityService cityService;

    @GetMapping
    public List<Airport> getAllAirports() {
        return airportService.getAllAirports();
    }

    @GetMapping("/{id}")
    public Airport getAirportById(@PathVariable Long id) {
        return airportService.getAirportById(id);
    }

    @PostMapping
    public Airport createAirport(@RequestBody Airport airport) {
        if (airport.getCity() != null && airport.getCity().getId() != null) {
            City fullCity = cityService.getCityById(airport.getCity().getId());
            airport.setCity(fullCity);
        }

        return airportService.createAirport(airport);
    }

    @DeleteMapping("/{id}")
    public void deleteAirport(@PathVariable Long id) {
        airportService.deleteAirport(id);
    }
}
