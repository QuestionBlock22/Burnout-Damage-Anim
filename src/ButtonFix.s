# Fixes a bug where letting go of the acceleration button causes the characters' arms to snap back to the steering wheel (plays the Wait animation for one frame).

# Inject @
# PAL   : 807ccb04
# NTSC-U: 807be0a4
# NTSC-J: 807cc170
# NTSC-K: 807baec4

# .set region, '' # Fill with P, E, J, or K to assemble for a particular region.
.if (region == 'P' || region == 'p')
    .set return, 0x807ccb10
.elseif (region == 'E' || region == 'e')
    .set return, 0x807be0b0
.elseif (region == 'J' || region == 'j')
    .set return, 0x807cc17c
.elseif (region == 'K' || region == 'k')
    .set return, 0x807baed0
.else
    .err
.endif

.set DAMAGE, 0x1a

lhz r0, 0xFA (r31)
cmpwi r0, DAMAGE
bne end
lis r12, return@h
ori r12, r12, return@l
mtctr r12
bctr
end:
li r0, 7
