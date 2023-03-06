// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation


public final class UserSigninQuery: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    
    
    public let operationDefinition =
    """
    mutation SignIn($input: SignIn!) {
    signIn(input: $input) {
    __typename
          user{
          __typename
               id
               email
               }
               auth {
          __typename
                   authenticationToken
               }
      }
    }
    """
    
    
    public let operationName = "SignIn"
    
    public var inputs: Dictionary<String,Any>
    
    public init(input: Dictionary<String,Any>) {
        self.inputs = input
    }

    public var variables: GraphQLMap? {
        return ["input": inputs]
    }
    
    
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes = ["Mutation"]
        
        
        public static let selections: [GraphQLSelection] = [
            GraphQLField("signIn", arguments: ["input": GraphQLVariable("input")], type: .object(SignIn.selections)),
        ]
        
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(signDetail: SignIn? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mutation", "signIn": signDetail.flatMap { (value: SignIn) -> ResultMap in value.resultMap }])
        }
        
        public var signDetail: SignIn? {
          get {
            return (resultMap["signIn"] as? ResultMap).flatMap { SignIn(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "signIn")
          }
        }

        public struct SignIn:GraphQLSelectionSet{
            public static let possibleTypes = ["SignIn"]
            
            public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("user", type: .nonNull(.object(UserDetails.selections))),
                GraphQLField("auth", type: .nonNull(.object(AuthDetails.selections))),
            ]
            
            public private(set) var resultMap: ResultMap
            
            public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
            }
            
            public init(user:UserDetails,auth:AuthDetails){
                self.init(unsafeResultMap: ["__typename": "SignIn","user": user, "auth": auth])
            }
            
            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }
            
            public var userDetail: UserDetails? {
              get {
                return (resultMap["user"] as? ResultMap).flatMap { UserDetails(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "user")
              }
            }
            
            public var authDetail: AuthDetails? {
              get {
                return (resultMap["auth"] as? ResultMap).flatMap { AuthDetails(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "auth")
              }
            }
            

            
            public struct UserDetails: GraphQLSelectionSet {
                public static let possibleTypes = ["User"]
                
                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(String.self)),
                 //   GraphQLField("name", type: .scalar(String.self)),
                    GraphQLField("email", type: .scalar(String.self)),
                ]
                
                public private(set) var resultMap: ResultMap
                
                public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                }
                
                public init(id: String? = nil, name: String, email: String) {
                    self.init(unsafeResultMap: ["__typename": "User","id": id, "name": name, "email": email])
                }
                
                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }
                
                public var id: String? {
                    get {
                        return resultMap["id"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "id")
                    }
                }
                
                public var name: String? {
                    get {
                        return resultMap["name"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "name")
                    }
                }
                
                public var email: String {
                    get {
                        return resultMap["email"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "email")
                    }
                }
            }
            
            public struct AuthDetails: GraphQLSelectionSet {
                public static let possibleTypes = ["Auth"]
                
                public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                 //   GraphQLField("id", type: .scalar(String.self)),
                    GraphQLField("authenticationToken", type: .scalar(String.self)),
                ]
                
                public private(set) var resultMap: ResultMap
                
                public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                }
                
                public init(id: String? = nil, authenticationToken: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Auth","id": id, "authenticationToken": authenticationToken])
                }
                
                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }
                
                public var id: String? {
                    get {
                        return resultMap["id"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "id")
                    }
                }
                
                public var authenticationToken: String? {
                    get {
                        return resultMap["authenticationToken"] as? String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "authenticationToken")
                    }
                }
            }
        }
    }
}


