package com.mbds.grails

class Annonce {

    String title
    String description
    Double price

    Date dateCreated
    Date lastUpdated
    int etat
    static hasMany = [illustrations: Illustration]

    static belongsTo = [author: User]

    static constraints = {
        title       nullable: false, blank: false
        description nullable: false, blank: false
        price       min: 0D
        etat        nullable:false
    }

    static mapping = {
        description type: 'text'
    }
}
