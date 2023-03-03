//
//  Apollo.swift
//  XcodersGraphQL
//
//  Created by Mohammad Azam on 8/9/21.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://fetchpark-staging-api.herokuapp.com/graphql")!)
    
    private init() {
        
    }
}




//mutation SignIn($input: {$email: String!,$password:String!,$deviceToken:String!,$deviceOS:String!,$deviceModel:String!,$timezone:String!}) {
//    signIn(input:$Input){
//          user{
//               id
//               email
//               }
//               auth {
//                   authenticationToken
//               }
//      }
//}
