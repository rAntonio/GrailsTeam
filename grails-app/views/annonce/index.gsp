<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>


                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>titre</td>
                            <td>Description</td>
                            <td>Prix</td>
                            <td>Utilisateur</td>
                            <td>Illustration</td>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${annonceList}">
                        <tr>
                            <td>${it.title}</td>
                            <td>${it.description}</td>
                            <td>${it.price}</td>
                            <td>${it.author.username}</td>
                            <td>
                                <g:each in="${it.illustrations}">
                                    <asset:image src="${it.filename}"/>
                                </g:each>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>