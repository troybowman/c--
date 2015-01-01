#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 4
# sym: main
#   line: 8
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: argc
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       1: argv
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: print_int
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: print_misc
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: end
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: argc
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: argv
#   line: 8
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: y
#   line: 10
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 4
# node 5: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 7
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 9
# node 10: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 10
# node 11: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 11
# node 12: type: TNT_SYMBOL sym: argc
# child SEQ_NEXT for node 6
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 16
# node 17: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 15
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 19
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 18
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 21
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "test"
# c-- exited with code: 0
