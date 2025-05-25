
import Foundation // Необходимо для CharacterSet.whitespacesAndNewlines

class ConsoleView {

    // а) вывод массива
    func displayArray(_ array: [Int]?, title: String) {
        print("\n--- \(title) ---")
        guard let unwrappedArray = array else {
            print("(Массив nil)")
            return
        }
        if unwrappedArray.isEmpty {
            print("(Массив пуст)")
        } else {
            let arrayDescription = unwrappedArray.map { String($0) }.joined(separator: ", ")
            print("[\(arrayDescription)]")
        }
    }

    func displayMessage(_ message: String) {
        print(message)
    }

    // в) ввод элементов массива с консоли
    func getNumbersFromConsole(prompt: String) -> [Int]? {
        print(prompt)
        print("Введите числа через пробел (или оставьте строку пустой для nil-массива):")
        
        let optionalLine: String? = readLine()

        guard let line = optionalLine else {
            // Это условие сработает, если readLine() вернет nil (например, конец ввода)
            displayMessage("Ошибка чтения строки ввода.") // Используем print, если displayMessage еще не гарантирован
            print("Ошибка чтения строки ввода или ввод завершен.")
            return nil
        }

        let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedLine.isEmpty {
            return nil 
        }

        let stringNumbers = trimmedLine.split(separator: " ")
        let numbers = stringNumbers.compactMap { Int($0) } // Преобразует только валидные числа

        if numbers.isEmpty && !stringNumbers.isEmpty {
             // Если были введены какие-то символы, но ни один не является числом
            // displayMessage("Введены нечисловые значения, массив будет считаться пустым (не nil).")
            print("Введены нечисловые значения, массив будет считаться пустым (не nil).")
            return [] // Возвращаем пустой массив, а не nil, т.к. пользователь что-то ввел
        }
        
        // Если numbers не пуст, возвращаем его.
        // Если numbers пуст И stringNumbers тоже был пуст (что покрыто trimmedLine.isEmpty), вернется nil.
        // Если numbers пуст, но stringNumbers не был пуст, вернется [] (покрыто предыдущим if).
        return numbers.isEmpty ? nil : numbers
    }
    
    func getIntegerInput(prompt: String) -> Int? {
        print(prompt, terminator: ": ")
        guard let line = readLine(), let number = Int(line.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            // displayMessage("Ошибка: Некорректный ввод целого числа.")
            print("Ошибка: Некорректный ввод целого числа.")
            return nil
        }
        return number
    }
    
    func getMenuChoice(options: [String]) -> Int? {
        print("\nВыберите действие:")
        for (index, option) in options.enumerated() {
            print("\(index + 1). \(option)")
        }
        print("0. Выход")
        // Используем self.getIntegerInput, чтобы вызвать другой метод этого же класса
        return self.getIntegerInput(prompt: "Ваш выбор")
    }

} // Это закрывающая скобка для class ConsoleView
