<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<% 
	String idUpd=request.getParameter("idUpd");
	String nom=request.getParameter("nom");
	String ape=request.getParameter("ape");
	String email=request.getParameter("email");
	String etiqueta=request.getParameter("etiq");
	String etiqueta2=request.getParameter("etiq2");
	
	ConexionDB conex=new ConexionDB();
	Statement st=conex.conectar();
	try{
		Integer updateOk=st.executeUpdate("UPDATE oradores SET nombre='"+nom+"', apellido='"+ape+"', email='"+email+"', etiquetas='"+etiqueta+"', etiquetasDos='"+etiqueta2+"' WHERE id="+idUpd);
		
		if(updateOk==1) {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20orador%20se%20modificó%20exitosamente");
		} else {
			response.sendRedirect("../view/listOra.jsp?mensaje=El%20orador%20no%20se%20pudo%20modificar");
		}

	}
	catch(Exception e){
		response.sendRedirect("../view/listOra.jsp?mensaje=El%20orador%20no%20se%20pudo%20modificar");
		e.printStackTrace();

	}

%>
