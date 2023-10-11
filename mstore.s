.section .data
hello:  .string "Hello, World!"

.section .text
.globl _start

# print函数的定义
print:
    mov $1, %rax           # syscall number for sys_write
    mov $1, %rdi           # file descriptor 1 (stdout)
    mov $13, %rdx          # length of the string
    syscall                # invoke syscall
    ret                    # 返回到调用点

_start:
    # 调用print函数
    lea hello(%rip), %rsi # pointer to the string to print
    call print

    # sys_exit (void _exit(int status))
    mov $60, %rax           # syscall number for sys_exit
    xor %rdi, %rdi          # status code 0
    syscall                 # invoke syscall
