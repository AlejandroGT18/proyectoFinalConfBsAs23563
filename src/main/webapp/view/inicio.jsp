<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Conf Bs As</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-body-secondary">
	<%
		ConexionDB conex=new ConexionDB();
		Statement st=conex.conectar();
		ResultSet rs;
		
		String id=request.getParameter("id");
		String na=new String();
		String email=new String();
		String permisos=new String();
		String foto=new String();
		
		if(id!=null) {
			rs=st.executeQuery("SELECT * FROM usuarios WHERE id="+id);
			rs.next();
			na=rs.getString("nombre") + " "+ rs.getString("apellido");
			email=rs.getString("user");
			permisos=rs.getString("rol");
			foto=rs.getString("fotoPerfil");
		}		
	%>

    
    <header>
		<!-- menu -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand ms-5" href="#">
                    <img src="images/codoacodo.png" alt="Logo CAC" class="animate__animated animate__flipInX w-25">
                    <span>Conf BsAs</span>
                </a>
                <button class="navbar-toggler position-absolute end-0 me-5" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse me-5" id="navbarText">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                        </li>
                    </ul>
                    <span class="navbar-text">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#conferencia">La conferencia</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#oradores">Los oradores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#lugar-fecha">El lugar y la fecha</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#form-oradores">Conviértete en orador</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-success" href="../tickets/comprarTicket.html">Comprar Ticket</a>
                            </li>
                            <li class="">
                            	<!-- Button trigger modal -->
                            	<img alt="Foto de perfil" src="<% out.print(foto); %>" id="img-perfil" class="img-fluid rounded-4 " width="40px" data-bs-toggle="modal" data-bs-target="#modal-foto">
	                        	
	                        	<!-- Modal -->
                                    <div class="modal fade" id="modal-foto" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Ficha del usuario</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="text-center w-100">
                                                        <img src="<% out.print(foto); %>" style='width:100%;height:20rem;' alt="Foto de perfil" id="perfil"
                                                             class="animate__animated animate__zoomIn mb-3">
                                                    </div>
                                                    <p>Nombre y apellido: <% out.print(na); %></p>
                                                    <p>Email: <% out.print(email); %></p>
                                                    <p>Usted es <% out.print(permisos); %></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <a class="btn btn-danger" href="../index.html">Cerrar sesion</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        	
                        	</li>                        	
                        	
                        </ul>
                    </span>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <!-- Carrusel -->
        <section id="conferencia">
            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <!-- <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div> -->
                <div class="carousel-inner">

                    <!-- Primera slide -->
                    <div class="carousel-item active">
                        <img src="images/ba1.jpg" class="d-block w-100" alt="Slide 1">
                        <div class="carousel-caption d-block">
                            <div class="container">
                                <div class="row justify-content-end">
                                    <div class="texto-carrusel col-xs-12 text-s-center col-lg-6 text-lg-end">
                                        <h2>Conf Bs As</h2>
                                        <p>Bs As llega por primera vez a Argentina. Un evento para compartir con nuestra
                                            comunidad el conocimiento y experiencia de los expertos que están creando el
                                            futuro de Internet. Ven a conocer a miembros del evento, a otros estudiantes
                                            de Codo a Codo y los oradores de primer nivel que tenemos para ti. Te
                                            esperamos!
                                        </p>
                                        <div>
                                            <a href="#form-oradores" class="btn btn-outline-light me-2 my-2">Quiero ser orador</a>
                                            <a href="../tickets/comprarTicket.html" class="btn btn-success">Comprar tickets</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Segunda slide -->
                    <div class="carousel-item">
                        <img src="images/ba2.jpg" class="d-block w-100" alt="Slide 2">
                        <div class="carousel-caption d-block">
                            <div class="container">
                                <div class="row justify-content-end">
                                    <div class="texto-carrusel col-xs-12 text-s-center col-lg-6 text-lg-end">
                                        <h2>Conf Bs As</h2>
                                        <p>Bs As llega por primera vez a Argentina. Un evento para compartir con nuestra
                                            comunidad el conocimiento y experiencia de los expertos que están creando el
                                            futuro de Internet. Ven a conocer a miembros del evento, a otros estudiantes
                                            de Codo a Codo y los oradores de primer nivel que tenemos para ti. Te
                                            esperamos!
                                        </p>
                                        <div>
                                            <a href="#form-oradores" class="btn btn-outline-light me-2 my-2">Quiero ser
                                                orador</a>
                                            <a href="tickets/comprarTicket.html" class="btn btn-success">Comprar tickets</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Tercera slide -->
                    <div class="carousel-item">
                        <img src="images/ba3.jpg" class="d-block w-100" alt="Slide 3">
                        <div class="carousel-caption d-block">
                            <div class="container">
                                <div class="row justify-content-end">
                                    <div class="texto-carrusel col-xs-12 text-s-center col-lg-6 text-lg-end">
                                        <h2>Conf Bs As</h2>
                                        <p>Bs As llega por primera vez a Argentina. Un evento para compartir con nuestra
                                            comunidad el conocimiento y experiencia de los expertos que están creando el
                                            futuro de Internet. Ven a conocer a miembros del evento, a otros estudiantes
                                            de Codo a Codo y los oradores de primer nivel que tenemos para ti. Te
                                            esperamos!
                                        </p>
                                        <div>
                                            <a href="#form-oradores" class="btn btn-outline-light me-2 my-2">Quiero ser
                                                orador</a>
                                            <a href="tickets/comprarTicket.html" class="btn btn-success">Comprar tickets</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <!-- Oradores -->
        <section id="oradores" class="d-flex justify-content-center flex-wrap row-gap-3 column-gap-4 mt-3 w-75 mx-auto">

            <div class="col-12 text-center">
                <span class="d-block fs-6">CONOCE A LOS</span>
                <span class="d-block fw-bold fs-3">ORADORES</span>
            </div>

			<!-- 
            <article>
                <div class="sombra card" style="width: 18rem;">
                    <img src="images/steve.jpg" class="card-img-top" alt="Steve Jobs">

                    <div class="card-body">
                        <button type="button" class="btn btn-warning">JavaScript</button>
                        <button type="button" class="btn btn-primary">React</button>

                        <span class="nombre-orador">Steve Jobs</span>
                        <p class="card-text">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora laudantium
                            minus, odit amet dicta sint maiores eos ea sit quas ratione rerum corrupti, iusto doloremque
                            culpa commodi nesciunt aut numquam!</p>
                    </div>
                </div>
            </article>
            <article>
                <div class="sombra card" style="width: 18rem;">
                    <img src="images/bill.jpg" class="card-img-top" alt="Bill Gates">
                    <div class="card-body">
                        <button type="button" class="btn btn-warning">JavaScript</button>
                        <button type="button" class="btn btn-primary">React</button>

                        <span class="nombre-orador">Bill Gates</span>
                        <p class="card-text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laborum eligendi
                            id quae, non a facilis architecto! Sit eum aliquam perspiciatis itaque recusandae est
                            cupiditate sunt sed, laudantium, fugiat, vel reprehenderit?</p>
                    </div>
                </div>
            </article>
            <article>
                <div class="sombra card" style="width: 18rem;">
                    <img src="images/ada.jpeg" class="card-img-top" alt="Ada Lovelace">
                    <div class="card-body">
                        <button type="button" class="btn btn-secondary">Negocios</button>
                        <button type="button" class="btn btn-danger">Startups</button>

                        <span class="nombre-orador">Ada Lovelace</span>
                        <p class="card-text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Molestiae ipsam
                            illo sit doloribus, nemo eveniet vel officia iste ea hic doloremque labore? Quaerat non
                            cumque beatae? Odit magni est recusandae!</p>
                    </div>
                </div>
            </article>
            -->
			
			<%
			rs=st.executeQuery("SELECT * FROM oradores");
		       while(rs.next()) {
		       	out.println("<article");
		       	out.println("<div class='sombra card' style='width: 18rem;height:35rem;'>");
		       	out.println("<img src='"+rs.getString("oradores.fotoPerfil")+"' height='300' class='card-img-top' alt=''>");
		       	out.println("<div class='card-body'>");
		       	if(rs.getString("etiquetas") != null) {
		       		out.println("<button type='button' class='btn btn-danger text-light'>"+rs.getString("etiquetas")+"</button>");	
		       	}
		       	if(rs.getString("etiquetasDos") != null) {
		       		out.println("<button type='button' class='btn btn-primary text-light'>"+rs.getString("etiquetasDos")+"</button>");	
		       	}
		       	out.println("<span class='nombre-orador'>"+rs.getString("oradores.nombre") +" "+ rs.getString("oradores.apellido")+"</span>");
		       	out.println("<p class='card-text'>"+rs.getString("oradores.temas")+"</p>");
		       	out.println("</div>");
		       	out.println("</div>");
		       	out.println("</article>");
		       }
			
			%>
			
            
        </section>

        <!-- Img con info -->
        <section id="lugar-fecha" class="container-fluid mt-5">
            <div class="row">
                <div class="col-lg p-0">
                    <img src="images/honolulu.jpg" alt="Honolulu" class="img-fluid">
                </div>
                <article class="col-lg bg-dark text-white pt-4">
                    <span class="fs-3 fw-bold">Bs As - Octubre</span>
                    <p class="fs-6">Buenos Aires es la provincia y localidad mas grande del estado de Argentina. En los
                        Estados Unidos, Honolulu es la mas sureña de entre las principales ciudades estadounidenses. Aunque el
                        nombre de Honolulu se refiere al área urbana en la costa sureste de la isla de Ohau, la ciudad y
                        el condado de Honolulu han formado una ciudad-condado consolidada que cubre toda la ciudad
                        (aproximadamente 600 km<sup>2</sup> de superficie).
                    </p>
                    <a href="#" class="btn btn-outline-light mb-4">Conocé más</a>

                </article>
            </div>
        </section>

        <!-- Formulario -->
        <section id="form-oradores" class="container mt-3">

            <div class="col-12 text-center">
                <span class="d-block fs-6">CONVIÉRTETE EN UN</span>
                <span class="d-block fw-bold fs-3">ORADOR</span>
                <P>Anótate como orador para dar una <span class="subrayado-punteado">charla ignite</span>. Cuéntanos de
                    qué quieres hablar!</P>
            </div>

            <form action="javascript:alert('Formulario enviado con exito');" method="get">
                <div class="row">
                    <div class="col-md mb-3">
                        <input type="text" name="nombre" id="nombre" placeholder="Nombre" class="form-control" required>
                    </div>
                    <div class="col-md mb-3">
                        <input type="text" name="apellido" id="apellido" placeholder="Apellido" class="form-control" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md mb-3">
                        <textarea name="tema" id="tema" rows="5" class="form-control"
                            placeholder="Sobre qué quieres hablar?" required></textarea>
                        <div class="small text-start mt-2">Recuerda incluir un título para tu charla</div>

                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        <input type="submit" value="Enviar" class="color-manzana btn text-white fw-bold w-100">
                    </div>
                </div>
            </form>
        </section>
    </main>

    <!-- Pie de página -->
    <footer
        class="d-flex flex-column flex-lg-row justify-content-center align-items-center fw-bold column-gap-4 row-gap-3 py-4">
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Preguntas frecuentes</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Contáctanos</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Prensa</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Conferencias</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Términos y condiciones</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Privacidad</a>
        <a class="link-light text-decoration-none" href="javascript:alert('Esta página no se encuentra disponible');">Estudiantes</a>
        </div>

    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        
    <script src="js/inicio.js"></script>
</body>

</html>
