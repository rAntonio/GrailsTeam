    <%--
  Created by IntelliJ IDEA.
  User: JESSI
  Date: 04/03/2021
  Time: 17:35
--%>


    <%@ page contentType="text/html;charset=UTF-8" %>
    <html>
    <head>
        <title>Grail's Network Authentification</title>
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="bootstrap.css"/>
        <asset:stylesheet src="all.min.css"/>
        <asset:stylesheet src="login.css"/>
        <asset:javascript src="jquery-3.5.1.js"/>
        <asset:javascript src="bootstrap.min.js"/>
        <asset:javascript src="all.min.js"/>
    </head>

    <body>
    <div class='image-background'>
        <asset:image src="Jessi-module.png"/>
    </div>
    <div class="login-body">
        <div class='login-form-container'>
            <form  action="/login/authenticate" method="POST" />
            <g:if test='${flash.message}'>
                <div class="alert alert-danger" role="alert">${flash.message}</div>
            </g:if>
            <div class="login-social-signup">
                <h1>Se connecter</h1>
                <div class="btn-container-inline">
                    <div class="social-auth-button-container facebook col-md-9">
                        <div class="icons-container">
                            <asset:image src="icons/facebook.svg"/>
                        </div>
                        <button>continuer avec Facebook</button>
                    </div>
                    <div class="social-auth-button-container google col-md-2">
                        <div class="icons-container">
                            <asset:image src="icons/chercher.svg"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="login-divider">
                <h3>Ou</h3>
            </div>
            <div class='input-group-custom'>
                <label>Nom d'utilisateur</label>
                <input type="text" name="username" class='input-core'>
            </div>
            <div class='input-group-custom'>
                <label>Mot de passe</label>
                <input type="password" name="password" class='input-core'>
            </div>
            <div class="btn-container">
                <input type="submit" class='btn-custom validate' value='Se Connecter'>
            </div>
        </form>
        </div>
        <div class="login-design-container">
            <div class="login-design-background">
                <asset:image src="Jessi-module.png"/>
            </div>
            <div class="login-design-giant">
                <asset:image src="Jessi-Giant.png"/>
            </div>

        </div>
    </div>
    </body>
    </html>