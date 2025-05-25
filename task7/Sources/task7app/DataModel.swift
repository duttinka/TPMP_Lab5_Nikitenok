struct DataModel {
    var numbers: [Int]? // Опциональный массив чисел
    
    init(numbers: [Int]? = nil) { // По умолчанию nil
        self.numbers = numbers
        let initialNumbersDescription = numbers?.description ?? "nil"
        print("DataModel инициализирована. Начальный массив: \(initialNumbersDescription)")
    }
}
