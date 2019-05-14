<%HttpSession sesion = request.getSession();

// -- verificacion se sesion
    

    if (sesion.getAttribute("user") != null) {

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
    </head>
    <body
        <div class="d-flex d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;width: 100%;height: 114%;">
            <div class="bg-dark rounded shadow d-xl-flex align-self-center flex-wrap justify-content-xl-center align-items-xl-center" style="margin-top: 1%;width: 464px;height: 402px;">
                <div class="row text-right d-xl-flex justify-content-xl-center align-items-xl-end">
                    <div class="col text-nowrap d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;"><a class="btn btn-primary" role="button" href="productos.jsp" style="height: 40px;padding: auto;">Productos</a></div>
                </div>
                <div class="row d-xl-flex align-items-xl-end">
                    <div class="col d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;"><a class="btn btn-primary" role="button" href="provs.jsp" style="height: 40px;padding: auto;">Proveedores</a></div>
                </div>
                <div class="row d-xl-flex justify-content-xl-center align-items-xl-start">
                    <div class="col d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;margin-top: 0px;"><a class="btn btn-primary" role="button" href="ingresar.jsp" style="padding: auto;height: 40px;">Ingreso</a></div>
                </div>
                <div class="row d-xl-flex justify-content-xl-center align-items-xl-start">
                    <div class="col d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;"><a class="btn btn-primary" role="button" href="salidas.jsp" style="padding: auto;height: 40px;">Egreso</a></div>
                </div>
                <div class="row d-xl-flex justify-content-xl-center align-items-xl-start">
                    <div class="col d-xl-flex justify-content-xl-center align-items-xl-center" style="margin: 0px;"><a class="btn btn-primary" role="button" href="jsp/closesion.jsp" style="padding: auto;height: 40px;">Salir</a></div>
                </div>
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