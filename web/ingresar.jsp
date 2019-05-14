<%@page import="java.sql.ResultSet"%>
<%@page import="codes.selects"%>
<%HttpSession sesion = request.getSession();

// -- verificacion se sesion
    out.println(sesion.getAttribute("user"));

    if (sesion.getAttribute("user") != null) {

// -- declaracion de metodo - objeto
        selects select = new selects();

// -- obtiene el resultado de la consulta
        ResultSet rs = select.getingresos();


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

        <script src="assets/js/jquery.min.js"></script>

        <script src="assets/js/jss.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.2/xlsx.core.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.js"></script>
    </head>

    <body>
        <div class="bg-dark rounded shadow d-flex flex-row align-items-xl-center" style="background-color: rgb(255,255,255);width: 98%;height: 108%;margin: auto;margin-left: 17px;padding-top: 0px;">
            <div style="height: 95%;background-color: rgba(255,255,255,0.82);margin-top: 0px;">
                <div id="divt" class="table-responsive" style="height: 100%;width: 100%;">
                    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" media="print">
                    <table id="InfSalidas" class="table table-striped table-hover table-sm fonty">
                        <thead>
                            <tr>
                                <th>No. Ingreso</th>
                                <th>Proveedor</th>
                                <th>no. Factura</th>
                                <th>Fecha</th>
                                <th class="oculto-impresion">Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td class="oculto-impresion">
                                    <form action="formingreso.jsp" name="formingre" method="POST">
                                        <input type="hidden" name="content" value="1">
                                        <input type="hidden" name="idit" value="<%=rs.getString(2)%>">

                                        <input type="hidden" name="prov" value="<%=rs.getString(7)%>">
                                        <input type="hidden" name="nfac" value="<%=rs.getString(2)%>">
                                        <input type="hidden" name="fech" value="<%=rs.getString(4)%>">
                                        <input type="hidden" name="pago" value="<%=rs.getString(5)%>">

                                        <button class="btn btn-primary btn-lg text-center border rounded" type="submit">Detalles</button>
                                    </form>
                                </td>
                                <% }
                                %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="text-break text-center d-inline-flex d-xl-flex flex-column align-items-xl-center" style="width: 18%;height: 82%;margin-top: 88px;margin-left: 22px;background-color: rgba(255,255,255,0);">
                <button class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" type="button" onclick="printDiv();" style="width: 123px;height: 38px;">PDF</button>
                <button class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" type="button" id="excel" style="width: 123px;height: 38px;">Excel</button>
                <a class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" role="button" href="grafics.jsp" style="width: 123px;height: 38px;">Gráficas</a>
                <form action="formingreso.jsp" name="formingre" method="POST">
                    <input type="hidden" name="content" value="0">
                    <button class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" type="submit" style="margin-top: 298px;width: 110px;height: 45px;">Ingresar</button>
                </form>

                <a class="btn btn-primary text-center d-inline-flex d-xl-flex flex-column justify-content-xl-center align-items-xl-center" role="button" href="menu.jsp" style="margin-top: 128px;width: 110px;height: 34px;padding-top: 4px;padding-right: 10px;">Salir</a></div>
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

        <script>
                    var tableId = 'InfSalidas';
                    var ExportButtons = document.getElementById(tableId);

                    var instance = new TableExport(ExportButtons, {
                        formats: ['csv'],
                        exportButtons: false,
                        ignoreCols: 4

                    });

                    var CSV = instance.CONSTANTS.FORMAT.CSV;

                    // "id"  // format
                    var exportDataCSV = instance.getExportData()[tableId][CSV];

                    // get filesize
                    var bytesCSV = instance.getFileSize(exportDataCSV.data, exportDataCSV.fileExtension);

                    console.log('filesize (CSV):', bytesCSV + 'B');

                    var CSVbutton = document.getElementById('excel');
                    CSVbutton.addEventListener('click', function (e) {
                        //                   // data             // mime                 // name                 // extension
                        instance.export2file(exportDataCSV.data, exportDataCSV.mimeType, exportDataCSV.filename, exportDataCSV.fileExtension);
                    });
        </script>
    </body>

</html>

<%} else {
// -- redirecciona a pagina de login si no hay sesion activa
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>