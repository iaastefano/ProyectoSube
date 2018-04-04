package funciones;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Funciones {
	public static boolean esBisiesto(int anio) {
		return (anio % 400 == 0) || ((anio % 4 == 0) && (anio % 100 != 0));
	}

	public static int traerAnio(GregorianCalendar fecha) {
		return fecha.get(Calendar.YEAR);
	}

	public static int traerMes(GregorianCalendar fecha) {
		return fecha.get(Calendar.MONTH) + 1;
	}

	public static int traerDia(GregorianCalendar fecha) {
		return fecha.get(Calendar.DATE);
	}

	public static boolean esFechaValida(int anio, int mes, int dia) { // VERIFICAR
		boolean resultado = true;
		int[] diasPorMes = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if ((anio <= 0) || (mes <= 0) || (dia <= 0)) {
			resultado = false;
		}
		if (esBisiesto(anio) == true) {
			diasPorMes[2] = 29;
		}
		if (dia > diasPorMes[mes]) {
			resultado = false;
		}
		return resultado;
	}

	public static GregorianCalendar traerFecha(int anio, int mes, int dia) {
		GregorianCalendar fecha = new GregorianCalendar();
		if (esFechaValida(anio, mes, dia)) {
			fecha.set(anio, mes, dia);
		}
		return fecha;
	}

	public static GregorianCalendar traerFecha(String fecha) {
		String[] partes = fecha.split("/");
		String parte1 = partes[0];
		String parte2 = partes[1];
		String parte3 = partes[2];
		int dia = Integer.parseInt(parte1);
		int mes = Integer.parseInt(parte2);
		int anio = Integer.parseInt(parte3);
		return traerFecha(anio, mes, dia);
	}

	public static String traerFechaCorta(GregorianCalendar fecha) {
		String dia = String.valueOf(traerDia(fecha));
		String mes = String.valueOf(traerMes(fecha));
		String anio = String.valueOf(traerAnio(fecha));
		String resultado;
		if (esFechaValida(traerAnio(fecha), traerMes(fecha), traerDia(fecha)) == false)
			resultado = "La fecha no es valida.";
		else
			resultado = completarCadena(dia, "0", 2) + "/" + completarCadena(mes, "0", 2) + "/"
					+ completarCadena(anio, "0", 4);
		return resultado;
	}

	public static String traerFechaCortaHora(GregorianCalendar fecha) {
		String horas = String.valueOf(fecha.get(Calendar.HOUR_OF_DAY));
		String minutos = String.valueOf(fecha.get(Calendar.MINUTE));
		String segundos = String.valueOf(fecha.get(Calendar.SECOND));
		String resultado;
		if (esFechaValida(traerAnio(fecha), traerMes(fecha), traerDia(fecha)) == false)
			resultado = "La fecha no es valida.";
		else
			resultado = completarCadena(horas, "0", 2) + ":" + completarCadena(minutos, "0", 2) + ":"
					+ completarCadena(segundos, "0", 2);
		return traerFechaCorta(fecha) + " " + resultado;
	}

	public static String completarCadena(String cadena, String agregado, int longitudDeseada) {
		int cantidadAgregados = longitudDeseada - cadena.length();
		for (int i = 0; i < cantidadAgregados; i++)
			cadena = agregado + cadena;
		return cadena;
	}

	public static GregorianCalendar traerFechaProximo(GregorianCalendar fecha, int cantDias) {
		GregorianCalendar fechaResultado = (GregorianCalendar) fecha.clone();
		fechaResultado.add(Calendar.DAY_OF_MONTH, cantDias);
		return fechaResultado;
	}

	public static boolean esDiaHabil(GregorianCalendar fecha) {
		return fecha.get(Calendar.DAY_OF_WEEK) > 1 && fecha.get(Calendar.DAY_OF_WEEK) < 7;
	}

	public static String traerDiaDeLaSemana(GregorianCalendar fecha) {
		String[] diaDeLaSemana = { "", "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" };
		return diaDeLaSemana[fecha.get(Calendar.DAY_OF_WEEK)];
	}

	public static String traerMesEnLetras(GregorianCalendar fecha) {
		String[] mesDelAnio = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
				"Octubre", "Noviembre", "Diciembre" };
		return mesDelAnio[fecha.get(Calendar.MONTH)];
	}

	public static String traerFechaLarga(GregorianCalendar fecha) {
		return traerDiaDeLaSemana(fecha) + " " + traerDia(fecha) + " de " + traerMesEnLetras(fecha) + " del "
				+ traerAnio(fecha);
	}

	public static boolean sonFechasIguales(GregorianCalendar fecha, GregorianCalendar fecha1) {
		String fechaA = traerFechaCorta(fecha);
		String fechaB = traerFechaCorta(fecha1);
		return fechaA.equals(fechaB);
	}

	public static boolean sonFechasHorasIguales(GregorianCalendar fecha, GregorianCalendar fecha1) {
		String fechaA = traerFechaCortaHora(fecha);
		String fechaB = traerFechaCortaHora(fecha1);
		return fechaA.equals(fechaB);
	}

	public static int traerCantDiasDeUnMes(int anio, int mes) {
		int[] diasPorMes = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if (esBisiesto(anio))
			diasPorMes[2] = 29;
		return diasPorMes[mes];
	}

	public static double aproximar2Decimal(double valor) {
		double valorAux = valor * 1000;
		if (valorAux % 10 >= 5)
			valorAux = valorAux - valorAux % 10 + 10;
		else
			valorAux = valorAux - valorAux % 10;
		return valorAux / 1000.0;
	}

	public static boolean esNumero(char c) {
		return Character.isDigit(c);
	}

	public static boolean esLetra(char c) {
		return Character.isLetter(c);
	}

	public static boolean esCadenaNros(String cadena) {
		boolean resultado = true;
		int i = 0;
		char[] cadenaAux = cadena.toCharArray();
		while ((resultado == true) && (i < cadena.length())) {
			resultado = esNumero(cadenaAux[i]);
			i++;
		}
		return resultado;
	}

	public static boolean esCadenaLetras(String cadena) {
		boolean resultado = true;
		int i = 0;
		char[] cadenaAux = cadena.toCharArray();
		while ((resultado == true) && (i < cadena.length())) {
			resultado = esLetra(cadenaAux[i]);
			i++;
		}
		return resultado;
	}
	
	public static double convertirADouble ( int n ){
		return (( double) n);
		}

}
