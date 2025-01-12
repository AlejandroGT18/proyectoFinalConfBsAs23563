<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Listado de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  </head>
  
  <body>
  	<jsp:include page="menu.jsp"/>
	<div class="container">
		<div class="text-center fs-3 my-4">Listado de usuarios</div>
		
		
		<button title="Agregar usuario" class="btn btn-primary my-3" data-bs-toggle='modal' data-bs-target='#addModal'><i class="bi bi-person-plus-fill"></i></button>
		
		
		
		<table class="table table-striped text-center">
		  <thead class="table-dark">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Nombre</th>
		      <th scope="col">Apellido</th>
		      <th scope="col">Usuario</th>
		      <th scope="col">Contrase�a</th>
		      <th scope="col">Operaciones</th>
		    </tr>
		  </thead>
		  <tbody>
			<!-- Dentro de estas etiquetas podemos programar en java -->
			<% 
			//conectarnos a la db, traer la tabla usuarios y generar un html para enviar al usuario
			
			//traer el archivo/clase conexionDb
			ConexionDB conex=new ConexionDB();
			
			//conecto a la db y devuel un objeto statment que es una instancia de db
			Statement st=conex.conectar();
			
			//le hago la consulta sql, traigo la tabla usuarios
			ResultSet rs=st.executeQuery("SELECT * FROM usuarios");
			
			while(rs.next()) {
				out.println("<tr>");
				
				out.println("<td>");
				out.println(rs.getInt("id"));
				out.println("</td>");

				out.println("<td>");
				out.println(rs.getString("nombre"));
				out.println("</td>");
				
				out.println("<td>");
				out.println(rs.getString("apellido"));
				out.println("</td>");
				
				out.println("<td>");
				out.println(rs.getString("user"));
				out.println("</td>");
				
				out.println("<td>");
				out.println(rs.getString("pass"));
				out.println("</td>");
				
				out.println("<td>");
                out.println("<a href='#' title='Borrar orador' data-bs-toggle='modal' data-bs-target='#deleteModal' data-bs-whatever='" + rs.getInt("id") + "'><i class='bi bi-trash-fill'></i></a>");
                out.println("<a href='#' title='Modificar orador' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='" + rs.getInt("id") + "' nom ='" + rs.getString("nombre") + "' ape='" + rs.getString("apellido") + "' usu='" + rs.getString("user") + "'cont'"  rs.getString("pass") "'><i class='bi bi-pencil-fill'></i></a>");
                out.println("</td>");

				out.println("</tr>");
				
			}
			
			%>		
		   
		  </tbody>
		</table>
		

		
	</div>  
	  
	
	   <!-- Modal agregar -->
        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Usuario</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/addUsuario.jsp" method="post">
                            <div class="mb-3 text-center">
                                <input type="text" class="form-control mb-3" id="nomAdd" name="nomAdd" placeholder="Nombre">
                                <input type="text" class="form-control mb-3" id="apeAdd" name="apeAdd" placeholder="Apellido"> 
                                <input type="text" class="form-control mb-3" id="dniAdd" name="dniAdd" placeholder="DNI">
                                <input type="text" class="form-control mb-3" id="rolAdd" name="rolAdd" placeholder="Rol">
           						<input type="text" class="form-control mb-3" id="usuAdd" name="usuAdd" placeholder="Usuario">
                                <input class="form-control" type="password" name="password" id="password">                      
                 			 </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Agregar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!-- Modal borrar -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Usuario</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/delUsuario.jsp" method="post">
                            <div class="mb-3 text-center">
                                <label for="recipient-name" class="col-form-label">�Desea eliminar el orador?</label>
                                <input type="hidden" class="form-control" id="recipient-name" name="id">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Eliminar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal modificar -->
        <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Usuario</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/updUsuario.jsp" method="post">
                            <div class="mb-3 text-start">
                                <input type="hidden" class="form-control mb-3" id="idUpd" name=idUpd>
                                <span>Nombre:</span>
                                <input type="text" class="form-control mb-3" id="nom" name="nom">
                                <span>Apellido:</span>
                                <input type="text" class="form-control mb-3" id="ape" name="ape">
                                <span>Usuario:</span>
                                <input type="text" class="form-control mb-3" id="user" name="user">
                                <span>Contrase�a:</span>
                                <input type="text" class="form-control mb-3" id="pass" name="pass">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
      
        
        
        
        
        <script src="js/listUsu.js"></script>
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>