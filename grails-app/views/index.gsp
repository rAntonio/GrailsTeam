<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>
<body>
    <div class="custom-menu">
        <div class="custom-menu-ul">
            <div class="custom-menu-item ">
                <a href="/annonce">Annonce</a>
                <ul class="custom-menu-item-container">

                    <a href="${createLink(uri:'/annonce')}"><li class="custom-menu-item-sub">Liste</li></a>
                    <a href="${createLink(uri:'/annonce/create')}"><li class="custom-menu-item-sub">Create</li></a>
                </ul>
            </div>
            <div class="custom-menu-item ">
                <ul class="custom-menu-item-container"> User
                    <a href=""><li class="custom-menu-item-sub">Liste</li></a>
                    <a href=""><li class="custom-menu-item-sub">Create</li></a>
                </ul>
            </div>
        </div>

    </div>
    <style>
        .custom-menu{
            background-color: #bce2ca;
            transition: all 0.3s;
        }
        .custom-menu .custom-menu-ul {
            display: flex;
            flex-direction: row;
        }
        .custom-menu .custom-menu-ul .custom-menu-item:hover{
            transition: all 0.3s;
            background-color: #7f8f82;
        }
        .custom-menu .custom-menu-ul .custom-menu-item {
            width:150px;
            padding:10px 25px 10px 25px;
            text-align: center;
        }
        .custom-menu .custom-menu-ul .custom-menu-item .custom-menu-item-container .custom-menu-item-sub {
            display: none;
        }
    </style>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

            <div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </section>
    </div>

</body>
</html>
