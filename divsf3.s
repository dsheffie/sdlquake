	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_zicond1p0_zmmul1p0_zaamo1p0_zalrsc1p0_zba1p0_zbb1p0"
	.file	"divsf3.c"
	.file	0 "/home/dsheffie/rv64-linux-apps/sdlquake" "divsf3.c" md5 0x445121fbfb38b64798f168f7f257031e
	.file	1 "." "fp32_recip.h" md5 0x5f71921807270c8c5d74e6e8ec747792
	.text
	.globl	__divsf3                        # -- Begin function __divsf3
	.p2align	2
	.type	__divsf3,@function
__divsf3:                               # @__divsf3
.Lfunc_begin0:
	.loc	0 18 0                          # divsf3.c:18:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: __divsf3:a <- $x10
	#DEBUG_VALUE: __divsf3:b <- $x11
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
.Ltmp0:
	#DEBUG_VALUE: __divsf3:fia <- $x10
	#DEBUG_VALUE: __divsf3:fib <- $x11
	mv	s0, a0
.Ltmp1:
	#DEBUG_VALUE: __divsf3:a <- $x8
	#DEBUG_VALUE: __divsf3:fia <- $x8
	.loc	0 28 12 prologue_end            # divsf3.c:28:12
	slli	a2, a1, 33
	.loc	0 30 7                          # divsf3.c:30:7
	slli	a0, a1, 41
	srli	a3, a2, 56
	srli	a0, a0, 63
	add	a0, a3, a0
.Ltmp2:
	#DEBUG_VALUE: __divsf3:e <- $x10
.Lpcrel_hi0:
	.loc	0 32 7                          # divsf3.c:32:7
	auipc	a3, %pcrel_hi(recip_guess)
	addi	a3, a3, %pcrel_lo(.Lpcrel_hi0)
	sh2add	a0, a0, a3
.Ltmp3:
	#DEBUG_VALUE: __divsf3:y <- undef
	.loc	0 34 7                          # divsf3.c:34:7
	lw	a0, 0(a0)
	sext.w	s1, a1
.Ltmp4:
	#DEBUG_VALUE: __divsf3:r <- [DW_OP_constu 22, DW_OP_shr, DW_OP_constu 1, DW_OP_and, DW_OP_stack_value] undef
	#DEBUG_VALUE: __divsf3:n <- [DW_OP_constu 31, DW_OP_shr, DW_OP_stack_value] undef
	.loc	0 28 12                         # divsf3.c:28:12
	srli	a1, a2, 33
.Ltmp5:
	#DEBUG_VALUE: __divsf3:fib <- undef
	.loc	0 34 7                          # divsf3.c:34:7
	lui	a2, 262144
	mul.fp32	a3, a1, a0
	sub.fp32	a3, a2, a3
	mul.fp32	a0, a3, a0
	mul.fp32	a3, a0, a1
	sub.fp32	a3, a2, a3
	mul.fp32	a0, a3, a0
	mul.fp32	a3, a0, a1
	sub.fp32	a3, a2, a3
	mul.fp32	a0, a3, a0
	mul.fp32	a1, a0, a1
	sub.fp32	a2, a2, a1
	mul.fp32	a0, a2, a0	

.Ltmp6:
	.loc	0 0 7 is_stmt 0                 # divsf3.c:0:7
	lui	a1, 524288
.Ltmp7:
	.loc	0 40 6 is_stmt 1                # divsf3.c:40:6
	and	a1, s1, a1
	xor	a1, a0, a1
.Ltmp8:
	.loc	0 43 5                          # divsf3.c:43:5
	mv	a0, s0
.Ltmp9:
	#DEBUG_VALUE: __divsf3:a <- $x10
	#DEBUG_VALUE: __divsf3:fia <- $x10
	call	__mulsf3
