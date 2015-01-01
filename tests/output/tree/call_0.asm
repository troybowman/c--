#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
# sym: main
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: print_int
#   line: 9
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: print_ints
#   line: 10
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: print_misc
#   line: 11
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       2: three
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: print_string
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: print_strings
#   line: 8
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: str1
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: str2
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       2: str3
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       3: str4
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_CHARCON str: 'x'
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_strings
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 15
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_STRCON str: "two"
# child SEQ_NEXT for node 17
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_STRCON str: "three"
# child SEQ_NEXT for node 19
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_STRCON str: "four"
# child SEQ_NEXT for node 13
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: print_ints
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 27
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_CHARCON str: '3'
# child SEQ_NEXT for node 23
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_CHARCON str: '2'
# child SEQ_NEXT for node 35
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_STRCON str: "three"
# child SEQ_NEXT for node 37
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_INTCON val: 4
