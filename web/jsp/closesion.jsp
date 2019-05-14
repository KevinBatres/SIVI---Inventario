<%
    
// -- declara la session 
    HttpSession sesion = request.getSession();
    
 // -- verifica que exista una session creada
    
        
        // --  cierra la session invalidandola
        sesion.invalidate();

        // -- redirecciona a pagina de login
        String redirectURL = "../index.jsp";
        response.sendRedirect(redirectURL);
   

%>