package projet_itu_2020_2021

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "/login/auth"(view:"/login")
        "404"(view:'/notFound')
    }
}
