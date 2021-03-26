<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:stylesheet src="section-container.css"/>
        <asset:stylesheet src="list.css"/>
    </head>
    <body>
        <div class="section-controller">
            <div class="section-controller-icon">
                <svg id="Layer_1"  viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" class="duck-icons">
                    <path d="m394.417 198.1 79.9 11.23a5.931 5.931 0 0 0 .837.059 6 6 0 0 0 4.368-10.112l-114.795-121.977a6 6 0 0 0 -8.612-.13l-92.808 92.8a5.949 5.949 0 0 0 -1.087 6.99l42.12 81.719-230.572-117.485a6 6 0 0 0 -8.463 7.1l36.512 119.706h-85.817a5.679 5.679 0 0 0 -5.53 3.3 5.4 5.4 0 0 0 1.239 6.146l154.391 158.247c1.128 1.156 2.675 2.307 4.291 2.307h228.609a6 6 0 0 0 5.932-5.141l95.681-115.08a6 6 0 0 0 -.259-7.964zm-34.19-108.076 98.854 105.043-178.781-25.128zm-279.327 68.276 215.308 109.7h-181.845zm92.018 267.7-142.666-146h285.076l75.252 146zm227.7-6.72-122.425-237.52 97.144 13.655 112.642 118.79z"/>
                    <path d="m86.457 296h-1.946a6 6 0 1 0 0 12h1.946a6 6 0 0 0 0-12z"/><path d="m192.245 296h-86.286a6 6 0 0 0 0 12h86.286a6 6 0 0 0 0-12z"/>
                </svg>
                <span class="duck-title">Lecoincoin</span>
            </div>
            <div class="section-controller-search-bar">
                <div class="custom-input-search">
                    <div class="custom-input-search-select-theme">
                        <div class="custom-input-search-select-theme-title">
                            <span>Content Type</span>
                        </div>
                        <select class="custom-input-search-select-theme-name">
                            <g:each in="${menuList}">
                                <g:if test="${it.name ==  entityName }">
                                    <option selected value="${it.href}">${it.name}</option>
                                </g:if>
                                <g:else>
                                    <option value="${it.href}">${it.name}</option>
                                </g:else>
                            </g:each>
                        </select>
                    </div>

                    <input type="text" name="search_text" class="search-control" placeholder="Type to search for entries"/>

                </div>
            </div>
            <div class="section-controller-add-bar">
                <a href="create" class="btn btn-primary btn-cust">Add To ${entityName}</a>
            </div>
        </div>
        <!--<a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div> !-->
        <div class="section-container">
            <div class="section-menu">a</div>

            <div class="section-contenue">
                <span class="nombre-element">${annonceCount} item trouvé(s)</span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th><input type="checkbox"/></th>
                            <th>Titre</th>
                            <th>Type</th>
                            <th>Dernier Mise a jour</th>
                            <th>Prix</th>
                            <th>Author</th>
                            <th>Statut</th>


                        </tr>
                    </thead>
                    <tbody>

                        <g:each in="${annonceList}">
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>${it.title}</td>
                            <td>${entityName}</td>
                            <td>${it.lastUpdated}</td>
                            <td>${it.price} Ariary</td>
                            <td>${it.author.username}</td>
                            <td>
                                <g:if test="${it.etat == 0}">
                                    <span class="not-validate">Pas Publié</span>
                                </g:if>
                                <g:else>
                                    <span class="validate">Publié</span>
                                </g:else>
                            </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>