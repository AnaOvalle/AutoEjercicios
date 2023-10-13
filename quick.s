@ #include <stdio.h>  // Including the standard input-output header file for functions like printf.

@void swap(int* a, int* b) {
@    int temp = *a;
@    *a = *b;
@    *b = temp;
@}

@ * Partitions the array around a pivot element.
@ *
@ * @param arr: An array of integers.
@ * @param low: The starting index of the array.
@ * @param high: The ending index of the array.
@ * @return: The index of the pivot element after partitioning.

@ int partition(int arr[], int low, int high) {
@    int pivot = arr[high];  // Choosing the last element as the pivot.
@    int i = (low - 1);  // Index of the smaller element.

@    for (int j = low; j <= high - 1; j++) {
@        // If the current element is smaller than or equal to the pivot,
@        // swap arr[i] and arr[j] and increment i.
@        if (arr[j] <= pivot) {
@            i++;
@            swap(&arr[i], &arr[j]);
@        }
@    }
@    swap(&arr[i + 1], &arr[high]);
@    return (i + 1);
@}

@ * Sorts an array of integers using the QuickSort algorithm.
@ *
@ * @param arr: An array of integers.
@ * @param low: The starting index of the array.
@ * @param high: The ending index of the array.
@ 
@ void quickSort(int arr[], int low, int high) {
@    if (low < high) {
@        // Partition the array and get the index of the pivot element.
@        int pi = partition(arr, low, high);
@
@        // Recursively sort the sub-arrays before and after the pivot element.
@      quickSort(arr, low, pi - 1);
@       quickSort(arr, pi + 1, high);
@    }
@ }

@ // Usage example for quickSort

@ int main() {
@    int arr[] = {64, 34, 25, 12, 22, 11, 90};
@    int n = sizeof(arr) / sizeof(arr[0]);

@    printf("Original array: ");
@    for (int i = 0; i < n; i++) {
@        printf("%d ", arr[i]);
@    }
@    printf("\n");
@
@    quickSort(arr, 0, n - 1);
@
@    printf("Sorted array: ");
@    for (int i = 0; i < n; i++) {
@        printf("%d ", arr[i]);
@    }
@    printf("\n");

@    return 0;
@ }

@---------------------------------------------------------------------------

@ Establecer la arquitectura como ARMv6
        .arch armv6
        .eabi_attribute 28, 1
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 6
        .eabi_attribute 34, 1
        .eabi_attribute 18, 4

@ Ajustes y configuración para la interfaz binaria
        .file   "quick.c"

@ Indentificar el nombre del archivo 
        .text
        .align  2

@ ----------SECCIÓN DE CODIGO-----------
@ Declara la función swap como global

        .global swap
        .arch armv6
        .syntax unified
        .arm
        .fpu vfp
        .type   swap, %function            // Configuraciones y ajustes para la arquitectura y la sintaxis de ARMv6, utilizando unidades de punto flotante VFP.
