//: Playground - noun: a place where people can play

import Foundation
///Two examples of when Optional<Optional<Type>> can occur


// —— 
@objc protocol OptProtocol {
	@objc optional var name: String? { get set }
}


// —— Accessing optional property in a @objc protocol ————
enum MyError: Error {
	case danger
}

class MyClass: OptProtocol {
	var name: String?
}

let obj = MyClass()


print("type of name in the class: \(type(of: obj.name))")
// optional property in an @objc protocol with Optional type
print("type of name in the protocol: \(type(of: (obj as OptProtocol).name))")

// ——————————————————



// —— Using 'try?' ————
class AnotherClass {
	func myFunc(value: Int) throws -> String? {
		if value == 0 { return "0" }
		else { throw MyError.danger }
	}
}


//
let anotherObj = AnotherClass()
let tryRes = try? anotherObj.myFunc(value: 0)
print(type(of: tryRes))

// casting from double optional to single optional
let singleOptional = (try? anotherObj.myFunc(value: 0)) as? String
print(type(of: singleOptional))

