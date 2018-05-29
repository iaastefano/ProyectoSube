package datos;
// Generated 29/05/2018 01:28:13 by Hibernate Tools 5.3.0.Beta2

import java.util.HashSet;
import java.util.Set;

/**
 * Estacionsubte generated by hbm2java
 */
public class Estacionsubte implements java.io.Serializable {

	private Integer idEstacionSubte;
	private Lineasubte lineasubte;
	private String nombre;
	private Set boletosubtes = new HashSet(0);

	public Estacionsubte() {
	}

	public Estacionsubte(Lineasubte lineasubte, String nombre) {
		this.lineasubte = lineasubte;
		this.nombre = nombre;
	}

	public Estacionsubte(Lineasubte lineasubte, String nombre, Set boletosubtes) {
		this.lineasubte = lineasubte;
		this.nombre = nombre;
		this.boletosubtes = boletosubtes;
	}

	public Integer getIdEstacionSubte() {
		return this.idEstacionSubte;
	}

	public void setIdEstacionSubte(Integer idEstacionSubte) {
		this.idEstacionSubte = idEstacionSubte;
	}

	public Lineasubte getLineasubte() {
		return this.lineasubte;
	}

	public void setLineasubte(Lineasubte lineasubte) {
		this.lineasubte = lineasubte;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Set getBoletosubtes() {
		return this.boletosubtes;
	}

	public void setBoletosubtes(Set boletosubtes) {
		this.boletosubtes = boletosubtes;
	}

}