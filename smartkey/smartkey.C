//Project: smartkey.prj
// Device: MS82Fxx02
// Memory: Flash 2KX14b, EEPROM 128X8b, SRAM 128X8b
// Author: 
//Company: 
//Version:
//   Date: 
//===========================================================
//===========================================================

#include 	"main.h";
#include 	"sysInit.H"


unsigned char mode_chek = md_ckIDE ;
unsigned int timeOut =0,timeTick=0,cntTmp=0;
unsigned char cntCyc = 0,cntOff =0,lostDetect =0;//test_t=0,
unsigned char  mtState = _Ide,mtOldState=0;//
//unsigned char serNum[9]={0};
unsigned char RegStatus = 0;


//===========================================================
//Variable definition
//===========================================================

/*
V1: Ðo mu'c 16ms < H < 80ms  và L > 130ms - trong truong hop khong co nhieu
Phat hien suon len trong trang thai nghi-> start-> do muc H
Doi suon xuong, do muc L
V2: Ðo d? r?ng m?c L k?t h?p v?i suon len dau tien 


T + N_____||||||__________________
	      ______
T    _____|	   |__________________

F + N_____||||||_____||||||_____||||||_____||||||__________________
	      ______ 	 ______     ______     ______
F    _____|	   |_____|     |____|    |_____|    |__________

*/

void interrupt ISR(void)
{
	unsigned char tmp=0;
//=============
//PortA Interrup --> keyfob detect   
	if(PAIE&&PAIF){
		
		
tmp = PORTA;		//
		PAIF = 0;          //clear flag       
		//righting egde
		if(keyDetect){
    
			if(mode_chek == md_ckIDE){	
				cntCyc = 0;
				cntOff = 0; 
				//TMR2IE = 0;
				mode_chek = md_ckStart;
                
            }
		
		} //falling edge
        else{
        	cntOff = 0;
        	// init timer
          			
		}   

	}
 
//====================

//====================
//Timer0 Interrup 
 if(T0IE&&T0IF){
     T0IF = 0;
	 TMR0 = 179;
        
        // time out 10ms
        // 'Verify' : 20ms <'0'< 50ms -> 'F' -> 'Busy' -> 'IDE'
        // 'Verify' : '0' > 50ms -> 'T' -> 'IDE'
    
        if( mode_chek == md_ckStart){
			//count cycle time(inlude noise)
			cntCyc++;
            
			if(keyDetect==0){
				//cout dead time
            cntOff++;
                
				//time out 
				if(cntOff > 15){ //110
					//TMR2IE = 1;
					mode_chek = md_ckIDE;
                    	//90 - 500ms
					if((cntCyc>15) &&(cntCyc<50)) {//2-> 16=>15
						RegStatus |= (keyfob);				
                    } else if (cntCyc>=50){
                        RegStatus &= ~(keyfob);                       
                    }
                    //swUartSendString("keyUpd\n");
                    
					RegStatus |= keyUpd;
                }
                
			}
           /* 
			if( cntCyc==0){
                mode_chek = md_ckIDE;
                RegStatus &= ~(keyfob);  
				RegStatus |= keyUpd;
				test_t=1;
			}
            */
            
		}
        
        //
		timeTick++;
		
		if((mtState == _rAlert)||(mtState == _Alert)){

			if(timeTick > cntTmp){
	            cntTmp = timeTick+40;
	            if(cntTmp<=timeOut)
				{
					if(PR2L == 11)
						PR2L = 30; 
					else
						PR2L = 11;
				}
            }
		}
		

	}
 //====================
// Timer2 ->> buzzer   
	if(TMR2IE&&TMR2IF)
		{
			TMR2IF = 0;
			buzzer =~ buzzer;			//
		}
    
}


void delay_x10ms(unsigned int t){
unsigned int set = t + timeTick; 
        while(timeTick < set); 
}

void beepOff(){
    TMR2ON = 0;buzzer =0;TRISA |= 0x20;
}
void beepOn(){
    TMR2ON = 1;
    TRISA &= 0xdf;
}
void beep(unsigned char delay,unsigned char rep){


    {	
        
		while(rep--){
            TMR2ON = 1;
			PR2L = 12; //12
			delay_x10ms(delay);
            TMR2ON = 0;buzzer =0;
            delay_x10ms(20);
        }
    }

}


/*====================================================*/
unsigned char READ_EEPROM(unsigned char EEAddr)
{
	unsigned char ReEepromData;

	EEADR = EEAddr;    
	RD = 1;
	ReEepromData = EEDAT;
	RD = 0;
	return ReEepromData;
}

