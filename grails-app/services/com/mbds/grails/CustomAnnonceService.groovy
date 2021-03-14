package com.mbds.grails

import grails.gorm.transactions.Transactional

@Transactional
class CustomAnnonceService {

    AnnonceService annonceService

    def getRandomString() {
        // On crée un string aléatoire pour differencier les fichiers
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        StringBuilder sBuilder = new StringBuilder()
        Random rnd = new Random()
        while(sBuilder.length() < 6) {
            int index = (int) (rnd.nextFloat() * alphabet.length());
            sBuilder.append(alphabet.charAt(index));
        }
        return sBuilder.toString()
    }

    def uploaderFichier(def file, String uploadPath) {
        String fileName = this.getRandomString()
        if(file && !file.empty) {
            String temp = file.getContentType()
            String ext = "."+temp.substring(temp.lastIndexOf("/")+1)
            file.transferTo(new File("${uploadPath}/${fileName.concat(ext)}"))
            return fileName.concat(ext)
        } else {
            return
        }
        return null
    }
}
