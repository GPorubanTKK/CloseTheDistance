//
//  CtdApi.swift
//  MyApp
//
//  Created by Gedeon P on 11/11/26.
//

import SwiftUI

class CtdApi {
    private typealias ResponseCode = Int
    private typealias Headers = Dictionary<String, String>
    
    private func putEndpoint<T: Encodable, R: Decodable>(endpoint: String, payload: T) async -> (response: R?, code: ResponseCode) {
        return (nil, 0)
    }
    
    private func deleteEndpoint(endpoint: String) async -> ResponseCode {
        return 0
    }
    
    private func postEndpoint<T: Encodable, R: Decodable>(endpoint: String, payload: T, headers: Headers) async throws -> (response: R?, code: ResponseCode) {
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            for (name, value) in headers {
                request.setValue(value, forHTTPHeaderField: name)
            }
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                if let urlResponse = response as? HTTPURLResponse {
                    if(urlResponse.statusCode < 200 || urlResponse.statusCode > 299) {
                        return (nil, urlResponse.statusCode)
                    } else {
                        return (decodeJson(payload: data), urlResponse.statusCode)
                    }
                } else {
                    throw ApiError.InvalidProtocol
                }
            } catch {
                throw ApiError.ServerError
            }
        }
        throw ApiError.MalformedURL(ep: endpoint)
    }
    
    private func getEndpoint<T: Decodable>(endpoint: String, headers: Headers = [:]) async throws -> T? {
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            for (name, value) in headers {
                request.setValue(value, forHTTPHeaderField: name)
            }
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                if let urlResponse = response as? HTTPURLResponse {
                    if(urlResponse.statusCode < 200 || urlResponse.statusCode > 299) {
                        return nil
                    } else {
                        return decodeJson(payload: data)
                    }
                } else {
                    throw ApiError.InvalidProtocol
                }
            } catch {
                throw ApiError.ServerError
            }
        }
        throw ApiError.MalformedURL(ep: endpoint)
    }
    
    private func decodeJson<T: Decodable>(payload: Data) -> T? {
        return nil
    }
    
    public enum ApiError: Error {
        case MalformedURL(ep: String)
        case InvalidProtocol
        case ServerError
    }
}
