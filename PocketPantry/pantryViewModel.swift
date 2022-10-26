//import Foundation
//import FirebaseDatabase
//
//final class PantryViewModel: ObservableObject {
//    var pantries: [Pantry] = []
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//
//
//    private lazy var dbPath: DatabaseReference? = {
//        let ref = Database.database().reference().child("Pantries")
//        return ref
//    }()
//
//    func listenRealtimeDatabase() {
//        guard let dbPath = dbPath else {
//            return
//        }
//        dbPath.observe(.childAdded) { [weak self] snapshot in
//            guard
//                let self = self,
//                var json = snapshot.value as? [String: Any]
//            else {
//                return
//            }
//            json["id"] = snapshot.key
//            do {
//                let pantryData = try JSONSerialization.data(withJSONObject: json)
//                let pantry = try self.decoder.decode(Pantry.self, from: pantryData)
//                self.pantries.append(pantry)
//
//                print(pantry.id)
//                print(pantry.foods)
//                print(pantry.userID)
//                print(pantry.isShared)
//
//            } catch {
//                print("An error ocurred", error)
//            }
//        }
//    }
//
//    func stopListening() {
//        dbPath?.removeAllObservers()
//    }
//}
//
////func readPantryData(){
////        let jsonData = Data("""
////        {
////            "Foods": {
////              "1": {
////                "brand": "Null",
////                "category": "produce",
////                "id": 1,
////                "name": "Broccoli"
////              },
////              "2": {
////                "brand": "Hood",
////                "category": "Dairy",
////                "id": 2,
////                "name": "Reduced Fat Milk"
////              },
////              "3": {
////                "brand": "Cabot",
////                "category": "Dairy",
////                "id": 3,
////                "name": "Cheddar Cheese"
////              }
////            },
////            "Pantries": {
////                "foods":[
////                  {
////                    "date_added": "10-22-2022",
////                    "id": 1
////                  },
////                  {
////                    "date_added": "10-10-2022",
////                    "id": 2
////                  }
////                ],
////                "id": 1,
////                "isShared": false,
////                "userID": 1
////            },
////            "Users": {
////                "1": {
////                "email": "'ahambyuvm.edu'",
////                "first": "Anika",
////                "last": "Hamby"
////              }
////            }
////          }
////        """.utf8)
////        do {
////            let pantry = try self.decoder.decode(Pantry.self, from: jsonData)
////            self.pantries.append(pantry)
////
////            print(pantry.id)
////            print(pantry.foods)
////            print(pantry.userID)
////            print(pantry.isShared)
////        } catch {
////            print("An error ocurred", error)
////        }
////    }
