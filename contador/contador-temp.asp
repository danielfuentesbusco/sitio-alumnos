<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#INCLUDE FILE="conexion.inc" -->
<%

	Response.End()
	Set Conn = Nothing
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.ConnectionTimeout = 100
	'ConnectStr = "PROVIDER=SQLOLEDB;Data Source="&cStr(Application("Servidor"))&";Initial Catalog="&cStr(Application("Base_new"))
	
	ConnectStr = "PROVIDER=SQLOLEDB;Data Source="&cStr(Application("Servidor"))&";Initial Catalog=umasnet; UID=sa; PWD=reflex"
	Conn.Open ConnectStr
	
%>
<% Dim var1, var2, var3, NueDiurnos_0, NueDiurnos_1, NueDiurnos_2, NueDiurnos_3, AntDiurnos_0, AntDiurnos_1, AntDiurnos_2, AntDiurnos_3, NueVesp_0, NueVesp_1, NueVesp_2, NueVesp_3, AntVesp_0 %> 
<% Dim AntVesp_1, AntVesp_2, AntVesp_3, NueTot_0, NueTot_1, NueTot_2, NueTot_3, AntTot_0, AntTot_1, AntTot_2, AntTot_3 %>
<html>
<head>
<title>::Contador::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css"></style></head>

<body>
<table border="0">
  <tr bgcolor="#000066"> 
    <td width="65"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="contador.asp"><font color="#FFFFFF">hoy</font></a></font></div></td>
    <td width="65"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="contadorayer.asp"><font color="#FFFFFF"> 
        ayer</font></a></font></div></td>
    <td width="65"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="TomaRamo.asp"><font color="#FFFFFF"> 
        T.Ramo</font></a></font></div></td>
    <td width="65"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="retencion.asp"><font color="#FFFFFF"> 
        Retenci&oacute;n </font></a></font></div></td>
    <td width="65"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="contadorlargo.asp"><font color="#FFFFFF">Largo</font></a></font></div></td>
    <td width="65"><div align="center"></div></td>
    <td width="65"><div align="center"></div></td>
  </tr>
</table>
<br> 
<font size="2" face="Verdana, Arial, Helvetica, sans-serif">
<table width="541" border="0">
  <tr> 
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Contador 
      Matrícula</font></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><div align="center"></div></td>
    <td><div align="center"></div></td>
    <td><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><strong></strong></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2018</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2017</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2016</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2015</font></div></td>
    <td width="61"><div align="center"><font color="#333333" size="1">v<font face="Verdana, Arial, Helvetica, sans-serif">ar%</font></font></div></td>
    <td width="44"><div align="center"><font color="#333333" size="1">Prom3</font></div></td>
    <td width="52"><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><strong><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nuevos</font></strong></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
