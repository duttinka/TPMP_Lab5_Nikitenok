#import <Foundation/Foundation.h>
#import "NumberProcessor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создаем экземпляр
        NumberProcessor *processor = [[NumberProcessor alloc] init];
        
        double m_value;
        
        NSLog(@"Пожалуйста, введите число m (дробное число вводится через точку, например, 2.5):");
        

        if (scanf("%lf", &m_value) == 1) {
            [processor calculateAndPrintCubesOfOddHundredsWithMultiplier:m_value];
        } else {
            
            NSLog(@"Ошибка ввода. Пожалуйста, убедитесь, что вы ввели число.");
            char c;
            while ((c = getchar()) != '\n' && c != EOF);
        }
    }
    return 0;
}
