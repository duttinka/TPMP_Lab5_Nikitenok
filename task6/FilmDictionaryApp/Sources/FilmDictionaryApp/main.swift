
import FilmLibrary

let filmManager = FilmManager() // Создаем экземпляр менеджера

func displayMenu() {
    print("\nМеню управления фильмотекой:")
    print("--- Годы фильмов ---")
    print("1. Добавить/Обновить фильм (год)")
    print("2. Найти год фильма по названию")
    print("3. Удалить фильм (год)")
    print("4. Показать все фильмы (годы) (сорт. по названию)")
    print("5. Показать все фильмы (годы) (сорт. по году)")
    print("6. Показать количество фильмов (годы)")
    print("7. Очистить словарь годов фильмов")
    print("--- Стоимость фильмов ---")
    print("11. Добавить/Обновить стоимость фильма")
    print("12. Найти стоимость фильма по названию")
    print("13. Удалить стоимость фильма")
    print("14. Показать все фильмы (стоимости) (сорт. по названию)")
    print("15. Показать все фильмы (стоимости) (сорт. по стоимости)")
    print("16. Показать количество фильмов (стоимости)")
    print("17. Очистить словарь стоимостей фильмов")
    print("--- Общие операции ---")
    print("21. Модифицировать данные фильма (год и/или стоимость)")
    print("0. Выход")
    print("Введите ваш выбор:")
}

func getStringInput(prompt: String) -> String {
    print(prompt, terminator: " ")
    return readLine() ?? ""
}

func getIntInput(prompt: String) -> Int? {
    print(prompt, terminator: " ")
    guard let line = readLine(), let number = Int(line) else {
        print("Ошибка: Введите корректное целое число.")
        return nil
    }
    return number
}

func getDoubleInput(prompt: String) -> Double? {
    print(prompt, terminator: " ")
    guard let line = readLine(), let number = Double(line) else {
        print("Ошибка: Введите корректное число с плавающей точкой.")
        return nil
    }
    return number
}

// Основной цикл программы
var running = true
while running {
    displayMenu()
    
    guard let choiceString = readLine(), let choice = Int(choiceString) else {
        print("Некорректный ввод. Пожалуйста, введите число.")
        continue
    }

    switch choice {
    // Годы фильмов
    case 1:
        let name = getStringInput(prompt: "Введите название фильма:")
        if let year = getIntInput(prompt: "Введите год выхода:") {
            filmManager.addFilmYear(name: name, year: year)
        }
    case 2:
        let name = getStringInput(prompt: "Введите название фильма:")
        if let year = filmManager.getFilmYear(name: name) {
            print("Фильм '\(name)' вышел в \(year) году.")
        } else {
            print("Фильм '\(name)' не найден в словаре годов.")
        }
    case 3:
        let name = getStringInput(prompt: "Введите название фильма для удаления (год):")
        filmManager.removeFilmYear(name: name)
    case 4:
        filmManager.listAllFilmYears(sortedBy: "name")
    case 5:
        filmManager.listAllFilmYears(sortedBy: "value")
    case 6:
        print("Количество записей в словаре годов фильмов: \(filmManager.countFilmYears())")
    case 7:
        filmManager.clearFilmYears()

    // Стоимость фильмов
    case 11:
        let name = getStringInput(prompt: "Введите название фильма:")
        if let cost = getDoubleInput(prompt: "Введите стоимость производства (млн USD):") {
            filmManager.addFilmCost(name: name, cost: cost)
        }
    case 12:
        let name = getStringInput(prompt: "Введите название фильма:")
        if let cost = filmManager.getFilmCost(name: name) {
            print("Стоимость производства фильма '\(name)': \(cost) млн USD.")
        } else {
            print("Фильм '\(name)' не найден в словаре стоимостей.")
        }
    case 13:
        let name = getStringInput(prompt: "Введите название фильма для удаления (стоимость):")
        filmManager.removeFilmCost(name: name)
    case 14:
        filmManager.listAllFilmCosts(sortedBy: "name")
    case 15:
        filmManager.listAllFilmCosts(sortedBy: "value")
    case 16:
        print("Количество записей в словаре стоимостей: \(filmManager.countFilmCosts())")
    case 17:
        filmManager.clearFilmCosts()

    // Общие операции
    case 21:
        let name = getStringInput(prompt: "Введите название фильма для модификации:")
        print("Введите новый год (оставьте пустым, если не хотите менять):")
        let yearStr = readLine()
        let newYear = yearStr.flatMap { Int($0.isEmpty ? "nil" : $0) } // nil если пусто или не число
        
        print("Введите новую стоимость (оставьте пустым, если не хотите менять):")
        let costStr = readLine()
        let newCost = costStr.flatMap { Double($0.isEmpty ? "nil" : $0) } // nil если пусто или не число

        if newYear == nil && newCost == nil {
            print("Не указаны новые данные для модификации.")
        } else {
            filmManager.modifyFilmData(name: name, newYear: newYear, newCost: newCost)
        }


    case 0:
        running = false
        print("Выход из программы.")
    default:
        print("Неверный выбор. Пожалуйста, попробуйте снова.")
    }
    
    if running {
        _ = getStringInput(prompt: "\nНажмите Enter для продолжения...")
    }
}