<%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018 ",Conn
if rst.recordcount > 0 then
   NueTot_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot+NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueTot_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   var2 = 0
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot+NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueTot_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot+NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueTot_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="61"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(NueTot_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueTot_0 / NueTot_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td width="44"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(NueTot_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueTot_1 + NueTot_2 + NueTot_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td width="52"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		If NueTot_1 + NueTot_2 + NueTot_3 > 0 Then
         Response.write(FormatNumber( (NueTot_0/((NueTot_1 + NueTot_2 + NueTot_3)/3)-1)*100,1))
		Else
			Response.write("0")
		End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018 and jornada='D'",Conn
if rst.recordcount > 0 then
   NueDiurnos_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueDiurnos_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha= CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueDiurnos_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write ".s."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueDiurnos_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="61"><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(NueDiurnos_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueDiurnos_0 / NueDiurnos_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td width="44"><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(NueDiurnos_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueDiurnos_1 + NueDiurnos_2 + NueDiurnos_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td width="52"><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		If NueDiurnos_1 + NueDiurnos_2 + NueDiurnos_3 > 0 Then
         Response.write(FormatNumber( (NueDiurnos_0/((NueDiurnos_1 + NueDiurnos_2 + NueDiurnos_3)/3)-1)*100,1))
		 Else
		 Response.Write("0")
		 End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018 and jornada='V'",Conn
if rst.recordcount > 0 then
   NueVesp_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueVesp_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueVesp_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#000000" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   NueVesp_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(NueVesp_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueVesp_0 / NueVesp_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(NueDiurnos_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((NueVesp_1 + NueVesp_2 + NueVesp_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
	  If NueVesp_1 + NueVesp_2 + NueVesp_3 > 0 Then
         Response.write(FormatNumber( (NueVesp_0/((NueVesp_1 + NueVesp_2 + NueVesp_3)/3)-1)*100,1))
		 Else 
		 Response.Write("0")
		 End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Antiguos</strong></font></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018",Conn
if rst.recordcount > 0 then
   AntTot_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot+AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntTot_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot+AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntTot_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot+AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntTot_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(AntTot_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntTot_0 / AntTot_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(AntTot_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntTot_1 + AntTot_2 + AntTot_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
	  If AntTot_1 + AntTot_2 + AntTot_3  > 0 Then
         Response.write(FormatNumber( (AntTot_0/((AntTot_1 + AntTot_2 + AntTot_3)/3)-1)*100,1))
		 Else 
		 Response.Write("0")
		 End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018 and jornada='D'",Conn
if rst.recordcount > 0 then
   AntDiurnos_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntDiurnos_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "no Enc"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntDiurnos_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntDiurnos_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(AntDiurnos_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntDiurnos_0 / AntDiurnos_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(AntDiurnos_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntDiurnos_1 + AntDiurnos_2 + AntDiurnos_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
	  If AntDiurnos_1 + AntDiurnos_2 + AntDiurnos_3 > 0 Then
         Response.write(FormatNumber( (AntDiurnos_0/((AntDiurnos_1 + AntDiurnos_2 + AntDiurnos_3)/3)-1)*100,1))
		 Else 
		 Response.Write("0")
		 End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018 and jornada='V'",Conn
if rst.recordcount > 0 then
   AntVesp_0 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntVesp_1 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntVesp_2 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_tot as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   AntVesp_3 = CInt(rst("valor"))
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% 
		if(AntVesp_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntVesp_0 / AntVesp_1) - 1)*100, 2))
		end if
	%>
      %</font></div></td>
    <td><div align="center"><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(AntVesp_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntVesp_1 + AntVesp_2 + AntVesp_3))/3, 1))
		end if
	%>
    </font></div></td>
    <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
	  If AntVesp_1 + AntVesp_2 + AntVesp_3 > 0 Then
         Response.write(FormatNumber( (AntVesp_0/((AntVesp_1 + AntVesp_2 + AntVesp_3)/3)-1)*100,1))
		 Else
		 Response.Write("0")
		 End If
	  %> %
    </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b style='mso-bidi-font-weight:normal'>Total 
      Matrícula :</b></font></td>
    <td width="50"><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%

   response.write (AntVesp_0+AntDiurnos_0+NueDiurnos_0+NueVesp_0)

%>
        </font></strong></div></td>
    <td width="50"><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%

   response.write (AntVesp_1+AntDiurnos_1+NueDiurnos_1+NueVesp_1)

%>
        </font></strong></div></td>
    <td width="50"><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%

   response.write (AntVesp_2+AntDiurnos_2+NueDiurnos_2+NueVesp_2)

%>
        </font></strong></div></td>
    <td width="50"><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%

   response.write (AntVesp_3+AntDiurnos_3+NueDiurnos_3+NueVesp_3)

%>
        </font></strong></div></td>
    <td><div align="center"><strong><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% dim var01, var02
		var01 = CInt((AntVesp_0+AntDiurnos_0+NueDiurnos_0+NueVesp_0))
		var02 = CInt((AntVesp_1+AntDiurnos_1+NueDiurnos_1+NueVesp_1))
		if(var02 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((var01 / var02) - 1)*100, 2))
		end if
	%>
      %</font></strong></div></td>
    <td><div align="center"><strong><font color="#333333" size="1" face="Verdana, Arial, Helvetica, sans-serif">
      <% 
		if(AntTot_1 = 0) then
			response.write "s.i."
		else
		   Response.write(FormatNumber(((AntVesp_1+AntDiurnos_1+NueDiurnos_1+NueVesp_1)+(AntVesp_2+AntDiurnos_2+NueDiurnos_2+NueVesp_2)+(AntVesp_3+AntDiurnos_3+NueDiurnos_3+NueVesp_3))/3, 1))
		end if
	%>
    </font></strong></div></td>
    <td><div align="center"><strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
    </font></strong></div></td>
  </tr>
</table>
</font> </p> 
<table border="0">
  <tr> 
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Contador 
      Diario</font></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><strong></strong></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2017</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2016</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2015</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2014</font></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td width="150"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nuevos</strong></font></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat =1 and ano =2018 and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"><font color="#0033FF"></font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018 and jornada='D' and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "no Enc"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha= CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "JLAZ"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018 and jornada='V' and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select NueDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Antiguos</strong></font></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018 and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"><font color="#0033FF"></font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018 and jornada='D' and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "no Enc"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "no Enc"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018 and jornada='V' and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></div></td>
    <td width="49"><div align="center"></div></td>
  </tr>
  <tr> 
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b style='mso-bidi-font-weight:normal'>Total 
      Matrícula :</b></font></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b style='mso-bidi-font-weight:normal'> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and fec_mat=CONVERT(VARCHAR(11), GETDATE())",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </b></font></div></td>
    <td><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select Total_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd,- 366, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></strong></div></td>
    <td><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia+NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 730, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></strong></div></td>
    <td><div align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia+NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1094, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></strong></div></td>
    <td width="49"><div align="center"></div></td>
  </tr>
  <tr> 
    <td width="150"><font color="#666666" size="1" face="Verdana, Arial, Helvetica, sans-serif">Ayer</font></td>
    <td><div align="center"><font color="#666666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b style='mso-bidi-font-weight:normal'> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and fec_mat=CONVERT(VARCHAR(11), DATEADD(dd, - 1, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </b></font></div></td>
    <td><div align="center"><font color="#666666" size="1"><strong><font face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select Total_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 365, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></strong></font></div></td>
    <td><div align="center"><font color="#666666" size="1"><strong><font face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia+NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 729, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "0"
end if

set rst=nothing

%>
        </font></strong></font></div></td>
    <td><div align="center"><font color="#666666" size="1"><strong><font face="Verdana, Arial, Helvetica, sans-serif"> 
        <%
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select AntDiurnos_dia+AntVesp_dia+NueDiurnos_dia+NueVesp_dia as valor from rc_contador WITH (NOLOCK) where fecha=CONVERT(VARCHAR(11), DATEADD(dd, - 1093, GETDATE()))",Conn
if rst.recordcount > 0 then
   response.write rst("valor")
else
   response.write "s.i."
end if

set rst=nothing

%>
        </font></strong></font></div></td>
    <td width="49"><div align="center"><font size="1"></font></div></td>
  </tr>
</table>
<br>
<table border="0">
  <tr> 
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> A&ntilde;o 
      Anterior</font></strong></td>
    <td width="60">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><strong></strong></td>
    <td width="60"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2016</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2015</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2014</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2013</font></div></td>
    <td width="60"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" >Reten.</font></div></td>
  </tr>
  <tr> 
    <td width="150"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nuevos</strong></font></td>
    <td width="60"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((nuetot_0 / 414))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">414</font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">441</font></div></td>
    <td width="50"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">500</font></div></td>
    <td width="60"><div align="center"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif">ECAS 
        </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((nuediurnos_0 / 204))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">204</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">254</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">317</font></div></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><font color="#000000"></font></font></font> 
        </font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano =2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((nuevesp_0 / 210))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">210</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">187</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">183</font></div></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        </font><font color="#000000"></font></div></td>
  </tr>
  <tr> 
    <td width="150"><font color="#0033FF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Antiguos</strong></font></td>
    <td width="60"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((anttot_0 / 1215))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font></div></td>
    <td width="50"><div align="center"><font size="2" color="#0033FF" face="Verdana, Arial, Helvetica, sans-serif">1.215</font></div></td>
    <td width="50"><div align="center"><font size="2" color="#0033FF" face="Verdana, Arial, Helvetica, sans-serif">1.212</font></div></td>
    <td width="50"><div align="center"><font size="2" color="#0033FF" face="Verdana, Arial, Helvetica, sans-serif">1.112</font></div></td>
    <td width="60"><div align="center"><font color="#0033FF" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2016 and estacad='VIGENTE' and periodo_mat = 1 and ano =2016",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((anttot_0 / (1215+414-100)))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Diurnos</font></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((antdiurnos_0 / 536))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">536</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">490</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">383</font></div></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2016 and estacad='VIGENTE' and periodo_mat = 1 and ano =2016",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((antdiurnos_0 / (536+204-50)))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
  </tr>
  <tr> 
    <td width="150"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Vespertinos</font></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1 and ano <2018",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((antvesp_0 / 679))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">679</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">722</font></div></td>
    <td width="50"><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">729</font></div></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2016 and estacad='VIGENTE' and periodo_mat = 1 and ano =2016",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber(((antvesp_0 / (679+210-50)))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font></div></td>
  </tr>
  <tr> 
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b style='mso-bidi-font-weight:normal'>Total 
      Matrícula :</b></font></td>
    <td width="60"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
        <% 
set rst = createobject("adodb.recordset")
rst.cursortype = 1

rst.open "select count(codcli) as valor from mt_alumno WITH (NOLOCK) where ano_mat=2018 and estacad='VIGENTE' and periodo_mat = 1",Conn
if rst.recordcount > 0 then
   Response.write(FormatNumber((((anttot_0+nuetot_0) / 1629))*100, 2))
else
   var1 = 0
   response.write "0"
end if

set rst=nothing

%>
        % </font><font color="#000000"></font><font color="#000000"></font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.629</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.653</font></div></td>
    <td><div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.612</font></div></td>
    <td width="60"> <div align="center"></div></td>
  </tr>
</table>
</body>
</html>
<!--#INCLUDE file="desconexion.inc" -->

