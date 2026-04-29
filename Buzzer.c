#include<LPC214x.h>

void delay(unsigned long int);

void main()
{
    unsigned int number = 0x01000000;

    IO1DIR = 0x01000000;

    while(1)
    {
        if(IO0PIN & 0x00008000)
        {
            IO1SET = number;
            delay(200000);

            IO1CLR = number;
            delay(200000);
        }
        else
        {
            IO1CLR = number;
        }
    }
}

void delay(unsigned long int count1)
{
    while(count1 > 0)
    {
        count1--;
    }
}
