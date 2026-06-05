# Disable the turning animation that interrupts the damage animation when player inputs are detected

# Hook 1, Prevent playing the turning animation at a standstill.:
# PAL   : 807ccb70
# NTSC-U: 807be110
# NTSC-J: 807cc1dc
# NTSC-K: 807baf30

# Hook 2, Prevent playing the turning animation when tilting the controller left or right, then letting go.:
# PAL   : 807ccb64
# NTSC-U: 807be104
# NTSC-J: 807cc1d0
# NTSC-K: 807baf24

.macro is_START_BOOST_FAIL
    andis. r12, r12, 0x0004
.endm

b start

startDriveAnimation:
sth r0, 0xF6 (r31)             # Original instruction
b end

start:
lwz r12, 0 (r31)
lwz r12, 0x4 (r12)
cmpwi r12, 0
beq end
lwz r12, 0x8 (r12)
is_START_BOOST_FAIL
beq startDriveAnimation         # Referred to as "DRIVE" internally and in the Ghidra Project.

end:
