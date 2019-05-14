<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    // -- variables para la consulta sql
    Connection cnx = null;
    Statement sta = null;

    //ResultSet rs = null;
    int idc = Integer.parseInt(request.getParameter("cont"));

    String query = "";

    // -- variables de rproveedores
    // -- variables de nuevo producto 
    String prod = "";
    String marc = "";
    String desc = "";
    String fech = "";
    String idedit = "";

    // -- variables de ingreso
    // -- variables de egreso
    out.println("Fuera de if");

    if (idc == 0) {
        int control = Integer.parseInt(request.getParameter("control"));
        if (control == 0) {
            // -- Insert query
            out.println("dentro de if control");

            prod = request.getParameter("prod");
            marc = request.getParameter("marc");
            desc = request.getParameter("desc");
            fech = request.getParameter("fech");

            query = "INSERT INTO prodcts values (null, '" + prod + "', 'xxx', '0.00', '" + marc + "', '0.00', '" + desc + "', '0.00', '0.00', '" + fech + "', 'pendiente')";

        } else {
            if (control == 1) {
                // -- update query
                prod = request.getParameter("prod");
                marc = request.getParameter("marc");
                desc = request.getParameter("desc");
                fech = request.getParameter("fech");

                idedit = request.getParameter("idedit");

                query = "UPDATE `prodcts` SET `prod` = '" + prod + "', `marc` = '" + marc + "', `description` = '" + desc + "', `fech_prod` = '" + fech + "' WHERE `prodcts`.`id_prod` = '" + idedit + "'";
            } else {
                if (control == 2) {
                    idedit = request.getParameter("idedit");

                    query = "delete from prodcts where id_prod = '" + idedit + "'";
                } else {
                    out.println("Error de control procedente de productos");
                }
            }
        }
        // -- Terminan controlador de datos provenientos de productos.jsp
    } else {
        if (idc == 1) {

            // -- inicia controlador de datos provenientes de ingresos
            String proveedor = request.getParameter("proveedor");
            String nfactura = request.getParameter("nfactura");
            String feching = request.getParameter("feching");
            String pago = request.getParameter("pago");

            String[] prods1 = request.getParameterValues("prod");
            String[] cant = request.getParameterValues("cant");
            String[] prec = request.getParameterValues("pcompra");

            try {

                Class.forName("com.mysql.jdbc.Driver");
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");
                sta = cnx.createStatement();

                String querytwo = "INSERT INTO ingre VALUES (NULL, '" + nfactura + "', '" + proveedor + "', '" + feching + "', '" + pago + "')";

                int qry = sta.executeUpdate(querytwo);

                int i = 0;
                while (i < prods1.length) {
                    String querythre = "INSERT INTO ingre_det VALUES (NULL, '" + prods1[i] + "', '" + cant[i] + "', '" + prec[i] + "', '" + nfactura + "')";

                    int qr = sta.executeUpdate(querythre);

                    // -- Cierra conexiones
                    // -- /consulta
                    i++;
                }

                // -- consulta
            } catch (Exception e) {
                out.println(e + " Error try catch");
            }

            sta.close();
            cnx.close();

            String redirectURL = "../ingresar.jsp";
            response.sendRedirect(redirectURL);

        } else {
            if (idc == 2) {

                // -- inicia controlador de datos provenientes de salidas
                String encargado = request.getParameter("encargado");
                String fechsalida = request.getParameter("fechsalida");
                String razonsalida = request.getParameter("razonsalida");
                String facturar = request.getParameter("facturar");
                if (facturar == null) {
                    facturar = Integer.toString(0);
                }

                String[] prods1 = request.getParameterValues("prod");
                String[] cant = request.getParameterValues("cant");
                //String[] prec = request.getParameterValues("pcompra");

                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");
                    sta = cnx.createStatement();

                    String querytwo = "INSERT INTO salid VALUES (NULL, '" + razonsalida + "', '" + fechsalida + "', '" + encargado + "', '" + facturar + "')";

                    int qry = sta.executeUpdate(querytwo);

                    int i = 0;
                    while (i < prods1.length) {
                        String querythre = "INSERT INTO salid_det VALUES (NULL, '" + prods1[i] + "', '" + cant[i] + "', (SELECT id_salid FROM salid ORDER BY id_salid DESC LIMIT 1))";

                        int qr = sta.executeUpdate(querythre);

                        // -- Cierra conexiones
                        // -- /consulta
                        i++;
                    }

                    // -- consulta
                } catch (Exception e) {
                    out.println(e + " Error try catch");
                }

                sta.close();
                cnx.close();

                String redirectURL = "../salidas.jsp";
                response.sendRedirect(redirectURL);

                // -- /Termina controlador de salidas
            } else {
                if (idc == 3) {
                    // -- inicia controlador de proveedores
                    int control = Integer.parseInt(request.getParameter("control"));

                    if (control == 0) {

                        //String idprov = request.getParameter("idprov");
                        String prov = request.getParameter("prov");
                        String telp = request.getParameter("telp");
                        String dirp = request.getParameter("dirp");

                        query = "INSERT INTO provs VALUES (NULL, '" + prov + "', '" + telp + "', '" + dirp + "')";

                    } else {
                        if (control == 1) {

                            String idprov = request.getParameter("idprov");
                            String prov = request.getParameter("prov");
                            String telp = request.getParameter("telp");
                            String dirp = request.getParameter("dirp");

                            query = "UPDATE provs SET nom_prov = '" + prov + "', tel_prov = '" + telp + "', dir_prov = '" + dirp + "' WHERE provs.id_prov = " + idprov + "";
                        } else {
                            if (control == 2) {
                                String idprov = request.getParameter("idprov");

                                query = "delete from provs where id_prov = '" + idprov + "'";

                            } else {
                                out.println("Error proveniente del idc de proveedores");
                            }
                        }
                    }
                }
            }
        }
    }

    // -- creacion de consulta y ejecucion de Consulta para verificacion de usuario y password
    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://localhost/sivi_db?user=root&password=");

        sta = cnx.createStatement();
        int qry = sta.executeUpdate(query);

        // -- Cierra conexiones
        sta.close();

        cnx.close();

        if (idc == 0) {

            String redirectURL = "../productos.jsp";
            response.sendRedirect(redirectURL);
        }else{
            if(idc == 3){
                String redirectURL = "../provs.jsp";
            response.sendRedirect(redirectURL);
            }
        }
    } catch (Exception e) {
        out.println(e + " Error try catch");
    }


%>