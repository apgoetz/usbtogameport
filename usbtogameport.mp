Archive member included because of file (symbol)

/usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
                              /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o (exit)
/usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
                              /tmp/cchw8kyQ.o (__do_copy_data)
/usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
                              /tmp/ccnhkGzC.o (__do_clear_bss)

Allocating common symbols
Common symbol       size              file

usbTxBuf            0xb               /tmp/ccWcvuB4.o
usbTxStatus1        0xc               /tmp/ccWcvuB4.o
usbDeviceAddr       0x1               /tmp/ccWcvuB4.o
val                 0x1               /tmp/cchw8kyQ.o
usbRxToken          0x1               /tmp/ccWcvuB4.o
usbInputBufOffset   0x1               /tmp/ccWcvuB4.o
tx_front_ptr        0x1               /tmp/ccnhkGzC.o
tx_rear_ptr         0x1               /tmp/ccnhkGzC.o
tx_buf              0x10              /tmp/ccnhkGzC.o
usbMsgPtr           0x2               /tmp/ccWcvuB4.o
usbRxLen            0x1               /tmp/ccWcvuB4.o
usbNewDeviceAddr    0x1               /tmp/ccWcvuB4.o
usbCurrentTok       0x1               /tmp/ccWcvuB4.o
usbConfiguration    0x1               /tmp/ccWcvuB4.o
usbRxBuf            0x16              /tmp/ccWcvuB4.o
tx_size             0x1               /tmp/ccnhkGzC.o

Memory Configuration

Name             Origin             Length             Attributes
text             0x0000000000000000 0x0000000000002000 xr
data             0x0000000000800060 0x000000000000ffa0 rw !x
eeprom           0x0000000000810000 0x0000000000010000 rw !x
fuse             0x0000000000820000 0x0000000000000400 rw !x
lock             0x0000000000830000 0x0000000000000400 rw !x
signature        0x0000000000840000 0x0000000000000400 rw !x
*default*        0x0000000000000000 0xffffffffffffffff

Linker script and memory map

LOAD /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
LOAD /tmp/ccnhkGzC.o
LOAD /tmp/cchw8kyQ.o
LOAD /tmp/ccWcvuB4.o
LOAD /tmp/ccsRpVGi.o
LOAD /tmp/ccoCT4Ow.o
LOAD /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a
LOAD /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/libc.a
LOAD /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a

.hash
 *(.hash)

.dynsym
 *(.dynsym)

.dynstr
 *(.dynstr)

.gnu.version
 *(.gnu.version)

.gnu.version_d
 *(.gnu.version_d)

.gnu.version_r
 *(.gnu.version_r)

.rel.init
 *(.rel.init)

.rela.init
 *(.rela.init)

.rel.text
 *(.rel.text)
 *(.rel.text.*)
 *(.rel.gnu.linkonce.t*)

.rela.text
 *(.rela.text)
 *(.rela.text.*)
 *(.rela.gnu.linkonce.t*)

.rel.fini
 *(.rel.fini)

.rela.fini
 *(.rela.fini)

.rel.rodata
 *(.rel.rodata)
 *(.rel.rodata.*)
 *(.rel.gnu.linkonce.r*)

.rela.rodata
 *(.rela.rodata)
 *(.rela.rodata.*)
 *(.rela.gnu.linkonce.r*)

.rel.data
 *(.rel.data)
 *(.rel.data.*)
 *(.rel.gnu.linkonce.d*)

.rela.data
 *(.rela.data)
 *(.rela.data.*)
 *(.rela.gnu.linkonce.d*)

.rel.ctors
 *(.rel.ctors)

.rela.ctors
 *(.rela.ctors)

.rel.dtors
 *(.rel.dtors)

.rela.dtors
 *(.rela.dtors)

.rel.got
 *(.rel.got)

.rela.got
 *(.rela.got)

.rel.bss
 *(.rel.bss)

.rela.bss
 *(.rela.bss)

.rel.plt
 *(.rel.plt)

.rela.plt
 *(.rela.plt)

