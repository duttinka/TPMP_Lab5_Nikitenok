#import "NumberProcessor.h"

@implementation NumberProcessor

-(void)calculateAndPrintCubesOfOddHundredsWithMultiplier:(double)m {
    NSLog(@"Расчет для множителя m = %f", m);

    BOOL foundOddHundred = NO; 

    for (int number = 1; number <= 1000; number++) {
        if (number % 100 == 0) {
            // Получаем порядковый номер сотни (1 для 100, 2 для 200, и т.д.)
            int hundredOrder = number / 100;
            
            if (hundredOrder % 2 != 0) {
                foundOddHundred = YES;
                
                double cube = (double)number * number * number;
                
                double result = cube * m;
                
                // %.0f используется для вывода double без дробной части, если она нулевая
                NSLog(@"Нечетная сотня: %d. Куб: %.0f. Результат умножения на m: %.0f", number, cube, result);
            }
        }
    }

    if (!foundOddHundred) {
        NSLog(@"В диапазоне от 1 до 1000 не найдено нечетных сотен.");
    }
}

@end
