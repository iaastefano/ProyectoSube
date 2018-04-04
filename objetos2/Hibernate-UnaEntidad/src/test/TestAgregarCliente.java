package test;

import java.util.GregorianCalendar;
import negocio.ClienteABM;

public class TestAgregarCliente {
	public static void main(String[] args) {
		String apellido = "STEFANO";
		String nombre = "DALESSANDRO";
		int documento = 41196319;
		GregorianCalendar fechaDeNacimiento = new GregorianCalendar(1998,5,23); // tu fecha de nacimiento
		ClienteABM abm = new ClienteABM();
		long ultimoIdCliente = abm.agregar(apellido, nombre, documento, fechaDeNacimiento);
	}
}