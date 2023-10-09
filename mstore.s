    .section .data
hello:  .string "Hello, World!"

    .section .text
    .globl _start
_start:
    # sys_write (ssize_t write(int fd, const void *buf, size_t count))
    movl $4, %eax           # syscall number for sys_write
    movl $1, %ebx           # file descriptor 1 (stdout)
    leal hello, %ecx        # pointer to the string to print
    movl $13, %edx          # length of the string
    int $0x80               # interrupt to invoke syscall

    # sys_exit (void _exit(int status))
    movl $1, %eax           # syscall number for sys_exit
    xorl %ebx, %ebx         # status code 0
    int $0x80               # interrupt to invoke syscall
