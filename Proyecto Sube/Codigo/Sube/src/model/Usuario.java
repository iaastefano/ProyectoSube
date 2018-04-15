package model;

import java.util.*;

public class Usuario {
	private int idUsuario;
	private String nombre;
	private String apellido;
	private long dni;
	private String pass;
	private String email;
	private boolean tarifaSocial;
	private boolean estudiantil;
	private List<Tarjeta> lstTarjetas;
}
