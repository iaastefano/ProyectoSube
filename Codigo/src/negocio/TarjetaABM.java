package negocio;

import java.util.GregorianCalendar;
import java.util.List;
import dao.TarjetaDao;
import datos.Tarjeta;

public class TarjetaABM {
	TarjetaDao dao = new TarjetaDao();

	public Tarjeta traerTarjeta(long idTarjeta) throws Exception {
		Tarjeta c = dao.traerTarjeta(idTarjeta);
		if (c == null)
		{
			throw new Exception("La Tarjeta de id " + idTarjeta + " no existe.");
		}
		return c;
	}

	public Tarjeta traerTarjeta(String nroTarjeta) throws Exception {
		Tarjeta c = dao.traerTarjeta(nroTarjeta);
		if (c == null)
		{
			throw new Exception("La Tarjeta de numero " + nroTarjeta + " que quiere traer no existe.");
		}
		return c;
	}

	public int agregar(String nroTarjeta) throws Exception {
		if(dao.traerTarjeta(nroTarjeta)!=null)
		{
			throw new Exception("La Tarjeta de numero " + nroTarjeta + " que quiere agregar ya existe.");
		}
		Tarjeta t = new Tarjeta(nroTarjeta);
		return dao.agregar(t);
	}

}
