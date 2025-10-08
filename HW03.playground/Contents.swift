import Foundation

//1 - Напишите программу, которая определяет, является число четным или нечетным.
print ("Task 1")
let number: Int = 5

func checkNumberIsEvenOrOdd(_ number: Int) {
    if number % 2 == 0 {
        print ("The number is even")
    } else {
        print ("The number is odd")
    }
}

checkNumberIsEvenOrOdd(number)




//3 - Напишите программу, которая считывает три числа и подсчитывает сумму только положительных чисел.
//
// Примечание. Если положительных чисел нет, то следует вывести 0
print ("Task 3")
let number1 = 1
let number2 = 83
let number3 = -10

func sumNumbers (_ num1: Int, _ num2: Int, _ num3: Int) {
    var sum: Int = 0
    if num1 >= 0 {
        sum += num1
    }
    if num2 >= 0 {
        sum += num2
    }
    if num3 >= 0 {
        sum += num3
    }
    print ("Sum: \(sum)")
}

sumNumbers(number1, number2, number3)





//4 - Дан порядковый номер месяца (1,2,…, 12). Напишите программу, которая выводит на экран количество дней в этом месяце. Принять, что год является невисокосным.
//
// Примечание. Постарайтесь написать программу так, чтобы в ней было не более трех условий.
print ("Task 4")
let month = 1;

func printDaysCountInMonth (_ month: Int) {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        print ("31 days are in month \(month)")
    case 4,6, 9, 11:
        print ("30 days are in month \(month)")
    case 2:
        print ("28 days are in month \(month)")
    default:
        print ("Unknown month")
    }
}

printDaysCountInMonth(month)



//5* - Известен вес боксера-любителя (целое число). Известно, что вес таков, что боксер может быть отнесён к одной из трех весовых категорий:
//
// Легкий вес – до 60 кг (невключительно);
// Первый полусредний вес – до 64 кг (невключительно);
// Полусредний вес – до 69 кг (невключительно).
// Напишите программу, определяющую, в какой категории будет выступать данный боксер.
print ("Task 5")

let boxer_weight: Int = 62

func printWeightCategory (_ weight: Int) {
    switch true{
    case weight < 60:
        print ("Легкий вес")
    case weight < 64:
        print("Первый полусредний вес")
    case weight < 69:
        print ("Полусредний вес")
    default:
        print ("Неизвестная категория")
    }
}

printWeightCategory(boxer_weight)


//6* - Напишите программу, которая считывает с клавиатуры два целых числа и строку. Если эта строка является обозначением одной из четырёх математических операций (+, -, *, /), то выведите результат применения этой операции к введённым ранее числам, в противном случае выведите «Неверная операция» (без кавычек). Если пользователь захочет поделить на ноль, выведите текст «На ноль делить нельзя!» (без кавычек).
print ("Task 6")
let num1: Int = 249
let num2: Int = 3
let operation: Character = "/"

switch operation {
case "+":
    print(num1 + num2)
case "-":
    print (num1 - num2)
case "*":
    print (num1 * num2)
case "/":
    if num2 == 0 {
        print ("На ноль делить нельзя!")
    } else {
        print (num1 / num2)
    }
default:
    print ("Неверная операция")
}

// 7*) Попробуйте реализовать игру "Камень, ножницы, бумага"
print ("Task 7")
let input1 = "rock"
let input2 = "scissors"

checkGame(input1, input2)

func checkGame (_ inp1: String, _ inp2: String) {
    let str1 = inp1.lowercased()
    let str2 = inp2.lowercased()
    
    if !validateGameValue(str1) {
        print ("Player 1 typed wrong value")
        return
    }
    
    if !validateGameValue(str2) {
        print ("Player 2 typed wrong value")
        return
    }
    
    switch true {
    case str1 == str2:
        print ("Draw")
    case str1 == "paper" && str2 == "rock":
        print ("Player 1 won")
    case str1 == "scissors" && str2 == "paper":
        print ("Player 1 won")
    case str1 == "rock" && str2 == "scissors":
        print ("Player 1 won")
    case str2 == "paper" && str1 == "rock":
        print ("Player 2 won")
    case str2 == "scissors" && str1 == "paper":
        print ("Player 2 won")
    case str2 == "rock" && str1 == "scissors":
        print ("Player 2 won")
    default:
        print ("Error")
    }
}

func validateGameValue (_ input: String) -> Bool {
    return input == "rock" || input == "paper" || input == "scissors"
}
