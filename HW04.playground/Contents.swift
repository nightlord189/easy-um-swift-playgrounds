import Foundation

print("Hello, this is HW04")

//1 - Напишите программу, которая использует ровно три цикла for для печати следующей последовательности символов:
//
// AAA
// AAA
// AAA
// AAA
// AAA
// AAA
// BBBB
// BBBB
// BBBB
// BBBB
// BBBB
// E
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// TTTTT
// G
print ("Task 1")

for _ in 1...6 {
    print ("AAA")
}
for _ in 1...6 {
    print ("BBB")
}
for i in 1...9 {
    if i == 1 {
        print ("E")
    }
    print ("TTT")
    if i == 9 {
        print ("G")
    }
}



//2 - Напишите программу, которая считывает одну строку текста и выводит 10 строк, пронумерованных от 0 до 9,
// каждая с указанной строкой текста.
//
// Тестовые данные 🟢
//
// Sample Input 1:
// LeBron
//
// Sample Output 1:
// 0 LeBron
// 1 LeBron
// 2 LeBron
// 3 LeBron
// 4 LeBron
// 5 LeBron
// 6 LeBron
// 7 LeBron
// 8 LeBron
// 9 LeBron
print ("Task 2")
let input = "LeBron"
for i in 0...9 {
    print("\(i) \(input)")
}

//3 - Дано предложение и количество раз которое его надо повторить. Напишите программу, которая повторяет данное предложение нужное количество раз.
//
// Тестовые данные 🟢
//
// Sample Input 1:
// Век живи - век учись.
// 10
//
// Sample Output 1:
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
// Век живи - век учись.
print ("Task 3")
let input2 = "Век живи - век учись."
let count = 10
for _ in 1...count {
    print(input2)
}
