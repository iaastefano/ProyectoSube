package datos;
// Generated 29/05/2018 01:28:13 by Hibernate Tools 5.3.0.Beta2

import java.util.HashSet;
import java.util.Set;

/**
 * Beneficio generated by hbm2java
 */
public class Beneficio implements java.io.Serializable {

	private Integer idBeneficio;
	private String descripcion;
	private float valor;
	private Set usuarioTieneBeneficios = new HashSet(0);

	public Beneficio() {
	}

	public Beneficio(String descripcion, float valor) {
		this.descripcion = descripcion;
		this.valor = valor;
	}

	public Beneficio(String descripcion, float valor, Set usuarioTieneBeneficios) {
		this.descripcion = descripcion;
		this.valor = valor;
		this.usuarioTieneBeneficios = usuarioTieneBeneficios;
	}

	public Integer getIdBeneficio() {
		return this.idBeneficio;
	}

	public void setIdBeneficio(Integer idBeneficio) {
		this.idBeneficio = idBeneficio;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getValor() {
		return this.valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public Set getUsuarioTieneBeneficios() {
		return this.usuarioTieneBeneficios;
	}

	public void setUsuarioTieneBeneficios(Set usuarioTieneBeneficios) {
		this.usuarioTieneBeneficios = usuarioTieneBeneficios;
	}

}