void WRITE_EEPROM(unsigned char EEAddr,unsigned char EEData)
{
	GIE = 0;           
	while(GIE) CLRWDT();
	EEADR = EEAddr;
	EEDAT = EEData;
	EEIF = 0;
	EECON1 = 0x34;
	WR = 1;
	while(WR) CLRWDT();	
                       
	GIE = 1;
}

/*====================================================*/

void setState(unsigned char stt, unsigned int _tOut){
    mtOldState = mtState;
	mtState = stt;
	timeTick =0;
	timeOut = _tOut;
}

void main(void)
{
	// clear WDT

unsigned char reAlertOn=0;


	CLRWDT();
    
	sys_init();
	gpio_init();
        
    timer_init();
    int_init();

 //swUartSendString("PowerOn\n");
 
    __delay_ms(100);
    
 enaDetect =1;
    __delay_ms(100);
    
	PAIE = 1;    
	
	RegStatus = 0;

    setState(_Ide,0);
    
    
    //RegStatus |= (bitSwMain);
	   
//================= 
	WRITE_EEPROM(0xFF,0xAA);			//bat buoc
	WRITE_EEPROM(0xFF,0xAA);			//bat buoc
 //================= 
     
    delay_x10ms(1);
    
    if(READ_EEPROM(add_Alert)==0xff) {WRITE_EEPROM(add_Alert,0);__delay_ms(2);}
    
    if(READ_EEPROM(add_Alert)==0xcc){		//
		RegStatus &=~(bitPwOn);
		setState(_Alert,tOut_Alert);
		mtOldState = _Open;
		cntTmp = timeTick+50;
		PR2L =12;
		beepOn();
    } else {
setState(_rCheck,400);// bat nguon lan dau timeOut =4s

mtOldState = _Ide;
 /*       RegStatus |=(bitPwOn);
								setState(_Open,tOut_Open);mtOldState = _Open;
                                */
	}


//=================
	while(1){
/*
 /// swMain  =======================         
        // cap nhat trang thai swMain, kiem tra suon len, xuong -> Bat/Tat may
        // neu gia tri hien tai khac gia tri truoc do -> co suon
        
		if((swMainIn) != (RegStatus & bitSwMain)){
        	// suon len
			if(swMainIn) {
                // thuc thi
				
                // luu gia tri
				RegStatus |= (bitSwMain);
			} 
            /// suon xuong
			else {
                 // thuc thi
				
                // luu gia tri
                RegStatus &= (~bitSwMain);
			}
		}
        
*/    
/*
     if(READ_EEPROM(add_Alert)==0xcc) swStartOut =1;
     else  swStartOut =0;
     */
 /*
Tin hieu cac xe khac nhau
vision 2018 - '1'=50ms '0'=50ms ;
-------2019 -------------'0'=40ms; keyfob True  3 xung 1-0
sh2019---- '1'=70ms '0'=50ms ; recheck '0' = 100ms  

*/   

swTx =keyDetect;
                    
/// keyfob update  ===============    
        if(mode_chek == md_ckIDE)
        {
        	
			if(RegStatus & keyUpd)
            {
				PAIE = 0;
                
				//indicator ? notifi				                
				RegStatus &= (~keyUpd);
              /*  			
				if(test_t ){
                    if(mtOldState == _Ide){
                    //test_t=0;
                    beep(10,3);
					RegStatus |=(bitPwOn); 
					setState(_Norl,tOut_Norl);
                    }
                    }
                else
                */
                {
	        	// co chia -> tao TimeOut
				if ((RegStatus & keyfob) !=0){
					//beep(10,1);	
                    	
					switch (mtState){					                                                 
                        case _Open:
						//kiem tra chan chong
                        /*
                            if(swStand){   
                                 // kiem? tra lan^ 2 ?                        									
								RegStatus &=(~bitPwOn);
                                setState(_rCheck,tOut_rCheck);
                            }
                            */
                            lostDetect =0;
                            timeTick =0;//open->open
							break; 
                                                         
                        case _rCheck:
                        if(timeTick >30){                         
							timeTick =0;
                            
                            if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                            
							if((mtOldState == _Alert)){
									beepOn();TMR2ON = 0; beep(10,1);
                                    if(reAlertOn)reAlertOn =0;
							}                           
                            else if((mtOldState == _Ide)||(mtOldState == _rAlert)){
								RegStatus |=(bitPwOn);
								setState(_Open,tOut_Open);
                                beep(10,1);
                            }
                            else if((mtOldState == _Open)){
									//beepOn();TMR2ON = 0; beep(10,1);
                                    if(reAlertOn)reAlertOn =0;
							}   	
                        }			     				 
							break;
                            
                        case _Alert:                   
							if(timeTick > 200)
                            {
								beepOff();
								if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                                RegStatus |=(bitPwOn);		                         
								setState(_Open,tOut_Open);
                            }
                            //timeTick =0;
							break;
                            
						case _rAlert:
							beepOff();                        
							setState(_rCheck,tOut_rCheck);
							break;  	
						case _Ide:
                            //setState(_rCheck,tOut_rCheck);
							break; 
                        
					}
                    
	        	}
                // mat chia
                else{
					//beep(10,2);
                     switch (mtState){

                            case _Open:
                            /// Da chong canh, ? mat chia => uu tien ?
                             /*
								 if(swStand){
                                    // kiem? tra lan^ 2 ?
								 	beepOn();TMR2ON = 0;
								 	RegStatus &=(~bitPwOn);
									setState(_rCheck,tOut_rCheck);
								 }
								 else*/
                                
                                 {
								 	// vision moi lan nhan nut de, -> check chia
                                    if(lostDetect==1 && timeTick< 1500) // check lan 2 <=> = 20 -> alert 20s -> den smart key sang!  =>      alert =18s                           
                                    {
										if(READ_EEPROM(add_Alert)==0x00) WRITE_EEPROM(add_Alert,0xcc);
                                        
										setState(_Alert,tOut_Alert);
	                                    cntTmp = timeTick+40;// kiem tra lai 
										PR2L =11;
										beepOn();
	                                    lostDetect =0;
                                    }
                                    else {
										lostDetect =1;
                                        //beepOn();TMR2ON = 0;
										//beep(10,2);
                                    }
                                    timeTick =0;
								 }                                               
								break;
                            case _rCheck:
                             //if(timeTick >30)
                             {
								timeTick =0;
                                beepOn();TMR2ON = 0;
                                beep(10,2);
                                if(mtOldState == _Alert){reAlertOn =1;}  
                             }                            
								break;
                     }  
				}
                
                }// test time out  chan detect 125khz
				
				PAIE = 1;
			}
        	
        }
	
/// Time Out
 //if(mode_chek == md_ckIDE)
{
		if((timeOut!=0)&&( timeTick >timeOut)){
              		
			switch (mtState){
             
                case _Open:
                // da chong (khong nhan duoc tin hieu)
			        //beepOn();TMR2ON = 0;
			        //RegStatus &=(~bitPwOn);            
					//setState(_rCheck,tOut_rCheck);		
					break;
			    case _Alert:
					beepOff();     
			        RegStatus &=(~bitPwOn);            
					setState(_rCheck,tOut_rCheck);		
					break;
				case _rAlert:
                    beepOff();
                    delay_x10ms(20);
                    beepOn();TMR2ON = 0;reAlertOn =0;         
                    beep(30,1);
					setState(_Ide,tOut_Ide);
                    break;
				case _rCheck:
                    // xoa canh bao
                    if(READ_EEPROM(add_Alert)==0xcc) WRITE_EEPROM(add_Alert,0);
                    
					if(reAlertOn){	///???reAlertOn						
							setState(_rAlert,tOut_rAlert);
							cntTmp = timeTick+40;
							PR2L =11;
							beepOn();
                            
                    }else if(mtOldState == _Ide){							
                            // bao anten hong
                            beep(10,5);
                            RegStatus |=(bitPwOn); 
							//setState(_Norl,tOut_Norl);
                            setState(_Open,tOut_Open);
                            
						}else{
                            beepOn();TMR2ON = 0; 
                            reAlertOn =0;          
							beep(30,1);						
							setState(_Ide,tOut_Ide);
						}
				break;
			 }
		}

} 
     
		if((swStand ) && (mtState == _Open)){
			timeTick =0;
            while(timeTick <700);
            //cntTmp = timeTick+100;
			cntTmp=0;
			while((swStand) &&( cntTmp<9)){					 
                     beepOn();TMR2ON = 0; beep(10,1);
                     cntTmp++;
                     __delay_ms(1000);
			}	
            cntTmp =0;
            if(swStand){   
			//beepOn();TMR2ON = 0;
			RegStatus &=(~bitPwOn);
			setState(_rCheck,tOut_rCheck);
            }
            
            timeTick =0;
		}   		
///     
  
		if(RegStatus & bitPwOn) {swMainOut =1;swMainOut2 =1;}
        else {swMainOut =0;swMainOut2 =0;}
        

	}   

}
//===========================================================
