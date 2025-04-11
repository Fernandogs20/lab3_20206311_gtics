package com.example.lab3_gtics.repositorio;

import com.example.lab3_gtics.entidad.jugador;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JugadorRepository extends JpaRepository<jugador, Long> {
}
