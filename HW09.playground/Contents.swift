import Foundation

print("Hello, this is HW09")

//1. Создать класс Круг с хранимым свойством Радиус. Добавить ему вычисляемые свойства - длина окружности и площадь круга. Добавить метод "Вытянуть в цилиндр", который принимает высоту цилиндра и возвращает объем цилиндра

print ("Task1")

class Circle {
    let radius: Double
    
    init (_ radius: Double) {
        self.radius = radius
    }
    
    var length: Double {
        get {
            return 2 * .pi * radius
        }
    }
    
    var square: Double {
        get {
            return .pi * pow (radius, 2)
        }
    }
    
    func extractToCylinder (_ height: Double) -> Double {
        return square * height
    }
}

let circle1 = Circle (3)
print("Radius: \(circle1.radius), length: \(circle1.length), " +
      "square: \(circle1.square), volume of cylinder with height 10: \(circle1.extractToCylinder(10))")


// 2. Создайте класс Музыкальный инструмент со свойствами: название, марка, тип (духовой, струнный, меховой, смычковый), материал корпуса (Дерево, пластик, металл) и методом Играть. Создайте Структуру Усилитель со свойствами Марка и Мощность (Вт),  булевым свойством, хранящим состояние включённости/выключенности усилителя, а также мутирующим методом, включающим и выключающим усилитель. Создайте дочерний класс - Гитара со свойствами Тип гитары - акустическая, электрогитара и опционально Усилитель, переопределите метод «Играть» с разными принтами в случае с использованием включенного усилителя или отключенного либо без него, а также создайте методы «Подключить усилитель» и «Отключить усилитель». Учтите, что усилитель можно подключить, только если он ещё не подключен и отключить, только, если он уже подключен. Создайте финальный класс Электрогитара, переопределите его инициализатор, заведомо задав тип гитары - Электрогитара. Создайте по 1 экземпляру Электрогитары и Усилителя, подключите к электрогитаре усилитель и вызовите метод Играть.

print ("Task2")

enum MusicalInstrumentType {
    case wind, string, bellow, bowed
}

enum Material {
    case wood, plastic, metal
}

class MusicalInstrument {
    let name: String
    let type: MusicalInstrumentType
    let brand: String
    let material: Material
    
    init(name: String, type: MusicalInstrumentType, brand: String, material: Material) {
        self.name = name
        self.type = type
        self.brand = brand
        self.material = material
    }
    
    func play () {
        print("Playing on musical instrument")
    }
}

struct Amplifier {
    let brand: String
    let power: Int
    private(set) var isOn: Bool
    
    mutating func turn () {
        self.isOn = !self.isOn
    }
    
    var toString: String {
        get {
            return "\(self.brand), power: \(self.power), isOn: \(self.isOn)"
        }
    }
}

enum GuitarType {
    case acoustic, electric
}

class Guitar: MusicalInstrument {
    let guitarType: GuitarType
    var amplifier: Amplifier? = nil
    
    init(name: String, brand: String, guitarType: GuitarType) {
        self.guitarType = guitarType
        
        let instrumentType: MusicalInstrumentType = .string
        var material: Material
        
        switch guitarType {
        case .acoustic:
            material = .wood
        case .electric:
            material = .plastic
        }
        
        super.init(name: name, type: instrumentType, brand: brand, material: material)
    }
    
    func connectAmplifier (_ amplifier: Amplifier) {
        if self.amplifier != nil {
            print ("Amplifier is already connected")
            return
        }
        self.amplifier = amplifier
        print ("Amplifier connected")
    }
    
    func disconnectAmplifier () {
        if self.amplifier == nil {
            print ("Amplifier is already disconnected")
            return
        }
        self.amplifier = nil
        print ("Amplifier disconnected")
    }
    
    override func play () {
        if self.amplifier == nil {
            print ("Playing on guitar [\(toString)] without amplifier")
        } else {
            print ("Playing on guitar [\(toString)] with amplifier: [\(self.amplifier!.toString)]")
        }
    }
    
    var toString: String {
        get {
            return "type: \(type), \(brand) \(name)"
        }
    }
}

class ElectricGuitar: Guitar {
    init(name: String, brand: String) {
        super.init(name: name, brand: brand, guitarType: .electric)
    }
}

let guitar1 = ElectricGuitar(name: "Les Paul", brand: "Gibson")
var amplifier = Amplifier(brand: "Yamaha", power: 20, isOn: false)

guitar1.connectAmplifier(amplifier)

guitar1.amplifier?.turn()

guitar1.play()

//3.  Требуется создать справочник (массив) достопримечательностей города. Это могут быть как Скульптуры, например, памятники, так и архитектурные объекты - здания. Структура Скульптуры имеет свойства - название, скульптор и Материал. Структура Архитектурного строения имеет свойства - почтовый индекс, название.  Создать протокол, требующий свойства - название и год создания данной достопримечательности. Именно эти свойства будет необходимы для того, чтобы поместить достопримечательности в общий справочник. Создать несколько экземпляров архитектурных и скульптурных памятников и добавить их в общий массив, проверив тем самым работу кода.

print ("Task3")

enum SculptureMaterial {
    case stone, bronze, mixed
}

struct Sculpture: Landmark {
    let name: String
    let author: String
    let material: SculptureMaterial
    let year: Int
}

struct Building: Landmark {
    let postalCode: String
    let name: String
    let year: Int
}

protocol Landmark {
    var name: String { get }
    var year: Int { get }
}

let sculpture1 = Sculpture(name: "Памятник М. Ауэзову", author: "Е. А. Сергебаев", material: .bronze, year: 1980)
let sculpture2 = Sculpture(name: "Монумент независимости", author: "Ш. Валиханов", material: .mixed, year: 1996)

let building1 = Building(postalCode: "050000", name: "Гостиница Казахстан", year: 1977)
let building2 = Building(postalCode: "050013", name: "Телебашня Коктобе", year: 1983)

var landmarks: [Landmark] = [sculpture1, building1, sculpture2, building2]

for item in landmarks {
    print ("Landmark \(item.name), year: \(item.year)")
}