.Ltmp10:
	.loc	0 44 3 epilogue_begin           # divsf3.c:44:3
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Ltmp11:
.Lfunc_end0:
	.size	__divsf3, .Lfunc_end0-__divsf3
	.cfi_endproc
                                        # -- End function
	.type	recip_guess,@object             # @recip_guess
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
recip_guess:
	.word	0x7effffee                      # float 1.70141001E+38
	.word	0x7e800001                      # float 8.50706018E+37
	.word	0x7e000001                      # float 4.25353009E+37
	.word	0x7d7fffda                      # float 2.12675998E+37
	.word	0x7cffffda                      # float 1.06337999E+37
	.word	0x7c7ffffa                      # float 5.31691008E+36
	.word	0x7c00000d                      # float 2.65846011E+36
	.word	0x7b80000d                      # float 1.32923006E+36
	.word	0x7b000000                      # float 6.64613997E+35
	.word	0x7a800000                      # float 3.32306999E+35
	.word	0x79ffffce                      # float 1.66153004E+35
	.word	0x797ffff6                      # float 8.30767002E+34
	.word	0x79000005                      # float 4.15383996E+34
	.word	0x78800005                      # float 2.07691998E+34
	.word	0x78000005                      # float 1.03845999E+34
	.word	0x77800005                      # float 5.19229995E+33
	.word	0x77000005                      # float 2.59614998E+33
	.word	0x767fffca                      # float 1.29807004E+33
	.word	0x75fffffd                      # float 6.49036991E+32
	.word	0x7580000c                      # float 3.24519018E+32
	.word	0x74ffffe3                      # float 1.62258996E+32
	.word	0x747ffff8                      # float 8.11295997E+31
	.word	0x73fffff8                      # float 4.05647999E+31
	.word	0x737ffff8                      # float 2.02823999E+31
	.word	0x72fffff8                      # float 1.01412E+31
	.word	0x727ffff8                      # float 5.07059998E+30
	.word	0x71fffff8                      # float 2.53529999E+30
	.word	0x717ffff8                      # float 1.26765E+30
	.word	0x70fffff8                      # float 6.33824998E+29
	.word	0x70800009                      # float 3.1691299E+29
	.word	0x6fffffde                      # float 1.58456004E+29
	.word	0x6f800004                      # float 7.92282002E+28
	.word	0x6f000004                      # float 3.96141001E+28
	.word	0x6e7fffde                      # float 1.98070005E+28
	.word	0x6dffffff                      # float 9.90351972E+27
	.word	0x6d7fffff                      # float 4.95175986E+27
	.word	0x6cffffff                      # float 2.47587993E+27
	.word	0x6c7fffff                      # float 1.23793997E+27
	.word	0x6bffffff                      # float 6.18969983E+26
	.word	0x6b7fffff                      # float 3.09484991E+26
	.word	0x6b00001b                      # float 1.54743003E+26
	.word	0x6a800005                      # float 7.73712985E+25
	.word	0x69fffff5                      # float 3.86856009E+25
	.word	0x697ffff5                      # float 1.93428004E+25
	.word	0x69000003                      # float 9.67141001E+24
	.word	0x687ffff5                      # float 4.83570011E+24
	.word	0x67fffff5                      # float 2.41785005E+24
	.word	0x6780001d                      # float 1.20893E+24
	.word	0x67000001                      # float 6.04462981E+23
	.word	0x667fffe7                      # float 3.02231005E+23
	.word	0x6600000f                      # float 1.51115998E+23
	.word	0x65800004                      # float 7.55578997E+22
	.word	0x64fffff2                      # float 3.77789003E+22
	.word	0x6480000f                      # float 1.88894997E+22
	.word	0x63fffffb                      # float 9.44473015E+21
	.word	0x63800006                      # float 4.72236986E+21
	.word	0x62ffffe9                      # float 2.36118E+21
	.word	0x627fffe9                      # float 1.18059E+21
	.word	0x62000003                      # float 5.90296021E+20
	.word	0x61800003                      # float 2.95148011E+20
	.word	0x61000003                      # float 1.47574005E+20
	.word	0x60800003                      # float 7.37870026E+19
	.word	0x60000003                      # float 3.68935013E+19
	.word	0x5f7fffd8                      # float 1.84467001E+19
	.word	0x5efffffc                      # float 9.22336984E+18
	.word	0x5e800007                      # float 4.61168987E+18
	.word	0x5dffffea                      # float 2.30583999E+18
	.word	0x5d7fffea                      # float 1.15291999E+18
	.word	0x5d000004                      # float 5.76461027E+17
	.word	0x5c7fffea                      # float 2.88229998E+17
	.word	0x5bffffea                      # float 1.44114999E+17
	.word	0x5b800001                      # float 7.20576026E+16
	.word	0x5b000001                      # float 3.60288013E+16
	.word	0x5a800001                      # float 1.80144007E+16
	.word	0x5a000001                      # float 9.00720032E+15
	.word	0x59800001                      # float 4.50360016E+15
	.word	0x59000001                      # float 2.25180008E+15
	.word	0x58800001                      # float 1.12590004E+15
	.word	0x58000001                      # float 5.6295002E+14
	.word	0x57800001                      # float 2.8147501E+14
	.word	0x56ffffc6                      # float 1.40737002E+14
	.word	0x567ffff5                      # float 7.0368698E+13
	.word	0x56000007                      # float 3.51844014E+13
	.word	0x55800007                      # float 1.75922007E+13
	.word	0x54fffffa                      # float 8.79608988E+12
	.word	0x54800007                      # float 4.39805018E+12
	.word	0x53ffffe7                      # float 2.19901998E+12
	.word	0x537fffe7                      # float 1.09950999E+12
	.word	0x53000003                      # float 5.4975601E+11
	.word	0x52800003                      # float 2.74878005E+11
	.word	0x52000003                      # float 1.37439003E+11
	.word	0x51800003                      # float 6.87195013E+10
	.word	0x50ffffed                      # float 3.43596995E+10
	.word	0x5080000f                      # float 1.71798999E+10
	.word	0x4ffffff7                      # float 8.58992998E+9
	.word	0x4f800005                      # float 4.29496986E+9
	.word	0x4effffe4                      # float 2.14748006E+9
	.word	0x4e7fffe4                      # float 1.07374003E+9
	.word	0x4e000001                      # float 536870976
	.word	0x4d7fffe4                      # float 268435008
	.word	0x4d000011                      # float 134218000
	.word	0x4c800004                      # float 67108896
	.word	0x4bfffff0                      # float 33554400
	.word	0x4b7ffff0                      # float 16777200
	.word	0x4b000002                      # float 8388610
	.word	0x4a7ffff0                      # float 4194300
	.word	0x49fffff0                      # float 2097150
	.word	0x49800020                      # float 1048580
	.word	0x49000000                      # float 524288
	.word	0x48800000                      # float 262144
	.word	0x48000000                      # float 131072
	.word	0x47800000                      # float 65536
	.word	0x47000000                      # float 32768
	.word	0x46800000                      # float 16384
	.word	0x46000000                      # float 8192
	.word	0x45800000                      # float 4096
	.word	0x45000000                      # float 2048
	.word	0x44800000                      # float 1024
	.word	0x44000000                      # float 512
	.word	0x43800000                      # float 256
	.word	0x43000000                      # float 128
	.word	0x42800000                      # float 64
	.word	0x42000000                      # float 32
	.word	0x41800000                      # float 16
	.word	0x41000000                      # float 8
	.word	0x40800000                      # float 4
	.word	0x40000000                      # float 2
	.word	0x3f800000                      # float 1
	.word	0x3f000000                      # float 0.5
	.word	0x3e800000                      # float 0.25
	.word	0x3e000000                      # float 0.125
	.word	0x3d800000                      # float 0.0625
	.word	0x3d000000                      # float 0.03125
	.word	0x3c800000                      # float 0.015625
	.word	0x3c000000                      # float 0.0078125
	.word	0x3b800000                      # float 0.00390625
	.word	0x3affffd5                      # float 0.00195311999
	.word	0x3a7ffff7                      # float 9.76561976E-4
	.word	0x39fffff7                      # float 4.88280988E-4
	.word	0x3980000d                      # float 2.44141003E-4
	.word	0x38ffffd5                      # float 1.2207E-4
	.word	0x38800006                      # float 6.10351999E-5
	.word	0x38000006                      # float 3.05176E-5
	.word	0x37800006                      # float 1.52588E-5
	.word	0x36fffff6                      # float 7.62938998E-6
	.word	0x36800006                      # float 3.81469999E-6
	.word	0x36000006                      # float 1.90735E-6
	.word	0x357ffffa                      # float 9.53673975E-7
	.word	0x34fffffa                      # float 4.76836988E-7
	.word	0x3480000f                      # float 2.38419005E-7
	.word	0x33ffffd7                      # float 1.19208998E-7
	.word	0x337ffff3                      # float 5.96045986E-8
	.word	0x32fffff3                      # float 2.98022993E-8
	.word	0x32800016                      # float 1.49012003E-8
	.word	0x31ffffff                      # float 7.45058015E-9
	.word	0x317fffff                      # float 3.72529008E-9
	.word	0x31000016                      # float 1.86265003E-9
	.word	0x30800004                      # float 9.31323018E-10
	.word	0x2ffffff6                      # float 4.6566101E-10
	.word	0x2f80000d                      # float 2.32831004E-10
	.word	0x2effffd2                      # float 1.16415003E-10
	.word	0x2e800006                      # float 5.82077025E-11
	.word	0x2dffffee                      # float 2.91037992E-11
	.word	0x2d7fffee                      # float 1.45518996E-11
	.word	0x2d000003                      # float 7.27596021E-12
	.word	0x2c800003                      # float 3.63798011E-12
	.word	0x2c000003                      # float 1.81899005E-12
	.word	0x2b800003                      # float 9.09495027E-13
	.word	0x2afffff3                      # float 4.54746999E-13
	.word	0x2a80000c                      # float 2.27374001E-13
	.word	0x2a00000c                      # float 1.13687E-13
	.word	0x297ffffa                      # float 5.68433985E-14
	.word	0x28fffffa                      # float 2.84216993E-14
	.word	0x2880001b                      # float 1.42109005E-14
	.word	0x28000003                      # float 7.1054299E-15
	.word	0x277fffef                      # float 3.55271008E-15
	.word	0x2700000f                      # float 1.77636002E-15
	.word	0x267ffff8                      # float 8.88177996E-16
	.word	0x25fffff8                      # float 4.44088998E-16
	.word	0x2580000f                      # float 2.22045002E-16
	.word	0x24ffffd2                      # float 1.11021998E-16
	.word	0x24800007                      # float 5.55111976E-17
	.word	0x24000007                      # float 2.77555988E-17
	.word	0x23800007                      # float 1.38777994E-17
	.word	0x22fffff7                      # float 6.93889018E-18
	.word	0x22800007                      # float 3.46944985E-18
	.word	0x21ffffde                      # float 1.73471996E-18
	.word	0x21800003                      # float 8.67362048E-19
	.word	0x21000003                      # float 4.33681024E-19
	.word	0x207fffde                      # float 2.16839995E-19
	.word	0x1fffffde                      # float 1.08419998E-19
	.word	0x1f7ffffd                      # float 5.42100989E-20
	.word	0x1f00000e                      # float 2.71050995E-20
	.word	0x1e7fffde                      # float 1.35524997E-20
	.word	0x1dfffff7                      # float 6.77625994E-21
	.word	0x1d7ffff7                      # float 3.38812997E-21
	.word	0x1d000014                      # float 1.69406993E-21
	.word	0x1c800001                      # float 8.47033048E-22
	.word	0x1bffffed                      # float 4.23515994E-22
	.word	0x1b7fffed                      # float 2.11757997E-22
	.word	0x1affffed                      # float 1.05878998E-22
	.word	0x1a800006                      # float 5.29395971E-23
	.word	0x1a000006                      # float 2.64697985E-23
	.word	0x19800006                      # float 1.32348993E-23
	.word	0x18fffff4                      # float 6.61744017E-24
	.word	0x187ffff4                      # float 3.30872008E-24
	.word	0x17fffff4                      # float 1.65436004E-24
	.word	0x17800004                      # float 8.27181006E-25
	.word	0x16fffff4                      # float 4.1359001E-25
	.word	0x167ffff4                      # float 2.06795005E-25
	.word	0x16000022                      # float 1.03397996E-25
	.word	0x15800002                      # float 5.16988006E-26
	.word	0x15000002                      # float 2.58494003E-26
	.word	0x14800002                      # float 1.29247002E-26
	.word	0x14000002                      # float 6.46235007E-27
	.word	0x137fffea                      # float 3.23117003E-27
	.word	0x1300000f                      # float 1.61559002E-27
	.word	0x12800004                      # float 8.07793952E-28
	.word	0x12000004                      # float 4.03896976E-28
	.word	0x117fffdf                      # float 2.01947995E-28
	.word	0x10ffffdf                      # float 1.00973997E-28
	.word	0x10800000                      # float 5.04870979E-29
	.word	0x0fffffdf                      # float 2.52434993E-29
	.word	0x0f800011                      # float 1.26218001E-29
	.word	0x0f000004                      # float 6.31089025E-30
	.word	0x0e7fffed                      # float 3.15544005E-30
	.word	0x0dffffed                      # float 1.57772002E-30
	.word	0x0d800001                      # float 7.88860999E-31
	.word	0x0cffffed                      # float 3.94430006E-31
	.word	0x0c7fffed                      # float 1.97215003E-31
	.word	0x0bfffffe                      # float 9.86076013E-32
	.word	0x0b7ffffe                      # float 4.93038007E-32
	.word	0x0afffffe                      # float 2.46519003E-32
	.word	0x0a800021                      # float 1.23260001E-32
	.word	0x0a000006                      # float 6.16298023E-33
	.word	0x09800006                      # float 3.08149012E-33
	.word	0x08ffffd5                      # float 1.54074001E-33
	.word	0x08800000                      # float 7.70371977E-34
	.word	0x08000000                      # float 3.85185989E-34
	.word	0x07800000                      # float 1.92592994E-34
	.word	0x07000000                      # float 9.62964972E-35
	.word	0x067fffef                      # float 4.81481998E-35
	.word	0x05ffffef                      # float 2.40740999E-35
	.word	0x0580001a                      # float 1.20370995E-35
	.word	0x04fffffd                      # float 6.01853E-36
	.word	0x0480000c                      # float 3.00926984E-36
	.word	0x03ffffe1                      # float 1.50462999E-36
	.word	0x037ffff7                      # float 7.5231598E-37
	.word	0x02fffff7                      # float 3.7615799E-37
	.word	0x027ffff7                      # float 1.88078995E-37
	.word	0x01fffff7                      # float 9.40394976E-38
	.word	0x01800005                      # float 4.70198021E-38
	.word	0x01000005                      # float 2.3509901E-38
	.word	0x007fffe1                      # float 1.17549001E-38
	.word	0x003fffff                      # float 5.87747035E-39
	.word	0x00200003                      # float 2.93874008E-39
	.size	recip_guess, 1024

	.file	2 "/home/dsheffie" "buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/include/bits/types.h" md5 0xe1865d9fe29fe1b5ced550b7ba458f9e
	.file	3 "/home/dsheffie" "buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/include/bits/stdint-uintn.h" md5 0x256fcabbefa27ca8cf5e6d37525e6e16
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	5                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp1-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp1-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	88                              # DW_OP_reg8
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	72                              # DW_TAG_call_site
	.byte	0                               # DW_CHILDREN_no
	.byte	127                             # DW_AT_call_origin
	.byte	19                              # DW_FORM_ref4
	.byte	125                             # DW_AT_call_return_pc
	.byte	27                              # DW_FORM_addrx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	23                              # DW_TAG_union_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	13                              # DW_AT_bit_size
	.byte	11                              # DW_FORM_data1
	.byte	107                             # DW_AT_data_bit_offset
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x116 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	1                               # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	1                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0xb DW_TAG_variable
	.byte	3                               # DW_AT_name
	.word	50                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               # Abbrev [3] 0x32:0xd DW_TAG_array_type
	.word	63                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x37:0x7 DW_TAG_subrange_type
	.word	72                              # DW_AT_type
	.half	256                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x3f:0x5 DW_TAG_const_type
	.word	68                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x44:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x48:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	8                               # Abbrev [8] 0x4c:0x5b DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	68                              # DW_AT_type
                                        # DW_AT_external
	.byte	9                               # Abbrev [9] 0x5b:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
	.word	68                              # DW_AT_type
	.byte	9                               # Abbrev [9] 0x64:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
	.word	68                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0x6d:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.word	191                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x76:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	20                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.word	191                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x7f:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.word	285                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x88:0x8 DW_TAG_variable
	.byte	22                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.word	285                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x90:0x8 DW_TAG_variable
	.byte	23                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.word	285                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x98:0x8 DW_TAG_variable
	.byte	24                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	21                              # DW_AT_decl_line
	.word	68                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0xa0:0x6 DW_TAG_call_site
	.word	167                             # DW_AT_call_origin
	.byte	2                               # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	13                              # Abbrev [13] 0xa7:0x18 DW_TAG_subprogram
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	68                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	14                              # Abbrev [14] 0xaf:0x5 DW_TAG_formal_parameter
	.word	68                              # DW_AT_type
	.byte	14                              # Abbrev [14] 0xb4:0x5 DW_TAG_formal_parameter
	.word	68                              # DW_AT_type
	.byte	14                              # Abbrev [14] 0xb9:0x5 DW_TAG_formal_parameter
	.word	68                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0xbf:0x8 DW_TAG_typedef
	.word	199                             # DW_AT_type
	.byte	19                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.byte	16                              # Abbrev [16] 0xc7:0x17 DW_TAG_union_type
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0xcb:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.word	68                              # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	17                              # Abbrev [17] 0xd4:0x9 DW_TAG_member
	.byte	12                              # DW_AT_name
	.word	222                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0xde:0x8 DW_TAG_typedef
	.word	230                             # DW_AT_type
	.byte	18                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	18                              # Abbrev [18] 0xe6:0x23 DW_TAG_structure_type
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	19                              # Abbrev [19] 0xea:0xa DW_TAG_member
	.byte	11                              # DW_AT_name
	.word	265                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.byte	23                              # DW_AT_bit_size
	.byte	0                               # DW_AT_data_bit_offset
	.byte	19                              # Abbrev [19] 0xf4:0xa DW_TAG_member
	.byte	16                              # DW_AT_name
	.word	265                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	8                               # DW_AT_bit_size
	.byte	23                              # DW_AT_data_bit_offset
	.byte	19                              # Abbrev [19] 0xfe:0xa DW_TAG_member
	.byte	17                              # DW_AT_name
	.word	265                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.byte	1                               # DW_AT_bit_size
	.byte	31                              # DW_AT_data_bit_offset
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x109:0x8 DW_TAG_typedef
	.word	273                             # DW_AT_type
	.byte	15                              # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	26                              # DW_AT_decl_line
	.byte	15                              # Abbrev [15] 0x111:0x8 DW_TAG_typedef
	.word	281                             # DW_AT_type
	.byte	14                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	42                              # DW_AT_decl_line
	.byte	6                               # Abbrev [6] 0x119:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x11d:0x4 DW_TAG_base_type
	.byte	21                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	104                             # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (git@github.com:dsheffie/llvm-rv64.git fb9231f22466f6a611d83d7e2be8ec5bec4bfacf)" # string offset=0
