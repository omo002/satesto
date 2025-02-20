import Foundation

// 1. შექმენით კლასი Car.
class Car: UpgradableMovable {
    private var manufacturer: String
    private var buildYear: Int
    private var price: Double
    private var maxSpeedInKm: Double
    
    init(manufacturer: String, buildYear: Int, price: Double, maxSpeedInKm: Double) {
        self.manufacturer = manufacturer
        self.buildYear = buildYear
        self.price = price
        self.maxSpeedInKm = maxSpeedInKm
    }
    
        var maxSpeedInMiles: Double {
        return maxSpeedInKm * 0.621371
    }
    
    
    func move() {
        print("\(manufacturer) car is moving")
    }
    
    
    func upgrade(speedBy: Double) {
        self.maxSpeedInKm += speedBy
        print("\(manufacturer) car speed upgraded by \(speedBy) km/h. New max speed: \(maxSpeedInKm) km/h.")
    }
}

// 2. შექმენით კლასი Motorcycle.

class Motorcycle: UpgradableMovable {
    private var manufacturer: String
    private var price: Double
    private var maxSpeedMS: Double
    private var engineCapacity: Int
    
    init(manufacturer: String, price: Double, maxSpeedMS: Double, engineCapacity: Int) {
        self.manufacturer = manufacturer
        self.price = price
        self.maxSpeedMS = maxSpeedMS
        self.engineCapacity = engineCapacity
    }
    
    
    var maxSpeedInMiles: Double {
        return maxSpeedMS * 2.23694
    }
    
  
    func move() {
        print("\(manufacturer) motorcycle is moving with max speed: \(maxSpeedMS) m/s.")
    }
    
    
    func upgrade(speedBy: Double) {
        self.maxSpeedMS += speedBy
        print("\(manufacturer) motorcycle speed upgraded by \(speedBy) m/s. New max speed: \(maxSpeedMS) m/s.")
    }
}
// 3. შექმენით მინიმუმ 5-5 მანქანა და ბაიკის ინსტანსი

let car1 = Car(manufacturer: "Toyota", buildYear: 2020, price: 25000.0, maxSpeedInKm: 180.0)
let car2 = Car(manufacturer: "Ford", buildYear: 2021, price: 30000.0, maxSpeedInKm: 200.0)
let car3 = Car(manufacturer: "BMW", buildYear: 2019, price: 35000.0, maxSpeedInKm: 220.0)
let car4 = Car(manufacturer: "Audi", buildYear: 2022, price: 45000.0, maxSpeedInKm: 240.0)
let car5 = Car(manufacturer: "Mercedes", buildYear: 2023, price: 55000.0, maxSpeedInKm: 260.0)

let bike1 = Motorcycle(manufacturer: "Harley Davidson", price: 15000.0, maxSpeedMS: 50.0, engineCapacity: 1200)
let bike2 = Motorcycle(manufacturer: "Kawasaki", price: 18000.0, maxSpeedMS: 55.0, engineCapacity: 1000)
let bike3 = Motorcycle(manufacturer: "Yamaha", price: 12000.0, maxSpeedMS: 60.0, engineCapacity: 800)
let bike4 = Motorcycle(manufacturer: "Honda", price: 13000.0, maxSpeedMS: 65.0, engineCapacity: 1000)
let bike5 = Motorcycle(manufacturer: "Ducati", price: 25000.0, maxSpeedMS: 70.0, engineCapacity: 1300)

// 4. შექმენით პროტოკოლი Movable რომელსაც აქვს move() ფუნცქცია და maxSpeedInMiles { get }

protocol Movable {
    var maxSpeedInMiles: Double { get }
    func move()
}

// 5. შექმენით პროტოკოლი Upgradable რომელსაც აქვს upgrade(speedby: Double) ფუნცქცია

protocol Upgradable {
    func upgrade(speedBy: Double)
}

//6.შექმენით typealias UpgradableMovable, რომელიც შეერთებს Movable და Upgradable პროტოკოლებს.

typealias UpgradableMovable = Movable & Upgradable



// 7. შექმენით ახალი მასივი allTransport და ჩასვით შიგნით ყველა ტრანსპორტი

var allTransport: [UpgradableMovable] = [car1, car2, car3, car4, car5, bike1, bike2, bike3, bike4, bike5]


//8. რენდომად 4 ელემენტს განუახლეთ სისწრაფე upgrade(speed by: Double), რენდომ ერთეულით 0...100 ის შუალედში

for _ in 1...4 {
    let randomIndex = Int.random(in: 0..<allTransport.count)
    let randomUpgradeValue = Double.random(in: 0...100)
    
    allTransport[randomIndex].upgrade(speedBy: randomUpgradeValue)
}
//9. დაასორტირეთ maxSpeedInMiles ის ზრდადობის მიხედვით


let sortedTransport = allTransport.sorted { $0.maxSpeedInMiles < $1.maxSpeedInMiles }

// 10. ეს ამ დასორტირებულ მასივზე გამოიძახეთ foreach ფუნქცია და დაბეჭდეთ თითოეული ელემენტისთვის. მაგ

print("\nSorted Transport Info by Max Speed in Miles (Ascending Order):")

sortedTransport.forEach { transport in
    if let car = transport as? Car {
        
        car.move()
        print("Maximum Speed: \(car.maxSpeedInMiles) miles per hour")
    } else if let motorcycle = transport as? Motorcycle {
        
        motorcycle.move()
        print("Maximum Speed: \(motorcycle.maxSpeedInMiles) miles per hour")
    }
    print("------")
}

