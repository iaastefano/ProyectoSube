package datos;
// Generated 29/05/2018 01:28:13 by Hibernate Tools 5.3.0.Beta2

import java.util.HashSet;
import java.util.Set;

/**
 * Estaciontren generated by hbm2java
 */
public class Estaciontren implements java.io.Serializable {

	private Integer idEstacionTren;
	private String nombre;
	private Set ramalTieneEstacions = new HashSet(0);
	private Set boletotrensForIdEstacionBajada = new HashSet(0);
	private Set boletotrensForIdEstacionSubida = new HashSet(0);

	public Estaciontren() {
	}

	public Estaciontren(String nombre) {
		this.nombre = nombre;
	}

	public Estaciontren(String nombre, Set ramalTieneEstacions, Set boletotrensForIdEstacionBajada,
			Set boletotrensForIdEstacionSubida) {
		this.nombre = nombre;
		this.ramalTieneEstacions = ramalTieneEstacions;
		this.boletotrensForIdEstacionBajada = boletotrensForIdEstacionBajada;
		this.boletotrensForIdEstacionSubida = boletotrensForIdEstacionSubida;
	}

	public Integer getIdEstacionTren() {
		return this.idEstacionTren;
	}

	public void setIdEstacionTren(Integer idEstacionTren) {
		this.idEstacionTren = idEstacionTren;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Set getRamalTieneEstacions() {
		return this.ramalTieneEstacions;
	}

	public void setRamalTieneEstacions(Set ramalTieneEstacions) {
		this.ramalTieneEstacions = ramalTieneEstacions;
	}

	public Set getBoletotrensForIdEstacionBajada() {
		return this.boletotrensForIdEstacionBajada;
	}

	public void setBoletotrensForIdEstacionBajada(Set boletotrensForIdEstacionBajada) {
		this.boletotrensForIdEstacionBajada = boletotrensForIdEstacionBajada;
	}

	public Set getBoletotrensForIdEstacionSubida() {
		return this.boletotrensForIdEstacionSubida;
	}

	public void setBoletotrensForIdEstacionSubida(Set boletotrensForIdEstacionSubida) {
		this.boletotrensForIdEstacionSubida = boletotrensForIdEstacionSubida;
	}

}
