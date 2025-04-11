package com.example.lab3_gtics.entidad;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name="jugador")
public class jugador {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idpartido",nullable = false)
    private int idPartido;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "numeroJornada")
    private int numeroJornada;

    @Column(name = "arbitro_idarbitro",nullable = false)
    private int arbitro_idarbitro;

    @Column(name = "seleccion_idseleccion",nullable = false)
    private int seleccion_idseleccion;

    @Column(name = "seleccion_idseleccion1",nullable = false)
    private int seleccion_idseleccion1;

}