.text           0x0000000000000000      0xeda
 *(.vectors)
 .vectors       0x0000000000000000       0x26 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
                0x0000000000000000                __vectors
                0x0000000000000000                __vector_default
 *(.vectors)
 *(.progmem.gcc*)
 *(.progmem*)
 .progmem.data  0x0000000000000026       0x3f /tmp/cchw8kyQ.o
                0x0000000000000026                usbDescriptorHidReport
 .progmem.data  0x0000000000000065       0x6c /tmp/ccWcvuB4.o
                0x0000000000000065                usbDescriptorString0
                0x0000000000000069                usbDescriptorStringVendor
                0x0000000000000085                usbDescriptorStringDevice
                0x000000000000009d                usbDescriptorDevice
                0x00000000000000af                usbDescriptorConfiguration
                0x00000000000000d2                . = ALIGN (0x2)
 *fill*         0x00000000000000d1        0x1 
                0x00000000000000d2                __trampolines_start = .
 *(.trampolines)
 .trampolines   0x00000000000000d2        0x0 linker stubs
 *(.trampolines*)
                0x00000000000000d2                __trampolines_end = .
 *(.jumptables)
 *(.jumptables*)
 *(.lowtext)
 *(.lowtext*)
                0x00000000000000d2                __ctors_start = .
 *(.ctors)
                0x00000000000000d2                __ctors_end = .
                0x00000000000000d2                __dtors_start = .
 *(.dtors)
                0x00000000000000d2                __dtors_end = .
 SORT(*)(.ctors)
 SORT(*)(.dtors)
 *(.init0)
 .init0         0x00000000000000d2        0x0 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
                0x00000000000000d2                __init
 *(.init0)
 *(.init1)
 *(.init1)
 *(.init2)
 .init2         0x00000000000000d2        0xc /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
 *(.init2)
 *(.init3)
 *(.init3)
 *(.init4)
 .init4         0x00000000000000de       0x16 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
                0x00000000000000de                __do_copy_data
 .init4         0x00000000000000f4       0x10 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
                0x00000000000000f4                __do_clear_bss
 *(.init4)
 *(.init5)
 *(.init5)
 *(.init6)
 *(.init6)
 *(.init7)
 *(.init7)
 *(.init8)
 *(.init8)
 *(.init9)
 .init9         0x0000000000000104        0x4 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
 *(.init9)
 *(.text)
 .text          0x0000000000000108        0x2 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
                0x0000000000000108                __vector_12
                0x0000000000000108                __bad_interrupt
                0x0000000000000108                __vector_6
                0x0000000000000108                __vector_3
                0x0000000000000108                __vector_11
                0x0000000000000108                __vector_17
                0x0000000000000108                __vector_7
                0x0000000000000108                __vector_5
                0x0000000000000108                __vector_4
                0x0000000000000108                __vector_9
                0x0000000000000108                __vector_2
                0x0000000000000108                __vector_15
                0x0000000000000108                __vector_8
                0x0000000000000108                __vector_14
                0x0000000000000108                __vector_10
                0x0000000000000108                __vector_16
                0x0000000000000108                __vector_18
 .text          0x000000000000010a      0x272 /tmp/ccnhkGzC.o
                0x000000000000010a                init_usart
                0x000000000000015e                put_tx
                0x00000000000001d6                pgm_uout
                0x000000000000025c                ram_uout
                0x00000000000002be                bgetc
                0x00000000000002e2                __vector_13
                0x000000000000035e                tx_isempty
 .text          0x000000000000037c      0x336 /tmp/cchw8kyQ.o
                0x000000000000037c                getReport
                0x0000000000000482                usbFunctionSetup
                0x0000000000000520                main
                0x0000000000000568                init
                0x00000000000005f2                en_a
                0x0000000000000612                dis_a
                0x0000000000000632                brea_a
 .text          0x00000000000006b2      0x5b0 /tmp/ccWcvuB4.o
                0x0000000000000790                usbSetInterrupt
                0x0000000000000b90                usbPoll
                0x0000000000000c28                usbInit
 .text          0x0000000000000c62      0x274 /tmp/ccsRpVGi.o
                0x0000000000000c62                usbCrc16
                0x0000000000000c8c                usbCrc16Append
                0x0000000000000c94                __vector_1
 .text          0x0000000000000ed6        0x0 /tmp/ccoCT4Ow.o
 .text          0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text          0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text          0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
                0x0000000000000ed6                . = ALIGN (0x2)
 *(.text.*)
 .text.libgcc.mul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc.div
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc   0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc.prologue
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc.builtins
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc.fmul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .text.libgcc.mul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc.div
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc   0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc.prologue
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc.builtins
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc.fmul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .text.libgcc.mul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 .text.libgcc.div
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 .text.libgcc   0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 .text.libgcc.prologue
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 .text.libgcc.builtins
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 .text.libgcc.fmul
                0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
                0x0000000000000ed6                . = ALIGN (0x2)
 *(.fini9)
 .fini9         0x0000000000000ed6        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
                0x0000000000000ed6                exit
                0x0000000000000ed6                _exit
 *(.fini9)
 *(.fini8)
 *(.fini8)
 *(.fini7)
 *(.fini7)
 *(.fini6)
 *(.fini6)
 *(.fini5)
 *(.fini5)
 *(.fini4)
 *(.fini4)
 *(.fini3)
 *(.fini3)
 *(.fini2)
 *(.fini2)
 *(.fini1)
 *(.fini1)
 *(.fini0)
 .fini0         0x0000000000000ed6        0x4 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 *(.fini0)
                0x0000000000000eda                _etext = .

