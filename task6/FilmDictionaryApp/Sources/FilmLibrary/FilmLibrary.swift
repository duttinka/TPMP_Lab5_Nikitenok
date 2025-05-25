// Sources/FilmLibrary/FilmLibrary.swift

import Foundation // Для сортировки строк и других утилит

public class FilmManager {
    // Словарь: [Название фильма: Год выхода]
    private var filmYears: [String: Int] = [:]

    // Словарь: [Название фильма: Стоимость производства в млн. USD]
    private var filmCosts: [String: Double]

    // Инициализатор
    public init() {
        // Инициализируем filmYears как пустой
        self.filmYears = [:]
        
        // Инициализируем filmCosts с некоторыми данными
        self.filmCosts = [
            "Аватар": 237.0,
            "Титаник": 200.0,
            "Мстители: Финал": 356.0
        ]
        print("FilmManager инициализирован.")
        printInitialDictionariesState()
    }

    private func printInitialDictionariesState() {
        print("Начальное состояние словаря годов фильмов:")
        printDictionary(filmYears, name: "Годы фильмов")
        print("Начальное состояние словаря стоимости фильмов:")
        printDictionary(filmCosts, name: "Стоимость фильмов")
    }

    // Универсальный метод для печати словарей
    private func printDictionary<K, V>(_ dictionary: [K: V], name: String) {
        print("--- \(name) (Количество: \(dictionary.count)) ---")
        if dictionary.isEmpty {
            print("(Словарь пуст)")
            return
        }
        // Сортировка по ключу для консистентного вывода, если ключи это String
        if K.self == String.self {
            let sortedKeys = dictionary.keys.compactMap { $0 as? String }.sorted()
            for key in sortedKeys {
                if let stringKey = key as? K { // Безопасное приведение
                     print("\(key): \(dictionary[stringKey]!)")
                }
            }
        } else { // Для других типов ключей просто итерируем
            for (key, value) in dictionary {
                print("\(key): \(value)")
            }
        }
        print("--------------------")
    }

    // --- Операции для словаря Годов Фильмов (filmYears) ---

    public func addFilmYear(name: String, year: Int) {
        filmYears[name] = year
        print("Фильм '\(name)' (\(year) год) добавлен/обновлен в словарь годов.")
    }

    public func getFilmYear(name: String) -> Int? {
        return filmYears[name]
    }

    public func removeFilmYear(name: String) {
        if filmYears.removeValue(forKey: name) != nil {
            print("Фильм '\(name)' удален из словаря годов.")
        } else {
            print("Фильм '\(name)' не найден в словаре годов.")
        }
    }
    
    public func listAllFilmYears(sortedBy: String = "name") {
        printDictionarySorted(filmYears, name: "Все фильмы (Год выхода)", sortedBy: sortedBy)
    }

    public func countFilmYears() -> Int {
        return filmYears.count
    }
    
    public func clearFilmYears() {
        filmYears.removeAll()
        print("Словарь годов фильмов очищен.")
    }

    // --- Операции для словаря Стоимости Фильмов (filmCosts) ---

    public func addFilmCost(name: String, cost: Double) {
        filmCosts[name] = cost
        print("Стоимость для фильма '\(name)' (\(cost) млн) добавлена/обновлена.")
    }
    
    public func getFilmCost(name: String) -> Double? { 
        return filmCosts[name]
    }

    public func removeFilmCost(name: String) {
        if filmCosts.removeValue(forKey: name) != nil {
            print("Стоимость для фильма '\(name)' удалена.")
        } else {
            print("Фильм '\(name)' не найден в словаре стоимостей.")
        }
    }

    public func listAllFilmCosts(sortedBy: String = "name") {
        printDictionarySorted(filmCosts, name: "Все фильмы (Стоимость)", sortedBy: sortedBy)
    }
    
    public func countFilmCosts() -> Int {
        return filmCosts.count
    }

    public func clearFilmCosts() {
        filmCosts.removeAll()
        print("Словарь стоимостей фильмов очищен.")
    }
    
    // --- Модификация (общая для обоих, если фильм существует в одном, можно обновить другой) ---
    public func modifyFilmData(name: String, newYear: Int?, newCost: Double?) { // [cite: 132]
        var modified = false
        if let year = newYear {
            if filmYears[name] != nil || filmCosts[name] != nil { // Модифицируем год, если фильм вообще известен
                filmYears[name] = year
                print("Год для фильма '\(name)' обновлен на \(year).")
                modified = true
            }
        }
        if let cost = newCost {
             if filmYears[name] != nil || filmCosts[name] != nil { // Модифицируем стоимость, если фильм вообще известен
                filmCosts[name] = cost
                print("Стоимость для фильма '\(name)' обновлена на \(cost) млн.")
                modified = true
            }
        }
        if !modified && (newYear != nil || newCost != nil) {
            print("Фильм '\(name)' не найден для модификации. Используйте 'добавить', чтобы создать новую запись.")
        } else if !modified {
             print("Не предоставлено данных для модификации фильма '\(name)'.")
        }
    }

    // Вспомогательный метод для печати с сортировкой
    private func printDictionarySorted<V: Comparable>(_ dictionary: [String: V], name: String, sortedBy: String) {
        print("\n--- \(name) (Количество: \(dictionary.count)) ---")
        if dictionary.isEmpty {
            print("(Словарь пуст)")
            return
        }

        let sortedItems: [(String, V)]
        if sortedBy == "name" {
            sortedItems = dictionary.sorted { $0.key.localizedStandardCompare($1.key) == .orderedAscending }
        } else if sortedBy == "value" {
            sortedItems = dictionary.sorted { $0.value < $1.value }
        } else {
            print("Неизвестный критерий сортировки: \(sortedBy). Вывод без специальной сортировки.")
            sortedItems = dictionary.map { ($0.key, $0.value) } // Просто преобразуем в массив пар
        }

        for (key, value) in sortedItems {
            print("\(key): \(value)")
        }
        print("--------------------")
    }
}
