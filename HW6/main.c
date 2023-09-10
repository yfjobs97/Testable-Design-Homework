#include <stdio.h>
#include <stdlib.h>

#define HIGHEST_ORDER 8 //Set LFSR order. 8 in problem
#define MAX_ITERATIONS 16




int main()
{

    int transMatrix[HIGHEST_ORDER][HIGHEST_ORDER] = {
                              {0,1,0,0,0,0,0,0},
                              {0,0,1,0,0,0,0,0},
                              {0,0,0,1,0,0,0,0},
                              {0,0,0,0,1,0,0,0},
                              {0,0,0,0,0,1,0,0},
                              {0,0,0,0,0,0,1,0},
                              {0,0,0,0,0,0,0,1},
                              {1,0,1,1,1,0,0,0}
                            };
    int initialValues[HIGHEST_ORDER] = {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1};

    int resultMatrix[HIGHEST_ORDER];
    int previousValues[HIGHEST_ORDER];
    /*Take 16 iterations in matrix multiplication*/
    int iterations = 0;
    while(iterations < MAX_ITERATIONS){
        for(int i = 0; i < HIGHEST_ORDER; i++){
            int tempValue = 0;//Collect immediate results between matrix additions
            for(int j = 0; j < HIGHEST_ORDER; j++){
                if(iterations == 0){
                    tempValue = tempValue + transMatrix[i][j] * initialValues[j];//If first run, use initial values
                }else{
                    tempValue = tempValue + transMatrix[i][j] * previousValues[j];//If not first run, use previous values
                }

            }
            if(tempValue > 1){
                tempValue = 0;//Limit result to 0 and 1
            }
            resultMatrix[i] = tempValue;//write to result matrix
        }
        printf("\n");
        //printf("Result Matrix %d is:\n", iterations);
        //printf("s0(t+1) \ts1(t+1) \ts2(t+1) \ts3(t+1) \ts4(t+1) \ts5(t+1) \ts6(t+1) \ts7(t+1) \n");

        /*Convert patterns to decimal number and do the multiplication*/
        int x, y = 0;
        for(int k = HIGHEST_ORDER-1; k >=0 ; k--){
            previousValues[k] = resultMatrix[k];//store the result to previous block
            printf("%d ",resultMatrix[k]);
            if(k == 7){
                x += resultMatrix[k] * 8;
            }
            else if(k == 6){
                x += resultMatrix[k] * 4;
            }
            else if(k == 5){
                x += resultMatrix[k] * 2;
            }
            else if(k == 4){
                x += resultMatrix[k] * 1;
            }
            else if(k == 3){
                y += resultMatrix[k] * 8;
            }
            else if(k == 2){
                y += resultMatrix[k] * 4;
            }
            else if(k == 1){
                y += resultMatrix[k] * 2;
            }
            else {
                y += resultMatrix[k] * 1;

                printf("\n X is %d, and Y is %d. X * Y is %d \n", x, y, x*y);
                x = 0;
                y = 0;
            }
        }

        iterations++;
    }
    printf("\n Total iterations: %d", iterations);

    return 0;
}
