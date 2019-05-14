function printDiv() {
    var objeto = document.getElementById('divt');
    //obtenemos el objeto a imprimir

    var ventana = window.open('', '_blank'); //abrimos una ventana vacía nueva
    ventana.document.write("<head><style> @media all{ .oculto-impresion, .oculto-impresion *{display: none !important;}} </style></head>");
    ventana.document.write(objeto.innerHTML); //imprimimos el HTML del objeto en la nueva ventana

    ventana.document.close();  //cerramos el documento
    ventana.print();  //imprimimos la ventana
    ventana.close();  //cerramos la ventana
    // imprimir literal de javascript
}


 