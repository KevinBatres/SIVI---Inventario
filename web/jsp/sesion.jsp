<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%
    // -- Codigo para creacion de variables
    String mail = request.getParameter("mail");
    String pass = request.getParameter("pass");
    String data = pass;
    
    if(mail.isEmpty()){
        String redirectURL = "../index.jsp";
            response.sendRedirect(redirectURL);
    } else {

    // -- cifrado de contraseña para su validacion
    String passcrypted = DigestUtils.sha256Hex(data);

    // -- declaracion de sesion
    HttpSession sesion = request.getSession();

    // -- variables para la consulta sql
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;

    // -- creacion de consulta y ejecucion de Consulta para verificacion de usuario y password
    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

        sta = cnx.createStatement();
        rs = sta.executeQuery("SELECT * FROM usr WHERE us= '" + mail + "' AND pss = '" + passcrypted + "'");

        // -- obtencion de valores
        if (rs.next() && rs.getString(2) != null && sesion.getAttribute("user") == null) {

            // -- asignacion de session
            sesion.setAttribute("idUser", rs.getString(1));
            sesion.setAttribute("user", rs.getString(2));
            //sesion.setAttribute("passUser", rs.getString(3));
            sesion.setAttribute("userType", rs.getString(4));

            // -- Redireccion a menu luego de verificar y crear sesion
            String redirectURL = "../menu.jsp";
            response.sendRedirect(redirectURL);

            out.println("Si Existe " + rs.getString(1));

        } else {
            
            String redirectURL = "../index.jsp";
            response.sendRedirect(redirectURL);
        }

        // -- Cierra conexiones
        sta.close();
        rs.close();
        cnx.close();

    } catch (Exception e) {
        out.println(e + " Error try catch");
    }
    }

%> 
