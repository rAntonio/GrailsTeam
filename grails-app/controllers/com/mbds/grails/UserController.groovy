package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.beans.factory.annotation.Autowired

import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class UserController {

    @Autowired
    SpringSecurityService springSecurityService

    CustomeUserService customeUserService
    UserService userService
//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count(),menuList : Menu.list()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }
        try {
            def file= request.getFiles("image")
            String fileName = "profil.png"
            if(  file != null ){
                String basePath = grailsApplication.config.annonces.illustrations.path
                for (int i=0; i<file.size(); i++) {
                    fileName = customeUserService.uploaderFichier(file.get(i), basePath)
                }
                user.img = fileName
            }
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(  ) {
        def user = User.get(params.id)
        user.username = params.username
        user.passwordExpired =  Boolean.parseBoolean(params.passwordExpired)
        user.accountLocked = Boolean.parseBoolean(params.accountLocked)
        user.accountExpired = Boolean.parseBoolean(params.accountExpired)
        user.enabled = Boolean.parseBoolean(params.enabled)

        /*
        if( params.newPassword != null  ){
            println user.password
            println params.newPassword
            user.password =  springSecurityService.encodePassword(params.newPassword)
            println( user.password )
        }
        */
        String fileName = user.img
        if (user == null) {
            notFound()
            return
        }
        try {
            def file= request.getFiles("image")
            if(  file != null ){
                String basePath = grailsApplication.config.annonces.illustrations.path
                for (int i=0; i<file.size(); i++) {
                    fileName = customeUserService.uploaderFichier(file.get(i), basePath)
                }
                if( fileName == null ){
                    fileName = user.img
                }
            }
            user.img = fileName
            userService.save(user)
        }catch(Exception e){
            e.printStackTrace()
        }
        catch (ValidationException e) {
            e.printStackTrace()
            respond user.errors, view:'edit'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        userService.delete(id)
        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
