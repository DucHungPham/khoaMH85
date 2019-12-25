#ifndef __swuart_h
#define __swuart_h

#include "main.h"

#define StopBit 3
#define StartBit 3
#define DataBit 1

#define swTx RA0
#define swBR 9600

#define swDelayBit (2000000/swBR)

void swUartInit(void);
void swUartSendByte(unsigned char dat);
void swUartSendString(char *str);
void SendNum(unsigned char num);

#endif