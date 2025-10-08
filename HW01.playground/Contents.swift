import Foundation

print ("Hello, this is HW01")

//1 - На вход принимаются дробное число(Double) n - рубли. Задача состоит в том, что нужно найти целое число рублей и копеек
print("Task 1")
let n = 135.55
print ("Input: \(n)")
let nDecimal = Decimal(n)
let roubles = Int(n)
print ("Roubles: \(roubles)")
let kopeykas = (nDecimal - Decimal(roubles))*100
print ("Kopeykas: \(kopeykas)")


//2 - На вход дается целое число из трех цифр. Задача состоит в том, чтобы найти сумму всех 3-х чисел
print("Task 2")
let input2 = 871
print ("Input: \(input2)")
let digit1 = input2/100
let digit2 = input2/10-digit1*10
let digit3 = input2-digit1*100-digit2*10
print ("\(digit1) + \(digit2) + \(digit3) = \(digit1+digit2+digit3)")


//3 - После соревнований по боксу сумму 500000 р. распределили между спортсменами, занявшими 1, 2, 3 отношении 7:3:1. Найдите вознаграждение, которую получил каждый призёр.
print("Task 3")
let allAmount = 50000
print ("Input: \(allAmount)")
let part1 = 7
let part2 = 3
let part3 = 1
let partSum = part1 + part2 + part3
let fraction = allAmount / partSum
let amount1 = fraction * part1
let amount2 = fraction * part2
let amount3 = fraction * part3
print ("Result: \(amount1), \(amount2), \(amount3)")



//4 - N школьников делят K яблок поровну, неделящийся остаток остается в корзинке. Сколько яблок достанется каждому школьнику? Сколько яблок останется в корзинке? N и K задайте произвольно
print("Task 4")
let pupils = 3
let apples = 17
print ("\(pupils) школьников делят \(apples) яблок поровну. Яблок каждому школьнику достанется: \(apples / pupils), останется в корзинке: \(apples % pupils)")

//5 - Даны числа A и B. Найдите гипотенузу прямоугольника с катетами A и B.
print("Task 5")
let a:Double = 3
let b:Double = 4
print ("Гипотенуза прямоугольника с катетами \(a) и \(b) равна: \(sqrt(a*a+b*b))")



//6. Электронные часы
//
//     Электронные часы показывают время в формате h:mm:ss (от 0:00:00 до 23:59:59), то есть сначала записывается количество часов, потом обязательно двузначное количество минут, затем обязательно двузначное количество секунд. Количество минут и секунд при необходимости дополняются до двузначного числа нулями.
//
//     С начала суток прошло N секунд. Выведите, что покажут часы.
//
//     Формат входных данных
//
//     На вход дается натурально число N, не превосходящее
//     1
//     0
//     7
//     10
//     7
//     (10000000).
//
//     Формат выходных данных
//
//     Выведите ответ на задачу.
//
//     Sample Input 1:
//     3602
//     Sample Output 1:
//     1:00:02
//     Sample Input 2:
//     129700
//     Sample Output 2:
//     12:01:40
print("Task 6")
printTimeClock(3602)
printTimeClock(129700)

func printTimeClock (_ inputSeconds: Int) {
    var hours = inputSeconds / 3600 % 24
    
    var minutes = inputSeconds / 60 % 60
    
    var seconds = inputSeconds % 60
    
    print ("Time for \(inputSeconds) seconds is: \(timeUnitsToStr(hours)):\(timeUnitsToStr(minutes)):\(timeUnitsToStr(seconds))")
}

func timeUnitsToStr (_ units: Int) -> String {
    if units < 10 {
        return "0" + String(units)
    }
    return String(units)
}
