<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listado de oradores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>

    <body>

        <jsp:include page="menu.jsp"/>

        <div class="container">
            <div class="text-center fs-3 my-4">Listado de oradores</div>

            <%
                String mensaje = request.getParameter("mensaje");
                if (mensaje != null) {

                    /*Mensaje mostrado por alert*/
                    out.println("<script type='text/javascript'>alert('" + mensaje + "')</script>");
                    /*
                            out.println("<div class='bg-danger text-center p-1 rounded' id='msj'>");
                            out.println(mensaje);
                            out.println("</div>");
                     */
                } else {
                    //TODO: eliminar div del mensaje

                }
            %>			

            <button title="Agregar orador" class="btn btn-primary my-3" data-bs-toggle='modal' data-bs-target='#addModal'><i class="bi bi-person-plus-fill"></i></button>

            <table class="table table-striped text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Email</th>
                        <th scope="col">Etiqueta</th>
                        <th scope="col">Etiqueta2</th>
                        <th scope="col">Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dentro de estas etiquetas podemos programar en java -->
                    <%
                        //conectarnos a la db, traer la tabla usuarios y generar un html para enviar al usuario
                        //traer el archivo/clase conexionDb
                        ConexionDB conex = new ConexionDB();

                        //conecto a la db y devuel un objeto statment que es una instancia de db
                        Statement st = conex.conectar();

                        //le hago la consulta sql, traigo la tabla usuarios
                        String buscar = request.getParameter("buscar");
                        ResultSet rs;

                        if (buscar != null) {
                            rs = st.executeQuery("SELECT * FROM oradores WHERE nombre LIKE '%" + buscar + "%' OR apellido LIKE '%" + buscar + "%';");
                        } else {
                            rs = st.executeQuery("SELECT * FROM oradores");
                        }

                        //ResultSet rs=st.executeQuery("SELECT * FROM oradores");
                        while (rs.next()) {
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
                            out.println(rs.getString("email"));
                            out.println("</td>");

                            out.println("<td>");
                            out.println(rs.getString("etiquetas"));
                            out.println("</td>");
                            
                            out.println("<td>");
                            out.println(rs.getString("etiquetasDos"));
                            out.println("</td>");

                            out.println("<td>");
                            out.println("<a href='#' title='Borrar orador' data-bs-toggle='modal' data-bs-target='#deleteModal' data-bs-whatever='" + rs.getInt("id") + "'><i class='bi bi-trash-fill'></i></a>");
                            out.println("<a href='#' title='Modificar orador' data-bs-toggle='modal' data-bs-target='#updateModal' idUpd='" + rs.getInt("id") + "' nom='" + rs.getString("nombre") + "' ape='" + rs.getString("apellido") + "' email='" + rs.getString("email") + "'><i class='bi bi-pencil-fill'></i></a>");
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Orador</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/addOrador.jsp" method="post">
                            <div class="mb-3 text-center">
                                <input type="text" class="form-control mb-3" id="nomAdd" name="nomAdd" placeholder="Nombre">
                                <input type="text" class="form-control mb-3" id="apeAdd" name="apeAdd" placeholder="Apellido">
                                <input type="text" class="form-control mb-3" id="emailAdd" name="emailAdd" placeholder="Email">
                                <input type="text" class="form-control mb-3" id="dniAdd" name="dniAdd" placeholder="DNI">
                                <input type="text" class="form-control mb-3" id="etiquetasAdd" name="etiquetasAdd" placeholder="Etiquetas">
                                <textarea rows="4" class="form-control mb-3" id="temasAdd" name="temasAdd" placeholder="Escriba una descripción de los temas a tratar"></textarea>
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Orador</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/delOrador.jsp" method="post">
                            <div class="mb-3 text-center">
                                <label for="recipient-name" class="col-form-label">¿Desea eliminar el orador?</label>
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Orador</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../controller/updOrador.jsp" method="post">
                            <div class="mb-3 text-start">
                                <input type="hidden" class="form-control mb-3" id="idUpd" name=idUpd>
                                <span>Nombre:</span>
                                <input type="text" class="form-control mb-3" id="nom" name="nom">
                                <span>Apellido:</span>
                                <input type="text" class="form-control mb-3" id="ape" name="ape">
                                <span>Email:</span>
                                <input type="text" class="form-control mb-3" id="email" name="email">
                                <span>Etiqueta:</span>
                                <input type="text" class="form-control mb-3" id="etiq" name="etiq">
                                <span>Etiqueta2:</span>
                                <input type="text" class="form-control mb-3" id="etiq2" name="etiq2">
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

        <script src="js/listOra.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
