package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured('ROLE_ADMIN')
class ApiController {

    AnnonceService annonceService

//    GET / PUT / PATCH / DELETE -- in progress
    //url : localhost:8081/api/annonce/{id}
    def annonce() {
        def annonceInstance;
        switch (request.getMethod()) {
        //Postman API : Annonce/Get Annonce
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(annonceInstance, request.getHeader("Accept"));
                break
        //Postman API : Annonce/Update Annonce (PUT)
            case "PUT":
                print params.id
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                annonceInstance = Annonce.get(params.id)

                //updated field
                    if (request.JSON.title && request.JSON.price && request.JSON.description && request.JSON.author) {
                        annonceInstance.title = request.JSON.title
                        annonceInstance.price = request.JSON.price
                        annonceInstance.description = request.JSON.description
                        def author = User.findById(request.JSON.author.id)
                        if(author)
                            annonceInstance.author = author
                        else
                            return response.status = HttpServletResponse.SC_BAD_REQUEST
                        annonceInstance.lastUpdated = new Date();
                        annonceService.save(annonceInstance);
                        return response.status = HttpServletResponse.SC_OK
                    }
                return response.status = HttpServletResponse.SC_BAD_REQUEST
                break;
            case "PATCH":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                String query = "update Annonce set "
                def paramsMap = [:]
                def valid = false
                paramsMap.id = Long.parseLong(params.id)

                //updated field
                    if (request.JSON.title && request.JSON.title != "") {
                        query += "title=(:title) "
                        paramsMap.title = request.JSON.title
                        valid = true
                    }
                    if (request.JSON.price && request.JSON.price != "") {
                        query += "price=(:price) "
                        paramsMap.price = request.JSON.price
                        valid = true
                    }
                    if (request.JSON.description && request.JSON.description != "") {
                        query += "description=(:description) "
                        paramsMap.description = request.JSON.description
                        valid = true
                    }
                    if (request.JSON.author && request.JSON.author != "") {
                        query += "authorId=(:author) "
                        paramsMap.author = request.JSON.author.id
                        valid = true
                    }
                if(valid) {
//                    paramsMap.lastUpdated = new Date();
                    query += "where id=(:id)"
                    print Annonce.executeUpdate(query, paramsMap)
                    return response.status = HttpServletResponse.SC_NO_CONTENT
                }
                return response.status = HttpServletResponse.SC_BAD_REQUEST
                break
            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                annonceService.delete(Long.parseLong(params.id))
                return response.status = HttpServletResponse.SC_NO_CONTENT
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST --tester
    //url : localhost:8081/api/annonces
    def annonces() {
        def annonceInstance;
        switch (request.getMethod()) {
            //Postman API : Annonce/GET Annonces
            case "GET":
                def annonces = Annonce.getAll();
                serializeData(annonces, request.getHeader("Accept"))
                break;
            //Postman API : Annonce/Create Annonce (POST)
            case  "POST":
                    annonceInstance = new Annonce()
                    if(request.JSON.title && request.JSON.title != "") annonceInstance.title = request.JSON.title
                    if(request.JSON.price && request.JSON.price != "") annonceInstance.price = request.JSON.price
                    if(request.JSON.description && request.JSON.description != "") annonceInstance.description = request.JSON.description
                    if(request.JSON.author && request.JSON.author != "")
                        annonceInstance.author = User.findById(request.JSON.author.id)
                    if(request.JSON.author && request.JSON.author != "") {
                        def illustrationsId = request.JSON.illustrations.collect { it.id };
                        annonceInstance.illustrations = Illustration.findAllByIdInList(illustrationsId)
                    }
                    if(annonceInstance) {
                        def annonces = annonceService.save(annonceInstance);
                        serializeData(annonces, request.getHeader("Accept"));
                    }
                break;
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / PUT / PATCH / DELETE --not tested --collection missing
    def user() {
        def userInstance;
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(userInstance, request.getHeader("Accept"));
            case  "PUT":
                if (!params.id) return response.status = HttpServletResponse.SC_BAD_REQUEST
                String query = "update User set "
                def paramsMap = [:]
                paramsMap.id = Long.parseLong(params.id)
                    if (params.username && params.username != "") {
                        query += "username=(:username) "
                        paramsMap.username = params.username
                    }
                query += "where id=(:id)"
                User.executeUpdate(query, paramsMap)
                return response.status = HttpServletResponse.SC_OK
                break;
            case "PATCH":
                break;
            case "DELETE":
                break;
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST --not tested --collection missing
    def users() {
        def userInstance;
        switch (request.getMethod()) {
            case "GET":
                def users = User.getAll();
                serializeData(users, request.getHeader("Accept"))
                break;
            case  "POST":
                userInstance = new User()
                if(request.JSON.username && request.JSON.username != "") userInstance.username = request.JSON.username
                if(request.JSON.password && request.JSON.password != "") userInstance.password = request.JSON.password
                if(userInstance) {
                    userInstance.save()
                    if(request.JSON.role && request.JSON.role != "") {
                        UserRole.create(userInstance, Role.get(request.JSON.role),true)
                    }
                    return response.status = HttpServletResponse.SC_OK
                } else
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                break;
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

    def serializeData(object, format)
    {
        switch (format)
        {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
        }
    }
}
