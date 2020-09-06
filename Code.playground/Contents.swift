// MARK: - Объявление переменных

var variableInt = 1
let constantInt = 2

variableInt = 2
variableInt += 1

// constantInt = 3
// Error: Cannot assign to value: 'constantInt' is a 'let' constant

var variableInt2: Int
variableInt2 = 42
var variableInt3: Int = 42
var variableInt4: Int = Int(42)

// MARK: - Примитивные типы данных

let myString: String = "Hello, world!"
let myInt: Int = 42
let myFloat: Float = 42
let myDouble: Double = 42
let myTrueBoolean: Bool = true
let myFalseBoolean: Bool = false

// MARK: - Опционалы

var myOptionalString: String?
myOptionalString = "Hello"
myOptionalString = nil

// MARK: - Tuples

var nameAndAge: (String, Int) = ("Vasya Pupkin", 18)
nameAndAge.0
nameAndAge.1

var nameAndAge1: (name: String, age: Int) = ("Ivan Ivanov", 20)
nameAndAge1.0
nameAndAge1.1
nameAndAge1.name
nameAndAge1.age

nameAndAge1 = nameAndAge
nameAndAge
nameAndAge1

// MARK: - Массивы

// Array<Element>
var myIntArray = [ 1, 2, 3, 4, 5 ]
var myIntArray1: [Int] = [ 1, 2, 3 ]
var myIntArray2: Array<Int> = [ 1, 2, 3, 4]
var myIntArray3 = Array<Int>()
var myIntArray4 = [Int]()

let firstItem = myIntArray[0]
firstItem
let safeFirstItem = myIntArray.first
safeFirstItem
myIntArray3.first
myIntArray2[1] = 6
myIntArray2

// MARK: - Словари

// Dictionary<Key, Value>
var gasolinePrices: [String: Int] = [ "92": 43, "95": 45, "100": 55 ]
gasolinePrices
let priceOf92 = gasolinePrices["92"]
gasolinePrices["98"] = 48
gasolinePrices["100"] = nil
gasolinePrices

// MARK: - Functions

// Объявление функции
func myFunctionThatDoesNothing() {
}

// Использование функции
myFunctionThatDoesNothing()

// Функция для печати print()
func myFunctionThatPrints() {
    print("Hello")
    print(myString)
    print(myString, myInt, myDouble)
    print(myString, myInt, myDouble, separator: "—")
}

// myFunctionThatPrints()

func printSum(of a: Int, and b: Int) {
    print(a + b)
}

// printSum(of: myInt, and: 30)

func getSum(of a: Int, and b: Int) -> Int {
    let result = a + b
    return result
}

func getSum2(of a: Int, and b: Int) -> Int {
    // return для функций писать не обязательно, если в ней выполняется одно действие
    a + b
}

func multiply(x: Int, by y: Int) -> Int {
    x * y
}

let mySumResult = getSum(of: 3, and: 3)
let myMultiplicationResult = multiply(x: 3, by: 3)

// MARK: - Циклы и условия

let arrayForSumTests = [1, 2, 3, 4, 5, 6]

func sum(of array: [Int]) -> Int {
    var result = 0
    for integerValue in array {
        result += integerValue
    }
    return result
}

sum(of: arrayForSumTests)

func sumOfEvenNumbers(in array: [Int]) -> Int {
    var result = 0
    for value in array {
        if value % 2 == 0 {
            result += value
        }
    }
    return result
}

sumOfEvenNumbers(in: arrayForSumTests)

func printGasolinePrices() {
    for (key, value) in gasolinePrices {
        print("АИ-\(key): \(value)₽")
    }
}

// printGasolinePrices()

let studentsAndScores: [String: Int] = [
    "V.Pupkin": 50,
    "S.Petrov": 37,
    "A.Ivanov": 65,
    "N.Sidorov": 25,
    "N.Udachnij": 42
]

func printStudentResults() {
    for (name, score) in studentsAndScores {
        let result: String
        if score >= 60 || score == 42 {
            result = "A+. No exams."
        } else if score < 28 {
            result = "F. Pay respects."
        } else {
            result = "Need to pass exams."
        }
        print("Name:", name, "Score:", score, "Result:", result)
    }
}

