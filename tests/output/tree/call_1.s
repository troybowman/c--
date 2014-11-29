#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 10
# sym: a
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: c
#   line: 11
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: d
#   line: 12
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: main
#   line: 14
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: args
#         type: ST_ARRAY
#           base: PRIM_INT
#     is_extern: no
# sym: print_array
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: a
#         type: ST_ARRAY
#           base: PRIM_INT
#     is_extern: yes
# sym: print_char
#   line: 4
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: print_int
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: print_misc
#   line: 7
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: a
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: b
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       2: c
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: d
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: print_string
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: args
#   line: 14
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: l1
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: l2
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x4
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: print_char
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_char
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: print_array
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: print_array
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: args
# child SEQ_NEXT for node 29
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: args
# child SEQ_NEXT for node 35
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_SYMBOL sym: l2
# child SEQ_NEXT for node 37
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 39
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_SYMBOL sym: d
# c-- exited with code: 0
