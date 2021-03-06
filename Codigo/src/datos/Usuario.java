package datos;
// Generated 29/05/2018 01:28:13 by Hibernate Tools 5.3.0.Beta2

import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario implements java.io.Serializable {

	private Integer idUsuario;
	private String nombre;
	private String apellido;
	private String email;
	private String usuario;
	private String contraseña;
	private long dni;
	private Set tarjetas = new HashSet(0);
	private Set usuarioTieneBeneficios = new HashSet(0);
	private Set descuentos = new HashSet(0);
	private Set movimientos = new HashSet(0);

	public Usuario() {
	}

	public Usuario(String nombre, String apellido, String email, String usuario, String contraseña, long dni) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.usuario = usuario;
		this.contraseña = contraseña;
		this.dni = dni;
	}

	public Usuario(String nombre, String apellido, String email, String usuario, String contraseña, long dni,
			Set tarjetas, Set usuarioTieneBeneficios, Set descuentos, Set movimientos) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.usuario = usuario;
		this.contraseña = contraseña;
		this.dni = dni;
		this.tarjetas = tarjetas;
		this.usuarioTieneBeneficios = usuarioTieneBeneficios;
		this.descuentos = descuentos;
		this.movimientos = movimientos;
	}

	public Integer getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContraseña() {
		return this.contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public long getDni() {
		return this.dni;
	}

	public void setDni(long dni) {
		this.dni = dni;
	}

	public Set getTarjetas() {
		return this.tarjetas;
	}

	public void setTarjetas(Set tarjetas) {
		this.tarjetas = tarjetas;
	}

	public Set getUsuarioTieneBeneficios() {
		return this.usuarioTieneBeneficios;
	}

	public void setUsuarioTieneBeneficios(Set usuarioTieneBeneficios) {
		this.usuarioTieneBeneficios = usuarioTieneBeneficios;
	}

	public Set getDescuentos() {
		return this.descuentos;
	}

	public void setDescuentos(Set descuentos) {
		this.descuentos = descuentos;
	}

	public Set getMovimientos() {
		return this.movimientos;
	}

	public void setMovimientos(Set movimientos) {
		this.movimientos = movimientos;
	}

}
