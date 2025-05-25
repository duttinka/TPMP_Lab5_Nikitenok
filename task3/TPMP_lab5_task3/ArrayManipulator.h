#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayManipulator : NSObject

//публичные методы

/**
 * удаляет все четные числа из предоставленного изменяемого массива
 * @param array Массив чисел (NSNumber), из которого будут удалены четные элементы. Массив будет изменен
 * @return Тот же массив, но без четных чисел
 */
- (NSMutableArray *)removeEvenNumbersFromArray:(NSMutableArray<NSNumber *> *)array;

/**
 * выводит содержимое массива в консоль с заданным заголовком
 * @param array Массив для вывода.
 * @param title Заголовок, который будет напечатан перед массивом.
 */
- (void)printArray:(nullable NSArray *)array withTitle:(NSString *)title;

/**
 * создание пустого изменяемого массива, подсчет элементов, добавление,
 * вставка, удаление последнего, удаление по индексу, удаление всех элементов
 */
- (void)demonstrateArrayOperations;

@end

NS_ASSUME_NONNULL_END
