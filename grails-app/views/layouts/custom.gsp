<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title><g:layoutTitle default="Le Coin Coin"/></title>
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="custom.css"/>
        <asset:stylesheet src="all.min.css"/>

        <g:layoutHead/>
    </head>
    <body>
        <div class="wrapper">

            <div class="banner">
                <sec:ifLoggedIn>
                    <g:form controller="logout">
                        <g:submitButton class="btn btn-primary btn-logout" name="Submit" value="Déconnexion"
                        />
                    </g:form>
                </sec:ifLoggedIn>
            </div>


            <div class="content-wrapper" role="main">
                <g:layoutBody/>
            </div>
        </div>
        <asset:javascript src="application.js"></asset:javascript>
        <asset:javascript src="custom.js"></asset:javascript>
    </body>
</html>
