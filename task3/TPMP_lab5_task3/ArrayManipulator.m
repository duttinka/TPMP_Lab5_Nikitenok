#import "ArrayManipulator.h"

@interface ArrayManipulator ()
// Приватный вспомогательный метод для логирования операций
- (void)logInternalAction:(NSString *)actionDescription;
@end

@implementation ArrayManipulator

#pragma mark - Private Methods

- (void)logInternalAction:(NSString *)actionDescription {
    NSLog(@"[Внутреннее действие класса]: %@", actionDescription);
}

#pragma mark - Public Methods Implementation

- (NSMutableArray<NSNumber *> *)removeEvenNumbersFromArray:(NSMutableArray<NSNumber *> *)array {
    if (!array) {
        NSLog(@"Ошибка: Передан nil массив в removeEvenNumbersFromArray.");
        return nil;
    }
    
    [self logInternalAction:[NSString stringWithFormat:@"Начало удаления четных чисел. Исходный размер массива: %lu", (unsigned long)array.count]];
    
    NSMutableIndexSet *indexesOfEvenNumbersToRemove = [NSMutableIndexSet indexSet];
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSNumber *numberObject = [array objectAtIndex:i];
        if ([numberObject isKindOfClass:[NSNumber class]] && [numberObject intValue] % 2 == 0) {
            [indexesOfEvenNumbersToRemove addIndex:i];
        }
    }
    
    [array removeObjectsAtIndexes:indexesOfEvenNumbersToRemove];
    [self logInternalAction:[NSString stringWithFormat:@"Завершение удаления четных чисел. Новый размер массива: %lu", (unsigned long)array.count]];
    return array;
}

- (void)printArray:(nullable NSArray *)array withTitle:(NSString *)title {
    NSLog(@"\n--- %@ ---", title);
    if (array == nil) {
        NSLog(@"(Массив nil)");
        return;
    }
    if ([array count] == 0) {
        NSLog(@"(Массив пуст)");
        return;
    }
    
    NSMutableArray<NSString *> *stringElements = [NSMutableArray arrayWithCapacity:array.count];
    for (id object in array) {
        [stringElements addObject:[object description]]; 
    }
    NSLog(@"[%@]", [stringElements componentsJoinedByString:@", "]);
}

- (void)demonstrateArrayOperations {
    NSLog(@"\n\n=== Демонстрация Дополнительных Операций с Массивами ===");

    // а) вывод массива (будет использоваться повсеместно)

    // б) создание пустого изменяемого массива
    [self logInternalAction:@"Создание пустого изменяемого массива (emptyMutableArray)"];
    NSMutableArray *emptyMutableArray = [[NSMutableArray alloc] init];
    [self printArray:emptyMutableArray withTitle:@"Б) Пустой изменяемый массив"];

    // в) ввод элементов массива с консоли (эта часть реализована в main, здесь имитируем добавление для полноты демонстрации внутри класса)
    [self logInternalAction:@"Имитация добавления элементов в emptyMutableArray (как если бы был ввод)"];
    [emptyMutableArray addObject:@111];
    [emptyMutableArray addObject:@222];
    [emptyMutableArray addObject:@333];
    [self printArray:emptyMutableArray withTitle:@"В) emptyMutableArray после программного добавления элементов"];
    
    // г) подсчет количества элементов в неизменяемом и изменяемом массива
    [self logInternalAction:@"Подсчет количества элементов"];
    NSArray *immutableDemoArray = @[@10, @20, @30, @40]; // Неизменяемый
    NSMutableArray *mutableDemoArray = [NSMutableArray arrayWithObjects:@"Apple", @"Banana", nil]; // Изменяемый
    
    [self printArray:immutableDemoArray withTitle:@"Г) Неизменяемый массив (immutableDemoArray) для подсчета"];
    NSLog(@"Количество элементов в immutableDemoArray: %lu", (unsigned long)[immutableDemoArray count]);
    
    [self printArray:mutableDemoArray withTitle:@"Г) Изменяемый массив (mutableDemoArray) для подсчета"];
    NSLog(@"Количество элементов в mutableDemoArray: %lu", (unsigned long)[mutableDemoArray count]);

    // д) добавление элемента массива (в mutableDemoArray)
    [self logInternalAction:@"Добавление элемента 'Cherry' в mutableDemoArray"];
    [mutableDemoArray addObject:@"Cherry"];
    [self printArray:mutableDemoArray withTitle:@"Д) mutableDemoArray после добавления 'Cherry'"];

    // е) вставка элемента массива по индексу (в mutableDemoArray)
    [self logInternalAction:@"Вставка элемента 'Orange' по индексу 1 в mutableDemoArray"];
    if ([mutableDemoArray count] >= 1) {
        [mutableDemoArray insertObject:@"Orange" atIndex:1];
        [self printArray:mutableDemoArray withTitle:@"Е) mutableDemoArray после вставки 'Orange' по индексу 1"];
    } else {
         NSLog(@"Массив mutableDemoArray слишком мал для вставки по индексу 1. Текущее содержимое: %@", mutableDemoArray);
    }

    // ё) удаление последнего элемента массива (из mutableDemoArray)
    [self logInternalAction:@"Удаление последнего элемента из mutableDemoArray"];
    if ([mutableDemoArray count] > 0) {
        [mutableDemoArray removeLastObject];
        [self printArray:mutableDemoArray withTitle:@"Ё) mutableDemoArray после удаления последнего элемента"];
    } else {
        NSLog(@"Массив mutableDemoArray пуст, удаление последнего элемента невозможно.");
    }

    // ж) удаление элементов массива по индексу (из mutableDemoArray)
    [self logInternalAction:@"Удаление элемента по индексу 0 из mutableDemoArray"];
    if ([mutableDemoArray count] > 0) {
        [mutableDemoArray removeObjectAtIndex:0];
        [self printArray:mutableDemoArray withTitle:@"Ж) mutableDemoArray после удаления элемента по индексу 0"];
    } else {
        NSLog(@"Массив mutableDemoArray пуст, удаление по индексу 0 невозможно.");
    }
    
    // з) удаление всех элементов массива (из mutableDemoArray)
    [self logInternalAction:@"Удаление всех элементов из mutableDemoArray"];
    [mutableDemoArray removeAllObjects];
    [self printArray:mutableDemoArray withTitle:@"З) mutableDemoArray после удаления всех элементов"];
    
    NSLog(@"\n=== Завершение Демонстрации Дополнительных Операций ===");
}

@end
