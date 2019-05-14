<%@page import="java.sql.ResultSet"%>
<%@page import="codes.selects"%>
<%HttpSession sesion = request.getSession();

// -- verificacion se sesion
    if (sesion.getAttribute("user") != null) {
        ResultSet rs = null;

        String idet = "";
        String enca = "";
        String fech = "";
        String desc = "";
        String fact = "";

        int controlsalid = Integer.parseInt(request.getParameter("controlsalid"));

// -- declaracion de metodo - objeto
        selects select = new selects();

        if (controlsalid == 1) {
            idet = request.getParameter("idet");

            enca = request.getParameter("enca");
            fech = request.getParameter("fech");
            desc = request.getParameter("desc");
            fact = request.getParameter("fact");

            rs = select.getSaliDet(idet);
        } else {

// -- obtiene el resultado de la consulta
            rs = select.getRs();
        }


%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>SIVI - Front</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">

        <script src="assets/js/jquery.min.js"></script>
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/filtrado.js"></script>

        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="assets/css/Bootstrap-Tags-Input.css">
        <link rel="stylesheet" href="assets/css/Data-Table-1.css">
        <link rel="stylesheet" href="assets/css/Data-Table.css">
        <link rel="stylesheet" href="assets/css/Dynamic-Table.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/MUSA_no-more-tables-1.css">
        <link rel="stylesheet" href="assets/css/MUSA_no-more-tables.css">
        <link rel="stylesheet" href="assets/css/MUSA_panel-table-1.css">
        <link rel="stylesheet" href="assets/css/MUSA_panel-table.css">
        <link rel="stylesheet" href="assets/css/PHP-Contact-Form-dark-1.css">
        <link rel="stylesheet" href="assets/css/PHP-Contact-Form-dark.css">
        <link rel="stylesheet" href="assets/css/Pretty-Search-Form.css">
        <link rel="stylesheet" href="assets/css/Pretty-Table-1.css">
        <link rel="stylesheet" href="assets/css/Pretty-Table-2.css">
        <link rel="stylesheet" href="assets/css/Pretty-Table-3.css">
        <link rel="stylesheet" href="assets/css/Pretty-Table.css">
        <link rel="stylesheet" href="assets/css/Responsive-Form-1.css">
        <link rel="stylesheet" href="assets/css/Responsive-Form.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/Table-With-Search-1.css">
        <link rel="stylesheet" href="assets/css/Table-With-Search.css">

        <%if (controlsalid != 1) { %>
        <script>
            $(document).ready(function () {
                $('#btn_add').click(function () {
                    agregar();

                });
            });
            var cont = 0;
            function agregar() {
                cont++;
                var fila = '<tr><td><input class="form-control" name="id" type="number"></td><td><select id="controlBuscador" class="form-control" name="prod"> "<%while (rs.next()) {%>"<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option> "<%}%>"</select></td><td><input class="form-control" name="cant" type="number" min="1" onkeyup="this.value=Numeros(this.value)"></td></tr>';
                $('#tablaform').append(fila);

            }

            $(document).ready(function () {
                $('#btn_add').click(function () {
                    $('#controlBuscador').select2();
                });
            });

        </script>
        <% } %>

    </head>

    <body>
        <div class="bg-dark rounded shadow d-flex flex-row align-items-xl-center" style="background-color: rgb(255,255,255);width: 98%;height: 108%;margin: auto;margin-top: 30px;margin-left: 17px;padding: 3px;padding-top: 0px;">
            <div style="height: 94%;background-color: rgba(255,255,255,0);margin-top: 0px;">
                <form style="height: 94%;" name="formtable" method="POST" action="jsp/qprod.jsp">

                    <input name="cont" type="hidden" value="2">

                    <div class="table-responsive table-bordered text-left" style="width: 97%;height: 87%;margin-top: 58px;margin-left: 18px;margin-bottom: 0px;background-color: rgb(255,255,255);">
                        <table id="tablaform" class="table table-striped table-bordered table-hover">
                            <thead class="text-center">
                                <tr>
                                    <th style="width: 10%;">Id</th>
                                    <th>Producto</th>
                                    <th style="width: 25%;">Cantidad</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (controlsalid == 1) {
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                </tr>

                                <% }
                                    } %>
                            </tbody>
                            <tfoot>
                                <tr></tr>
                            </tfoot>
                        </table>
                    </div>
                    <%if (controlsalid != 1) { %>
                    <button type="button" id="btn_add"  class="btn btn-primary btn-sm text-center border rounded" style="width: auto;height: auto;">Agregar</button>
                    <% }%>


            </div>
            <div class="text-break text-center d-inline-flex d-xl-flex flex-column align-items-xl-center" style="width: 18%;height: 82%;margin-top: -7px;margin-left: 22px;background-color: rgba(255,255,255,0);">
                <input class="border rounded form-control-lg" type="text" name="encargado" value="<%if (controlsalid == 1) {
                        out.println(enca);
                    }%>" placeholder="Encargado" style="width: auto;height: auto;" <%if (controlsalid == 1) {
                        out.println("readonly");
                    }%> onkeyup="this.value = NumText(this.value)">
                <input class="border rounded form-control-lg d-flex flex-row justify-content-xl-center align-items-xl-center" name="fechsalida" type="date" value="<%=fech%>" required="" style="width: auto;height: auto;margin-top: 18%;padding: 29px;" <%if (controlsalid == 1) {
                        out.println("readonly");
                    } %>>
                <textarea class="form-control-lg" placeholder="Razón" name="razonsalida" style="margin-top: 60px;width: 78%;height: 26%;" <%if (controlsalid == 1) {
                        out.println("readonly");
                    } %> onkeyup="this.value = NumText(this.value)"><%if (controlsalid == 1) {
                        out.println(desc);
                    }%></textarea>
                <label for="facturar" style="font-size: 27px;color: rgb(255,255,255);margin-top: 31px;">facturación</label> 
                <input type="checkbox" name="facturar" value="1" <%if (controlsalid == 1) {
                        if (fact.equals("1")) {
                            out.println("checked");
                        }
                    }%> <%if (controlsalid == 1) {
                        out.println("disabled");
                    }%> style="width: auto;height: auto;margin-top: 2px;padding: 50px;">  
                <button class="btn btn-primary btn-lg text-center border rounded" type="submit" style="width: auto;height: auto;margin: auto;margin-top: 5%;padding: auto;padding-top: 0px;padding-bottom: 0px;" <%if (controlsalid == 1) {
                        out.println("disabled");
                    }%>>Egresar</button>
                </form>
                <a class="btn btn-primary text-center d-inline-flex d-xl-flex flex-column align-self-center justify-content-xl-center align-items-xl-center" role="button" href="salidas.jsp" style="margin: auto;margin-top: 50%;width: 110px;height: auto;padding: auto;padding-top: auto;padding-right: auto;">Salir</a>
            </div>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
        <script src="assets/js/Bootstrap-Tags-Input-1.js"></script>
        <script src="assets/js/Bootstrap-Tags-Input.js"></script>
        <script src="assets/js/Dynamic-Table.js"></script>
        <script src="assets/js/PHP-Contact-Form-dark-1.js"></script>
        <script src="assets/js/PHP-Contact-Form-dark.js"></script>
        <script src="assets/js/Table-With-Search.js"></script>
    </body>

</html>

<%    } else {
// -- redirecciona a pagina de login si no hay sesion activa
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>