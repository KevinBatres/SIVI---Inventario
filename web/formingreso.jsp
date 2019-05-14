<%@page import="java.sql.ResultSet"%>
<%@page import="codes.selects"%>
<%HttpSession sesion = request.getSession();

// -- verificacion se sesion
    out.println(sesion.getAttribute("user"));

    if (sesion.getAttribute("user") != null) {

        ResultSet rs = null;
        ResultSet rs2 = null;

        int content = Integer.parseInt(request.getParameter("content"));

        String idit = "";
        String prov = "";
        String nfac = "";
        String fech = "";
        String pago = "";

// -- declaracion de metodo - objeto
        selects select = new selects();

        if (content == 1) {

            idit = request.getParameter("idit");
            prov = request.getParameter("prov");
            nfac = request.getParameter("nfac");
            fech = request.getParameter("fech");
            pago = request.getParameter("pago");

            rs = select.getIngreDet(idit);

        } else {

// -- obtiene el resultado de la consulta
            rs = select.getRs();
            rs2 = select.getProvs();
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
        <script src="assets/js/filtrado.js"></script>

        <%if (content != 1) {%>
        <script>
            $(document).ready(function () {
                $('#btn_add').click(function () {
                    agregar();

                });
            });
            var cont = 0;
            function agregar() {
                cont++;
                var fila = '<tr><td><input class="form-control" name="id" type="number"></td><td><select id="controlBuscador" class="form-control" name="prod"> "<%while (rs.next()) {%>"<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option> "<%}%>"</select></td><td><input class="form-control" name="cant" type="number" step="0.01" onkeyup="this.value=Numeros(this.value)"></td><td><input class="form-control" name="pcompra" type="number" onkeyup="this.value=Numeros(this.value)"></td></tr>';
                $('#tablaform').append(fila);

            }

            $(document).ready(function () {
                $('#btn_add').click(function () {
                    $('#controlBuscador').select2();
                });
            });

        </script>
        <%}%>

    </head>

    <body>
        <div class="bg-dark rounded shadow d-flex flex-row align-items-xl-center" style="background-color: rgb(255,255,255);width: 98%;height: 108%;margin: auto;margin-left: 17px;padding: 3px;padding-top: 0px;">
            <div style="height: 94%;background-color: rgba(255,255,255,0);margin-top: 0px;">
                <form style="height: 94%;" name="formtable" method="POST" action="jsp/qprod.jsp">

                    <input name="cont" type="hidden" value="1">

                    <div class="table-responsive table-bordered text-left" style="width: 97%;height: 87%;margin-top: 58px;margin-left: 18px;margin-bottom: 0px;background-color: rgb(255,255,255);">
                        <table id="tablaform" class="table table-striped table-bordered table-hover">
                            <thead class="text-center">
                                <tr>
                                    <th>Id</th>
                                    <th>Productos</th>
                                    <th>Cantidad</th>
                                    <th>P. Compra</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (content == 1) {
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                </tr>

                                <% }
                                    } %>

                            </tbody>
                            <tfoot>
                                <tr>

                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <%if (content != 1) { %>
                    <button type="button" id="btn_add" class="btn btn-primary btn-sm text-center border rounded" style="width: auto;height: auto;" >Agregar</button>                
                    <% }%>

            </div>
            <div class="text-break text-center d-inline-flex d-xl-flex flex-column align-items-xl-center" style="width: 18%;height: 82%;margin-top: -7px;margin-left: 22px;background-color: rgba(255,255,255,0);">
                <select class="border rounded form-control-lg" type="text" name="proveedor" value="proveedor" required="" style="width: auto;height: auto;" <%if (content == 1) {
                        out.println("disabled");
                    }%>>
                    <%
                        if (content == 1) {%>
                    <option value="<%=prov%>"><%=prov%></option>
                    <% } else {
                        while (rs2.next()) {%>
                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
                    <%
                            }
                        }
                    %>
                </select>
                <input class="border rounded form-control-lg" type="text" name="nfactura" value="<%if (content == 1) {
                        out.println(nfac);
                    }%>" placeholder="No. Factura" style="width: auto;height: auto;" <%if (content == 1) {
                            out.println("disabled");
                        }%> onkeyup="this.value = Numeros(this.value)" onkeyup="this.value = NumText(this.value)">
                <input class="border rounded form-control-lg d-flex flex-row justify-content-xl-center align-items-xl-center" name="feching" type="date" value="<%=fech%>" required="" style="width: auto;height: auto;margin-top: 18%;padding: 29px;" <%if (content == 1) {
                        out.println("disabled");
                    }%>>
                <label for="credito" style="font-size: 27px;color: rgb(255,255,255);margin-top: 31px;">Credito</label>
                <input type="checkbox" name="pago" value="credito"  <%if (content == 1) {
                        if (pago.equals("credito")) {
                            out.println("checked");
                        }
                    }%> style="width: auto;height: auto;padding: 50px;margin-top: 1px;" <%if (content == 1) {
                            out.println("disabled");
                        }%>>
                <label style="color: rgb(255,255,255);font-size: 27px;margin-top: 23px;">Contado</label>
                <input type="checkbox" name="pago" value="contado" <%if (content == 1) {
                        if (pago.equals("contado")) {
                            out.println("checked");
                        }
                    }%> style="width: auto;height: auto;margin-top: 2px;padding: 50px;" <%if (content == 1) {
                            out.println("disabled");
                        }%>>
                <button class="btn btn-primary btn-lg text-center border rounded" type="submit" style="width: auto;height: auto;margin: auto;margin-top: 44%;padding: auto;padding-top: 0px;padding-bottom: 0px;" <%if (content == 1) {
                        out.println("disabled");
                    }%>>Ingresar</button>
                </form>
                <a class="btn btn-primary btn-lg border rounded d-xl-flex flex-column align-self-center justify-content-xl-center align-items-xl-center" role="button" href="ingresar.jsp" style="margin: auto;margin-top: 5%;width: auto;height: auto;padding: 0px;padding-top: 0px;padding-right: 0px;min-height: 31px;min-width: 100px;">Salir</a></div>
        </div>

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