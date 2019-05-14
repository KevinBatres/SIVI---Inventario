<%
    HttpSession sesion = request.getSession();

    // -- verificacion de sesion
    if (sesion.isNew()) {


%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>sesion</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">

        <script src="assets/js/filtrado.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/styles.min.css">
    </head>

    <body>
        <!-- Start: Login Form Dark -->
        <div class="login-dark">
            <form method="post" action="jsp/sesion.jsp">
                <h2 class="sr-only">Login Form</h2>
                <div class="illustration">
                    <i class="icon ion-ios-locked-outline"></i>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="mail" placeholder="Usuario" onkeyup="this.value = NumText(this.value)">
                </div>
                <div class="form-group">
                    <input class="form-control" type="password" name="pass" placeholder="Password">
                </div>
                <div class="form-group">
                    <button class="btn btn-primary btn-block" type="submit">Log In</button>
                </div>

            </form>
        </div>
        <!-- End: Login Form Dark -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
<%    } else {
        String redirectURL = "jsp/closesion.jsp";
        response.sendRedirect(redirectURL);
    }
%>