.data           0x0000000000800060        0x8 load address 0x0000000000000eda
                0x0000000000800060                PROVIDE (__data_start, .)
 *(.data)
 .data          0x0000000000800060        0x0 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
 .data          0x0000000000800060        0x0 /tmp/ccnhkGzC.o
 .data          0x0000000000800060        0x2 /tmp/cchw8kyQ.o
                0x0000000000800060                logbuf
 .data          0x0000000000800062        0x2 /tmp/ccWcvuB4.o
                0x0000000000800062                usbTxLen
 .data          0x0000000000800064        0x0 /tmp/ccsRpVGi.o
 .data          0x0000000000800064        0x0 /tmp/ccoCT4Ow.o
 .data          0x0000000000800064        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .data          0x0000000000800064        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .data          0x0000000000800064        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 *(.data*)
 *(.rodata)
 .rodata        0x0000000000800064        0x4 /tmp/cchw8kyQ.o
 *(.rodata*)
 *(.gnu.linkonce.d*)
                0x0000000000800068                . = ALIGN (0x2)
                0x0000000000800068                _edata = .
                0x0000000000800068                PROVIDE (__data_end, .)

.bss            0x0000000000800068       0x4f
                0x0000000000800068                PROVIDE (__bss_start, .)
 *(.bss)
 .bss           0x0000000000800068        0x0 /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
 .bss           0x0000000000800068        0x0 /tmp/ccnhkGzC.o
 .bss           0x0000000000800068        0x4 /tmp/cchw8kyQ.o
 .bss           0x000000000080006c        0x1 /tmp/ccWcvuB4.o
 .bss           0x000000000080006d        0x0 /tmp/ccsRpVGi.o
 .bss           0x000000000080006d        0x0 /tmp/ccoCT4Ow.o
 .bss           0x000000000080006d        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
 .bss           0x000000000080006d        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
 .bss           0x000000000080006d        0x0 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
 *(.bss*)
 *(COMMON)
 COMMON         0x000000000080006d       0x13 /tmp/ccnhkGzC.o
                0x000000000080006d                tx_front_ptr
                0x000000000080006e                tx_rear_ptr
                0x000000000080006f                tx_buf
                0x000000000080007f                tx_size
 COMMON         0x0000000000800080        0x1 /tmp/cchw8kyQ.o
                0x0000000000800080                val
 COMMON         0x0000000000800081       0x36 /tmp/ccWcvuB4.o
                0x0000000000800081                usbTxBuf
                0x000000000080008c                usbTxStatus1
                0x0000000000800098                usbDeviceAddr
                0x0000000000800099                usbRxToken
                0x000000000080009a                usbInputBufOffset
                0x000000000080009b                usbMsgPtr
                0x000000000080009d                usbRxLen
                0x000000000080009e                usbNewDeviceAddr
                0x000000000080009f                usbCurrentTok
                0x00000000008000a0                usbConfiguration
                0x00000000008000a1                usbRxBuf
                0x00000000008000b7                PROVIDE (__bss_end, .)
                0x0000000000000eda                __data_load_start = LOADADDR (.data)
                0x0000000000000ee2                __data_load_end = (__data_load_start + SIZEOF (.data))

