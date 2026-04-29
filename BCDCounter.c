#include <LPC214x.h>

int main(void)
{
    unsigned int delay, delay1;
    unsigned int num, val;

    IO1DIR = 0x00FF0000;

    num = 0x00;
    val = 0x00000000;

    IO1CLR = 0x00FF0000;

    while(1)
    {
        IO1CLR = 0x00FF0000;

        val = (num << 16);

        IO1SET = val;

        num++;

        if(num > 9)
        {
            num = 0x00;
        }

        for(delay = 0; delay < 0x700; delay++)
        {
            for(delay1 = 0; delay1 < 0x70; delay1++);
        }
    }
}
