<!--#INCLUDE file="top.asp" -->
<!--#INCLUDE file="top1.asp" -->
<!--#INCLUDE file="f-izq.asp" -->
<!--#INCLUDE file="SubMenu.asp" -->
<!--#INCLUDE FILE="include/conexion.inc" -->
<!--#INCLUDE FILE="include/periodos.inc" -->
<!--#INCLUDE FILE="include/funciones.inc" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<style type="text/css">
<!--
.cssBloque {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.cssPregunta {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; }
-->
</style>
<link rel="stylesheet" href="css/tablas.css" type="text/css">

<body>
<table border="0" cellpadding="0" cellspacing="0"  align="center">
  <tr>
	<td>
		<table width="200" border="0" cellpadding="0" cellspacing="0" align="center">
		  <tr>
			<td colspan="2" valign="top" align="right"><% CargarTop()%><% 
				if trim(Session("NomAlum"))="" then
					CargarMenu() 
				else
					CargarMenu2() 
				end if
			    %></td>
			<td valign="top">
			<% CargarTop1()%><% SubMenu()%>
				<table width="100%" border="0" cellpadding="5" cellspacing="3">
				  <tr class="cssBloque">
					<td align="center" bgcolor="#E7E4BC"><br />
					  <br />
					NO HAY ENCUESTAS VIGENTES <br />
					<br />
					<br /></td>
				  </tr>
				
				  <tr class="cssPregunta">
					<td align="center" valign="middle" bgcolor="#F4F3E1"><form id="form1" name="form1" method="post" action="menu_encuestas.asp">
					  <input type="submit" name="Submit" value="ir a p&aacute;gina principal..." />
					</form>    </td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>				
</body>
</html>

