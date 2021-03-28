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
                <button class="btn btn-back" name="Submit" >
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 31.494 31.494" width="24px" xml:space="preserve">
                        <path style="fill:#FFFFFF;" d="M10.273,5.009c0.444-0.444,1.143-0.444,1.587,0c0.429,0.429,0.429,1.143,0,1.571l-8.047,8.047h26.554  c0.619,0,1.127,0.492,1.127,1.111c0,0.619-0.508,1.127-1.127,1.127H3.813l8.047,8.032c0.429,0.444,0.429,1.159,0,1.587  c-0.444,0.444-1.143,0.444-1.587,0l-9.952-9.952c-0.429-0.429-0.429-1.143,0-1.571L10.273,5.009z"/>
                    </svg>
                </button>
            </div>


            <div class="content-wrapper" role="main">
                <g:layoutBody/>
            </div>
        </div>
        <asset:javascript src="application.js"></asset:javascript>
        <asset:javascript src="custom.js"></asset:javascript>
    </body>
</html>
