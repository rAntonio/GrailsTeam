<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:stylesheet src="section-container.css"/>
        <asset:stylesheet src="section-container-form.css"/>
    </head>
    <body>

    <div class="section-controller">
        <div class="section-controller-back">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 443.52 443.52" style="enable-background:new 0 0 443.52 443.52;" xml:space="preserve">
                <path d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z"/>
            </svg>
        </div>
        <div class="section-controller-icon">
            <svg id="Layer_1"  viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" class="duck-icons">
                <path d="m394.417 198.1 79.9 11.23a5.931 5.931 0 0 0 .837.059 6 6 0 0 0 4.368-10.112l-114.795-121.977a6 6 0 0 0 -8.612-.13l-92.808 92.8a5.949 5.949 0 0 0 -1.087 6.99l42.12 81.719-230.572-117.485a6 6 0 0 0 -8.463 7.1l36.512 119.706h-85.817a5.679 5.679 0 0 0 -5.53 3.3 5.4 5.4 0 0 0 1.239 6.146l154.391 158.247c1.128 1.156 2.675 2.307 4.291 2.307h228.609a6 6 0 0 0 5.932-5.141l95.681-115.08a6 6 0 0 0 -.259-7.964zm-34.19-108.076 98.854 105.043-178.781-25.128zm-279.327 68.276 215.308 109.7h-181.845zm92.018 267.7-142.666-146h285.076l75.252 146zm227.7-6.72-122.425-237.52 97.144 13.655 112.642 118.79z"/>
                <path d="m86.457 296h-1.946a6 6 0 1 0 0 12h1.946a6 6 0 0 0 0-12z"/><path d="m192.245 296h-86.286a6 6 0 0 0 0 12h86.286a6 6 0 0 0 0-12z"/>
            </svg>
            <span class="duck-title">Lecoincoin</span>
        </div>

        <div class="section-controller-add-bar">

        </div>
    </div>
    <div class="section-container">
        <div class="section-contenue">
            <div class="section-contenue-form-container">

                <form id="edit-annonce-form" name="edit-annonce-form" action="${createLink(controller:"annonce",action:"create")}" method="POST" enctype="multipart/form-data">
                    <div class="section-contenue-input">
                        <label>titre</label>
                        <input id="titre" name="title" type="text" class="form-contenue-control"/>
                        <div class="fields-error">
                            <p class=" fields-error-message">aaaaaaaaaa</p>
                        </div>
                        <div class="section-contenue-input-descriptor">
                            <span >Maximum 256 charactere</span>
                        </div>
                    </div>

                    <div class="section-contenue-input">
                        <label>description</label>
                        <input id="description" name="description" type="text" class="form-contenue-control" />
                        <div class="section-contenue-input-descriptor">
                            <span >Maximum 256 charactere</span>
                        </div>
                    </div>

                    <div class="section-contenue-input">
                        <label>prix</label>
                        <input id="prix" name="price" type="text" class="form-contenue-control" value="0"/>
                        <div class="section-contenue-input-descriptor">
                            <span class="nb-characters">0 charactere</span>
                            <span >Maximum 256 charactere</span>
                        </div>
                    </div>

                    <div class="section-contenue-input">
                        <label>Illustration</label>
                        <div class="section-contenue-input-image-container">
                            <div class="section-contenue-input-image-items">
                                <div class="section-contenue-input-image-items-title">
                                    <span>To Add</span>
                                </div>
                                <div class="section-contenue-input-image-items-pictures">
                                    <input style="display: inline" type="file" type="file" multiple name="image" id="file"/>
                                </div>
                            </div>

                        </div>
                        <div class="section-contenue-input-descriptor">
                            <span class="nb-characters">0 charactere</span>
                            <span >Maximum 256 charactere</span>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <div class="section-menu">
            <div class="section-menu-container">
                <div class="section-menu-widget status-widget">
                    <header>
                    </header>
                    <div class="status">
                    </div>
                    <button class="custom-button custom-button-success validator" data-form-id="edit-annonce-form">Inserer</button>
                    <div class="notice">

                    </div>
                </div>
            </div>
        </div>
    </div>
























       <!-- fin code css-->
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
