<%
    String encargado = request.getParameter("encargado");
    String fechsalida = request.getParameter("fechsalida");
    String razonsalida = request.getParameter("razonsalida");
    String facturar = request.getParameter("facturar");
    if(facturar == null){
        facturar = Integer.toString(0);
    }

    String[] prods1 = request.getParameterValues("prod");
    String[] cant = request.getParameterValues("cant");

    out.println(encargado);
    out.println(fechsalida);
    out.println(razonsalida);
    out.println(facturar);
    
    

    out.println("/n");
    int i = 0;
    while (i < prods1.length) {
        out.println(prods1[i]);
        out.println(cant[i]);
       
        i++;
    }

%>