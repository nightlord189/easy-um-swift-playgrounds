import Foundation

print ("Hello, this is HW-Calculator")

// Для ознакомления с понятием GUI потока - реализуйте калькулятор,
// который в бесконечном цикле будет запрашивать операции над числами(базовые арифметические),
// запрашивать два числа и выполнять заданную операцию.
// Предусмотрите обработку выхода из калькулятора.
// Что произойдет, если после выбора операции или при запросе меню(Выбор операции, выход) будут выполняться еще какие-то вычисления?

enum Operation {
    case minus, plus, divide, multiply
}

func parseOperation(_ operation: String) -> Operation? {
    switch operation {
    case "+":
        return .plus
    case "-":
        return .minus
    case "*":
        return .multiply
    case "/":
        return .divide
    default :
        return nil
    }
}

func readOperationFromConsole () -> (Operation, Bool) {
    while true {
        if let line = readLine() {
            if line == "/exit" {
                return (Operation.plus, true)
            }
            
            let operation = parseOperation(line)
            if let parsedOperation = operation {
                print ("Operation entered: \(parsedOperation)")
                return (parsedOperation, false)
            } else {
                print ("You entered wrong operation, please try again")
                continue
            }
        } else {
            print ("Wrong input")
        }
    }
}

func readNumberFromConsole() -> (Int, Bool) {
    while true {
        if let line = readLine() {
            if line == "/exit" {
                return (0, true)
            }
            
            if let number = Int(line) {
                return (number, false)
            } else {
                print ("You entered wrong number, please try again")
                continue
            }
        } else {
            print ("Wrong input")
        }
    }
}

func getOperationResult(_ num1: Int, _ num2: Int, _ operation: Operation) -> (Int?, String?) {
    switch operation {
    case .plus:
        return (num1 + num2, nil)
    case .minus:
        return (num1 - num2, nil)
    case .multiply:
        return (num1 * num2, nil)
    case .divide:
        if num2 == 0 {
            return (nil, "Division by zero")
        }
        return (num1 / num2, nil)
    }
}

var operation: Operation
var num1: Int
var num2: Int
var exit: Bool = false

while (true) {
    print ("Enter operation: +, -, *, / or enter /exit to exit")
    (operation, exit) = readOperationFromConsole()
    if exit {
        print("Exit")
        break
    }
    
    print ("Enter first number or enter /exit to exit")
    (num1, exit) = readNumberFromConsole()
    if exit {
        print("Exit")
        break
    }
    
    print ("Enter second number or enter /exit to exit")
    (num2, exit) = readNumberFromConsole()
    if exit {
        print("Exit")
        break
    }
    
    let (result, error) = getOperationResult(num1, num2, operation)
    
    if let error {
        print (error)
    } else {
        print ("Result: \(num1) \(operation) \(num2): \(result!)")
    }
}



print ("Program done")

