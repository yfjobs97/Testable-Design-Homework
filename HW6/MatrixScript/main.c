#include <stdio.h>
#include <stdlib.h>

#define HIGHEST_ORDER 5

int main()
{
    printf("Hello world!\n");


    int transMatrix[HIGHEST_ORDER][HIGHEST_ORDER] = {
                              {0,0,0,0,1},
                              {1,0,0,0,0},
                              {0,1,0,0,1},
                              {0,0,1,0,0},
                              {0,0,0,1,0}
                            };
    int initialValues[HIGHEST_ORDER] = {
    0,
    0,
    0,
    0,
    1};

    int resultMatrix[HIGHEST_ORDER];
    int previousValues[HIGHEST_ORDER];
    int currentValueMatch[HIGHEST_ORDER];
    int valuesMatchInitial = 0;
    int firstTime = 1;
    int iterations = 0;
    while(valuesMatchInitial == 0){
        for(int i = 0; i < HIGHEST_ORDER; i++){
            int tempValue = 0;
            for(int j = 0; j < HIGHEST_ORDER; j++){
                if(firstTime){
                    tempValue = tempValue + transMatrix[i][j] * initialValues[j];
                }else{
                    tempValue = tempValue + transMatrix[i][j] * previousValues[j];
                }

            }
            if(tempValue > 1){
                tempValue = 0;
            }
            resultMatrix[i] = tempValue;
        }
        printf("\n Result Matrix is:\n");

        for(int k = 0; k < HIGHEST_ORDER; k++){
            previousValues[k] = resultMatrix[k];
            printf("%d \n",resultMatrix[k]);

            if(resultMatrix[k] == initialValues[k]){
                currentValueMatch[k] = 1;
            }
            else{
                currentValueMatch[k] = 0;
            }
        }
        for(int k = 0; k < HIGHEST_ORDER  ; k++){
            if(currentValueMatch[k] != 1){
                break;
            }
            else{
                if(k== HIGHEST_ORDER - 1){
                    valuesMatchInitial = 1;
                }
            }
        }
        firstTime = 0;
        iterations++;
    }
    printf("Total iterations: %d", iterations);

    return 0;
}
