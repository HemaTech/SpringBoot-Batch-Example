<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<%-- <head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><tiles:getAsString name="title" /></title>
	<link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head> --%>
 </head>
<body>
<table>
<tr>
<td>
		<header id="header" >
			<tiles:insertAttribute name="header" />
		</header>
	</td>
	</tr>
	<tr>

</tr>	
<tr>
<td>	
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>
	</td>
	</tr>
	<tr>
<td>	
		<footer id="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
		</td>
		</tr>
		</table>
</body>
</html>