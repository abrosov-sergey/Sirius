//
//  main.swift
//  1
//
//  Created by Sergey Abrosov on 18.03.2024.
//

import Foundation

// СуперАпп = яндекс браузер + алиса + шедевр
// Chromium - c++ - есть возможность стать контрибьютором
// DevKit - серверная верстка для перевода кода с бека в натив

//var available = false
//var condition = pthread_cond_t()
//var mutex = pthread_mutex_t()
//
//class FirstCThread: Thread {
//    
//    override init() {
//        pthread_cond_init(&condition, nil)
//        pthread_mutex_init(&mutex, nil)
//    }
//    
//    override func main() {
//        print(1)
//        printSomething()
//    }
//    
//    private func printSomething() {
//        pthread_mutex_lock(&mutex)
//        print(2)
//        
//        while !available {
//            print(3)
//            pthread_cond_wait(&condition, &mutex)
//            print("here")
//        }
//        available = false
//        
//        print(4)
//        
//        defer {
//            pthread_mutex_unlock(&mutex)
//            print(5)
//        }
//        
//        print(6)
//    }
//}
//
//class SecondCThread: Thread {
//    
//    override init() {
//        pthread_cond_init(&condition, nil)
//        pthread_mutex_init(&mutex, nil)
//    }
//    
//    override func main() {
//        print(7)
//        printSomething()
//    }
//    
//    private func printSomething() {
//        pthread_mutex_lock(&mutex)
//        print(8)
//        
//        available = true
//        pthread_cond_signal(&condition)
//        
//        print(9)
//        
//        defer {
//            pthread_mutex_unlock(&mutex)
//            print(10)
//        }
//        
//        print(11)
//    }
//}
//
//var firstThread = FirstCThread()
//var secondThread = SecondCThread()
//
//firstThread.main()
//secondThread.main()

//firstThread.start()
//secondThread.start()









// Existential/Opaque type
// 1) изменение значения свойства структуры происходит через пометку функции mutating

//struct Cup {
//    var isFilled: Bool = false
//    
//    mutating func change() {
//        isFilled = true
//    }
//}

// 2) Собственный COW

final class Ref<T> {
  var val: T
    
  init(v: T) {
    val = v
  }
}

struct Box<T> {
    var ref: Ref<T>
    
    init(x: T) {
        ref = Ref(v: x)
    }
    
    var value: T {
        get {
            ref.val
        }
        set {
            if (!isKnownUniquelyReferenced(&ref)) {
                ref = Ref(v: newValue)
            } else {
                ref.val = newValue
            }
        }
    }
}

// 3) stored - хранимые / computed - вычисляемые (гет/сет и гет-онли)

// 4) переопределение static/class свойств

//class Car {
//    static var first: Int = 100
////    class var second: Int = 200
//    var third: Int = 300
//}
//
//class Tesla: Car {
//    override static var first: Int {
//        get {
//            100
//        }
//        
//        set {
//            first = newValue
//        }
//    }
//    
////    override class var second = {
////        
////    }
//    
//    override static var third = {
//        
//    }
//}

// 5) дезигнейтед, обязательный инициализатор, опциональный обязательный иинициализатор, вспомогательный, опциональный, выкидывающий исклоючение

//1. либо краш приложения
//2. либо нил
//3. либо ничего

//required init?(coder: NSCoder) {
//    fatalError("here")
//}

// 6) convenience required init

protocol P {
    var some: Int! {get}
    init(some: Int)
}

class C: P {
    private(set) var some: Int!
    convenience required init(some: Int) {
        self.init()
        self.some = some
    }
}

class D: C {
    // no need in required init(some: Int)...
}


// !!! 7) SideTable / память в свифт от 0 до 1

// Когда мы работает с вик, мы напрямую обращаемся в сайд тейбл (поэтому дольше)

//live - пока есть сильные ссылки
//если сильных нет начинается деинициализация
//проверяются аноунд ссылки и потом вик ссылки и потом происходит освобождение
//потом происходит удаление

//live
//deiniting
//deiniting
//freed
//dead

// !!! 8) управление памятью, прочитать про выделение памяти на value type & reference type - выделение в рантайме и при компиляции

// 9) композиция протоколов typealias compose = protocol1 & protocol2 - НЕ новый тип, а лишь псевдоним

//protocol MyProtocol: AnyObject {
//    func somePrint()
//}
//
//indirect enum MyEnum: MyProtocol { - нельзя, только для class-Type
//    case first(MyEnum)
//}

// 10) Полиморфизм в дайрект диспатч

protocol M {
    func doSomething(x: String)
    func doSomething(x: Int)
}

extension P {
    func doSomething(x: String) {
        print(x)
    }
    
    func doSomething(x: Int) {
        print(x)
    }
}


protocol Greet {
    func say()
}

extension Greet {
    func say() {
        print("protocol")
    }
}

class Person {
    
}

class Employee: Person, Greet {
    func say() {
        print("class")
    }
}

func greetings(greter: Greet) {
    greter.say()
}

greetings(greter: Employee())


// 11) associated item


// 12) existential and opaque types -


//indirect enum MyEnum {
//    case first(String)
//    case second
//    case third
//}
//
//var mySet: Set<MyEnum>


//indirect enum MyEnum1: Equatable, Hashable {
//    static func == (lhs: MyEnum1, rhs: MyEnum1) -> Bool {
//        lhs == rhs
//    }
//    
//    case first(MyEnum)
//    case second(MyEnum)
//    case third
//}
//
//var mySet: Set<MyEnum1>
