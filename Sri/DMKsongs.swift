//
//  DMKImage.swift
//  DMK Songs
//
//  Created by Mac on 2/16/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation

class DMKSongs {

    fileprivate var _name: String!
    fileprivate var _imageId: Int!
    fileprivate var _songlink: String!

    var name: String {

        return _name
    }

    var songlink: String {

        return _songlink
    }
    var imageId: Int {

        return _imageId
    }

    init(name: String, imageId: Int, songLink: String) {
        
    self._name = name
    self._imageId = imageId
    self._songlink = songLink

    //_pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
}
