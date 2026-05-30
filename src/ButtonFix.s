# Fixes a bug where letting go of the acceleration button causes the characters' arms to snap back to the steering wheel (plays the Wait animation for one frame).

# Inject @
# PAL   : 807ccb04
# NTSC-U: 807be0a4
# NTSC-J: 807cc170
# NTSC-K: 807baec4

# .set region, '' # Fill with P, E, J, or K to assemble for a particular region.
.if (region == 'P' || region == 'p')
    .set return, 0x807ccaf0
.elseif (region == 'E' || region == 'e')
    .set return, 0x807be090
.elseif (region == 'J' || region == 'j')
    .set return, 0x807cc15c
.elseif (region == 'K' || region == 'k')
    .set return, 0x807baeb0
.else
    .err
.endif

.set DRIVE, 0x1a

lhz r0, 0xFA (r31)
cmpwi r0, DRIVE
bne end
lis r12, return@h
ori r12, r12, return@l
mtctr r12
bctr
end:
li r0, 7