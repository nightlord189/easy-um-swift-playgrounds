import Foundation

print("Hello, this is HW05")


//Домашнее задание
//
//1 - Давайте представим, что мы находимся в кафе и решили что-то заказать. Создайте список того, что вы заказали [String:Int] и кошелёк с суммой. С помощью цикла найдите сумму в чеке, а также баланс кошелька после оплаты(учтите момент, что денег может не хватать)

print ("Task1")

let bucket: [String:Int] = ["Coffee":1500, "Cookies": 600, "Cake": 1000]
print ("bucket: \(bucket)")

var sum = 0;
for (_, amount) in bucket {
    sum += amount;
}

print ("sum: \(sum)")



//2 - Дан массив, состоящий из целых чисел. Найдите сумму четных элементов массива. Найдите минимальное и максимальное значение в массиве (без min() и max()). Найдите среднее арифметическое все элементов массива

print ("Task2")
let arr: [Int] = [1, 2, 3, 4, 5]
print (arr)
let sumEven = arr.filter{$0 % 2 == 0}.reduce(0) {(currentSum, item) in return currentSum + item}
print ("sum of even numbers: \(sumEven)")
let min = arr.reduce(Int.max){(currentMin, item) in return item < currentMin ? item : currentMin}
print ("min value in array: \(min)")
let max = arr.reduce(0){(currentMax, item) in return item > currentMax ? item : currentMax}
print ("max value in array: \(max)")


//3 - Дан массив чисел. Посчитайте, сколько в нем пар элементов, равных друг другу. Пара - это два соседних элемента
//
//Sample Input 1:
//1 2 3 2 3
//Sample Output 1:
//2
//
//Sample Input 2:
//1 1 1 1 1
//Sample Output 2:
//4

print ("Task3")

print ("getCountOfEqualPairs: \(getCountOfEqualPairs([1, 2, 3, 2, 3]))")
print ("getCountOfEqualPairs: \(getCountOfEqualPairs([1, 1, 1, 1, 1]))")

func getCountOfEqualPairs (_ arr: [Int]) -> Int {
    if arr.isEmpty || arr.count == 1 {
        return 0
    }
    var result = 0
    var lastElement: Int = arr[0]
    for idx in 1..<arr.count {
        if arr[idx] == lastElement {
            result+=1
        }
        lastElement = arr[idx]
    }
    return result
}


//4 - Дан массив с возрастами людей, которые хотят посетить аттракцион. Известно, что посетить его можно от 13 лет. Напишите программу, которая определяет может ли человек пойти на аттракцион. Если может, то выведите в консоль сообщение “Вы можете покататься на аттракционе”, в противном случае выведите “К сожалению вы не можете посетить аттракцион ”

print ("Task4")

let ages = [12, 25, 56, 14, 5]
ages.forEach { age in
    if age > 13 {
        print ("Возраст \(age): Вы можете покататься на аттракционе")
    } else {
        print ("Возраст \(age): К сожалению вы не можете посетить аттракцион")
    }
}
