package controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Tarjeta;
import negocio.TarjetaABM;

public class ControladorBuscarTarjeta extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		procesarPeticion(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		procesarPeticion(request, response);
	}
	
	private void procesarPeticion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			String nroTarjeta = request.getParameter("nroTarjeta");
			TarjetaABM tarjetaAbm = new TarjetaABM();
			Tarjeta tarjeta = tarjetaAbm.traerTarjeta(nroTarjeta);
			
			request.setAttribute("tarjeta", tarjeta);
			request.getRequestDispatcher("/vistaapoyarsube.jsp").forward(request, response);
			
		} catch (Exception e) {
			response.sendError(500, "La tarjeta no existe en la base de datos.");
		}
	}
}
