package com.keyin.rest.Airport;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.keyin.rest.City.City;
import com.keyin.rest.Aircraft.Aircraft;
import com.keyin.rest.Passenger.Passenger;
import jakarta.persistence.*;
import java.util.Set;

@Entity
public class Airport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String code;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;

    @ManyToMany(mappedBy = "airports")
    private Set<Aircraft> aircrafts;

    @ManyToMany(mappedBy = "airportsUsed")
    @JsonIgnore
    private Set<Passenger> passengersUsed;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Set<Aircraft> getAircrafts() {
        return aircrafts;
    }

    public void setAircrafts(Set<Aircraft> aircrafts) {
        this.aircrafts = aircrafts;
    }

    public Set<Passenger> getPassengersUsed() {
        return passengersUsed;
    }

    public void setPassengersUsed(Set<Passenger> passengersUsed) {
        this.passengersUsed = passengersUsed;
    }
}
