let view = ConsoleView()
var dataFilter: DataFilter // Будет инициализирован после ввода пользователя

// Начальная инициализация DataFilter на основе ввода пользователя
let initialNumbers = view.getNumbersFromConsole(prompt: "--- Инициализация DataFilter ---")
dataFilter = DataFilter(numbers: initialNumbers)
view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после инициализации DataFilter")

func demonstrateMainTask() {
    view.displayMessage("\n--- Демонстрация основной задачи (Вариант 32: Фильтрация четных чисел) ---")
    let evenNumbers = dataFilter.filterEvenNumbers()
    view.displayArray(evenNumbers, title: "Результат фильтрации (только четные)")
}

func demonstrateOtherOperations() {
    view.displayMessage("\n--- Демонстрация других операций с текущим массивом ---")

    // г) Подсчет количества элементов
    view.displayMessage("г) Текущее количество элементов: \(dataFilter.countElements())")
    
    // Неизменяемый массив для демонстрации подсчета
    let immutableArray: [Int]? = [1, 2, 3] // Может быть и nil
    view.displayArray(immutableArray, title: "Демонстрационный неизменяемый массив")
    view.displayMessage("Количество элементов в неизменяемом массиве: \(immutableArray?.count ?? 0)")


    // д) Добавление элемента
    if let newElement = view.getIntegerInput(prompt: "д) Введите элемент для добавления") {
        dataFilter.addElement(newElement)
        view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после добавления элемента")
    }

    // е) Вставка элемента
    if let elementToInsert = view.getIntegerInput(prompt: "е) Введите элемент для вставки") {
        if let index = view.getIntegerInput(prompt: "Введите индекс для вставки") {
            dataFilter.insertElement(elementToInsert, at: index)
            view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после вставки элемента")
        }
    }
    
    // ё) Удаление последнего
    view.displayMessage("ё) Удаление последнего элемента...")
    dataFilter.removeLastElement()
    view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после удаления последнего")

    // ж) Удаление по индексу
    if let indexToRemove = view.getIntegerInput(prompt: "ж) Введите индекс элемента для удаления") {
        dataFilter.removeElement(at: indexToRemove)
        view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после удаления по индексу")
    }
    
    // з) Удаление всех элементов
    view.displayMessage("з) Удаление всех элементов...")
    dataFilter.removeAllElements()
    view.displayArray(dataFilter.getCurrentNumbers(), title: "Массив после удаления всех элементов")
    
    // б) Создание пустого изменяемого массива (показано при инициализации consoleInputArray и выше)
    view.displayMessage("\nб) Создание пустого изменяемого массива уже было продемонстрировано (например, при инициализации DataFilter без аргументов или при очистке).")
    let emptyMutableArray = DataFilter(numbers: []) // Создаем экземпляр с пустым массивом
    view.displayArray(emptyMutableArray.getCurrentNumbers(), title: "Пример пустого изменяемого массива в DataFilter")
}

// Основной цикл меню (если нужен, или просто последовательная демонстрация)
// Для простоты здесь будет последовательная демонстрация, а не интерактивное меню
// как в Задании 6, так как акцент на MVC и операциях с массивом.

view.displayMessage("\n--- Начинаем демонстрацию для Задания 7 ---")

demonstrateMainTask() // Выполнение основной задачи варианта
demonstrateOtherOperations() // Демонстрация дополнительных операций

view.displayMessage("\n--- Демонстрация завершена ---")
