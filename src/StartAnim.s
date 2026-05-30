# Start the animation.

# Inject @
# PAL   : 807cb73c
# NTSC-U: 807bccdc
# NTSC-J: 807cada8
# NTSC-K: 807b9afc

# .set region, '' # Fill with P, E, J, or K to assemble for a particular region.
.if (region == 'P' || region == 'p')
    .set return, 0x807cb74c
.elseif (region == 'E' || region == 'e')
    .set return, 0x807bccec
.elseif (region == 'J' || region == 'j')
    .set return, 0x807cadb8
.elseif (region == 'K' || region == 'k')
    .set return, 0x807b9b0c
.else
    .err
.endif

.macro is_START_BOOST_FAIL
    andis. r12, r12, 0x0004
.endm

lwz r12, 0 (r29)
lwz r12, 0x4 (r12)
lwz r12, 0x8 (r12)
is_START_BOOST_FAIL
beq end
lis r12, return@h
ori r12, r12, return@l
mtctr r12
bctr

end:
cmpwi r3, 0                     # Original instruction