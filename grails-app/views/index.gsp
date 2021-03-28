<!doctype html>
<html>
<head>
    <meta name="layout" content="custom"/>
    <title>LE COIN COIN</title>
</head>
<body>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODO">
    <g:include controller="annonce" action="index"/>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_USER">
    <h3 style="margin: 22% auto;text-align: center;">Votre compte ne dispose pas du droit d'accès à cette page.</h3>
</sec:ifAnyGranted>
</body>
</html>
