print("Hello, this is HW06")

// 1. Проверка на простое число: - Напишите функцию, которая проверяет, является ли заданное число простым.

print ("Task1")

func isPrime (_ val: Int) -> Bool {
    print (val)
    if val <= 1 {
        return false
    }
    if val <= 3 {
        return true
    }
    if val % 2 == 0 || val % 3 == 0 {
        return false
    }
    
    for divider in 5..<val {
        if val % divider == 0 {
            return false
        }
    }
    
    return true
}

print (isPrime(-5))
print (isPrime(0))
print (isPrime(1))
print (isPrime(2))
print (isPrime(3))
print (isPrime(10))
print (isPrime(17))



// 2. Пример замыкания, которое принимает два аргумента типа Int и возвращает их сумму:

print ("Task 2")

let sum: (Int, Int) -> Int = {
    (a: Int, b: Int) -> Int in return a + b
}
print (sum (1, 5))

// 3. Замыкание, которое принимает массив и возвращает новый массив, содержащий только четные числа:

print ("Task 3")

let evenNumbers: ([Int]) -> [Int] = {
    (arr: [Int]) -> [Int] in {
        return arr.filter { item in
            return item % 2 == 0
        }
    }()
}

print (evenNumbers([1, 2, 3, 4, 5, 30, 55, 60, 71, 86]))

// 4. Написать функцию, которая сортирует массив String по алфавиту в обратную сторону(от я до а), далее поместить эту функцию в аргумент sorted

print ("Task 4")

let sortAlphabetically: (String, String) -> Bool = {
    (s1: String, s2: String) -> Bool in return s1 > s2
}

let stringArray = ["Alex", "Piotr", "John", "Donald", "Zuckerman"]

let sortedStringArray = stringArray.sorted(by: sortAlphabetically)

print (sortedStringArray)


// 5. Создайте функцию calculator, которая принимает два числа и замыкание, которое определяет, какие операции выполнять с этими числами. Функция должна вернуть результат выполнения замыкания

print ("Task 5")

func calculator (_ x1: Int, _ x2: Int, _ operation: (Int, Int) -> Int) -> Int {
    return operation (x1, x2)
}

print (calculator(1, 2, {(a, b) in a + b }))
print (calculator(1, 2, {(a, b) in a * b }))

// 6. Подсчет количества элементов в массиве: - Напишите функцию, которая принимает массив и возвращает количество элементов в нем.

print ("Task 6")

func getArraySize (_ arr: [Int]) -> Int {
    var count = 0
    arr.forEach { item in
        count += 1
    }
    return count
}

print (getArraySize([1, 2, 3]))