public final class LoadParkListQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition =
      """
      query FetchCalendarEvents($page: Int!, $parkId: ID!) {
          fetchCalendarEvents(page:$page,parkId:$parkId){
              __typename
      eve {
      __typename
      allDayStatus
      createdAt
      createdBy
      createdEmail
      createdTimezone
      description
      endDate
      endTime
      eventDate
      eventName
      eventType
      id
      startTime
      updatedAt
      park {
        __typename
        id
        address
        name
        timezone
        state
      }
      }
        date
      }
      }
      """

    public let operationName = "FetchCalendarEvents"
      
      public var page:Int
      public var parkID:GraphQLID

    //public var queryDocument: String { return operationDefinition.appending(ContactDetails.fragmentDefinition) }

      public init(page:Int,parkID:GraphQLID) {
          self.page = page
          self.parkID = parkID
    }
      public var variables: GraphQLMap?{
          return ["page":page,"parkId":parkID]
      }


  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("fetchCalendarEvents",arguments: ["page": GraphQLVariable("page"),"parkId": GraphQLVariable("parkId")], type: .nonNull(.list(.nonNull(.object(FetchCalendarEvents.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(caldendarEvents: [FetchCalendarEvents]) {
      self.init(unsafeResultMap: ["__typename": "Query", "fetchCalendarEvents": caldendarEvents.map { (value: FetchCalendarEvents) -> ResultMap in value.resultMap }])
    }

    public var caldendarEvents: [FetchCalendarEvents] {
      get {
        return (resultMap["fetchCalendarEvents"] as! [ResultMap]).map { (value: ResultMap) -> FetchCalendarEvents in FetchCalendarEvents(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FetchCalendarEvents) -> ResultMap in value.resultMap }, forKey: "fetchCalendarEvents")
      }
    }

    public struct FetchCalendarEvents: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FetchCalendarEvents"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("eve", type: .nonNull(.object(Eevents.selections)))
          //GraphQLField("states", type: .nonNull(.list(.nonNull(.object(State.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(date: String, eve: Eevents) {
        self.init(unsafeResultMap: ["__typename": "FetchCalendarEvents", "date": date, "eve": eve])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }


      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }
        
        public var event: Eevents? {
          get {
            return (resultMap["eve"] as? ResultMap).flatMap { Eevents(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "eve")
          }
        }

        
        public struct Eevents:GraphQLSelectionSet{
            public static let possibleTypes: [String] = ["Eve"]
            
            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("allDayStatus", type: .nonNull(.scalar(Int.self))),
                    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                    GraphQLField("createdBy", type: .nonNull(.scalar(String.self))),
                    GraphQLField("createdEmail", type: .nonNull(.scalar(String.self))),
                    GraphQLField("createdTimezone", type: .nonNull(.scalar(String.self))),
                    GraphQLField("description", type: .nonNull(.scalar(String.self))),
                   //  GraphQLField("endDate", type: .nonNull(.scalar(String.self))),
                    GraphQLField("endTime", type: .nonNull(.scalar(String.self))),
                    GraphQLField("eventDate", type: .nonNull(.scalar(String.self))),
                    GraphQLField("eventName", type: .nonNull(.scalar(String.self))),
                    GraphQLField("eventType", type: .nonNull(.scalar(String.self))),
                    GraphQLField("startTime", type: .nonNull(.scalar(String.self))),
                    GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                 //   GraphQLField("park", type: .nonNull(.object(Park.selections)))
                ]
            }
            
            public private(set) var resultMap: ResultMap
            
            public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
            }
            
            public init(allday: String, createdAt: String,createdBy: String, createdEmail: String,createdTimezone: String, description: String,endDate: String, endTime: String,eventName: String, eventType: String,startTime: String, updatedAt: String,id: GraphQLID, park: Park) {
                self.init(unsafeResultMap: ["__typename": "Eve", "allDayStatus": allday, "createdAt": createdAt,"createdBy":createdBy,"createdEmail":createdEmail,"createdTimezone":createdTimezone,"description":description,"endDate":endDate,"endTime":endTime,"eventName":eventName,"eventType":eventType,"startTime":startTime,"updatedAt":updatedAt,"id":id, "park": park])
            }
            
            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }
            
            
            public var allDayStatus: String {
                get {
                    return resultMap["allDayStatus"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "allDayStatus")
                }
            }
            
            public var createdAt: String {
                get {
                    return resultMap["createdAt"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "createdAt")
                }
            }
            
            public var createdBy: String {
                get {
                    return resultMap["createdBy"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "createdBy")
                }
            }
            
            public var createdEmail: String {
                get {
                    return resultMap["createdEmail"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "createdEmail")
                }
            }
            
            public var createdTimezone: String {
                get {
                    return resultMap["createdTimezone"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "createdTimezone")
                }
            }
            
            public var description: String {
                get {
                    return resultMap["description"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "description")
                }
            }
            
            public var endDate: String {
                get {
                    return resultMap["endDate"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "endDate")
                }
            }
            
            public var endTime: String {
                get {
                    return resultMap["endTime"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "endTime")
                }
            }
            
            public var eventDate: String {
                get {
                    return resultMap["eventDate"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "eventDate")
                }
            }
            
            public var eventName: String {
                get {
                    return resultMap["eventName"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "eventName")
                }
            }
            
            public var eventType: String {
                get {
                    return resultMap["eventType"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "eventType")
                }
            }
            
            public var startTime: String {
                get {
                    return resultMap["startTime"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "startTime")
                }
            }
            
            public var updatedAt: String {
                get {
                    return resultMap["updatedAt"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "updatedAt")
                }
            }
            
            public var id: GraphQLID {
                get {
                    return resultMap["id"]! as! GraphQLID
                }
                set {
                    resultMap.updateValue(newValue, forKey: "id")
                }
            }
            
            public var event: Park? {
              get {
                return (resultMap["park"] as? ResultMap).flatMap { Park(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "park")
              }
            }
            
            public struct Park:GraphQLSelectionSet{
                public static let possibleTypes: [String] = ["Park"]
                
                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("address", type: .nonNull(.scalar(String.self))),
                        GraphQLField("name", type: .nonNull(.scalar(String.self))),
                        GraphQLField("state", type: .nonNull(.scalar(String.self))),
                        GraphQLField("timezone", type: .nonNull(.scalar(String.self))),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    ]
                }
                
                public private(set) var resultMap: ResultMap
                
                public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                }
                
                public init(address: String, name: String,state: String, timezone: String,id: GraphQLID) {
                    self.init(unsafeResultMap: ["__typename": "Park", "address": address, "name": name,"state":state,"timezone":timezone,"id":id])
                }
                
                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }
                
                
                public var address: String {
                    get {
                        return resultMap["address"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "address")
                    }
                }
                
                public var name: String {
                    get {
                        return resultMap["name"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "name")
                    }
                }
                
                public var state: String {
                    get {
                        return resultMap["state"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "state")
                    }
                }
                
                public var timezone: String {
                    get {
                        return resultMap["timezone"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "timezone")
                    }
                }
                
                public var id: GraphQLID {
                    get {
                        return resultMap["id"]! as! GraphQLID
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "id")
                    }
                }
            }
        }
    }
  }
}



