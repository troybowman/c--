#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: main
#   line: 1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: argc
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: argv
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: argc
#   line: 1
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: argv
#   line: 1
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: y
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x4
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: '\0'
# c-- exited with code: 0
