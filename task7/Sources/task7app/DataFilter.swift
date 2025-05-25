class DataFilter {
    private var model: DataModel

    init(numbers: [Int]?) {
        self.model = DataModel(numbers: numbers)
    }

    // фильтрация четных чисел
    func filterEvenNumbers() -> [Int]? {
        guard let currentNumbers = model.numbers else {
            print("Фильтрация невозможна: исходный массив nil.")
            return nil
        }
        let evenNumbers = currentNumbers.filter { $0 % 2 == 0 }
        print("Отфильтрованы четные числа. Результат: \(evenNumbers)")
        return evenNumbers
    }

    // Метод для обновления массива в модели
    func updateNumbers(newNumbers: [Int]?) {
        model.numbers = newNumbers
        print("Массив в модели обновлен: \(model.numbers != nil ? "\(model.numbers!)" : "nil")")
    }
    
    // Метод для получения текущего массива из модели
    func getCurrentNumbers() -> [Int]? {
        return model.numbers
    }

    // --- Демонстрационные методы для операций с массивами ---
    // Эти методы будут вызываться из AppController/main.swift

    // д) добавление элемента массива
    func addElement(_ element: Int) {
        if model.numbers == nil {
            model.numbers = [] // Инициализируем, если был nil
        }
        model.numbers?.append(element)
        print("Элемент \(element) добавлен. Текущий массив: \(model.numbers ?? [])")
    }

    // е) вставка элемента массива по индексу
    func insertElement(_ element: Int, at index: Int) {
        guard model.numbers != nil, index >= 0, index <= (model.numbers?.count ?? 0) else {
            print("Ошибка вставки: массив nil или индекс (\(index)) вне допустимого диапазона.")
            return
        }
        model.numbers?.insert(element, at: index)
        print("Элемент \(element) вставлен по индексу \(index). Текущий массив: \(model.numbers ?? [])")
    }

    // ё) удаление последнего элемента массива
    func removeLastElement() {
        guard model.numbers != nil, !model.numbers!.isEmpty else {
            print("Ошибка удаления: массив nil или пуст.")
            return
        }
        let removedElement = model.numbers?.removeLast()
        print("Последний элемент (\(removedElement!)) удален. Текущий массив: \(model.numbers ?? [])")
    }

    // ж) удаление элементов массива по индексу
    func removeElement(at index: Int) {
        guard model.numbers != nil, index >= 0, index < (model.numbers?.count ?? 0) else {
            print("Ошибка удаления: массив nil или индекс (\(index)) вне допустимого диапазона.")
            return
        }
        let removedElement = model.numbers?.remove(at: index)
        print("Элемент по индексу \(index) (\(removedElement!)) удален. Текущий массив: \(model.numbers ?? [])")
    }
    
    // з) удаление всех элементов массива
    func removeAllElements() {
        model.numbers?.removeAll()
        print("Все элементы удалены. Текущий массив: \(model.numbers ?? [])")
    }
    
    // г) подсчет количества элементов
    func countElements() -> Int {
        return model.numbers?.count ?? 0
    }
}
