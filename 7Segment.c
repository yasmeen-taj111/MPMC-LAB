#include <LPC214x.H>

void delay(unsigned int);

// Hex values for 0 to F on 7-segment display
unsigned int seg_code[16] = {
    0x00000604, // 0
    0x000007E4, // 1
    0x00000648, // 2
    0x00000618, // 3
    0x00000730, // 4
    0x00000690, // 5
    0x00000680, // 6
    0x0000063C, // 7
    0x00000600, // 8
    0x00000630, // 9
    0x00000620, // A
    0x00000780, // B
    0x000006C4, // C
    0x00000708, // D
    0x000006C0, // E
    0x000006E0  // F
};

int main()
{
    int i;

    // P0.2 to P0.10 as output
    IO0DIR = 0x000007FC;

    while(1)
    {
        // Display 0 to F continuously
        for(i = 0; i < 16; i++)
        {
            IO0CLR = 0x00000FFF;   // Clear previous display
            IO0SET = seg_code[i];  // Send pattern to 7-segment
            delay(150000);
        }
    }
}

void delay(unsigned int count)
{
    while(count--);
}
