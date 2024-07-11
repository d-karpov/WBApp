import UIKit

class Person: Hashable {
	
	let name: String
	let surname: String
	let age: Int
	weak var passport: Passport?
	var fullname: String {
		name + " " + surname
	}
	
	init(name: String, surname: String, age: Int, passport: Passport? = nil) {
		self.name = name
		self.surname = surname
		self.age = age
		self.passport = passport
		
		print("🙋🏻‍♂️ inited \(fullname)")
	}
	
	deinit {
		print("☠️ deinited \(fullname)")
	}
	
	static func == (lhs: Person, rhs: Person) -> Bool {
		lhs.passport == rhs.passport && lhs.fullname == rhs.fullname
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(passport?.id)
		hasher.combine(fullname)
	}
}

class Passport: Equatable {
	
	let id: String
	var owner: Person
	
	init(id: String, owner: Person) {
		self.id = id
		self.owner = owner
		
		print("🪪 inited for \(owner.fullname)")
		
	}
	
	deinit {
		print("❌ 🪪 deinited for - \(owner.fullname)")
	}
	
	static func == (lhs: Passport, rhs: Passport) -> Bool {
		lhs.id == rhs.id
	}
	
}

class Factory {
	let name: String
	private(set) var team: Set<Person>
	
	enum Materials: String {
		case wood, iron, stone
	}
	
	init(name: String) {
		self.name = name
		team = .init()
		
		print("🏭 - \(name)")
	}
	
	deinit {
		print("🔥 - \(name)")
	}
	
	func hirePerson(_ person: Person) {
		if person.passport?.id != nil, team.insert(person).inserted {
			print("✅ \(person.fullname) hired!")
		} else {
			print("❌ \(person.fullname) decline!")
		}
	}
	
	func firePerson(_ person: Person) {
		if let fired = team.remove(person) {
			print("👋🏻 \(fired.fullname)")
		} else {
			print("❌ \(person.fullname) does'n work with us")
		}
	}
	
	func produceMaterial(_ material: Materials) {
		print("Produced - \(material.rawValue)")
	}
}


func startFactory() {
	let factory: Factory = .init(name: "GoodWood")
	
	
	let worker1 = Person(name: "Den", surname: "S", age: 30)
	let worker2 = Person(name: "Den", surname: "W", age: 20)
	let worker3 = Person(name: "Den", surname: "L", age: 13)
	
	let passport1 = Passport(id: UUID().uuidString, owner: worker1)
	let passport2 = Passport(id: UUID().uuidString, owner: worker2)
	
	worker1.passport = passport1
	worker2.passport = passport2
	
	
	let workers = [worker1, worker2, worker3]
		
	workers.forEach { person in
		factory.hirePerson(person)
	}
	
	factory.firePerson(worker3)
	factory.firePerson(worker2)
	
	factory.produceMaterial(.iron)
	factory.produceMaterial(.wood)
	factory.produceMaterial(.stone)
	
}

startFactory()
