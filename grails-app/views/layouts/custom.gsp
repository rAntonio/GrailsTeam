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
                <div>
                <g:link class="btn btn-back" url="${request.getHeader('referer')}">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 31.494 31.494" width="24px" xml:space="preserve">
                        <path style="fill:#FFFFFF;" d="M10.273,5.009c0.444-0.444,1.143-0.444,1.587,0c0.429,0.429,0.429,1.143,0,1.571l-8.047,8.047h26.554  c0.619,0,1.127,0.492,1.127,1.111c0,0.619-0.508,1.127-1.127,1.127H3.813l8.047,8.032c0.429,0.444,0.429,1.159,0,1.587  c-0.444,0.444-1.143,0.444-1.587,0l-9.952-9.952c-0.429-0.429-0.429-1.143,0-1.571L10.273,5.009z"/>
                    </svg>
                </g:link>
                </div>
                <sec:ifLoggedIn>
                    <div class="banner-icon">
                        <g:form controller="logout">
                            <button type="submit" class="banner-btn-logout">
                                <svg id="light" enable-background="new 0 0 24 24" height="512" viewBox="0 0 24 24" width="512" xmlns="http://www.w3.org/2000/svg"><path d="m13.5 24h-11c-1.378 0-2.5-1.122-2.5-2.5v-19c0-1.378 1.122-2.5 2.5-2.5h11c1.378 0 2.5 1.122 2.5 2.5v6c0 .276-.224.5-.5.5s-.5-.224-.5-.5v-6c0-.827-.673-1.5-1.5-1.5h-11c-.827 0-1.5.673-1.5 1.5v19c0 .827.673 1.5 1.5 1.5h11c.827 0 1.5-.673 1.5-1.5v-6c0-.276.224-.5.5-.5s.5.224.5.5v6c0 1.378-1.122 2.5-2.5 2.5z"/><path d="m23.5 12.5h-15c-.276 0-.5-.224-.5-.5s.224-.5.5-.5h15c.276 0 .5.224.5.5s-.224.5-.5.5z"/><path d="m19.5 16.5c-.128 0-.256-.049-.354-.146-.195-.195-.195-.512 0-.707l3.647-3.647-3.646-3.646c-.195-.195-.195-.512 0-.707s.512-.195.707 0l4 4c.195.195.195.512 0 .707l-4 4c-.098.097-.226.146-.354.146z"/></svg>
                            </button>
                        </g:form>
                    </div>
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
