format PE console

entry start

include 'win32a.inc'

section '.data' data readable writeable

        resStr db 'result: %d ', 10, 13
        ;1.1
        a dd 10
        b dd 27
        numb db 101b
        ;1.2
        sum dd 0  
        dif dd 0  
        pon dd 1 
        rem dd ?  
        quo dd ?  

        NULL = 0

section '.code' code readable executable

        start:
                ;1.3
                mov eax, [a]
                add eax, [b]
                mov [sum], eax

                push [sum]
                push resStr
                call[printf]

                ;1.4
                mov eax, 0
                mov eax, [a]
                sub eax, [b]
                mov [dif], eax

                push [dif]
                push resStr
                call[printf]

                ;1.5
                mov eax, 0
                mov eax, [a]
                mov ebx, [b]
                neg ebx
                sub eax, ebx

                push eax
                push resStr
                call [printf]

                ;1.6
                mov eax, 0
                mov eax, [a]
                imul eax, ebx
                mov [pon], eax

                push [pon]
                push resStr
                call [printf]

                ;1.7
                mov eax, 0
                mov eax, [b]
                div [a]
                mov [rem], eax
                mov [quo], edx


                push [rem]
                push resStr
                call [printf]
                push [quo]
                push resStr
                call [printf]

                ;1.8     0111
                mov edx, [rem]
                or edx, 10001110b
                and edx, 01101010b

                push edx
                push resStr
                call[printf]

                ;1.9
                mov eax, 0
                mov eax, edx
                xor eax, eax

                push eax
                push resStr
                call[printf]


                call[getch]
                push NULL
                call [ExitProcess]


section '.idata' import data readable

        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'

        import kernel,\
               ExitProcess, 'ExitProcess'

        import msvcrt,\
               printf, 'printf',\
               getch, '_getch'