// printStudentResults()

// MARK: - Классы

class MyClass {
}

let classExample = MyClass()
let classExample2 = MyClass.init()

class MyClassWithInt {
    var int: Int
    
    init() {
        int = 42
    }
    
    init(int: Int) {
        self.int = int
    }
}

let myIntClass = MyClassWithInt()
let myIntClass2 = MyClassWithInt(int: 42)
myIntClass.int

// MARK: - Протоколы

protocol MakingSounds {
    func makeSound()
}

class LivingBeing {
}

class Animal: LivingBeing, MakingSounds {
    func makeSound() {
        fatalError("We don't know this.")
    }
}

class Fox: Animal {
}

protocol Pet {
    var name: String? { get set }
}

class Dog: Animal, Pet {
    var name: String?
    
    override func makeSound() {
        print("Bark!")
    }
}

extension Pet {
    func whatsYourName() {
        if let name = name, let soundProducer = self as? MakingSounds {
            soundProducer.makeSound()
            print("[\(name)]")
        }
    }
}

let fox = Fox()
// fox.makeSound()
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).

let dog = Dog()
dog.name = "Bobik"
// dog.whatsYourName()
// Bark!
// [Bobik]

// MARK: - Структуры и перечисления

class Unit {
    let name: String
    let maximumHP: Int
    var currentHP: Int {
        didSet {
            if currentHP <= 0 {
                // print("\(name) dies")
            }
        }
    }
    
    init(name: String, maximumHP: Int) {
        self.name = name
        self.maximumHP = maximumHP
        self.currentHP = maximumHP
    }
}

protocol Weapon {
    mutating func dealDamage(to unit: Unit)
}

enum ItemQuality {
    case legendary
    case epic
    case rare
    case normal
}

struct Axe: Weapon {
    let damage: Int
    let quality: ItemQuality
    
    func dealDamage(to unit: Unit) {
        let multiplier: Double
        switch quality {
        case .legendary:
            multiplier = 2
        case .epic:
            multiplier = 1.5
        case .rare:
            multiplier = 1.2
        case .normal:
            multiplier = 0.9
        }
        unit.currentHP -= Int(Double(damage) * multiplier)
    }
}

extension Unit {
    func isAlive() -> Bool {
        currentHP > 0
    }
}

struct Chainsaw: Weapon {
    let quality: ItemQuality
    var energy = 10
    
    mutating func dealDamage(to unit: Unit) {
        guard unit.isAlive(), energy > 0 else { return }

        switch quality {
        case .legendary:
            unit.currentHP -= (unit.maximumHP / 2)
        case .epic, .rare:
            unit.currentHP /= 2
        case .normal:
            unit.currentHP = Int(Double(unit.currentHP) * 0.7)
        }
        energy -= 1
    }
}

class ChainsawAsClass: Weapon {
    let quality: ItemQuality
    private var energy = 3
    
    init(quality: ItemQuality) {
        self.quality = quality
    }
    
    func dealDamage(to unit: Unit) {
        guard unit.isAlive(), energy > 0 else { return }

        switch quality {
        case .legendary:
            unit.currentHP -= (unit.maximumHP / 2)
        case .epic, .rare:
            unit.currentHP /= 2
        case .normal:
            unit.currentHP = Int(Double(unit.currentHP) * 0.7)
        }
        energy -= 1
    }
}

struct Player {
    var unit: Unit
    var weapon: Weapon?
    
    func isDefeated() -> Bool {
        !unit.isAlive()
    }
}

var player1 = Player(
    unit: Unit(name: "Player 1", maximumHP: 100),
    weapon: Axe(damage: 5, quality: .epic)
)
var player2 = Player(
    unit: Unit(name: "Aeris", maximumHP: 70),
    weapon: Chainsaw(quality: .normal)
)

// Цикл repeat {} while <условие>
repeat {
    player1.weapon?.dealDamage(to: player2.unit)
    player2.weapon?.dealDamage(to: player1.unit)
} while !(player1.isDefeated() || player2.isDefeated())

// MARK: - Модификаторы доступа

open class OpenClass {
}
public class PublicClass {
}
internal class InternalClass {
}
fileprivate class FileprivateClass {
}
private class PrivateClass {
}