swap:      //Defina la función swap.
        @ args = 0, pretend = 0, frame = 16
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #20
        str     r0, [fp, #-16]
        str     r1, [fp, #-20]
        ldr     r3, [fp, #-16]
        ldr     r3, [r3]
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-20]
        ldr     r2, [r3]
        ldr     r3, [fp, #-16]
        str     r2, [r3]
        ldr     r3, [fp, #-20]
        ldr     r2, [fp, #-8]
        str     r2, [r3]
        nop
        add     sp, fp, #0
        @ sp needed
        ldr     fp, [sp], #4
        bx      lr

@ El contenido de la función swap realiza operaciones para intercambiar valores entre posiciones de memoria.
        .size   swap, .-swap
        .align  2
        .global partition
        .syntax unified
        .arm
        .fpu vfp
        .type   partition, %function
partition:
        @ args = 0, pretend = 0, frame = 32
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #32
        str     r0, [fp, #-24]
        str     r1, [fp, #-28]
        str     r2, [fp, #-32]
        ldr     r3, [fp, #-32]
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r3, [r3]
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-28]
        sub     r3, r3, #1
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-28]
        str     r3, [fp, #-12]
        b       .L3
.L5:
        ldr     r3, [fp, #-12]
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r3, [r3]
        ldr     r2, [fp, #-16]
        cmp     r2, r3
        blt     .L4
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-8]
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r0, r2, r3
        ldr     r3, [fp, #-12]
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        mov     r1, r3
        bl      swap
.L4:
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
.L3:
        ldr     r2, [fp, #-32]
        ldr     r3, [fp, #-12]
        cmp     r2, r3
        bgt     .L5
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r0, r2, r3
        ldr     r3, [fp, #-32]
        lsl     r3, r3, #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        mov     r1, r3
        bl      swap
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        mov     r0, r3
        sub     sp, fp, #4
        @ sp needed
        pop     {fp, pc}
        .size   partition, .-partition
        .align  2
        .global quickSort
        .syntax unified
        .arm
        .fpu vfp
        .type   quickSort, %function
quickSort:
        @ args = 0, pretend = 0, frame = 24
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #24
        str     r0, [fp, #-16]
        str     r1, [fp, #-20]
        str     r2, [fp, #-24]
        ldr     r2, [fp, #-20]
        ldr     r3, [fp, #-24]
        cmp     r2, r3
        bge     .L9
        ldr     r2, [fp, #-24]
        ldr     r1, [fp, #-20]
        ldr     r0, [fp, #-16]
        bl      partition
        str     r0, [fp, #-8]
        ldr     r3, [fp, #-8]
        sub     r3, r3, #1
        mov     r2, r3
        ldr     r1, [fp, #-20]
        ldr     r0, [fp, #-16]
        bl      quickSort
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        ldr     r2, [fp, #-24]
        mov     r1, r3
        ldr     r0, [fp, #-16]
        bl      quickSort
.L9:
        nop
        sub     sp, fp, #4
        @ sp needed
        pop     {fp, pc}
        .size   quickSort, .-quickSort
        .section        .rodata
        .align  2
.LC1:
        .ascii  "Original array: \000"
        .align  2
.LC2:
        .ascii  "%d \000"
        .align  2
.LC3:
        .ascii  "Sorted array: \000"
        .align  2
.LC0:
        .word   64
        .word   34
        .word   25
        .word   12
        .word   22
        .word   11
        .word   90
        .text
        .align  2
        .global main
        .syntax unified
        .arm
        .fpu vfp
        .type   main, %function
main:
        @ args = 0, pretend = 0, frame = 40
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #40
        ldr     r3, .L16
        sub     ip, fp, #44
        mov     lr, r3
        ldmia   lr!, {r0, r1, r2, r3}
        stmia   ip!, {r0, r1, r2, r3}
        ldm     lr, {r0, r1, r2}
        stm     ip, {r0, r1, r2}
        mov     r3, #7
        str     r3, [fp, #-16]
        ldr     r0, .L16+4
        bl      printf
        mov     r3, #0
        str     r3, [fp, #-8]
        b       .L11
.L12:
        ldr     r3, [fp, #-8]
        lsl     r3, r3, #2
        sub     r2, fp, #4
        add     r3, r2, r3
        ldr     r3, [r3, #-40]
        mov     r1, r3
        ldr     r0, .L16+8
        bl      printf
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L11:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        blt     .L12
        mov     r0, #10
        bl      putchar
        ldr     r3, [fp, #-16]
        sub     r2, r3, #1
        sub     r3, fp, #44
        mov     r1, #0
        mov     r0, r3
        bl      quickSort
        ldr     r0, .L16+12
        bl      printf
        mov     r3, #0
        str     r3, [fp, #-12]
        b       .L13
.L14:
        ldr     r3, [fp, #-12]
        lsl     r3, r3, #2
        sub     r2, fp, #4
        add     r3, r2, r3
        ldr     r3, [r3, #-40]
        mov     r1, r3
        ldr     r0, .L16+8
        bl      printf
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
.L13:
        ldr     r2, [fp, #-12]
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        blt     .L14
        mov     r0, #10
        bl      putchar
        mov     r3, #0
        mov     r0, r3
        sub     sp, fp, #4
        @ sp needed
        pop     {fp, pc}
.L17:
        .align  2
.L16:
        .word   .LC0
        .word   .LC1
        .word   .LC2
        .word   .LC3
        .size   main, .-main
        .ident  "GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
        .section        .note.GNU-stack,"",%progbits

@------------------------------------------------------------------

@ Instituto Tecnologico de Tijuana
@ Depto. Sistemas y computación
@ Ingeniería en Sistemas Computacionales
@ Ovalle Martinez Ana Maria 21212014
@ Repositorio: 

@--------Debbuger----------
@Temporary breakpoint 1 at 0x105f4: file quick.s, line 193.
@ Starting program: /home/l21212014/quick 

@ Temporary breakpoint 1, main () at quick.s:193
@ 193             push    {fp, lr}

@194             add     fp, sp, #4
@195             sub     sp, sp, #40
@196             ldr     r3, .L16
@ 197             sub     ip, fp, #44
@ 198             mov     lr, r3