.Linfo_string1:
	.asciz	"divsf3.c"                      # string offset=105
.Linfo_string2:
	.asciz	"/home/dsheffie/rv64-linux-apps/sdlquake" # string offset=114
.Linfo_string3:
	.asciz	"recip_guess"                   # string offset=154
.Linfo_string4:
	.asciz	"float"                         # string offset=166
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=172
.Linfo_string6:
	.asciz	"do_recip"                      # string offset=192
.Linfo_string7:
	.asciz	"__divsf3"                      # string offset=201
.Linfo_string8:
	.asciz	"a"                             # string offset=210
.Linfo_string9:
	.asciz	"b"                             # string offset=212
.Linfo_string10:
	.asciz	"fia"                           # string offset=214
.Linfo_string11:
	.asciz	"f"                             # string offset=218
.Linfo_string12:
	.asciz	"ff"                            # string offset=220
.Linfo_string13:
	.asciz	"unsigned int"                  # string offset=223
.Linfo_string14:
	.asciz	"__uint32_t"                    # string offset=236
.Linfo_string15:
	.asciz	"uint32_t"                      # string offset=247
.Linfo_string16:
	.asciz	"e"                             # string offset=256
.Linfo_string17:
	.asciz	"s"                             # string offset=258
.Linfo_string18:
	.asciz	"flt_t"                         # string offset=260
