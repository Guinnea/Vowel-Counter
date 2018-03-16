; Ryan Read
; 200243833
; Lab 6
; CS 301-95
; Mar 6th 2017

;;; Directives
          PRESERVE8
          THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
  
          ALIGN
		  
string1
	DCB	"ARM assembley language is important to learn!",0		  
 
; The program
; Linker requires Reset_Handler
 
	AREA    MYCODE, CODE, READONLY
 
	ENTRY
	EXPORT Reset_Handler
 
 
Reset_Handler

;;;;;;;;;; The Good Stuff ;;;;;;;;;;;;


	LDR R0, = string1   ;Load the string address into R0
	MOV	R1, #0  		;Initialize vowel counter to 0
	MOV R2, #0			;Initialize non-vowel counter to 0

loopNext

	LDRB 	R3, [R0]		; Load the character from the address R0 contains
	CBZ		R3, countDone   ; Branch to countDone if reached the end of the string
	
	ADD	R0, #1       		; Update the index to the next letter
	
	CMP R3, #'a' 			; Check to see if the letter in the string is a vowel
	BEQ addVowel			; If it is, branch to increment vowel counter
	CMP R3, #'A' 			; Repeat
	BEQ addVowel
	CMP R3, #'e' 
	BEQ addVowel
	CMP R3, #'E' 
	BEQ addVowel
	CMP R3, #'i' 
	BEQ addVowel
	CMP R3, #'I' 
	BEQ addVowel
	CMP R3, #'o' 
	BEQ addVowel
	CMP R3, #'O' 
	BEQ addVowel
	CMP R3, #'u' 
	BEQ addVowel
	CMP R3, #'U' 
	BEQ addVowel
	
	ADD R2, R2, #1			; If it's reached this point, it isn't a vowel and therefore increment non vowel counter
	
	B loopNext				; Branch to the top of the loop
	
addVowel
	ADD	R1, R1, #1      	; Increment the vowel counter by 1
	B loopNext

countDone

STOP
        B  STOP
	END			; End of the program