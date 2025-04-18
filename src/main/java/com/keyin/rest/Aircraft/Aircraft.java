package com.keyin.rest.Aircraft;

import com.fasterxml.jackson.annotation.JsonIgnore;

import com.keyin.rest.Passenger.Passenger;
import com.keyin.rest.Airport.Airport;
import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonProperty;


import java.util.Set;

@Entity
public class Aircraft {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;
    @Column(name = "airlineName")
    private String airlineName;

    @Column(name = "numberOfPassengers")
    private Integer numberOfPassengers;


    

    @ManyToMany
    @JsonIgnore
    @JoinTable(
            name = "aircraft_passenger",
            joinColumns = @JoinColumn(name = "aircraft_id"),
            inverseJoinColumns = @JoinColumn(name = "passenger_id")
    )
    private Set<Passenger> passengers;

    @ManyToMany
    
    @JoinTable(
            name = "aircraft_airport",
            joinColumns = @JoinColumn(name = "aircraft_id"),
            inverseJoinColumns = @JoinColumn(name = "airport_id")
    )
    private Set<Airport> airports;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    
    @JsonProperty("numberOfPassengers")
    public Integer getNumberOfPassengers() {
        return numberOfPassengers;
    }




    public void setNumberOfPassengers(Integer numberOfPassengers) {
        this.numberOfPassengers = numberOfPassengers;
    }

    public Set<Passenger> getPassengers() {
        return passengers;
    }

    public void setPassengers(Set<Passenger> passengers) {
        this.passengers = passengers;
    }

    public Set<Airport> getAirports() {
        return airports;
    }

    public void setAirports(Set<Airport> airports) {
        this.airports = airports;
    }
}
