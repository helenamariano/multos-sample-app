/* Application Identifier */
#pragma attribute("aid", "11")

/* Application Name */
#pragma attribute("name", "Sample")

/* FCI */
#pragma attribute("fci", "112233")

#include <multos.h>

#pragma melstatic
unsigned char counter = 0;

void main(void)
{    
    /* Increments the lower byte of the status word on every APDU*/
    counter++;
    multosSW2 = counter;
    multosExit();
}