.noinit         0x00000000008000b7        0x0
                0x00000000008000b7                PROVIDE (__noinit_start, .)
 *(.noinit*)
                0x00000000008000b7                PROVIDE (__noinit_end, .)
                0x00000000008000b7                _end = .
                0x00000000008000b7                PROVIDE (__heap_start, .)

.eeprom         0x0000000000810000        0x0
 *(.eeprom*)
                0x0000000000810000                __eeprom_end = .

.fuse
 *(.fuse)
 *(.lfuse)
 *(.hfuse)
 *(.efuse)

.lock
 *(.lock*)

.signature
 *(.signature*)

.stab           0x0000000000000000     0x3654
 *(.stab)
 .stab          0x0000000000000000      0x6cc /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o
 .stab          0x00000000000006cc      0x834 /tmp/ccnhkGzC.o
                                        0x840 (size before relaxing)
 .stab          0x0000000000000f00      0x798 /tmp/cchw8kyQ.o
                                        0x9b4 (size before relaxing)
 .stab          0x0000000000001698      0xe94 /tmp/ccWcvuB4.o
                                       0x10c8 (size before relaxing)
 .stab          0x000000000000252c      0xdc8 /tmp/ccsRpVGi.o
                                        0xdd4 (size before relaxing)
 .stab          0x00000000000032f4      0x168 /tmp/ccoCT4Ow.o
                                        0x360 (size before relaxing)
 .stab          0x000000000000345c       0x6c /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_exit.o)
                                         0x78 (size before relaxing)
 .stab          0x00000000000034c8       0xd8 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_copy_data.o)
                                         0xe4 (size before relaxing)
 .stab          0x00000000000035a0       0xb4 /usr/lib/gcc/avr/4.7.2/avr4/libgcc.a(_clear_bss.o)
                                         0xc0 (size before relaxing)

.stabstr        0x0000000000000000     0x136c
 *(.stabstr)
 .stabstr       0x0000000000000000     0x136c /usr/lib/gcc/avr/4.7.2/../../../../avr/lib/avr4/crtm8.o

.stab.excl
 *(.stab.excl)

.stab.exclstr
 *(.stab.exclstr)

.stab.index
 *(.stab.index)

.stab.indexstr
 *(.stab.indexstr)

.comment        0x0000000000000000       0x11
 *(.comment)
 .comment       0x0000000000000000       0x11 /tmp/ccnhkGzC.o
                                         0x12 (size before relaxing)
 .comment       0x0000000000000000       0x12 /tmp/cchw8kyQ.o
 .comment       0x0000000000000000       0x12 /tmp/ccWcvuB4.o
 .comment       0x0000000000000000       0x12 /tmp/ccoCT4Ow.o

.debug
 *(.debug)

.line
 *(.line)

.debug_srcinfo
 *(.debug_srcinfo)

.debug_sfnames
 *(.debug_sfnames)

.debug_aranges
 *(.debug_aranges)

.debug_pubnames
 *(.debug_pubnames)

.debug_info
 *(.debug_info)
 *(.gnu.linkonce.wi.*)

.debug_abbrev
 *(.debug_abbrev)

.debug_line
 *(.debug_line)

.debug_frame
 *(.debug_frame)

.debug_str
 *(.debug_str)

.debug_loc
 *(.debug_loc)

.debug_macinfo
 *(.debug_macinfo)

.debug_pubtypes
 *(.debug_pubtypes)

.debug_ranges
 *(.debug_ranges)

.debug_macro
 *(.debug_macro)
OUTPUT(usbtogameport.out elf32-avr)
LOAD linker stubs
