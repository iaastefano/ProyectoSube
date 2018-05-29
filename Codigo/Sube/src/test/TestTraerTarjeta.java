package test;

import negocio.TarjetaABM;
import datos.Tarjeta;

public class TestTraerTarjeta {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String nroTarjeta = "123 456 789";
			TarjetaABM abm = new TarjetaABM();
			Tarjeta t = abm.traerTarjeta(nroTarjeta);
			System.out.println("Traer tarjeta --> " + t.toString());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("ERROR al Agregar tarjeta --> " + ex);
		}
	}

}
