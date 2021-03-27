package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class AnnonceController {
    CustomAnnonceService customAnnonceService
    AnnonceService annonceService
    MenuService menuService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count(),menuList : Menu.list()]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        respond new Annonce(params),model: [userList: User.list()]
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        def file= request.getFiles("image")
        String basePath = grailsApplication.config.annonces.illustrations.path
        try {
            for (int i=0; i<file.size(); i++) {
                String fileName = customAnnonceService.uploaderFichier(file.get(i), basePath)
                annonce.addToIllustrations(new Illustration(filename: fileName))
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id),  model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    def update() {
        def annonce = Annonce.get(params.id)
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Double.parseDouble(params.price)
        annonce.etat=Integer.parseInt(params.etat)
//        annonce.author = User.get(params.author.id)
        if (annonce == null) {
            notFound()
            return
        }
        /**
         * 1. Récupérer le fichier dans la requête
         * 2. Sauvegarder le fichier localement
         * 3. Créer un illustration sur le fichier que vous avez sauvegardé
         * 4. Attacher l'illustration nouvellement créée à l'annonce
         */

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            e.printStackTrace()
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
