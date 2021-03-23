package com.mbds.grails

class Menu {
    String name
    String href
    static constraints = {
        name nullable: false , blank: false
        href nullable: false , blank: false
    }
    static mapping = {
        name type: 'text'
        href type: 'text'
    }
}
