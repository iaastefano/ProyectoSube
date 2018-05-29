package test;

import negocio.TarjetaABM;
import datos.Tarjeta;

public class TestAgregarTarjeta {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String nroTarjeta = "123 456 789";
			TarjetaABM abm = new TarjetaABM();
			long ultimoId = abm.agregar(nroTarjeta);
			System.out.println("Agregar tarjeta --> " + ultimoId);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("ERROR al Agregar tarjeta --> " + ex);
		}
	}

}
