
<%@page import="javax.servlet.http.HttpSession"%>
<%
    // -- verificacion se sesion
    HttpSession sesion = request.getSession();
    //out.println(sesion.getAttribute("user"));

    if (sesion.getAttribute("user") != null) {

        String idedit = "";
        String prodedit = "";
        String maredit = "";
        String desedit = "";
        String fecedit = "";

// -- veririfica si es de tipo update o insert
        int tipo = Integer.parseInt(request.getParameter("prod"));
        if (tipo == 1) {

            idedit = request.getParameter("idedit");
            prodedit = request.getParameter("prodedit");
            maredit = request.getParameter("maredit");
            desedit = request.getParameter("desedit");
            fecedit = request.getParameter("fecedit");

        } else {
            //out.println("Editar");
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



    </head>

    <body style="width: 100%;height: 100%;">
        <div class="container d-flex d-xl-flex flex-column justify-content-center align-items-center align-content-center align-self-center m-auto" style="width: 100%;height: 100%;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;margin-left: 0px;padding-right: 0px;padding-left: 0px;">
            <div class="d-xl-flex justify-content-xl-center" style="width: 100%;height: 100%;margin-top: 0px;margin-bottom: 0px;margin-left: 0px;">
                <form class="d-inline-flex flex-column m-auto justify-content-xl-center align-items-xl-center" style="width: 100%;" action="jsp/qprod.jsp" method="POST">
                    <input name="control" type="hidden" value="<%=tipo%>"> <!-- Input de control... para saber si es un insert, un update o un delete -->
                    <input name="cont" type="hidden" value="0"> <!-- Input de control... para saber de donde vienen los datos -->
                    <input name="idedit" type="hidden" value="<%=idedit%>"> <!-- Input de control... para pasar el id del producto a editar o eliminar -->

                    <div class="form-group m-auto" style="width: 90%;height: auto;">
                        <div class="rounded shadow bg-dark d-flex flex-column m-auto align-items-xl-center" id="formdiv" style="width: 100%;height: 100%;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;">
                            <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                <div class="col-md-8 offset-md-1" style="margin-bottom: 0px;">
                                    <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;">
                                        <strong>Producto</strong>
                                    </p>
                                </div>
                                <div class="col-md-10 offset-md-1">

                                    <input class="form-control" type="text" name="prod" value="<%=prodedit%>" placeholder="Producto" onkeyup="this.value = NumText(this.value)" style="margin: 0;margin-left: 0px;font-family: Roboto, sans-serif;">

                                </div>
                            </div>
                            <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;margin-top:-16px;">
                                <div class="col-md-8 offset-md-1" style="padding: 0%;margin-bottom: 0%;margin-top: 6%;">
                                    <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;">
                                        <strong>Marca</strong>
                                    </p>
                                </div>
                                <div class="col-md-10 offset-md-1">

                                    <input class="form-control" type="text" name="marc" value="<%=maredit%>" placeholder="Marca" onkeyup="this.value = NumText(this.value)" style="margin: 0;margin-left: 0px;font-family: Roboto, sans-serif;">

                                </div>
                            </div>
                            <div class="form-row" style="margin-right: 0px;margin-left: 0px;padding-top: 24px;margin-top: 0px;margin-bottom: 0px;">
                                <div class="col-md-8 offset-md-1" style="height: 2%;margin-top: 0px;margin-bottom: 0px;">
                                    <p class="d-xl-flex align-items-xl-center" style="margin: 0px;margin-left: 2%;font-family: Roboto, sans-serif;font-size: 28px;margin-bottom: 0px;height: 2%;">
                                        <br>
                                        <strong>Descripción</strong>
                                        <br>
                                        <br>
                                    </p>
                                </div>
                                <div class="col-md-10 offset-md-1">

                                    <input class="form-control" type="text" name="desc" value="<%=desedit%>" placeholder="Descripción" onkeyup="this.value = NumText(this.value)" style="margin: 0;margin-left: 0px;font-family: Roboto, sans-serif;">

                                </div>
                            </div>
                            <div class="form-row" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                <div class="col-md-8 offset-md-1 d-xl-flex align-items-xl-center" style="height: 2%;margin-top: 0px;margin-bottom: 0px;padding-right: 0px;padding-left: 0px;">
                                    <p class="d-xl-flex align-items-xl-center" style="margin-left: 2%;font-family: Roboto, sans-serif;font-size: 24px;height: 2%;">
                                        <strong>fecha</strong>
                                    </p>
                                </div>
                                <div class="col-md-10 offset-md-1" style="margin-bottom: 0px;padding-right: 0px;">

                                    <input class="form-control" <%if (tipo == 1) {
                                            out.println("readonly");
                                        }%> type="date" name="fech" value="<%=fecedit%>" style="font-family: Roboto, sans-serif;margin-top: 0px;">

                                </div>
                            </div>
                            <div class="form-row d-flex" style="margin-right:0px;margin-left:0px;padding-top:24px;">
                                <div class="col-12 col-md-4 offset-md-4 d-flex" style="width: 54%;">
                                    <a class="btn btn-light btn-lg" role="button" href="productos.jsp" style="font-family: Roboto, sans-serif;width: auto;height: auto;">Cancelar</a>
                                    <button class="btn btn-light btn-lg" type="submit" style="margin-left: 16px;width: auto;height: auto;"><% if (tipo == 0) {
                                            out.println("Registrar");
                                        } else {
                                            out.println("Actualizar");
                                        } %>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
// -- redirecciona a pagina de login
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>