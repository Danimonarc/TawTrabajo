<%-- 
    Document   : login
    Created on : 03-may-2019, 16:56:50
    Author     : jdani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/estiloLogin.css"/>
    </head>
    <body>
        <h1>Login</h1>
        <div>
            
            <form action="Autenticacion" method="post">
                <p>Email:<input type="text" name="usuario" id="usuario"/></p>
                <p>Contraseña:<input type="password" name="pass" id="pass"/></p>
                <p><input type="submit" name="Entrar" id="entrar"/></p>
                
            </form>
        </div>
    </body>
</html>
