package datos;
// Generated 29/05/2018 01:28:13 by Hibernate Tools 5.3.0.Beta2

/**
 * Boletocolectivo generated by hbm2java
 */
public class Boletocolectivo implements java.io.Serializable {

	private Integer idBoletoColectivo;
	private Lineacolectivo lineacolectivo;
	private Tarifacolectivo tarifacolectivo;
	private Viaje viaje;
	private String descripcion;
	private float precioFinal;

	public Boletocolectivo() {
	}

	public Boletocolectivo(Lineacolectivo lineacolectivo, Tarifacolectivo tarifacolectivo, Viaje viaje,
			String descripcion, float precioFinal) {
		this.lineacolectivo = lineacolectivo;
		this.tarifacolectivo = tarifacolectivo;
		this.viaje = viaje;
		this.descripcion = descripcion;
		this.precioFinal = precioFinal;
	}

	public Integer getIdBoletoColectivo() {
		return this.idBoletoColectivo;
	}

	public void setIdBoletoColectivo(Integer idBoletoColectivo) {
		this.idBoletoColectivo = idBoletoColectivo;
	}

	public Lineacolectivo getLineacolectivo() {
		return this.lineacolectivo;
	}

	public void setLineacolectivo(Lineacolectivo lineacolectivo) {
		this.lineacolectivo = lineacolectivo;
	}

	public Tarifacolectivo getTarifacolectivo() {
		return this.tarifacolectivo;
	}

	public void setTarifacolectivo(Tarifacolectivo tarifacolectivo) {
		this.tarifacolectivo = tarifacolectivo;
	}

	public Viaje getViaje() {
		return this.viaje;
	}

	public void setViaje(Viaje viaje) {
		this.viaje = viaje;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public float getPrecioFinal() {
		return this.precioFinal;
	}

	public void setPrecioFinal(float precioFinal) {
		this.precioFinal = precioFinal;
	}

}
