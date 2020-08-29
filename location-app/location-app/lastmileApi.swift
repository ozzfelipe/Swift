//
//  lastmileApi.swift
//  location-app
//
//  Created by AMcom on 29/06/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

class LastMileApi{
    private static let basePath: String = "https://api-ultragaz.sensedia.com/hml/residential/last-mile/v1/lastmile/deliveryman/self/localizacao"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.httpAdditionalHeaders = ["Content-Type": "aplication/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func sendLocation(accessToken: String, tokenClient: String, lat: String, long: String,onUserDeconected: @escaping (Bool) -> Void, onComplete: @escaping (Bool) -> Void){
        guard let url = URL(string: basePath) else {
            print("erro montar URL")
            onComplete(false)
            onUserDeconected(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue(accessToken, forHTTPHeaderField: "access_token")
        request.addValue(tokenClient, forHTTPHeaderField: "token_client")
        request.addValue(lat, forHTTPHeaderField: "latitude")
        request.addValue(long, forHTTPHeaderField: "longitude")
        request.addValue("b151ff0e-3fa9-3bc5-b12e-80ee321a538d"
, forHTTPHeaderField: "client_id")
        guard let json = try? JSONEncoder().encode(["data":""]) else {return}
        
        request.httpBody = json
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                guard let res = response as? HTTPURLResponse else {return}
                if res.statusCode == 200 {
                    let date = Date()
                    let calendar = Calendar.current
                    let hour = calendar.component(.hour, from: date)
                    let minutes = calendar.component(.minute, from: date)
                    let seconds = calendar.component(.second, from: date)
                print("Localização enviada com sucesso: \(hour):\(minutes):\(seconds)")
                }
                onComplete(true)
                onUserDeconected(false)
            } else {
                guard let res = response as? HTTPURLResponse else {return}
                if res.statusCode == 419 {
                print("Usuário desconectado")
                    onComplete(false)
                    onUserDeconected(true)
                    return
                }
                onComplete(false)
                onUserDeconected(false)
            }
        }
        dataTask.resume()
        
    }
    
    //    private static let configurationBackground: URLSessionConfiguration = {
    //        let config = URLSessionConfiguration.background(withIdentifier: "sendLocationBackground")
    //        config.timeoutIntervalForRequest = 10
    //        config.httpAdditionalHeaders = ["Content-Type": "aplication/json"]
    //        config.httpAdditionalHeaders = ["client_id": "b151ff0e-3fa9-3bc5-b12e-80ee321a538d"]
    ////        config.httpAdditionalHeaders = ["access_token": "56b27bad-12b5-3bf7-b234-91134b69d8eb"]
    ////        config.httpAdditionalHeaders = ["token_client": "8-FqPrc2Xa_jUKh76LDnOETUKg3UvT"]
    //        return config
    //    }()
    //
    //    private static let sessionBackground = URLSession(configuration: configurationBackground)

    
//    class func sendLocationBackground(accessToken: String, tokenClient: String, onComplete: @escaping (Bool) -> Void){
//        guard let url = URL(string: basePath) else {
//            print("erro montar URL")
//            onComplete(false)
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "PUT"
//        request.addValue(accessToken, forHTTPHeaderField: "access_token")
//        request.addValue(tokenClient, forHTTPHeaderField: "token_client")
//        guard let json = try? JSONEncoder().encode(["data":""]) else {return}
//
//        request.httpBody = json
//
//        let dataTask = sessionBackground.dataTask(with: request) { (data, response, error) in
//            if error == nil {
//                guard let res = response as? HTTPURLResponse, res.statusCode == 200, let data = data else {
//                    onComplete(false)
//                    return
//                }
//                print(data)
//                onComplete(true)
//            } else {
//                onComplete(false)
//            }
//        }
//        dataTask.resume()
//
//    }
}
