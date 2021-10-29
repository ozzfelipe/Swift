//
//  AuthManager.swift
//  Spotify Clone
//
//  Created by Locação on 26/02/21.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientId = "d276b5af0351454c89daf850313ee999"
        static let clientSecret = "1398f90fcd894d89a6e9cb004ec031cd"
    }
    
    private init(){}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreashToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreashToken:Bool {
        return false
    }
    
}


