<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="datos.Tarjeta" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SUBE - Apoyar tarjeta</title>
<script src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(window).ready(function(){
		$(document).on('change','.transporte',function(){
			var seleccionado = $(this).val();
			
			$.ajax({
				method:"POST"
					url:"MostrarLineaTransporte",
					data: {tipo: seleccionado},
					async: false
			}).done(function(data){
				$("#responsecliente").html(data);
				$('.encabezados').append(data[0]);
				$('.cuerpo').(data[1]);
			});//fin ajax
			
		});//fin change
	});//fin ready
</script>
</head>
<body>
	<% Tarjeta tarjeta = (Tarjeta) request.getAttribute("tarjeta"); %>
	<form method="POST" action=" /Sube/ApoyarTarjeta ">
		Tarjeta Nro.: <%= tarjeta.getNroTarjeta() %><BR> <BR>
		<table border="0">
			<tr class="encabezados">
				<td>Transporte</td>
			</tr>
			<tr>
				<td>
					<select name="transporte" class="transporte">
						<option selected>Colectivo</option>
						<option>Subte</option>
						<option>Tren</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>