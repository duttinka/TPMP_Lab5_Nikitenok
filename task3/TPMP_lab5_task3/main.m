#import <Foundation/Foundation.h>
#import "ArrayManipulator.h" // Убедитесь, что имя файла совпадает

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Запуск Лабораторной работы №5, Задание 3 (Objective-C Массивы)");
        
        ArrayManipulator *manipulator = [[ArrayManipulator alloc] init];

        NSLog(@"\n\n========== ЧАСТЬ 1: ЗАДАЧА ПО ВАРИАНТУ 32 ==========");
        NSMutableArray<NSNumber *> *numbersForVariant = [NSMutableArray arrayWithObjects:@2, @3, @4, @5, @6, @8, @10, @11, nil];
      
        
        [manipulator printArray:numbersForVariant withTitle:@"Исходный массив для задачи варианта"];
        
        // Удаление четных чисел
        [manipulator removeEvenNumbersFromArray:numbersForVariant]; // Метод модифицирует исходный массив
        [manipulator printArray:numbersForVariant withTitle:@"Массив после удаления четных чисел (Вариант 32)"];
        NSLog(@"========== ЗАВЕРШЕНИЕ ЧАСТИ 1 ==========");

        // --- Часть 2: Демонстрация всех требуемых операций с массивами ---
        // Этот метод внутри себя демонстрирует пункты а, б, г, д, е, ё, ж, з
        // из списка общих требований
        // Пункт "а) вывод массива" демонстрируется многократно через printArray.
        // Пункт "в) ввод элементов массива с консоли" будет продемонстрирован отдельно ниже.
        [manipulator demonstrateArrayOperations]; //
        
        NSLog(@"\n\n========== ЧАСТЬ 3: ВВОД С КОНСОЛИ (пункт 'в') ==========");
        NSMutableArray<NSNumber *> *consoleInputArray = [NSMutableArray array]; // Создание пустого изменяемого массива (пункт 'б')
        
        NSLog(@"Сейчас будет продемонстрирован ввод 3-х целых чисел в массив с консоли.");
        NSLog(@"Пожалуйста, вводите по одному числу и нажимайте Enter.");
        
        int numberOfElementsToInput = 3;
        for (int i = 0; i < numberOfElementsToInput; i++) {
            int num_input;
            printf("Введите целое число #%d: ", i + 1);
            
            // Проверка результата scanf
            if (scanf("%d", &num_input) == 1) {
                [consoleInputArray addObject:[NSNumber numberWithInt:num_input]]; // Добавление элемента (пункт 'д')
            } else {
                NSLog(@"\nОшибка ввода! Было введено не число. Попробуйте еще раз для этого элемента.");
                char c;
                while ((c = getchar()) != '\n' && c != EOF);
                i--;
            }
        }
        
        [manipulator printArray:consoleInputArray withTitle:@"Массив, заполненный с консоли"]; // Вывод массива (пункт 'а')
        NSLog(@"Количество элементов в массиве, заполненном с консоли: %lu", (unsigned long)[consoleInputArray count]); // Подсчет количества (пункт 'г')
        NSLog(@"========== ЗАВЕРШЕНИЕ ЧАСТИ 3 ==========");
        
        NSLog(@"\nПрограмма завершила выполнение Задания 3.");
    }
    return 0;
}
