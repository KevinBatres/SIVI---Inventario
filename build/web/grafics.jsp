<%@page import="java.sql.ResultSet"%>
<%@page import="codes.selects"%>
<%HttpSession sesion = request.getSession();

// -- verificacion de sesion
    out.println(sesion.getAttribute("user"));

    if (sesion.getAttribute("user") != null) {

// -- declaracion de metodo - objeto
        selects select = new selects();

// -- obtiene el resultado de la consulta
        ResultSet rs = select.getSumIngre();
        ResultSet rs2 = select.getSumSalid();
        ResultSet rs3 = select.getSumSalid();

        String mes[] = null;
        int c = 0;
        int d = 0;


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


        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>


        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>



    </head>

    <body>
        <div class="bg-dark rounded shadow d-flex flex-row align-items-xl-center" style="background-color: rgb(255,255,255);width: 35%!important; height: 55%!important;margin: auto;margin:auto;margin-top: 13%">
            <div style="height: auto!important; width: auto!important;background-color: rgba(255,255,255,0);margin: auto;">   
                <div id="divt" class="table-responsive" style="width: auto;height: auto;margin: auto;background-color: rgb(255,255,255);">
                    <div id="container" style="width: auto!important; height: auto!important;">

                    </div>
                </div>
            </div>
        </div>

        <script>

            $(function ($) {
                $('#container').highcharts({
                    title: {
                        text: 'Ingresos y Egresos mensuales',
                        x: -20 //center
                    },
                    subtitle: {
                        text: '',
                        x: -20
                    },
                    xAxis: {
                        categories: [<%                            while (rs3.next()) {
                                out.print("'" + rs3.getString(2) + "', ");
                            } %>]
                    },
                    yAxis: {
                        title: {
                            text: 'Unidades'
                        },
                        plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                    },
                    tooltip: {
                        valueSuffix: ' U'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                            name: 'Entradas',
                            data: [<%
                                while (rs.next()) {
                                    out.print(rs.getString(1) + ", ");
                                }  %>]
                        },
                        {
                            name: 'Salidas',
                            data: [<% while (rs2.next()) {
                                    out.print(rs2.getString(1) + ", ");
                                } %>]
                        }]
                });
            });

        </script>

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