#import <Foundation/Foundation.h>

// Объявление интерфейса класса NumberProcessor
// Класс наследуется от NSObject, базового класса в Objective-C
@interface NumberProcessor : NSObject

// Объявление метода.
// Он ничего не возвращает (void) и принимает один аргумент:
// - m: число типа double, с которым будем производить умножение.
// Имя метода: calculateAndPrintCubesOfOddHundredsWithMultiplier
- (void)calculateAndPrintCubesOfOddHundredsWithMultiplier:(double)m;

@end
