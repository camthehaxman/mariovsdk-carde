	.INCLUDE "macro.inc"

	.syntax unified

	thumb_func_start main
main: @ 0x0200000C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x100
	ldr r4, _02000204 @ =gSomeFuncPtr
	ldr r0, _02000208 @ =0x000002EA
	ldr r2, [r4]
	movs r1, #0x64
	bl _call_via_r2
	movs r0, #0x84
	lsls r0, r0, #2
	ldr r3, [r4]
	movs r1, #0x4e
	movs r2, #0
	bl _call_via_r3
	ldr r6, _0200020C @ =0x0000027E
	ldr r1, _02000210 @ =gUnknown_02001070
	ldr r5, [r4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0x10
	bl _call_via_r5
	ldr r1, _02000214 @ =gUnknown_02000D48
	ldr r5, [r4]
	adds r0, r6, #0
	movs r2, #0x10
	movs r3, #0x10
	bl _call_via_r5
	bl sub_02000260
	ldr r6, _02000218 @ =gUnknown_02000D8C
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r0, r6, #0
	bl sub_02000980
	ldr r0, _0200021C @ =0x000002C3
	ldr r1, _02000220 @ =sub_020005C4
	ldr r2, [r4]
	bl _call_via_r2
	movs r0, #0xa4
	lsls r0, r0, #2
	ldr r1, _02000224 @ =0x00000101
	movs r2, #0x81
	lsls r2, r2, #1
	ldr r3, _02000228 @ =0x00001E03
	ldr r5, [r4]
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0200022C @ =0x0000029A
	lsls r1, r7, #8
	ldr r2, [r4]
	bl _call_via_r2
	ldr r0, _02000230 @ =0x00000291
	ldr r3, [r4]
	adds r1, r7, #0
	movs r2, #0
	bl _call_via_r3
	ldr r0, _02000234 @ =0x00000292
	ldr r2, [r4]
	adds r1, r7, #0
	bl _call_via_r2
	movs r0, #0xa6
	lsls r0, r0, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r4]
	adds r1, r7, #0
	bl _call_via_r3
	ldr r0, _02000238 @ =0x00000299
	movs r2, #0xa1
	lsls r2, r2, #3
	ldr r3, _0200023C @ =gUnknown_02000AB4
	ldr r4, [r4]
	adds r1, r7, #0
	bl _call_via_r4
	mov r1, sp
	movs r0, #0x81
	strb r0, [r1]
	movs r0, #0x75
	strb r0, [r1, #1]
	adds r2, r6, #0
	adds r2, #0x10
	adds r1, #2
	ldrb r0, [r6, #0x10]
	cmp r0, #0
	beq _020000E4
_020000D6:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r1, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _020000D6
_020000E4:
	movs r0, #0x81
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x76
	strb r0, [r1]
	movs r0, #0
	strb r0, [r1, #1]
	ldr r5, _02000204 @ =gSomeFuncPtr
	movs r2, #0xa2
	lsls r2, r2, #3
	ldr r4, [r5]
	ldr r0, _02000238 @ =0x00000299
	adds r1, r7, #0
	mov r3, sp
	bl _call_via_r4
	ldr r2, _02000240 @ =0x00000105
	ldr r3, _02000244 @ =0x00001E10
	ldr r4, [r5]
	movs r0, #0xa4
	lsls r0, r0, #2
	ldr r1, _02000224 @ =0x00000101
	bl _call_via_r4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r7, #8
	ldr r2, [r5]
	ldr r0, _0200022C @ =0x0000029A
	bl _call_via_r2
	ldr r0, _02000230 @ =0x00000291
	mov sl, r0
	ldr r3, [r5]
	adds r1, r7, #0
	movs r2, #0
	bl _call_via_r3
	ldr r0, _02000234 @ =0x00000292
	mov r8, r0
	ldr r2, [r5]
	adds r1, r7, #0
	bl _call_via_r2
	movs r6, #0xa6
	lsls r6, r6, #2
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r3, [r5]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sb
	bl _call_via_r3
	ldr r3, _02000248 @ =0x00001E02
	ldr r4, [r5]
	movs r0, #0xa4
	lsls r0, r0, #2
	ldr r1, _02000224 @ =0x00000101
	movs r2, #0
	bl _call_via_r4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r1, r4, #8
	movs r0, #2
	orrs r1, r0
	ldr r2, [r5]
	ldr r0, _0200022C @ =0x0000029A
	bl _call_via_r2
	ldr r3, [r5]
	mov r0, sl
	adds r1, r4, #0
	movs r2, #0
	bl _call_via_r3
	ldr r2, [r5]
	mov r0, r8
	adds r1, r4, #0
	bl _call_via_r2
	ldr r3, [r5]
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, sb
	bl _call_via_r3
	ldr r2, _0200024C @ =0x00000402
	ldr r3, _02000250 @ =gUnknown_02000AE0
	ldr r6, [r5]
	ldr r0, _02000238 @ =0x00000299
	adds r1, r4, #0
	bl _call_via_r6
	ldr r0, _02000254 @ =0x0000021A
	ldr r3, [r5]
	movs r1, #0x10
	movs r2, #0x23
	bl _call_via_r3
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [r5]
	movs r1, #0x10
	bl _call_via_r2
	movs r4, #0
	ldr r0, _02000258 @ =gUnknown_020010B4
	strb r4, [r0]
	adds r6, r0, #0
_020001C6:
	ldr r2, [r5]
	movs r0, #0xc0
	lsls r0, r0, #2
	movs r1, #1
	bl _call_via_r2
	adds r0, r4, #0
	bl sub_020008A4
	strb r0, [r6]
	adds r0, r7, #0
	bl sub_020009A0
	ldr r1, [r5]
	ldr r0, _0200025C @ =0x00000301
	bl _call_via_r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r6]
	cmp r0, #0
	beq _020001C6
	movs r0, #2
	add sp, #0x100
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02000204: .4byte gSomeFuncPtr
_02000208: .4byte 0x000002EA
_0200020C: .4byte 0x0000027E
_02000210: .4byte gUnknown_02001070
_02000214: .4byte gUnknown_02000D48
_02000218: .4byte gUnknown_02000D8C
_0200021C: .4byte 0x000002C3
_02000220: .4byte sub_020005C4
_02000224: .4byte 0x00000101
_02000228: .4byte 0x00001E03
_0200022C: .4byte 0x0000029A
_02000230: .4byte 0x00000291
_02000234: .4byte 0x00000292
_02000238: .4byte 0x00000299
_0200023C: .4byte gUnknown_02000AB4
_02000240: .4byte 0x00000105
_02000244: .4byte 0x00001E10
_02000248: .4byte 0x00001E02
_0200024C: .4byte 0x00000402
_02000250: .4byte gUnknown_02000AE0
_02000254: .4byte 0x0000021A
_02000258: .4byte gUnknown_020010B4
_0200025C: .4byte 0x00000301

	thumb_func_start sub_02000260
sub_02000260: @ 0x02000260
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r3, _02000324 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _02000328 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0200032C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _02000330 @ =0x04000134
	strh r4, [r0]
	subs r2, #0xd8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2]
	ldrh r0, [r2]
	ldr r3, _02000334 @ =0x00004003
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r4, _02000338 @ =gUnknown_020010D0
	ldr r2, _0200033C @ =0x05000048
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x60
	str r0, [r4, #0x28]
	adds r0, #0x18
	str r0, [r4, #0x2c]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0xc0
	movs r2, #0
	movs r7, #0x30
	adds r7, r7, r4
	mov r8, r7
	movs r0, #0x90
	adds r0, r0, r4
	mov ip, r0
	adds r6, r4, #0
	adds r6, #0xa8
	movs r7, #0x40
	adds r7, r7, r4
	mov sb, r7
_020002D2:
	lsls r1, r3, #2
	mov r7, ip
	adds r0, r2, r7
	mov r7, r8
	adds r7, #4
	mov r8, r7
	subs r7, #4
	stm r7!, {r0}
	adds r0, r2, r6
	mov r7, sb
	adds r7, #4
	mov sb, r7
	subs r7, #4
	stm r7!, {r0}
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r1, r0
	str r5, [r1]
	adds r5, #0x48
	adds r2, #0x48
	adds r3, #1
	cmp r3, #1
	ble _020002D2
	movs r0, #0
	ldr r3, _02000324 @ =0x04000208
	strh r0, [r3]
	ldr r2, _02000328 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02000324: .4byte 0x04000208
_02000328: .4byte 0x04000200
_0200032C: .4byte 0x0000FF3F
_02000330: .4byte 0x04000134
_02000334: .4byte 0x00004003
_02000338: .4byte gUnknown_020010D0
_0200033C: .4byte 0x05000048

	thumb_func_start sub_02000340
sub_02000340: @ 0x02000340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r1
	ldr r6, _02000364 @ =0x04000128
	ldr r5, [r6]
	ldr r0, _02000368 @ =gUnknown_020010D0
	ldrb r2, [r0, #1]
	adds r7, r0, #0
	cmp r2, #1
	beq _020003D4
	cmp r2, #1
	bgt _0200036C
	cmp r2, #0
	beq _02000372
	b _02000410
	.align 2, 0
_02000364: .4byte 0x04000128
_02000368: .4byte gUnknown_020010D0
_0200036C:
	cmp r2, #2
	beq _02000404
	b _02000410
_02000372:
	movs r1, #0x30
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _020003D0
	movs r0, #0x88
	adds r4, r5, #0
	ands r4, r0
	cmp r4, #8
	bne _02000410
	movs r1, #4
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _020003D0
	ldr r1, [r7, #0x14]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _020003D0
	ldr r3, _020003E8 @ =0x04000208
	strh r2, [r3]
	ldr r2, _020003EC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _020003F0 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldrb r1, [r6, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #1]
	ldr r1, _020003F4 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _020003F8 @ =0x0000B1FC
	str r0, [r1]
	strb r4, [r7]
_020003D0:
	movs r0, #1
	strb r0, [r7, #1]
_020003D4:
	ldr r1, _020003FC @ =gUnknown_020010D0
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _02000404
	ldrb r0, [r1, #0xa]
	cmp r0, #7
	bhi _02000400
	adds r0, #1
	strb r0, [r1, #0xa]
	b _02000404
	.align 2, 0
_020003E8: .4byte 0x04000208
_020003EC: .4byte 0x04000200
_020003F0: .4byte 0x0000FF7F
_020003F4: .4byte 0x04000202
_020003F8: .4byte 0x0000B1FC
_020003FC: .4byte gUnknown_020010D0
_02000400:
	movs r0, #2
	strb r0, [r1, #1]
_02000404:
	mov r0, ip
	bl sub_020004E0
	mov r0, r8
	bl sub_0200046C
_02000410:
	ldr r1, _02000430 @ =gUnknown_020010D0
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	ldrb r3, [r1, #3]
	ldrb r0, [r1, #2]
	lsls r2, r0, #8
	ldrb r0, [r1]
	adds r7, r1, #0
	cmp r0, #8
	bne _02000434
	movs r0, #0x80
	orrs r0, r2
	orrs r0, r3
	b _02000438
	.align 2, 0
_02000430: .4byte gUnknown_020010D0
_02000434:
	adds r0, r3, #0
	orrs r0, r2
_02000438:
	adds r2, r0, #0
	ldrb r0, [r7, #9]
	cmp r0, #0
	beq _02000446
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
_02000446:
	ldrb r0, [r7, #0xa]
	lsrs r0, r0, #3
	lsls r1, r0, #0xf
	lsls r0, r5, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bls _0200045E
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r0, r1
	orrs r0, r2
	b _02000462
_0200045E:
	adds r0, r2, #0
	orrs r0, r1
_02000462:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200046C
sub_0200046C: @ 0x0200046C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _020004D4 @ =gUnknown_020010D0
	ldr r2, [r4, #0x28]
	ldrb r1, [r4, #0xb]
	strb r1, [r2]
	ldr r3, [r4, #0x28]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	eors r1, r2
	strb r1, [r3, #1]
	ldr r1, [r4, #0x28]
	strh r5, [r1, #2]
	ldr r1, [r4, #0x28]
	adds r1, #4
	ldr r2, _020004D8 @ =0x04000004
	bl CpuSet
	movs r2, #0
	ldr r1, [r4, #0x28]
_02000494:
	ldrh r0, [r1]
	adds r5, r5, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #9
	bls _02000494
	adds r2, r4, #0
	ldr r1, [r2, #0x28]
	mvns r0, r5
	subs r0, #0xc
	strh r0, [r1, #2]
	ldrb r0, [r2]
	cmp r0, #0
	beq _020004B6
	ldr r1, _020004DC @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_020004B6:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x14]
	ldrb r0, [r4]
	cmp r0, #0
	beq _020004CE
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _020004CE
	ldr r1, _020004DC @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_020004CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020004D4: .4byte gUnknown_020010D0
_020004D8: .4byte 0x04000004
_020004DC: .4byte 0x0400010E

	thumb_func_start sub_020004E0
sub_020004E0: @ 0x020004E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp]
	ldr r0, _020005B0 @ =0x04000208
	strh r1, [r0]
	ldr r3, _020005B4 @ =gUnknown_020010D4
	add r0, sp, #4
	mov sl, r0
	add r1, sp, #8
	mov sb, r1
	adds r2, r3, #0
	adds r2, #0x3c
	movs r4, #3
_02000506:
	ldr r1, [r2, #0x10]
	ldr r0, [r2]
	str r0, [r2, #0x10]
	stm r2!, {r1}
	subs r4, #1
	cmp r4, #0
	bge _02000506
	ldr r0, [r3]
	str r0, [sp, #4]
	movs r2, #0
	str r2, [r3]
	ldr r1, _020005B0 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	subs r0, r3, #4
	strb r2, [r0, #3]
	movs r4, #0
	mov r8, r0
	mov r7, r8
	adds r7, #0x50
_0200052E:
	movs r3, #0
	movs r2, #0
	lsls r5, r4, #2
	adds r6, r4, #1
	adds r0, r5, r7
	ldr r1, [r0]
_0200053A:
	ldrh r0, [r1]
	adds r3, r3, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #9
	bls _0200053A
	mov r2, sl
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200057A
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xd
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0200057A
	adds r0, r5, r7
	ldr r0, [r0]
	adds r0, #4
	lsls r1, r4, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	ldr r2, _020005B8 @ =0x04000004
	bl CpuSet
	movs r0, #1
	lsls r0, r4
	mov r2, r8
	ldrb r1, [r2, #3]
	orrs r0, r1
	strb r0, [r2, #3]
_0200057A:
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, r7
	ldr r1, [r0]
	adds r1, #4
	mov r0, sb
	ldr r2, _020005BC @ =0x05000004
	bl CpuSet
	adds r4, r6, #0
	cmp r4, #1
	ble _0200052E
	ldr r1, _020005C0 @ =gUnknown_020010D0
	ldrb r0, [r1, #2]
	ldrb r2, [r1, #3]
	orrs r0, r2
	strb r0, [r1, #2]
	ldrb r0, [r1, #3]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_020005B0: .4byte 0x04000208
_020005B4: .4byte gUnknown_020010D4
_020005B8: .4byte 0x04000004
_020005BC: .4byte 0x05000004
_020005C0: .4byte gUnknown_020010D0

	thumb_func_start sub_020005C4
sub_020005C4: @ 0x020005C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _02000600 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r2, _02000604 @ =gUnknown_020010D0
	ldr r3, _02000608 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r2, #9]
	ldr r1, [r2, #0x14]
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, r2
	cmp r1, r0
	bne _02000610
	ldr r0, _0200060C @ =0x0000FEFE
	strh r0, [r3, #2]
	ldr r1, [r2, #0x2c]
	ldr r0, [r2, #0x28]
	str r0, [r2, #0x2c]
	str r1, [r2, #0x28]
	b _02000620
	.align 2, 0
_02000600: .4byte 0x04000120
_02000604: .4byte gUnknown_020010D0
_02000608: .4byte 0x04000128
_0200060C: .4byte 0x0000FEFE
_02000610:
	cmp r1, #0
	blt _02000620
	mov r2, ip
	ldr r0, [r2, #0x2c]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3, #2]
_02000620:
	mov r1, ip
	ldr r0, [r1, #0x14]
	cmp r0, #0xa
	bgt _0200062C
	adds r0, #1
	str r0, [r1, #0x14]
_0200062C:
	movs r2, #0
	mov r8, r2
	mov sl, ip
	mov sb, r2
	mov r6, ip
	adds r6, #0x18
	mov r5, sp
_0200063A:
	ldrh r0, [r5]
	mov r1, r8
	lsls r7, r1, #2
	ldr r2, _02000654 @ =0x0000FEFE
	cmp r0, r2
	bne _02000658
	ldr r0, [r6]
	cmp r0, #9
	ble _02000658
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6]
	b _02000686
	.align 2, 0
_02000654: .4byte 0x0000FEFE
_02000658:
	mov r0, sl
	adds r0, #0x30
	mov r1, sb
	adds r4, r1, r0
	ldr r2, [r6]
	ldr r3, [r4]
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r1, [r5]
	strh r1, [r0]
	cmp r2, #9
	bne _02000686
	mov r0, ip
	adds r0, #0x40
	adds r0, r7, r0
	ldr r1, [r0]
	str r3, [r0]
	str r1, [r4]
	mov r0, ip
	adds r0, #4
	add r0, r8
	movs r1, #1
	strb r1, [r0]
_02000686:
	ldr r0, [r6]
	cmp r0, #0xa
	bgt _02000690
	adds r0, #1
	str r0, [r6]
_02000690:
	movs r2, #4
	add sb, r2
	adds r6, #4
	adds r5, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #1
	ble _0200063A
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #8
	bne _020006BE
	ldr r3, _020006D0 @ =0x0400010E
	movs r0, #0
	strh r0, [r3]
	ldr r2, _020006D4 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	strh r0, [r3]
_020006BE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020006D0: .4byte 0x0400010E
_020006D4: .4byte 0x04000128

	thumb_func_start sub_020006D8
sub_020006D8: @ 0x020006D8
	push {lr}
	ldr r1, _020006EC @ =gUnknown_020010D0
	ldrb r0, [r1]
	cmp r0, #0
	beq _020006E6
	movs r0, #1
	strb r0, [r1, #8]
_020006E6:
	pop {r0}
	bx r0
	.align 2, 0
_020006EC: .4byte gUnknown_020010D0

	thumb_func_start sub_020006F0
sub_020006F0: @ 0x020006F0
	push {r4, lr}
	ldr r3, _02000724 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _02000728 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0200072C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _02000730 @ =0x04000128
	ldr r2, _02000734 @ =0x00002003
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x1c
	ldr r0, _02000738 @ =0x0000B1FC
	str r0, [r1]
	adds r1, #0xf6
	movs r0, #0xc0
	strh r0, [r1]
	ldr r0, _0200073C @ =gUnknown_020010D0
	strb r4, [r0, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02000724: .4byte 0x04000208
_02000728: .4byte 0x04000200
_0200072C: .4byte 0x0000FF3F
_02000730: .4byte 0x04000128
_02000734: .4byte 0x00002003
_02000738: .4byte 0x0000B1FC
_0200073C: .4byte gUnknown_020010D0

	thumb_func_start sub_02000740
sub_02000740: @ 0x02000740
	ldr r1, _02000748 @ =gUnknown_020010D0
	movs r0, #0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02000748: .4byte gUnknown_020010D0

	thumb_func_start sub_0200074C
sub_0200074C: @ 0x0200074C
	push {r4, r5, r6, lr}
	ldr r2, _02000784 @ =gUnknown_020011F0
	ldr r0, _02000788 @ =gUnknown_02000D68
	ldr r1, [r2, #0x34]
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2, #4]
	cmp r1, #3
	bne _020007CE
	movs r5, #0xc
	ldrb r6, [r2, #0x15]
	adds r4, r6, #0
	muls r4, r5, r4
	ldr r1, [r2, #0x3c]
	cmp r4, r1
	blt _02000794
	ldr r6, [r2, #0x40]
	movs r5, #0
	movs r0, #4
	strb r0, [r2, #4]
	str r0, [r2, #0x34]
	ldr r1, _0200078C @ =gSomeFuncPtr
	ldr r0, _02000790 @ =0x00000105
	ldr r2, [r1]
	movs r1, #3
	bl _call_via_r2
	b _020007B0
	.align 2, 0
_02000784: .4byte gUnknown_020011F0
_02000788: .4byte gUnknown_02000D68
_0200078C: .4byte gSomeFuncPtr
_02000790: .4byte 0x00000105
_02000794:
	adds r0, r4, #0
	adds r0, #0xc
	cmp r0, r1
	blt _020007B0
	subs r5, r1, r4
	movs r0, #4
	strb r0, [r2, #4]
	str r0, [r2, #0x34]
	ldr r1, _020007D4 @ =gSomeFuncPtr
	ldr r0, _020007D8 @ =0x00000105
	ldr r2, [r1]
	movs r1, #3
	bl _call_via_r2
_020007B0:
	cmp r5, #0
	ble _020007C8
	ldr r1, _020007DC @ =gUnknown_020011F0
	ldr r0, [r1, #0x38]
	adds r0, r0, r4
	adds r1, #8
	lsrs r2, r5, #0x1f
	adds r2, r5, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
_020007C8:
	ldr r0, _020007DC @ =gUnknown_020011F0
	strb r6, [r0, #5]
	strb r5, [r0, #6]
_020007CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020007D4: .4byte gSomeFuncPtr
_020007D8: .4byte 0x00000105
_020007DC: .4byte gUnknown_020011F0

	thumb_func_start sub_020007E0
sub_020007E0: @ 0x020007E0
	push {lr}
	ldr r0, _020007F8 @ =gUnknown_020011F0
	ldrb r2, [r0, #0x14]
	ldr r1, [r0, #0x34]
	adds r3, r0, #0
	cmp r1, #5
	bhi _02000818
	lsls r0, r1, #2
	ldr r1, _020007FC @ =_02000800
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_020007F8: .4byte gUnknown_020011F0
_020007FC: .4byte _02000800
_02000800: @ jump table
	.4byte _02000818 @ case 0
	.4byte _02000822 @ case 1
	.4byte _02000840 @ case 2
	.4byte _0200086A @ case 3
	.4byte _0200089E @ case 4
	.4byte _0200087C @ case 5
_02000818:
	cmp r2, #1
	beq _0200089C
	cmp r2, #2
	bne _0200089E
	b _0200089C
_02000822:
	cmp r2, #2
	bne _0200089E
	str r2, [r3, #0x34]
	ldr r1, _02000838 @ =gSomeFuncPtr
	ldr r0, _0200083C @ =0x00000105
	ldr r2, [r1]
	movs r1, #0xb
	bl _call_via_r2
	b _0200089E
	.align 2, 0
_02000838: .4byte gSomeFuncPtr
_0200083C: .4byte 0x00000105
_02000840:
	ldr r0, [r3, #0x48]
	adds r0, #1
	str r0, [r3, #0x48]
	cmp r2, #3
	bne _02000864
	str r2, [r3, #0x34]
	ldr r1, _0200085C @ =gSomeFuncPtr
	ldr r0, _02000860 @ =0x00000105
	ldr r2, [r1]
	movs r1, #2
	bl _call_via_r2
	b _0200089E
	.align 2, 0
_0200085C: .4byte gSomeFuncPtr
_02000860: .4byte 0x00000105
_02000864:
	cmp r2, #1
	bne _0200089E
	b _0200089C
_0200086A:
	movs r0, #1
	str r0, [r3, #0x4c]
	cmp r2, #4
	beq _02000880
	cmp r2, #3
	beq _0200089E
	movs r0, #5
	str r0, [r3, #0x34]
	b _0200089E
_0200087C:
	cmp r2, #4
	bne _02000898
_02000880:
	str r2, [r3, #0x34]
	ldr r1, _02000890 @ =gSomeFuncPtr
	ldr r0, _02000894 @ =0x00000105
	ldr r2, [r1]
	movs r1, #3
	bl _call_via_r2
	b _0200089E
	.align 2, 0
_02000890: .4byte gSomeFuncPtr
_02000894: .4byte 0x00000105
_02000898:
	cmp r2, #3
	bne _0200089E
_0200089C:
	str r2, [r3, #0x34]
_0200089E:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_020008A4
sub_020008A4: @ 0x020008A4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _020008DC
	ldr r0, _020008D0 @ =gUnknown_020011F0
	ldr r0, [r0, #0x34]
	cmp r0, #1
	bls _020008BE
	cmp r0, #4
	bne _020008DC
_020008BE:
	ldr r1, _020008D4 @ =gSomeFuncPtr
	ldr r0, _020008D8 @ =0x00000105
	ldr r2, [r1]
	movs r1, #6
	bl _call_via_r2
	movs r0, #1
	b _02000974
	.align 2, 0
_020008D0: .4byte gUnknown_020011F0
_020008D4: .4byte gSomeFuncPtr
_020008D8: .4byte 0x00000105
_020008DC:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _020008FC
	ldr r1, _0200092C @ =gUnknown_020011F0
	ldr r0, [r1, #0x34]
	cmp r0, #4
	bne _020008FC
	movs r0, #0
	str r0, [r1, #0x34]
	ldr r1, _02000930 @ =gSomeFuncPtr
	ldr r0, _02000934 @ =0x00000105
	ldr r2, [r1]
	movs r1, #5
	bl _call_via_r2
_020008FC:
	adds r0, r6, #0
	bl sub_0200074C
	ldr r4, _02000938 @ =gUnknown_020011F4
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r4, #0
	bl sub_02000340
	subs r4, #4
	str r0, [r4]
	movs r5, #0xc0
	lsls r5, r5, #6
	ands r5, r0
	cmp r5, #0
	beq _02000940
	movs r0, #0x3c
	str r0, [r4, #0x44]
	ldr r1, _0200093C @ =gUnknown_02000D6E
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	ldrb r0, [r0]
	b _02000970
	.align 2, 0
_0200092C: .4byte gUnknown_020011F0
_02000930: .4byte gSomeFuncPtr
_02000934: .4byte 0x00000105
_02000938: .4byte gUnknown_020011F4
_0200093C: .4byte gUnknown_02000D6E
_02000940:
	cmp r0, #0
	beq _02000972
	movs r2, #0xf
	adds r1, r0, #0
	ands r1, r2
	lsrs r0, r0, #8
	ands r0, r2
	cmp r1, r0
	bne _0200095C
	adds r0, r6, #0
	bl sub_020007E0
	str r5, [r4, #0x44]
	b _02000972
_0200095C:
	ldr r0, [r4, #0x44]
	cmp r0, #0x3b
	bgt _02000968
	adds r0, #1
	str r0, [r4, #0x44]
	b _02000972
_02000968:
	ldr r0, _0200097C @ =gUnknown_02000D6E
	ldr r1, [r4, #0x34]
	adds r1, r1, r0
	ldrb r0, [r1]
_02000970:
	str r0, [r4, #0x34]
_02000972:
	movs r0, #0
_02000974:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0200097C: .4byte gUnknown_02000D6E

	thumb_func_start sub_02000980
sub_02000980: @ 0x02000980
	push {r4, lr}
	ldr r4, _0200099C @ =gUnknown_020011F0
	movs r2, #0
	str r2, [r4, #0x34]
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	adds r0, r1, #0
	movs r1, #0xc
	bl __udivsi3
	str r0, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200099C: .4byte gUnknown_020011F0

	thumb_func_start sub_020009A0
sub_020009A0: @ 0x020009A0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _020009E0 @ =gUnknown_02000D74
	ldr r0, _020009E4 @ =gUnknown_020011F0
	ldr r0, [r0, #0x34]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r1, _020009E8 @ =gUnknown_02001060
	ldr r0, [r1]
	cmp r0, r5
	beq _020009D8
	str r5, [r1]
	ldr r4, _020009EC @ =gSomeFuncPtr
	ldr r0, _020009F0 @ =0x00000292
	ldr r2, [r4]
	adds r1, r6, #0
	bl _call_via_r2
	ldr r0, _020009F4 @ =0x00000299
	movs r2, #0xa0
	lsls r2, r2, #3
	ldr r4, [r4]
	adds r1, r6, #0
	adds r3, r5, #0
	bl _call_via_r4
_020009D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020009E0: .4byte gUnknown_02000D74
_020009E4: .4byte gUnknown_020011F0
_020009E8: .4byte gUnknown_02001060
_020009EC: .4byte gSomeFuncPtr
_020009F0: .4byte 0x00000292
_020009F4: .4byte 0x00000299

	thumb_func_start CpuSet
CpuSet: @ 0x020009F8
	svc #0xb
	bx lr

	.BALIGN 4, 0

	.SECTION .data

	.GLOBAL gUnknown_02000AB4
gUnknown_02000AB4:
	.ASCII "マリオ　ｖｓ．　ドンキーコング　カードｅ＋\0\0"

	.GLOBAL gUnknown_02000AE0
gUnknown_02000AE0:
	.ASCII "マリオ　ｖｓ．　ドンキーコング\0\0"

	.ASCII "MultiSio010918\0\0"

	.GLOBAL gUnknown_02000B10
gUnknown_02000B10:
	.ASCII "そうしんかんりょう。\n\nＡボタンをおすともういちどそうしんします。\nＢボタンをおすとキャンセルします。\0"

	.GLOBAL gUnknown_02000B74
gUnknown_02000B74:
	.ASCII "そうしんちゅう。\n\nゲームボーイアドバンスのでんげんをきったり、つうしん\nケーブルをぬいたりしないでください。\0"

	.GLOBAL gUnknown_02000BE0
gUnknown_02000BE0:
	.ASCII "そうしんのよういができました。\n\nつうしんたいきちゅう。\0\0"

	.GLOBAL gUnknown_02000C18
gUnknown_02000C18:
	.ASCII "そうしんのよういができました。\n\nカードｅリーダー＋がささっているゲームボーイアドバン\nスと、マリオｖｓ．ドンキーコングのカートリッジがささ\nっているゲームボーイアドバンスを、つうしんケーブルで\nつなぎ、メニューで「ステージをついか」をえらんでスタ\nートさせてください。\nＢボタンをおすとキャンセルします。\n\0\0\0\0"
	
	.GLOBAL gUnknown_02000D48
gUnknown_02000D48:
	.incbin "data/palette.gbapal"

	.GLOBAL gUnknown_02000D68
gUnknown_02000D68:
	.byte 0x05
	.byte 0x06
	.byte 0x06
	.byte 0x07
	.byte 0x08
	.byte 0x07

	.GLOBAL gUnknown_02000D6E
gUnknown_02000D6E:
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x04
	.byte 0x00

	.GLOBAL gUnknown_02000D74
gUnknown_02000D74:
	.4byte gUnknown_02000C18
	.4byte gUnknown_02000C18
	.4byte gUnknown_02000BE0
	.4byte gUnknown_02000B74
	.4byte gUnknown_02000B10
	.4byte gUnknown_02000B74

	.GLOBAL gUnknown_02000D8C
gUnknown_02000D8C:
	.incbin "data/card-e.bin"
