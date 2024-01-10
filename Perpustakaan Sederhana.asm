.MODEL SMALL
.CODE
ORG 100H
JMP MULAI

;VARIABEL
nama     DB 0dh,0ah,0dh,0ah,"Masukkan nama anda: ", '$'
id       DB 0dh,0ah,"Masukkan Nomor id (diisi dengan tanggal lahir) anda: ", '$'
psn1     DB "PROGRAM PERPUSTAKAAN SEDERHANA",0dh,0ah,"-----------------------------",'$'
psn2     DB 0dh,0ah,0dh,0ah,"SELAMAT DATANG DI PERPUSTAKAAN SEDERHANA ", '$'
psn3     DB 0dh,0ah,"NOVEL YANG TERSEDIA SAAT INI: ",0dh,0ah  
         DB "========================",0dh,0ah     
         DB "=      1.BUKU 1        =",0dh,0ah
         DB "=      2.BUKU 2        =",0dh,0ah
         DB "=      3.BUKU 3        =",0dh,0ah
         DB "========================",0dh,0ah 
         DB 0dh,0ah, 'Novel apa yang ingin kamu baca? $'
psn4     DB 0dh,0ah, 'Selamat membaca... $'
psn5     DB 0dh,0ah, "Terimakasih telah berkunjung di perpustakaan UAD", '$'
psn6     DB 0dh,0ah, "Ingin membaca buku lainnya? (Y/N)", '$'
eror     DB 0dh,0ah, "Masukkan kode yang benar!", '$'
msg1:    DB 0dh,0ah,0dh,0ah,"============ BUKU 1 ============",0dh,0ah,"Daaun Yang Jatuh Tak pernah membenci angin...",'$'
msg2:    DB 0dh,0ah,0dh,0ah,"============ BUKU 2 ============",0dh,0ah,"Sherlock Holmes...",'$'
msg3:    DB 0dh,0ah,0dh,0ah,"============ BUKU 3 ============",0dh,0ah,"Yang bertahan atau binasa perlahan...",'$' 

tampung_nama DB 30, ?, 30 dup(?) 
tampung_id   DB 30, ?, 30 dup(?)  

MULAI:
LEA DX,psn1
MOV AH,9
INT 21H

LEA DX,nama
MOV AH,9
INT 21H

MOV AH,0AH
LEA DX,tampung_nama 
INT 21H
PUSH DX 

LEA DX,id
MOV AH,9
INT 21H   

MOV AH,0AH
LEA DX,tampung_id  
INT 21H
PUSH DX    

LEA DX,psn2
MOV AH,9
INT 21H    

MULAI2:
LEA DX,psn3
MOV AH,9
INT 21H    

proses:
MOV AH,01
INT 21H


CMP AL, '1'
JE BUKU_1  

CMP AL, '2'
JE BUKU_2

CMP AL, '3'
JE BUKU_3

JNE psn_eror

proses2:
LEA DX,psn6
MOV AH,9
INT 21H
MOV AH,01
INT 21H

CMP AL, 'Y'
JE baca_lagi

CMP AL, 'N'
JE baca_selesai

JNE psn_eror     

buku_1:
     LEA DX,psn4
     MOV AH,9
     INT 21H
     MOV DX,msg1
     MOV AH,9
     INT 21H
     JMP proses2
     
buku_2:
     LEA DX,psn4
     MOV AH,9
     INT 21H
     MOV DX,msg2
     MOV AH,9
     INT 21H
     JMP proses2
     
buku_3:
     LEA DX,psn4
     MOV AH,9
     INT 21H
     MOV DX,msg3
     MOV AH,9
     INT 21H
     JMP proses2
     
baca_lagi:
     JMP MULAI2
                    
baca_selesai:
     LEA DX,psn5
     MOV AH,9
     INT 21H
     INT 20H
     JMP exit
     
psn_eror:
     LEA DX,eror
     MOV AH,9
     INT 21H
     INT 20H
     
JMP EXIT
EXIT:
RET     
                   