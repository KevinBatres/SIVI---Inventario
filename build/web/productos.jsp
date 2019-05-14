<%@page import="java.sql.ResultSet"%>
<%@page import="codes.selects"%>
<%HttpSession sesion = request.getSession();

// -- verificacion de sesion
    out.println("... ");

    if (sesion.getAttribute("user") != null) {

// -- declaracion de metodo - objeto
        selects select = new selects();

// -- obtiene el resultado de la consulta
        ResultSet rs = select.getRs();
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

        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" media="all">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css" media="all">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css" media="all">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" media="all">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto" media="all">
        <link rel="stylesheet" href="assets/css/Bootstrap-Tags-Input.css" media="all">
        <link rel="stylesheet" href="assets/css/Data-Table-1.css" media="all">
        <link rel="stylesheet" href="assets/css/Data-Table.css" media="all">
        <link rel="stylesheet" href="assets/css/Dynamic-Table.css" media="all">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" media="all">
        <link rel="stylesheet" href="assets/css/MUSA_no-more-tables-1.css" media="all">
        <link rel="stylesheet" href="assets/css/MUSA_no-more-tables.css" media="all">
        <link rel="stylesheet" href="assets/css/MUSA_panel-table-1.css" media="all">
        <link rel="stylesheet" href="assets/css/MUSA_panel-table.css" media="all">
        <link rel="stylesheet" href="assets/css/PHP-Contact-Form-dark-1.css" media="all">
        <link rel="stylesheet" href="assets/css/PHP-Contact-Form-dark.css" media="all">
        <link rel="stylesheet" href="assets/css/Pretty-Search-Form.css" media="all">
        <link rel="stylesheet" href="assets/css/Pretty-Table-1.css" media="all">
        <link rel="stylesheet" href="assets/css/Pretty-Table-2.css" media="all">
        <link rel="stylesheet" href="assets/css/Pretty-Table-3.css" media="all">
        <link rel="stylesheet" href="assets/css/Pretty-Table.css" media="all">
        <link rel="stylesheet" href="assets/css/Responsive-Form-1.css" media="all">
        <link rel="stylesheet" href="assets/css/Responsive-Form.css" media="all">
        <link rel="stylesheet" href="assets/css/styles.css" media="all">
        <link rel="stylesheet" href="assets/css/Table-With-Search-1.css" media="all">
        <link rel="stylesheet" href="assets/css/Table-With-Search.css" media="all">
        <link rel="stylesheet" href="assets/css/media.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/css/tableexport.css" />
        <script src="assets/js/jquery.min.js"></script>

        <script src="assets/js/jss.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.2/xlsx.core.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.js"></script>

        <script language="javascript">
            function doSearch()
            {
                var tableReg = document.getElementById('tableprod');
                var searchText = document.getElementById('searchTerm').value.toLowerCase();
                var cellsOfRow = "";
                var found = false;
                var compareWith = "";

                // Recorremos todas las filas con contenido de la tabla
                for (var i = 1; i < tableReg.rows.length; i++)
                {
                    cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                    found = false;

                    // Recorremos todas las celdas
                    for (var j = 0; j < cellsOfRow.length && !found; j++)
                    {
                        compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                        // Buscamos el texto en el contenido de la celda
                        if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
                        {
                            found = true;
                        }
                    }
                    if (found)
                    {
                        tableReg.rows[i].style.display = '';
                    } else {
                        // si no ha encontrado ninguna coincidencia, esconde la
                        // fila de la tabla
                        tableReg.rows[i].style.display = 'none';
                    }
                }
            }
        </script>

    </head>

    <body>
        <div class="bg-dark rounded shadow d-flex flex-row align-items-xl-center" style="background-color: rgb(255,255,255);width: 98%;height: 108%;margin: auto;margin-left: 17px;padding-top: 0px;">
            <div style="height: 94%;background-color: rgba(255,255,255,0);margin-top: 0px;">
                <form class="d-inline-flex flex-row flex-wrap justify-content-xl-start align-items-xl-center search-form" style="width: 528px;height: 55px;margin-bottom: 0px;margin-right: 21px;margin-top: 28px;">
                    <div class="input-group d-inline-flex flex-column flex-fill justify-content-xl-center" style="margin-bottom: 0px;height: 51px;width: 314px;margin-left: 0px;margin-top: 0px;background-color: rgba(255,255,255,0);">
                        <div class="input-group-prepend d-xl-flex flex-fill align-items-xl-center" style="margin-top: 0px;width: 42px;height: 34px;margin-right: 0px;margin-bottom: 0px;margin-left: 0px;background-color: rgba(255,255,255,0);"><span class="flex-fill input-group-text" style="margin-top: 0px;height: 51px;padding-top: 0px;background-color: #e9ecef;margin-right: 0px;margin-left: 11px;"><i class="fa fa-search d-xl-flex flex-fill align-items-xl-center"></i></span></div>
                        <input class="form-control" id="searchTerm" onkeyup="doSearch()" type="text" placeholder="Producto" style="margin-top: 0px;width: 322px;background-color: #ffffff;padding-right: 0px;padding-top: 0px;padding-left: 15px;padding-bottom: 0px;margin-left: 0px;">
                        <div class="input-group-append text-center d-inline-flex d-xl-flex flex-row flex-grow-1 flex-fill align-items-xl-center" style="margin-top: 0px;margin-bottom: 0px;margin-left: 0px;width: 137px;background-color: rgba(255,255,255,0);"><button class="btn btn-light flex-fill" type="button" style="margin-top: 0px;padding-left: 8px;padding-top: 9px;height: 47px;">Buscar </button></div>
                    </div>
                </form>
                <div id="divt" class="table-responsive table-bordered text-left" style="width: 97%;height: 87%;margin-top: 25px;margin-left: 18px;margin-bottom: 0px;background-color: rgb(255,255,255);">
                    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" media="print">

                    <table id="tableprod" class="table table-striped table-bordered table-hover fonty">
                        <thead class="text-center">
                            <tr>
                                <th>Id</th>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>P. Compra</th>
                                    <% if (sesion.getAttribute("userType").equals("1")) {%>
                                <th class="oculto-impresion">Opciones</th>
                                    <% } %>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (rs.next()) {
                            %>
                            <tr>
                                <td class="text-center"><%=rs.getString(1)%></td>
                                <td class="text-center"><%=rs.getString(2)%></td>
                                <td class="text-center"><%=rs.getString(4)%></td>
                                <td class="text-center"><%=rs.getString(6)%></td>
                                <% if (sesion.getAttribute("userType").equals("1")) {%>
                                <td class="oculto-impresion">
                                    <!-- formulario para editar un producto -->
                                    <form action="formprod.jsp" method="POST" name="editar">
                                        <input name="prod" value="1" type="hidden">

                                        <input  name="idedit" value="<%=rs.getString(1)%>" type="hidden">
                                        <input  name="prodedit" value="<%=rs.getString(2)%>" type="hidden">
                                        <input  name="maredit" value="<%=rs.getString(5)%>" type="hidden">
                                        <input  name="desedit" value="<%=rs.getString(7)%>" type="hidden">
                                        <input  name="fecedit" value="<%=rs.getString(10)%>" type="hidden">
                                        <button class="btn btn-primary d-xl-flex flex-column justify-content-xl-center align-items-xl-center float-left" role="submit" style="width: 110px;height: 45px; margin: auto; margin-left: 10%;">Editar</button>
                                    </form>

                                    <!-- formulario para elimar un producto -->
                                    <form action="jsp/qprod.jsp" method="POST" name="editar">
                                        <input name="control" value="2" type="hidden">
                                        <input name="cont" value="0" type="hidden">
                                        <input  name="idedit" value="<%=rs.getString(1)%>" type="hidden">     
                                        <% // -- verificacion de eliminacion, si la existencia es igual a 0 si se puede eliminar
                                            if (rs.getString(4) != "0") {
                                        %>
                                        <button class="btn btn-primary d-xl-flex flex-column justify-content-xl-center align-items-xl-center" role = "submit" style = "width: 110px;height: 45px; margin: auto;" disabled > Eliminar </button >
                                        <% } else {%>
                                        <button class="btn btn-primary d-xl-flex flex-column justify-content-xl-center align-items-xl-center" role="submit" style="width: 110px;height: 45px; margin: auto;">Eliminar</button>
                                        <% }%>
                                    </form>
                                </td>
                                <% }
                                %>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <tfoot>
                            <tr></tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="text-break text-center d-inline-flex d-xl-flex flex-column align-items-xl-center" style="width: 18%;height: 82%;margin-top: 88px;margin-left: 22px;background-color: rgba(255,255,255,0);">
                <% if (sesion.getAttribute("userType").equals("1")) {

                %>
                <button class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" type="button" onclick="printDiv();" style="width: 123px;height: 38px;">PDF</button>
                <button class="btn btn-primary d-inline-flex flex-column justify-content-xl-center align-items-xl-center" type="button" id="excel" style="width: 123px;height: 38px;">Excel</button>

                <form name="nuevo" action="formprod.jsp" method="POST">
                    <input name="prod" value="0" type="hidden">
                    <button class="btn btn-primary d-xl-flex flex-column justify-content-xl-center align-items-xl-center" role="submit" style="margin-top: 298px;width: 110px;height: 45px;">Nuevo</button>
                </form>



                <% } %>
                <a class="btn btn-primary text-center d-inline-flex d-xl-flex flex-column justify-content-xl-center align-items-xl-center" role="button" href="menu.jsp" style="margin-top: 128px;width: 110px;height: 34px;padding-top: 4px;padding-right: 10px;">Salir</a>
            </div>
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
                    var tableId = 'tableprod';
                    var ExportButtons = document.getElementById(tableId);

                    var instance = new TableExport(ExportButtons, {
                        formats: ['csv'],
                        exportButtons: false,
                        ignoreCols: 4
                    });

                    var CSV = instance.CONSTANTS.FORMAT.CSV;

                    //                                          // "id"  // format
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

<%    } else {
// -- redirecciona a pagina de login si no hay sesion activa
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
%>