<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
	Response.Buffer = TRUE 
    Response.Expires = -1
%>
<!--#INCLUDE VIRTUAL="/certificados/conexion.inc"  -->
<!--#INCLUDE VIRTUAL="/include/funciones.inc" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ecas | Validar certificados</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: .9em;
}
label, input {
	display: block;
	float: left;
	width: 200px;
	margin-bottom: 10px;
}
label {
	width: 150px;
	text-align: right;
	padding-right: 10px;
	margin-top: 2px;
}
br {
	clear: left;
}
.certificado {
	margin: 10px 50px;
}
input {
	width: 200px;
}
.info, .success, .warning, .error, .validation {
    border: 1px solid;
    margin: 10px 100px;
    padding:15px 10px 15px 50px;
    background-repeat: no-repeat;
    background-position: 10px center;
}

.success {
    color: #4F8A10;
    background-color: #DFF2BF;
    background-image:url('success.png');
}
.warning {
    color: #9F6000;
    background-color: #FEEFB3;
    background-image: url('warning.png');
}
.error {
    color: #D8000C;
    background-color: #FFBABA;
    background-image: url('error.png');
}

</style>

<body>
<form action="./validar.asp" method="post" name="frmCertificado" id="frmCertificado">
  <img src="http://www.ecasvirtual.cl/pix/moodlelogo.gif" alt="" name="" />
  <h3>Validar certificados</h3>
<% 
	If Request.Form("btnValidar") <> "" Then
		Set rs = Server.CreateObject("ADODB.RecordSet")
		StrSql = "select rut, fecha, institucion, validez from certificados_generados where codigo_verificacion = '" & Request.Form("codigo_verificacion") & "';"
		rs.Open strSql,Conn
		
		if not rs.EOF then
			fecha_ = DateAdd("d", rs.Fields(3), rs.Fields(1))
			fecha_ = day(fecha_) & "/" &month(fecha_)&  "/" &year(fecha_)
			if (DateDiff("d",DateAdd("d", rs.Fields(3), rs.Fields(1)), Now()) < 0) Then 
				set rstmp = Conn.Execute("INSERT INTO certificados_validados (resultado, codigo_verificacion) VALUES ('success', '"&Request.Form("codigo_verificacion")&"');")
%>
		
        	<div class="success">El código ingresado corresponde a un certificado válido hasta el <%=fecha_%>.<br />
  <a href="http://www.ecasvirtual.cl/certificados/certificado<%Response.Write(Request.Form("codigo_verificacion"))%>.pdf">Haga clic acá para ver el certificado.</a></div>
<%
			Else
				set rstmp = Conn.Execute("INSERT INTO certificados_validados (resultado, codigo_verificacion) VALUES ('warning', '"&Request.Form("codigo_verificacion")&"');")
%>
        	<div class="warning">El código ingresado corresponde a un certiticado vencido el <%=fecha_%>.</div>
        <%
			End If
		Else
			set rstmp = Conn.Execute("INSERT INTO certificados_validados (resultado, codigo_verificacion) VALUES ('error', '"&Request.Form("codigo_verificacion")&"');")
		%>
       <div class="error">El código ingresado no corresponde a ningún certificado existente.</div> 
        <%
		end if
%>
<p align="center"><input type="reset" name="btnCerrar" value="Aceptar" onclick="window.close();" style="float:none; clear:none; display:inline" /> <input type="reset" name="btnVolver" value="Ingresar otro código" onClick="history.go(-1);" style="float:none; clear:none; display:inline;" /></p>
<%
	Else 
%>
  <p>Ingrese el código de verificación del certificado.</p>
  <label for="codigo_verificacion">Código de verificación</label>
  <input name="codigo_verificacion" type="text" maxlength="8" value="<%Response.Write("")%>" /><br />
  <label for="btnValidar">&nbsp;</label>
  <input type="submit" name="btnValidar" value="Aceptar" />
  &nbsp;
  <input type="reset" name="btnCerrar" value="Cancelar" onclick="window.close();" />
<% End If %>
</form>

<p>&nbsp;</p>
</body>
</html>
