<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form controller="annonce" action="save" method="POST" enctype="multipart/form-data">
                <fieldset class="form">
                    <div>
                        <div class="fieldcontain required">
                            <label for="titre">Titre
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="text" name="title"/>
                        </div>

                        <div class="fieldcontain required">
                            <label for="description">Description
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="text" name="description"/>

                        </div>

                        <div class="fieldcontain required">
                            <label for="Prix">Prix
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="number" name="price"/>
                        </div>
                        <div class="fieldcontain">
                            <label for="file">Upload</label>
                            <input style="display: inline" type="file" multiple name="image" id="file"/>
                        </div>
                        <div class="fieldcontain required">
                            <label for="author">Author
                                <span class="required-indicator">*</span>
                            </label>
                            <g:select name="author.id" from="${userList}" optionKey="id" optionValue="username" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
