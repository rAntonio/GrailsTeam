<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="custom" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
        <a href="${createLink(controller:"user",action:"create")}" class="btn btn-primary btn-cust">Ajouter ${entityName}</a>
    </div>
</div>
<div class="section-container">
    <div class="section-contenue">
        <div class="section-contenue-form-container">

            <form id="edit-user-form" name="edit-user-form" action="${createLink(controller:"user",action:"update",id:"${user.id}")}" method="POST" enctype="multipart/form-data">
                <div class="section-contenue-input">
                    <label>Identifiant</label>
                    <input id="id" type="text" class="form-contenue-control" value="${user.id}" disabled readonly/>
                    <div class="fields-error">
                        <p class=" fields-error-message">aaaaaaaaaa</p>
                    </div>
                    <div class="section-contenue-input-descriptor">
                        <span class="nb-characters">0 charactere</span>
                        <span >Maximum 256 charactere</span>
                    </div>
                </div>

                <div class="section-contenue-input">
                    <label>Utilisateur</label>
                    <input id="username" name="username" type="text" class="form-contenue-control" value="${user.username}" />
                    <div class="fields-error">
                        <p class=" fields-error-message">Erreur</p>
                    </div>
                    <div>
                        <span class="nb-characters">${user.username.length()} charactere</span>
                        <span >Maximum 256 charactere</span>
                    </div>
                </div>

                <div class="section-contenue-input">
                    <label for="passwordExpired">Password Expired</label>
                    <select id="passwordExpired" name="passwordExpired" type="text" class="form-contenue-control">
                        <g:if test="${user.enabled == true}">
                            <option value="true" selected>Activé</option>
                            <option value="false" >Désactivé</option>
                        </g:if>
                        <g:else>
                            <option value="true" >Activé</option>
                            <option value="false" selected>Désactivé</option>
                        </g:else>
                    </select>
                </div>

                <div class="section-contenue-input">
                    <label for="accountExpired">Account Expired</label>
                    <select id="accountExpired" name="accountExpired"  class="form-contenue-control">
                        <g:if test="${user.enabled == true}">
                            <option value="true" selected>Activé</option>
                            <option value="false">Désactivé</option>
                        </g:if>
                        <g:else>
                            <option value="true" >Activé</option>
                            <option value="false" selected >Désactivé</option>
                        </g:else>
                    </select>
                </div>

                <div class="section-contenue-input">
                    <label for="accountLocked">Account Locked</label>
                    <select id="accountLocked" name="accountLocked" type="text" class="form-contenue-control">
                        <g:if test="${user.accountLocked == true}">
                            <option value="true" selected>Activé</option>
                            <option value="false" >Désactivé</option>
                        </g:if>
                        <g:else>
                            <option value="true" >Activé</option>
                            <option value="false" selected >Désactivé</option>
                        </g:else>
                    </select>
                </div>
                <div class="section-contenue-input">
                    <label for="enabled">Enabled</label>
                    <select id="enabled" name="enabled" type="text" class="form-contenue-control">
                        <g:if test="${user.enabled == true}">
                            <option value="true" selected>Activé</option>
                            <option value="false">Désactivé</option>
                        </g:if>
                        <g:else>
                            <option value="true" >Activé</option>
                            <option value="false" selected>Désactivé</option>
                        </g:else>
                    </select>
                </div>



                <div class="section-contenue-input">
                    <label>Photo de profile</label>
                    <div class="section-contenue-input-image-container">

                        <div class="section-contenue-input-image-items">
                            <div class="section-contenue-input-image-items-title">
                                <span>${user.img}</span>
                            </div>
                            <div class="section-contenue-input-image-items-pictures">
                                <asset:image src="${user.img}"/>
                            </div>
                        </div>

                        <div class="section-contenue-input-image-items">
                            <div class="section-contenue-input-image-items-title">
                                <span>To Add</span>
                            </div>
                            <div class="section-contenue-input-image-items-pictures">
                                <input style="display: inline" type="file" name="image" id="file" multiple/>
                            </div>
                        </div>

                    </div>
                </div>

            </form>

        </div>
    </div>
    <div class="section-menu">
        <div class="section-menu-container">

            <div class="section-menu-widget status-widget">
                <header>
                    <h2>status</h2>
                </header>
                <button class="custom-button custom-button-success validator" data-form-id="edit-user-form">Modifier</button>
            </div>

            <div class="section-menu-widget status-widget">
                <header>
                    <h2>Gerer</h2>
                </header>

                <form action="${createLink(controller:"user",action:"delete",id:"${user.id}")}" method="DELETE">
                    <button class="custom-button custom-button-danger" data-form-id="edit-user-form">Supprimer</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    const oldValue = {
        id : ${user.id},
        username : '${user.username}',
        passwordExpired : '${user.passwordExpired}',
        accountLocked : '${user.accountLocked}',
        accountExpired : '${user.accountExpired}',
        enabled : '${user.enabled}'
    }
    function validator (formID){
/*
        try {
            let tabIdAttribut = [
                {
                    idHtml: "id",
                    attribut: "id"
                },
                {
                    idHtml: "username",
                    attribut: "username"
                },
                {
                    idHtml: "passwordExpired",
                    attribut: "passwordExpired"
                },                {
                    idHtml: "accountLocked",
                    attribut: "accountLocked"
                },                {
                    idHtml: "accountExpired",
                    attribut: "accountExpired"
                },                {
                    idHtml: "enabled",
                    attribut: "enabled"
                }

            ];
            let newValues = {};
            tabIdAttribut.map(item => {
                const valueItem = $('#' + item.idHtml).val();
                newValues[item.attribut] = valueItem;
            });
            checkValues(oldValue, newValues, tabIdAttribut);
        }
        catch (e){
            throw e;
        }
        */

    }
    function checkValues( oldValues , newValues , comparatif){

        try{
            let changes = 0;
            comparatif.map(item => {
                console.log("item.attribut ",item.attribut);
                if(typeof (oldValues[item.attribut]) === typeof undefined ){

                    let ex=new Error("Identifiant non valide pour l'oldValue");
                    ex.attribut = item
                    throw ex;
                }
                if(typeof (newValues[item.attribut]) === typeof undefined ){
                    let ex =new Error("Identifiant non valide pour la newValues")
                    ex.attribut = item
                    throw ex;
                }

                if(newValues[item.attribut].trim().length ===0){
                    let ex =new Error("Veuillez remplir cette champs");
                    ex.attribut = item
                    throw ex;
                }
                if(oldValues[item.attribut] !== newValues[item.attribut]){
                    changes+=1;
                }
            });

            if(changes === 0){
                let ex = new Error("Vous n'avez rien changer");
                ex.attribut = {
                    idHtml : "states-error"
                }
                throw ex;
            }
        }
        catch (e){
            console.log("error cached",e.attribut);
            throw e;
        }
    }
</script>


</body>
</html>