.Linfo_string19:
	.asciz	"floatint"                      # string offset=266
.Linfo_string20:
	.asciz	"fib"                           # string offset=275
.Linfo_string21:
	.asciz	"int"                           # string offset=279
.Linfo_string22:
	.asciz	"r"                             # string offset=283
.Linfo_string23:
	.asciz	"n"                             # string offset=285
.Linfo_string24:
	.asciz	"y"                             # string offset=287
	.section	.debug_str_offsets,"",@progbits
	.word	.Linfo_string0
	.word	.Linfo_string1
	.word	.Linfo_string2
	.word	.Linfo_string3
	.word	.Linfo_string4
	.word	.Linfo_string5
	.word	.Linfo_string6
	.word	.Linfo_string7
	.word	.Linfo_string8
	.word	.Linfo_string9
	.word	.Linfo_string10
	.word	.Linfo_string11
	.word	.Linfo_string12
	.word	.Linfo_string13
	.word	.Linfo_string14
	.word	.Linfo_string15
	.word	.Linfo_string16
	.word	.Linfo_string17
	.word	.Linfo_string18
	.word	.Linfo_string19
	.word	.Linfo_string20
	.word	.Linfo_string21
	.word	.Linfo_string22
	.word	.Linfo_string23
	.word	.Linfo_string24
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	recip_guess
	.quad	.Lfunc_begin0
	.quad	.Ltmp6
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (git@github.com:dsheffie/llvm-rv64.git fb9231f22466f6a611d83d7e2be8ec5bec4bfacf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
