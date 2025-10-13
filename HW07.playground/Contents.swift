import Foundation

print("Hello, this is HW07")


//Задача 1: Создание структуры для представления информации о книге. Представьте, что вам нужно разработать структуру данных для хранения информации о книге в вашей виртуальной библиотеке. Структура должна содержать следующие свойства:
//- Название книги
//- Автор
//- Год издания
//- Жанр

print ("Task1")

enum Genre {
    case drama, fantasy, science, horror, crime, romance, economics
}

struct Book {
    let name: String
    let author: String
    let publicationYear: Int
    let genre: Genre
}

let book: Book = Book(name: "Martin Eden", author: "Jack London", publicationYear: 1909, genre: Genre.drama)
print (book)


//Задача 2: Определение перечисления для дней недели. Давайте создадим перечисление для дней недели на английском языке. Каждый случай в перечислении будет представлять один из дней недели.

print ("Task2")

enum DayOfWeek {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

let day = DayOfWeek.friday
print (day)


//Задача 3: Использование перечисления для представления состояний приложения. Для вашего приложения разработки задач можно создать перечисление, которое будет представлять различные состояния задачи, такие как "в процессе", "завершена", "отменена" и т. д.

print ("Task 3")

enum AppState {
    case inProgress, completed, canceled, failed
}

let state: AppState = AppState.inProgress
print (state)


//Задача 4: Структура для хранения информации о студенте. Создайте структуру, которая будет содержать информацию о студенте, такую как имя, возраст, средний балл и список предметов, которые он изучает.

print ("Task 4")

struct Student {
    let name: String
    var age: Int
    var averageScore: Decimal
    var subjects: [String]
}

var student = Student(name: "John", age: 22, averageScore: 4.1, subjects: ["Math", "History", "Science"])

print (student)

student.subjects.append("Chemistry")

print (student)
