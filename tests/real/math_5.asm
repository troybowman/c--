#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 25
# sym: __print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_hex
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: hex
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: __print_string
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: printf
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: k
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x40
# sym: init_k
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: rotl
#   line: 29
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: rotr
#   line: 30
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: ch
#   line: 31
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
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
#     is_extern: no
# sym: maj
#   line: 32
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
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
#     is_extern: no
# sym: ep0
#   line: 33
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: ep1
#   line: 34
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sig0
#   line: 35
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sig1
#   line: 36
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: memset
#   line: 39
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: buf
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: val
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       2: buflen
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: strlen
#   line: 47
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: get_hex_str
#   line: 55
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: out
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: hash
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: sha256_transform
#   line: 75
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: state
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: block
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: sha256_init
#   line: 119
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: state
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: count
#         type: ST_ARRAY
#           base: PRIM_INT
#     is_extern: no
# sym: sha256_update
#   line: 136
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: state
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: block
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       2: count
#         type: ST_ARRAY
#           base: PRIM_INT
#       3: data
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       4: datalen
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sha256_final
#   line: 157
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: hash
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: state
#         type: ST_ARRAY
#           base: PRIM_INT
#       2: block
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       3: count
#         type: ST_ARRAY
#           base: PRIM_INT
#     is_extern: no
# sym: sha256_from_str
#   line: 210
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: phase_simple_strings
#   line: 226
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 237
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: init_k
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: init_k
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_INTCON val: 1116352408
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_INTCON val: 1899447441
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_INTCON val: -1245643825
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_INTCON val: -373957723
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_INTCON val: 961987163
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 5
# child RHS for node 27
# node 30: type: TNT_INTCON val: 1508970993
# child SEQ_NEXT for node 26
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 33
# node 34: type: TNT_INTCON val: 6
# child RHS for node 32
# node 35: type: TNT_INTCON val: -1841331548
# child SEQ_NEXT for node 31
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 38
# node 39: type: TNT_INTCON val: 7
# child RHS for node 37
# node 40: type: TNT_INTCON val: -1424204075
# child SEQ_NEXT for node 36
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 43
# node 44: type: TNT_INTCON val: 8
# child RHS for node 42
# node 45: type: TNT_INTCON val: -670586216
# child SEQ_NEXT for node 41
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 48
# node 49: type: TNT_INTCON val: 9
# child RHS for node 47
# node 50: type: TNT_INTCON val: 310598401
# child SEQ_NEXT for node 46
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 53
# node 54: type: TNT_INTCON val: 10
# child RHS for node 52
# node 55: type: TNT_INTCON val: 607225278
# child SEQ_NEXT for node 51
# node 56: type: TNT_STMT
# child SEQ_CUR for node 56
# node 57: type: TNT_ASSG
# child LHS for node 57
# node 58: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 58
# node 59: type: TNT_INTCON val: 11
# child RHS for node 57
# node 60: type: TNT_INTCON val: 1426881987
# child SEQ_NEXT for node 56
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_ASSG
# child LHS for node 62
# node 63: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 63
# node 64: type: TNT_INTCON val: 12
# child RHS for node 62
# node 65: type: TNT_INTCON val: 1925078388
# child SEQ_NEXT for node 61
# node 66: type: TNT_STMT
# child SEQ_CUR for node 66
# node 67: type: TNT_ASSG
# child LHS for node 67
# node 68: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 68
# node 69: type: TNT_INTCON val: 13
# child RHS for node 67
# node 70: type: TNT_INTCON val: -2132889090
# child SEQ_NEXT for node 66
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_ASSG
# child LHS for node 72
# node 73: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 73
# node 74: type: TNT_INTCON val: 14
# child RHS for node 72
# node 75: type: TNT_INTCON val: -1680079193
# child SEQ_NEXT for node 71
# node 76: type: TNT_STMT
# child SEQ_CUR for node 76
# node 77: type: TNT_ASSG
# child LHS for node 77
# node 78: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 78
# node 79: type: TNT_INTCON val: 15
# child RHS for node 77
# node 80: type: TNT_INTCON val: -1046744716
# child SEQ_NEXT for node 76
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_ASSG
# child LHS for node 82
# node 83: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 83
# node 84: type: TNT_INTCON val: 16
# child RHS for node 82
# node 85: type: TNT_INTCON val: -459576895
# child SEQ_NEXT for node 81
# node 86: type: TNT_STMT
# child SEQ_CUR for node 86
# node 87: type: TNT_ASSG
# child LHS for node 87
# node 88: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 88
# node 89: type: TNT_INTCON val: 17
# child RHS for node 87
# node 90: type: TNT_INTCON val: -272742522
# child SEQ_NEXT for node 86
# node 91: type: TNT_STMT
# child SEQ_CUR for node 91
# node 92: type: TNT_ASSG
# child LHS for node 92
# node 93: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 93
# node 94: type: TNT_INTCON val: 18
# child RHS for node 92
# node 95: type: TNT_INTCON val: 264347078
# child SEQ_NEXT for node 91
# node 96: type: TNT_STMT
# child SEQ_CUR for node 96
# node 97: type: TNT_ASSG
# child LHS for node 97
# node 98: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 98
# node 99: type: TNT_INTCON val: 19
# child RHS for node 97
# node 100: type: TNT_INTCON val: 604807628
# child SEQ_NEXT for node 96
# node 101: type: TNT_STMT
# child SEQ_CUR for node 101
# node 102: type: TNT_ASSG
# child LHS for node 102
# node 103: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 103
# node 104: type: TNT_INTCON val: 20
# child RHS for node 102
# node 105: type: TNT_INTCON val: 770255983
# child SEQ_NEXT for node 101
# node 106: type: TNT_STMT
# child SEQ_CUR for node 106
# node 107: type: TNT_ASSG
# child LHS for node 107
# node 108: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 108
# node 109: type: TNT_INTCON val: 21
# child RHS for node 107
# node 110: type: TNT_INTCON val: 1249150122
# child SEQ_NEXT for node 106
# node 111: type: TNT_STMT
# child SEQ_CUR for node 111
# node 112: type: TNT_ASSG
# child LHS for node 112
# node 113: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 113
# node 114: type: TNT_INTCON val: 22
# child RHS for node 112
# node 115: type: TNT_INTCON val: 1555081692
# child SEQ_NEXT for node 111
# node 116: type: TNT_STMT
# child SEQ_CUR for node 116
# node 117: type: TNT_ASSG
# child LHS for node 117
# node 118: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 118
# node 119: type: TNT_INTCON val: 23
# child RHS for node 117
# node 120: type: TNT_INTCON val: 1996064986
# child SEQ_NEXT for node 116
# node 121: type: TNT_STMT
# child SEQ_CUR for node 121
# node 122: type: TNT_ASSG
# child LHS for node 122
# node 123: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 123
# node 124: type: TNT_INTCON val: 24
# child RHS for node 122
# node 125: type: TNT_INTCON val: -1740746414
# child SEQ_NEXT for node 121
# node 126: type: TNT_STMT
# child SEQ_CUR for node 126
# node 127: type: TNT_ASSG
# child LHS for node 127
# node 128: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 128
# node 129: type: TNT_INTCON val: 25
# child RHS for node 127
# node 130: type: TNT_INTCON val: -1473132947
# child SEQ_NEXT for node 126
# node 131: type: TNT_STMT
# child SEQ_CUR for node 131
# node 132: type: TNT_ASSG
# child LHS for node 132
# node 133: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 133
# node 134: type: TNT_INTCON val: 26
# child RHS for node 132
# node 135: type: TNT_INTCON val: -1341970488
# child SEQ_NEXT for node 131
# node 136: type: TNT_STMT
# child SEQ_CUR for node 136
# node 137: type: TNT_ASSG
# child LHS for node 137
# node 138: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 138
# node 139: type: TNT_INTCON val: 27
# child RHS for node 137
# node 140: type: TNT_INTCON val: -1084653625
# child SEQ_NEXT for node 136
# node 141: type: TNT_STMT
# child SEQ_CUR for node 141
# node 142: type: TNT_ASSG
# child LHS for node 142
# node 143: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 143
# node 144: type: TNT_INTCON val: 28
# child RHS for node 142
# node 145: type: TNT_INTCON val: -958395405
# child SEQ_NEXT for node 141
# node 146: type: TNT_STMT
# child SEQ_CUR for node 146
# node 147: type: TNT_ASSG
# child LHS for node 147
# node 148: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 148
# node 149: type: TNT_INTCON val: 29
# child RHS for node 147
# node 150: type: TNT_INTCON val: -710438585
# child SEQ_NEXT for node 146
# node 151: type: TNT_STMT
# child SEQ_CUR for node 151
# node 152: type: TNT_ASSG
# child LHS for node 152
# node 153: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 153
# node 154: type: TNT_INTCON val: 30
# child RHS for node 152
# node 155: type: TNT_INTCON val: 113926993
# child SEQ_NEXT for node 151
# node 156: type: TNT_STMT
# child SEQ_CUR for node 156
# node 157: type: TNT_ASSG
# child LHS for node 157
# node 158: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 158
# node 159: type: TNT_INTCON val: 31
# child RHS for node 157
# node 160: type: TNT_INTCON val: 338241895
# child SEQ_NEXT for node 156
# node 161: type: TNT_STMT
# child SEQ_CUR for node 161
# node 162: type: TNT_ASSG
# child LHS for node 162
# node 163: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 163
# node 164: type: TNT_INTCON val: 32
# child RHS for node 162
# node 165: type: TNT_INTCON val: 666307205
# child SEQ_NEXT for node 161
# node 166: type: TNT_STMT
# child SEQ_CUR for node 166
# node 167: type: TNT_ASSG
# child LHS for node 167
# node 168: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 168
# node 169: type: TNT_INTCON val: 33
# child RHS for node 167
# node 170: type: TNT_INTCON val: 773529912
# child SEQ_NEXT for node 166
# node 171: type: TNT_STMT
# child SEQ_CUR for node 171
# node 172: type: TNT_ASSG
# child LHS for node 172
# node 173: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 173
# node 174: type: TNT_INTCON val: 34
# child RHS for node 172
# node 175: type: TNT_INTCON val: 1294757372
# child SEQ_NEXT for node 171
# node 176: type: TNT_STMT
# child SEQ_CUR for node 176
# node 177: type: TNT_ASSG
# child LHS for node 177
# node 178: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 178
# node 179: type: TNT_INTCON val: 35
# child RHS for node 177
# node 180: type: TNT_INTCON val: 1396182291
# child SEQ_NEXT for node 176
# node 181: type: TNT_STMT
# child SEQ_CUR for node 181
# node 182: type: TNT_ASSG
# child LHS for node 182
# node 183: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 183
# node 184: type: TNT_INTCON val: 36
# child RHS for node 182
# node 185: type: TNT_INTCON val: 1695183700
# child SEQ_NEXT for node 181
# node 186: type: TNT_STMT
# child SEQ_CUR for node 186
# node 187: type: TNT_ASSG
# child LHS for node 187
# node 188: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 188
# node 189: type: TNT_INTCON val: 37
# child RHS for node 187
# node 190: type: TNT_INTCON val: 1986661051
# child SEQ_NEXT for node 186
# node 191: type: TNT_STMT
# child SEQ_CUR for node 191
# node 192: type: TNT_ASSG
# child LHS for node 192
# node 193: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 193
# node 194: type: TNT_INTCON val: 38
# child RHS for node 192
# node 195: type: TNT_INTCON val: -2117940946
# child SEQ_NEXT for node 191
# node 196: type: TNT_STMT
# child SEQ_CUR for node 196
# node 197: type: TNT_ASSG
# child LHS for node 197
# node 198: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 198
# node 199: type: TNT_INTCON val: 39
# child RHS for node 197
# node 200: type: TNT_INTCON val: -1838011259
# child SEQ_NEXT for node 196
# node 201: type: TNT_STMT
# child SEQ_CUR for node 201
# node 202: type: TNT_ASSG
# child LHS for node 202
# node 203: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 203
# node 204: type: TNT_INTCON val: 40
# child RHS for node 202
# node 205: type: TNT_INTCON val: -1564481375
# child SEQ_NEXT for node 201
# node 206: type: TNT_STMT
# child SEQ_CUR for node 206
# node 207: type: TNT_ASSG
# child LHS for node 207
# node 208: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 208
# node 209: type: TNT_INTCON val: 41
# child RHS for node 207
# node 210: type: TNT_INTCON val: -1474664885
# child SEQ_NEXT for node 206
# node 211: type: TNT_STMT
# child SEQ_CUR for node 211
# node 212: type: TNT_ASSG
# child LHS for node 212
# node 213: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 213
# node 214: type: TNT_INTCON val: 42
# child RHS for node 212
# node 215: type: TNT_INTCON val: -1035236496
# child SEQ_NEXT for node 211
# node 216: type: TNT_STMT
# child SEQ_CUR for node 216
# node 217: type: TNT_ASSG
# child LHS for node 217
# node 218: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 218
# node 219: type: TNT_INTCON val: 43
# child RHS for node 217
# node 220: type: TNT_INTCON val: -949202525
# child SEQ_NEXT for node 216
# node 221: type: TNT_STMT
# child SEQ_CUR for node 221
# node 222: type: TNT_ASSG
# child LHS for node 222
# node 223: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 223
# node 224: type: TNT_INTCON val: 44
# child RHS for node 222
# node 225: type: TNT_INTCON val: -778901479
# child SEQ_NEXT for node 221
# node 226: type: TNT_STMT
# child SEQ_CUR for node 226
# node 227: type: TNT_ASSG
# child LHS for node 227
# node 228: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 228
# node 229: type: TNT_INTCON val: 45
# child RHS for node 227
# node 230: type: TNT_INTCON val: -694614492
# child SEQ_NEXT for node 226
# node 231: type: TNT_STMT
# child SEQ_CUR for node 231
# node 232: type: TNT_ASSG
# child LHS for node 232
# node 233: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 233
# node 234: type: TNT_INTCON val: 46
# child RHS for node 232
# node 235: type: TNT_INTCON val: -200395387
# child SEQ_NEXT for node 231
# node 236: type: TNT_STMT
# child SEQ_CUR for node 236
# node 237: type: TNT_ASSG
# child LHS for node 237
# node 238: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 238
# node 239: type: TNT_INTCON val: 47
# child RHS for node 237
# node 240: type: TNT_INTCON val: 275423344
# child SEQ_NEXT for node 236
# node 241: type: TNT_STMT
# child SEQ_CUR for node 241
# node 242: type: TNT_ASSG
# child LHS for node 242
# node 243: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 243
# node 244: type: TNT_INTCON val: 48
# child RHS for node 242
# node 245: type: TNT_INTCON val: 430227734
# child SEQ_NEXT for node 241
# node 246: type: TNT_STMT
# child SEQ_CUR for node 246
# node 247: type: TNT_ASSG
# child LHS for node 247
# node 248: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 248
# node 249: type: TNT_INTCON val: 49
# child RHS for node 247
# node 250: type: TNT_INTCON val: 506948616
# child SEQ_NEXT for node 246
# node 251: type: TNT_STMT
# child SEQ_CUR for node 251
# node 252: type: TNT_ASSG
# child LHS for node 252
# node 253: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 253
# node 254: type: TNT_INTCON val: 50
# child RHS for node 252
# node 255: type: TNT_INTCON val: 659060556
# child SEQ_NEXT for node 251
# node 256: type: TNT_STMT
# child SEQ_CUR for node 256
# node 257: type: TNT_ASSG
# child LHS for node 257
# node 258: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 258
# node 259: type: TNT_INTCON val: 51
# child RHS for node 257
# node 260: type: TNT_INTCON val: 883997877
# child SEQ_NEXT for node 256
# node 261: type: TNT_STMT
# child SEQ_CUR for node 261
# node 262: type: TNT_ASSG
# child LHS for node 262
# node 263: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 263
# node 264: type: TNT_INTCON val: 52
# child RHS for node 262
# node 265: type: TNT_INTCON val: 958139571
# child SEQ_NEXT for node 261
# node 266: type: TNT_STMT
# child SEQ_CUR for node 266
# node 267: type: TNT_ASSG
# child LHS for node 267
# node 268: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 268
# node 269: type: TNT_INTCON val: 53
# child RHS for node 267
# node 270: type: TNT_INTCON val: 1322822218
# child SEQ_NEXT for node 266
# node 271: type: TNT_STMT
# child SEQ_CUR for node 271
# node 272: type: TNT_ASSG
# child LHS for node 272
# node 273: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 273
# node 274: type: TNT_INTCON val: 54
# child RHS for node 272
# node 275: type: TNT_INTCON val: 1537002063
# child SEQ_NEXT for node 271
# node 276: type: TNT_STMT
# child SEQ_CUR for node 276
# node 277: type: TNT_ASSG
# child LHS for node 277
# node 278: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 278
# node 279: type: TNT_INTCON val: 55
# child RHS for node 277
# node 280: type: TNT_INTCON val: 1747873779
# child SEQ_NEXT for node 276
# node 281: type: TNT_STMT
# child SEQ_CUR for node 281
# node 282: type: TNT_ASSG
# child LHS for node 282
# node 283: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 283
# node 284: type: TNT_INTCON val: 56
# child RHS for node 282
# node 285: type: TNT_INTCON val: 1955562222
# child SEQ_NEXT for node 281
# node 286: type: TNT_STMT
# child SEQ_CUR for node 286
# node 287: type: TNT_ASSG
# child LHS for node 287
# node 288: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 288
# node 289: type: TNT_INTCON val: 57
# child RHS for node 287
# node 290: type: TNT_INTCON val: 2024104815
# child SEQ_NEXT for node 286
# node 291: type: TNT_STMT
# child SEQ_CUR for node 291
# node 292: type: TNT_ASSG
# child LHS for node 292
# node 293: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 293
# node 294: type: TNT_INTCON val: 58
# child RHS for node 292
# node 295: type: TNT_INTCON val: -2067236844
# child SEQ_NEXT for node 291
# node 296: type: TNT_STMT
# child SEQ_CUR for node 296
# node 297: type: TNT_ASSG
# child LHS for node 297
# node 298: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 298
# node 299: type: TNT_INTCON val: 59
# child RHS for node 297
# node 300: type: TNT_INTCON val: -1933114872
# child SEQ_NEXT for node 296
# node 301: type: TNT_STMT
# child SEQ_CUR for node 301
# node 302: type: TNT_ASSG
# child LHS for node 302
# node 303: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 303
# node 304: type: TNT_INTCON val: 60
# child RHS for node 302
# node 305: type: TNT_INTCON val: -1866530822
# child SEQ_NEXT for node 301
# node 306: type: TNT_STMT
# child SEQ_CUR for node 306
# node 307: type: TNT_ASSG
# child LHS for node 307
# node 308: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 308
# node 309: type: TNT_INTCON val: 61
# child RHS for node 307
# node 310: type: TNT_INTCON val: -1538233109
# child SEQ_NEXT for node 306
# node 311: type: TNT_STMT
# child SEQ_CUR for node 311
# node 312: type: TNT_ASSG
# child LHS for node 312
# node 313: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 313
# node 314: type: TNT_INTCON val: 62
# child RHS for node 312
# node 315: type: TNT_INTCON val: -1090935817
# child SEQ_NEXT for node 311
# node 316: type: TNT_STMT
# child SEQ_CUR for node 316
# node 317: type: TNT_ASSG
# child LHS for node 317
# node 318: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 318
# node 319: type: TNT_INTCON val: 63
# child RHS for node 317
# node 320: type: TNT_INTCON val: -965641998
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# size: 2
# sym: a
#   line: 29
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 29
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_BOR
# child LHS for node 3
# node 4: type: TNT_SHL
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: a
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: b
# child RHS for node 3
# node 7: type: TNT_SHR
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: a
# child RHS for node 7
# node 9: type: TNT_MINUS
# child LHS for node 9
# node 10: type: TNT_INTCON val: 32
# child RHS for node 9
# node 11: type: TNT_SYMBOL sym: b
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# size: 2
# sym: a
#   line: 30
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 30
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_BOR
# child LHS for node 3
# node 4: type: TNT_SHR
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: a
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: b
# child RHS for node 3
# node 7: type: TNT_SHL
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: a
# child RHS for node 7
# node 9: type: TNT_MINUS
# child LHS for node 9
# node 10: type: TNT_INTCON val: 32
# child RHS for node 9
# node 11: type: TNT_SYMBOL sym: b
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_BAND
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: x
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: y
# child RHS for node 3
# node 7: type: TNT_BAND
# child LHS for node 7
# node 8: type: TNT_BNOT
# child RHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 7
# node 10: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_BAND
# child LHS for node 5
# node 6: type: TNT_SYMBOL sym: x
# child RHS for node 5
# node 7: type: TNT_SYMBOL sym: y
# child RHS for node 4
# node 8: type: TNT_BAND
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_SYMBOL sym: z
# child RHS for node 3
# node 11: type: TNT_BAND
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: y
# child RHS for node 11
# node 13: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 33
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 2
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 13
# child RHS for node 3
# node 15: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 16
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 22
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 34
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 6
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 11
# child RHS for node 3
# node 15: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 16
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 25
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 35
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 7
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 18
# child RHS for node 3
# node 15: type: TNT_SHR
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: x
# child RHS for node 15
# node 17: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 36
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 17
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 19
# child RHS for node 3
# node 15: type: TNT_SHR
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: x
# child RHS for node 15
# node 17: type: TNT_INTCON val: 10
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: memset
#-----------------------------------------------------------------------------
# size: 4
# sym: buf
#   line: 39
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: val
#   line: 39
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: buflen
#   line: 39
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 41
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: memset
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_INIT for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: i
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child FOR_COND for node 2
# node 6: type: TNT_LT
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: i
# child RHS for node 6
# node 8: type: TNT_SYMBOL sym: buflen
# child FOR_INC for node 2
# node 9: type: TNT_PEQ
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: i
# child RHS for node 9
# node 11: type: TNT_INTCON val: 1
# child FOR_BODY for node 2
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: buf
# child AL_OFFSET for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 12
# node 15: type: TNT_SYMBOL sym: val
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: strlen
#-----------------------------------------------------------------------------
# size: 2
# sym: string
#   line: 47
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: i
#   line: 49
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: strlen
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_INIT for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: i
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child FOR_COND for node 2
# node 6: type: TNT_NEQ
# child LHS for node 6
# node 7: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 6
# node 9: type: TNT_INTCON val: 0
# child FOR_INC for node 2
# node 10: type: TNT_PEQ
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_RET
# child RET_EXPR for node 14
# node 15: type: TNT_SYMBOL sym: i
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: get_hex_str
#-----------------------------------------------------------------------------
# size: 4
# sym: out
#   line: 55
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: hash
#   line: 55
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: i
#   line: 57
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: map
#   line: 58
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x10
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: get_hex_str
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: '0'
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_CHARCON str: '1'
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_CHARCON str: '2'
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_CHARCON str: '3'
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_CHARCON str: '4'
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 5
# child RHS for node 27
# node 30: type: TNT_CHARCON str: '5'
# child SEQ_NEXT for node 26
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 33
# node 34: type: TNT_INTCON val: 6
# child RHS for node 32
# node 35: type: TNT_CHARCON str: '6'
# child SEQ_NEXT for node 31
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 38
# node 39: type: TNT_INTCON val: 7
# child RHS for node 37
# node 40: type: TNT_CHARCON str: '7'
# child SEQ_NEXT for node 36
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 43
# node 44: type: TNT_INTCON val: 8
# child RHS for node 42
# node 45: type: TNT_CHARCON str: '8'
# child SEQ_NEXT for node 41
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 48
# node 49: type: TNT_INTCON val: 9
# child RHS for node 47
# node 50: type: TNT_CHARCON str: '9'
# child SEQ_NEXT for node 46
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 53
# node 54: type: TNT_INTCON val: 10
# child RHS for node 52
# node 55: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 51
# node 56: type: TNT_STMT
# child SEQ_CUR for node 56
# node 57: type: TNT_ASSG
# child LHS for node 57
# node 58: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 58
# node 59: type: TNT_INTCON val: 11
# child RHS for node 57
# node 60: type: TNT_CHARCON str: 'b'
# child SEQ_NEXT for node 56
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_ASSG
# child LHS for node 62
# node 63: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 63
# node 64: type: TNT_INTCON val: 12
# child RHS for node 62
# node 65: type: TNT_CHARCON str: 'c'
# child SEQ_NEXT for node 61
# node 66: type: TNT_STMT
# child SEQ_CUR for node 66
# node 67: type: TNT_ASSG
# child LHS for node 67
# node 68: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 68
# node 69: type: TNT_INTCON val: 13
# child RHS for node 67
# node 70: type: TNT_CHARCON str: 'd'
# child SEQ_NEXT for node 66
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_ASSG
# child LHS for node 72
# node 73: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 73
# node 74: type: TNT_INTCON val: 14
# child RHS for node 72
# node 75: type: TNT_CHARCON str: 'e'
# child SEQ_NEXT for node 71
# node 76: type: TNT_STMT
# child SEQ_CUR for node 76
# node 77: type: TNT_ASSG
# child LHS for node 77
# node 78: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 78
# node 79: type: TNT_INTCON val: 15
# child RHS for node 77
# node 80: type: TNT_CHARCON str: 'f'
# child SEQ_NEXT for node 76
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_FOR
# child FOR_INIT for node 82
# node 83: type: TNT_ASSG
# child LHS for node 83
# node 84: type: TNT_SYMBOL sym: i
# child RHS for node 83
# node 85: type: TNT_INTCON val: 0
# child FOR_COND for node 82
# node 86: type: TNT_LT
# child LHS for node 86
# node 87: type: TNT_SYMBOL sym: i
# child RHS for node 86
# node 88: type: TNT_INTCON val: 32
# child FOR_INC for node 82
# node 89: type: TNT_PEQ
# child LHS for node 89
# node 90: type: TNT_SYMBOL sym: i
# child RHS for node 89
# node 91: type: TNT_INTCON val: 1
# child FOR_BODY for node 82
# node 92: type: TNT_STMT
# child SEQ_CUR for node 92
# node 93: type: TNT_ASSG
# child LHS for node 93
# node 94: type: TNT_ARRAY_LOOKUP sym: out
# child AL_OFFSET for node 94
# node 95: type: TNT_MULT
# child LHS for node 95
# node 96: type: TNT_INTCON val: 2
# child RHS for node 95
# node 97: type: TNT_SYMBOL sym: i
# child RHS for node 93
# node 98: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 98
# node 99: type: TNT_SHR
# child LHS for node 99
# node 100: type: TNT_BAND
# child LHS for node 100
# node 101: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 101
# node 102: type: TNT_SYMBOL sym: i
# child RHS for node 100
# node 103: type: TNT_INTCON val: 240
# child RHS for node 99
# node 104: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 92
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_ASSG
# child LHS for node 106
# node 107: type: TNT_ARRAY_LOOKUP sym: out
# child AL_OFFSET for node 107
# node 108: type: TNT_PLUS
# child LHS for node 108
# node 109: type: TNT_MULT
# child LHS for node 109
# node 110: type: TNT_INTCON val: 2
# child RHS for node 109
# node 111: type: TNT_SYMBOL sym: i
# child RHS for node 108
# node 112: type: TNT_INTCON val: 1
# child RHS for node 106
# node 113: type: TNT_ARRAY_LOOKUP sym: map
# child AL_OFFSET for node 113
# node 114: type: TNT_BAND
# child LHS for node 114
# node 115: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 115
# node 116: type: TNT_SYMBOL sym: i
# child RHS for node 114
# node 117: type: TNT_INTCON val: 15
# child SEQ_NEXT for node 81
# node 118: type: TNT_STMT
# child SEQ_CUR for node 118
# node 119: type: TNT_ASSG
# child LHS for node 119
# node 120: type: TNT_ARRAY_LOOKUP sym: out
# child AL_OFFSET for node 120
# node 121: type: TNT_INTCON val: 64
# child RHS for node 119
# node 122: type: TNT_INTCON val: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sha256_transform
#-----------------------------------------------------------------------------
# size: 15
# sym: state
#   line: 75
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: block
#   line: 75
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: a
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: d
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: e
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: g
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: h
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: t1
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: t2
#   line: 77
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: m
#   line: 77
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x40
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sha256_transform
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_INIT for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_ASSG
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: i
# child RHS for node 4
# node 6: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 3
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: j
# child RHS for node 8
# node 10: type: TNT_INTCON val: 0
# child FOR_COND for node 2
# node 11: type: TNT_LT
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: i
# child RHS for node 11
# node 13: type: TNT_INTCON val: 16
# child FOR_INC for node 2
# node 14: type: TNT_STMT
# child SEQ_CUR for node 14
# node 15: type: TNT_PEQ
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 14
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_PEQ
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: j
# child RHS for node 19
# node 21: type: TNT_INTCON val: 4
# child FOR_BODY for node 2
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 23
# node 24: type: TNT_SYMBOL sym: i
# child RHS for node 22
# node 25: type: TNT_BOR
# child LHS for node 25
# node 26: type: TNT_BOR
# child LHS for node 26
# node 27: type: TNT_BOR
# child LHS for node 27
# node 28: type: TNT_SHL
# child LHS for node 28
# node 29: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 29
# node 30: type: TNT_SYMBOL sym: j
# child RHS for node 28
# node 31: type: TNT_INTCON val: 24
# child RHS for node 27
# node 32: type: TNT_SHL
# child LHS for node 32
# node 33: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 33
# node 34: type: TNT_PLUS
# child LHS for node 34
# node 35: type: TNT_SYMBOL sym: j
# child RHS for node 34
# node 36: type: TNT_INTCON val: 1
# child RHS for node 32
# node 37: type: TNT_INTCON val: 16
# child RHS for node 26
# node 38: type: TNT_SHL
# child LHS for node 38
# node 39: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 39
# node 40: type: TNT_PLUS
# child LHS for node 40
# node 41: type: TNT_SYMBOL sym: j
# child RHS for node 40
# node 42: type: TNT_INTCON val: 2
# child RHS for node 38
# node 43: type: TNT_INTCON val: 8
# child RHS for node 25
# node 44: type: TNT_BAND
# child LHS for node 44
# node 45: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 45
# node 46: type: TNT_PLUS
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: j
# child RHS for node 46
# node 48: type: TNT_INTCON val: 3
# child RHS for node 44
# node 49: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 1
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_FOR
# child FOR_COND for node 51
# node 52: type: TNT_LT
# child LHS for node 52
# node 53: type: TNT_SYMBOL sym: i
# child RHS for node 52
# node 54: type: TNT_INTCON val: 64
# child FOR_INC for node 51
# node 55: type: TNT_PEQ
# child LHS for node 55
# node 56: type: TNT_SYMBOL sym: i
# child RHS for node 55
# node 57: type: TNT_INTCON val: 1
# child FOR_BODY for node 51
# node 58: type: TNT_ASSG
# child LHS for node 58
# node 59: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 59
# node 60: type: TNT_SYMBOL sym: i
# child RHS for node 58
# node 61: type: TNT_PLUS
# child LHS for node 61
# node 62: type: TNT_PLUS
# child LHS for node 62
# node 63: type: TNT_PLUS
# child LHS for node 63
# node 64: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 64
# node 65: type: TNT_ARG
# child SEQ_CUR for node 65
# node 66: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 66
# node 67: type: TNT_MINUS
# child LHS for node 67
# node 68: type: TNT_SYMBOL sym: i
# child RHS for node 67
# node 69: type: TNT_INTCON val: 2
# child RHS for node 63
# node 70: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 70
# node 71: type: TNT_MINUS
# child LHS for node 71
# node 72: type: TNT_SYMBOL sym: i
# child RHS for node 71
# node 73: type: TNT_INTCON val: 7
# child RHS for node 62
# node 74: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 74
# node 75: type: TNT_ARG
# child SEQ_CUR for node 75
# node 76: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 76
# node 77: type: TNT_MINUS
# child LHS for node 77
# node 78: type: TNT_SYMBOL sym: i
# child RHS for node 77
# node 79: type: TNT_INTCON val: 15
# child RHS for node 61
# node 80: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 80
# node 81: type: TNT_MINUS
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: i
# child RHS for node 81
# node 83: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 50
# node 84: type: TNT_STMT
# child SEQ_CUR for node 84
# node 85: type: TNT_ASSG
# child LHS for node 85
# node 86: type: TNT_SYMBOL sym: a
# child RHS for node 85
# node 87: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 87
# node 88: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 84
# node 89: type: TNT_STMT
# child SEQ_CUR for node 89
# node 90: type: TNT_ASSG
# child LHS for node 90
# node 91: type: TNT_SYMBOL sym: b
# child RHS for node 90
# node 92: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 92
# node 93: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 89
# node 94: type: TNT_STMT
# child SEQ_CUR for node 94
# node 95: type: TNT_ASSG
# child LHS for node 95
# node 96: type: TNT_SYMBOL sym: c
# child RHS for node 95
# node 97: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 97
# node 98: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 94
# node 99: type: TNT_STMT
# child SEQ_CUR for node 99
# node 100: type: TNT_ASSG
# child LHS for node 100
# node 101: type: TNT_SYMBOL sym: d
# child RHS for node 100
# node 102: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 102
# node 103: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 99
# node 104: type: TNT_STMT
# child SEQ_CUR for node 104
# node 105: type: TNT_ASSG
# child LHS for node 105
# node 106: type: TNT_SYMBOL sym: e
# child RHS for node 105
# node 107: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 107
# node 108: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 104
# node 109: type: TNT_STMT
# child SEQ_CUR for node 109
# node 110: type: TNT_ASSG
# child LHS for node 110
# node 111: type: TNT_SYMBOL sym: f
# child RHS for node 110
# node 112: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 112
# node 113: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 109
# node 114: type: TNT_STMT
# child SEQ_CUR for node 114
# node 115: type: TNT_ASSG
# child LHS for node 115
# node 116: type: TNT_SYMBOL sym: g
# child RHS for node 115
# node 117: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 117
# node 118: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 114
# node 119: type: TNT_STMT
# child SEQ_CUR for node 119
# node 120: type: TNT_ASSG
# child LHS for node 120
# node 121: type: TNT_SYMBOL sym: h
# child RHS for node 120
# node 122: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 122
# node 123: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 119
# node 124: type: TNT_STMT
# child SEQ_CUR for node 124
# node 125: type: TNT_FOR
# child FOR_INIT for node 125
# node 126: type: TNT_ASSG
# child LHS for node 126
# node 127: type: TNT_SYMBOL sym: i
# child RHS for node 126
# node 128: type: TNT_INTCON val: 0
# child FOR_COND for node 125
# node 129: type: TNT_LT
# child LHS for node 129
# node 130: type: TNT_SYMBOL sym: i
# child RHS for node 129
# node 131: type: TNT_INTCON val: 64
# child FOR_INC for node 125
# node 132: type: TNT_PEQ
# child LHS for node 132
# node 133: type: TNT_SYMBOL sym: i
# child RHS for node 132
# node 134: type: TNT_INTCON val: 1
# child FOR_BODY for node 125
# node 135: type: TNT_STMT
# child SEQ_CUR for node 135
# node 136: type: TNT_ASSG
# child LHS for node 136
# node 137: type: TNT_SYMBOL sym: t1
# child RHS for node 136
# node 138: type: TNT_PLUS
# child LHS for node 138
# node 139: type: TNT_PLUS
# child LHS for node 139
# node 140: type: TNT_PLUS
# child LHS for node 140
# node 141: type: TNT_PLUS
# child LHS for node 141
# node 142: type: TNT_SYMBOL sym: h
# child RHS for node 141
# node 143: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 143
# node 144: type: TNT_ARG
# child SEQ_CUR for node 144
# node 145: type: TNT_SYMBOL sym: e
# child RHS for node 140
# node 146: type: TNT_CALL sym: ch
# child CALL_ARGS for node 146
# node 147: type: TNT_ARG
# child SEQ_CUR for node 147
# node 148: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 147
# node 149: type: TNT_ARG
# child SEQ_CUR for node 149
# node 150: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 149
# node 151: type: TNT_ARG
# child SEQ_CUR for node 151
# node 152: type: TNT_SYMBOL sym: g
# child RHS for node 139
# node 153: type: TNT_ARRAY_LOOKUP sym: k
# child AL_OFFSET for node 153
# node 154: type: TNT_SYMBOL sym: i
# child RHS for node 138
# node 155: type: TNT_ARRAY_LOOKUP sym: m
# child AL_OFFSET for node 155
# node 156: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 135
# node 157: type: TNT_STMT
# child SEQ_CUR for node 157
# node 158: type: TNT_ASSG
# child LHS for node 158
# node 159: type: TNT_SYMBOL sym: t2
# child RHS for node 158
# node 160: type: TNT_PLUS
# child LHS for node 160
# node 161: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 161
# node 162: type: TNT_ARG
# child SEQ_CUR for node 162
# node 163: type: TNT_SYMBOL sym: a
# child RHS for node 160
# node 164: type: TNT_CALL sym: maj
# child CALL_ARGS for node 164
# node 165: type: TNT_ARG
# child SEQ_CUR for node 165
# node 166: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 165
# node 167: type: TNT_ARG
# child SEQ_CUR for node 167
# node 168: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 167
# node 169: type: TNT_ARG
# child SEQ_CUR for node 169
# node 170: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 157
# node 171: type: TNT_STMT
# child SEQ_CUR for node 171
# node 172: type: TNT_ASSG
# child LHS for node 172
# node 173: type: TNT_SYMBOL sym: h
# child RHS for node 172
# node 174: type: TNT_SYMBOL sym: g
# child SEQ_NEXT for node 171
# node 175: type: TNT_STMT
# child SEQ_CUR for node 175
# node 176: type: TNT_ASSG
# child LHS for node 176
# node 177: type: TNT_SYMBOL sym: g
# child RHS for node 176
# node 178: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 175
# node 179: type: TNT_STMT
# child SEQ_CUR for node 179
# node 180: type: TNT_ASSG
# child LHS for node 180
# node 181: type: TNT_SYMBOL sym: f
# child RHS for node 180
# node 182: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 179
# node 183: type: TNT_STMT
# child SEQ_CUR for node 183
# node 184: type: TNT_ASSG
# child LHS for node 184
# node 185: type: TNT_SYMBOL sym: e
# child RHS for node 184
# node 186: type: TNT_PLUS
# child LHS for node 186
# node 187: type: TNT_SYMBOL sym: d
# child RHS for node 186
# node 188: type: TNT_SYMBOL sym: t1
# child SEQ_NEXT for node 183
# node 189: type: TNT_STMT
# child SEQ_CUR for node 189
# node 190: type: TNT_ASSG
# child LHS for node 190
# node 191: type: TNT_SYMBOL sym: d
# child RHS for node 190
# node 192: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 189
# node 193: type: TNT_STMT
# child SEQ_CUR for node 193
# node 194: type: TNT_ASSG
# child LHS for node 194
# node 195: type: TNT_SYMBOL sym: c
# child RHS for node 194
# node 196: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 193
# node 197: type: TNT_STMT
# child SEQ_CUR for node 197
# node 198: type: TNT_ASSG
# child LHS for node 198
# node 199: type: TNT_SYMBOL sym: b
# child RHS for node 198
# node 200: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 197
# node 201: type: TNT_STMT
# child SEQ_CUR for node 201
# node 202: type: TNT_ASSG
# child LHS for node 202
# node 203: type: TNT_SYMBOL sym: a
# child RHS for node 202
# node 204: type: TNT_PLUS
# child LHS for node 204
# node 205: type: TNT_SYMBOL sym: t1
# child RHS for node 204
# node 206: type: TNT_SYMBOL sym: t2
# child SEQ_NEXT for node 124
# node 207: type: TNT_STMT
# child SEQ_CUR for node 207
# node 208: type: TNT_PEQ
# child LHS for node 208
# node 209: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 209
# node 210: type: TNT_INTCON val: 0
# child RHS for node 208
# node 211: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 207
# node 212: type: TNT_STMT
# child SEQ_CUR for node 212
# node 213: type: TNT_PEQ
# child LHS for node 213
# node 214: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 214
# node 215: type: TNT_INTCON val: 1
# child RHS for node 213
# node 216: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 212
# node 217: type: TNT_STMT
# child SEQ_CUR for node 217
# node 218: type: TNT_PEQ
# child LHS for node 218
# node 219: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 219
# node 220: type: TNT_INTCON val: 2
# child RHS for node 218
# node 221: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 217
# node 222: type: TNT_STMT
# child SEQ_CUR for node 222
# node 223: type: TNT_PEQ
# child LHS for node 223
# node 224: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 224
# node 225: type: TNT_INTCON val: 3
# child RHS for node 223
# node 226: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 222
# node 227: type: TNT_STMT
# child SEQ_CUR for node 227
# node 228: type: TNT_PEQ
# child LHS for node 228
# node 229: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 229
# node 230: type: TNT_INTCON val: 4
# child RHS for node 228
# node 231: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 227
# node 232: type: TNT_STMT
# child SEQ_CUR for node 232
# node 233: type: TNT_PEQ
# child LHS for node 233
# node 234: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 234
# node 235: type: TNT_INTCON val: 5
# child RHS for node 233
# node 236: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 232
# node 237: type: TNT_STMT
# child SEQ_CUR for node 237
# node 238: type: TNT_PEQ
# child LHS for node 238
# node 239: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 239
# node 240: type: TNT_INTCON val: 6
# child RHS for node 238
# node 241: type: TNT_SYMBOL sym: g
# child SEQ_NEXT for node 237
# node 242: type: TNT_STMT
# child SEQ_CUR for node 242
# node 243: type: TNT_PEQ
# child LHS for node 243
# node 244: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 244
# node 245: type: TNT_INTCON val: 7
# child RHS for node 243
# node 246: type: TNT_SYMBOL sym: h
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sha256_init
#-----------------------------------------------------------------------------
# size: 2
# sym: state
#   line: 119
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: count
#   line: 119
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sha256_init
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 0
# child RHS for node 17
# node 20: type: TNT_INTCON val: 1779033703
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 1
# child RHS for node 22
# node 25: type: TNT_INTCON val: -1150833019
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 2
# child RHS for node 27
# node 30: type: TNT_INTCON val: 1013904242
# child SEQ_NEXT for node 26
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 33
# node 34: type: TNT_INTCON val: 3
# child RHS for node 32
# node 35: type: TNT_INTCON val: -1521486534
# child SEQ_NEXT for node 31
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 38
# node 39: type: TNT_INTCON val: 4
# child RHS for node 37
# node 40: type: TNT_INTCON val: 1359893119
# child SEQ_NEXT for node 36
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 43
# node 44: type: TNT_INTCON val: 5
# child RHS for node 42
# node 45: type: TNT_INTCON val: -1694144372
# child SEQ_NEXT for node 41
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 48
# node 49: type: TNT_INTCON val: 6
# child RHS for node 47
# node 50: type: TNT_INTCON val: 528734635
# child SEQ_NEXT for node 46
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 53
# node 54: type: TNT_INTCON val: 7
# child RHS for node 52
# node 55: type: TNT_INTCON val: 1541459225
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sha256_update
#-----------------------------------------------------------------------------
# size: 6
# sym: state
#   line: 136
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: block
#   line: 136
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: count
#   line: 136
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: data
#   line: 136
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: datalen
#   line: 136
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 138
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sha256_update
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_INIT for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: i
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child FOR_COND for node 2
# node 6: type: TNT_LT
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: i
# child RHS for node 6
# node 8: type: TNT_SYMBOL sym: datalen
# child FOR_INC for node 2
# node 9: type: TNT_PEQ
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: i
# child RHS for node 9
# node 11: type: TNT_INTCON val: 1
# child FOR_BODY for node 2
# node 12: type: TNT_STMT
# child SEQ_CUR for node 12
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 14
# node 15: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 15
# node 16: type: TNT_INTCON val: 0
# child RHS for node 13
# node 17: type: TNT_ARRAY_LOOKUP sym: data
# child AL_OFFSET for node 17
# node 18: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 12
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_PEQ
# child LHS for node 20
# node 21: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 21
# node 22: type: TNT_INTCON val: 0
# child RHS for node 20
# node 23: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 19
# node 24: type: TNT_STMT
# child SEQ_CUR for node 24
# node 25: type: TNT_IF
# child IF_COND for node 25
# node 26: type: TNT_EQ
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 27
# node 28: type: TNT_INTCON val: 0
# child RHS for node 26
# node 29: type: TNT_INTCON val: 64
# child IF_BODY for node 25
# node 30: type: TNT_STMT
# child SEQ_CUR for node 30
# node 31: type: TNT_PEQ
# child LHS for node 31
# node 32: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 32
# node 33: type: TNT_INTCON val: 1
# child RHS for node 31
# node 34: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 30
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_IF
# child IF_COND for node 36
# node 37: type: TNT_EQ
# child LHS for node 37
# node 38: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 38
# node 39: type: TNT_INTCON val: 1
# child RHS for node 37
# node 40: type: TNT_INTCON val: 0
# child IF_BODY for node 36
# node 41: type: TNT_PEQ
# child LHS for node 41
# node 42: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 42
# node 43: type: TNT_INTCON val: 2
# child RHS for node 41
# node 44: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 35
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_CALL sym: sha256_transform
# child CALL_ARGS for node 46
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 47
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 45
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 53
# node 54: type: TNT_INTCON val: 0
# child RHS for node 52
# node 55: type: TNT_INTCON val: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sha256_final
#-----------------------------------------------------------------------------
# size: 7
# sym: hash
#   line: 157
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: state
#   line: 157
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: block
#   line: 157
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: count
#   line: 157
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: i
#   line: 159
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: h
#   line: 159
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: l
#   line: 159
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sha256_final
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: i
# child RHS for node 2
# node 4: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 4
# node 5: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_IF
# child IF_COND for node 7
# node 8: type: TNT_LT
# child LHS for node 8
# node 9: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 9
# node 10: type: TNT_INTCON val: 0
# child RHS for node 8
# node 11: type: TNT_INTCON val: 56
# child IF_BODY for node 7
# node 12: type: TNT_STMT
# child SEQ_CUR for node 12
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 14
# node 15: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 16: type: TNT_INTCON val: 128
# child SEQ_NEXT for node 12
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_PEQ
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: i
# child RHS for node 18
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_FOR
# child FOR_COND for node 22
# node 23: type: TNT_LT
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: i
# child RHS for node 23
# node 25: type: TNT_INTCON val: 56
# child FOR_INC for node 22
# node 26: type: TNT_PEQ
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: i
# child RHS for node 26
# node 28: type: TNT_INTCON val: 1
# child FOR_BODY for node 22
# node 29: type: TNT_ASSG
# child LHS for node 29
# node 30: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 30
# node 31: type: TNT_SYMBOL sym: i
# child RHS for node 29
# node 32: type: TNT_INTCON val: 0
# child IF_ELSE for node 7
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_ASSG
# child LHS for node 34
# node 35: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 35
# node 36: type: TNT_SYMBOL sym: i
# child RHS for node 34
# node 37: type: TNT_INTCON val: 128
# child SEQ_NEXT for node 33
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_PEQ
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: i
# child RHS for node 39
# node 41: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 38
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_FOR
# child FOR_COND for node 43
# node 44: type: TNT_LT
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: i
# child RHS for node 44
# node 46: type: TNT_INTCON val: 64
# child FOR_INC for node 43
# node 47: type: TNT_PEQ
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: i
# child RHS for node 47
# node 49: type: TNT_INTCON val: 1
# child FOR_BODY for node 43
# node 50: type: TNT_ASSG
# child LHS for node 50
# node 51: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 51
# node 52: type: TNT_SYMBOL sym: i
# child RHS for node 50
# node 53: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 42
# node 54: type: TNT_STMT
# child SEQ_CUR for node 54
# node 55: type: TNT_CALL sym: sha256_transform
# child CALL_ARGS for node 55
# node 56: type: TNT_ARG
# child SEQ_CUR for node 56
# node 57: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 56
# node 58: type: TNT_ARG
# child SEQ_CUR for node 58
# node 59: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 54
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_CALL sym: memset
# child CALL_ARGS for node 61
# node 62: type: TNT_ARG
# child SEQ_CUR for node 62
# node 63: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 62
# node 64: type: TNT_ARG
# child SEQ_CUR for node 64
# node 65: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 64
# node 66: type: TNT_ARG
# child SEQ_CUR for node 66
# node 67: type: TNT_INTCON val: 56
# child SEQ_NEXT for node 6
# node 68: type: TNT_STMT
# child SEQ_CUR for node 68
# node 69: type: TNT_ASSG
# child LHS for node 69
# node 70: type: TNT_SYMBOL sym: h
# child RHS for node 69
# node 71: type: TNT_BOR
# child LHS for node 71
# node 72: type: TNT_SHL
# child LHS for node 72
# node 73: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 73
# node 74: type: TNT_INTCON val: 2
# child RHS for node 72
# node 75: type: TNT_INTCON val: 9
# child RHS for node 71
# node 76: type: TNT_SHR
# child LHS for node 76
# node 77: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 77
# node 78: type: TNT_INTCON val: 1
# child RHS for node 76
# node 79: type: TNT_INTCON val: 23
# child SEQ_NEXT for node 68
# node 80: type: TNT_STMT
# child SEQ_CUR for node 80
# node 81: type: TNT_ASSG
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: l
# child RHS for node 81
# node 83: type: TNT_BOR
# child LHS for node 83
# node 84: type: TNT_SHL
# child LHS for node 84
# node 85: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 85
# node 86: type: TNT_INTCON val: 1
# child RHS for node 84
# node 87: type: TNT_INTCON val: 9
# child RHS for node 83
# node 88: type: TNT_SHL
# child LHS for node 88
# node 89: type: TNT_ARRAY_LOOKUP sym: count
# child AL_OFFSET for node 89
# node 90: type: TNT_INTCON val: 0
# child RHS for node 88
# node 91: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 80
# node 92: type: TNT_STMT
# child SEQ_CUR for node 92
# node 93: type: TNT_ASSG
# child LHS for node 93
# node 94: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 94
# node 95: type: TNT_INTCON val: 63
# child RHS for node 93
# node 96: type: TNT_SYMBOL sym: l
# child SEQ_NEXT for node 92
# node 97: type: TNT_STMT
# child SEQ_CUR for node 97
# node 98: type: TNT_ASSG
# child LHS for node 98
# node 99: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 99
# node 100: type: TNT_INTCON val: 62
# child RHS for node 98
# node 101: type: TNT_SHR
# child LHS for node 101
# node 102: type: TNT_SYMBOL sym: l
# child RHS for node 101
# node 103: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 97
# node 104: type: TNT_STMT
# child SEQ_CUR for node 104
# node 105: type: TNT_ASSG
# child LHS for node 105
# node 106: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 106
# node 107: type: TNT_INTCON val: 61
# child RHS for node 105
# node 108: type: TNT_SHR
# child LHS for node 108
# node 109: type: TNT_SYMBOL sym: l
# child RHS for node 108
# node 110: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 104
# node 111: type: TNT_STMT
# child SEQ_CUR for node 111
# node 112: type: TNT_ASSG
# child LHS for node 112
# node 113: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 113
# node 114: type: TNT_INTCON val: 60
# child RHS for node 112
# node 115: type: TNT_SHR
# child LHS for node 115
# node 116: type: TNT_SYMBOL sym: l
# child RHS for node 115
# node 117: type: TNT_INTCON val: 24
# child SEQ_NEXT for node 111
# node 118: type: TNT_STMT
# child SEQ_CUR for node 118
# node 119: type: TNT_ASSG
# child LHS for node 119
# node 120: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 120
# node 121: type: TNT_INTCON val: 59
# child RHS for node 119
# node 122: type: TNT_SYMBOL sym: h
# child SEQ_NEXT for node 118
# node 123: type: TNT_STMT
# child SEQ_CUR for node 123
# node 124: type: TNT_ASSG
# child LHS for node 124
# node 125: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 125
# node 126: type: TNT_INTCON val: 58
# child RHS for node 124
# node 127: type: TNT_SHR
# child LHS for node 127
# node 128: type: TNT_SYMBOL sym: h
# child RHS for node 127
# node 129: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 123
# node 130: type: TNT_STMT
# child SEQ_CUR for node 130
# node 131: type: TNT_ASSG
# child LHS for node 131
# node 132: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 132
# node 133: type: TNT_INTCON val: 57
# child RHS for node 131
# node 134: type: TNT_SHR
# child LHS for node 134
# node 135: type: TNT_SYMBOL sym: h
# child RHS for node 134
# node 136: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 130
# node 137: type: TNT_STMT
# child SEQ_CUR for node 137
# node 138: type: TNT_ASSG
# child LHS for node 138
# node 139: type: TNT_ARRAY_LOOKUP sym: block
# child AL_OFFSET for node 139
# node 140: type: TNT_INTCON val: 56
# child RHS for node 138
# node 141: type: TNT_SHR
# child LHS for node 141
# node 142: type: TNT_SYMBOL sym: h
# child RHS for node 141
# node 143: type: TNT_INTCON val: 24
# child SEQ_NEXT for node 137
# node 144: type: TNT_STMT
# child SEQ_CUR for node 144
# node 145: type: TNT_CALL sym: sha256_transform
# child CALL_ARGS for node 145
# node 146: type: TNT_ARG
# child SEQ_CUR for node 146
# node 147: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 146
# node 148: type: TNT_ARG
# child SEQ_CUR for node 148
# node 149: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 144
# node 150: type: TNT_STMT
# child SEQ_CUR for node 150
# node 151: type: TNT_FOR
# child FOR_INIT for node 151
# node 152: type: TNT_ASSG
# child LHS for node 152
# node 153: type: TNT_SYMBOL sym: i
# child RHS for node 152
# node 154: type: TNT_INTCON val: 0
# child FOR_COND for node 151
# node 155: type: TNT_LT
# child LHS for node 155
# node 156: type: TNT_SYMBOL sym: i
# child RHS for node 155
# node 157: type: TNT_INTCON val: 4
# child FOR_INC for node 151
# node 158: type: TNT_PEQ
# child LHS for node 158
# node 159: type: TNT_SYMBOL sym: i
# child RHS for node 158
# node 160: type: TNT_INTCON val: 1
# child FOR_BODY for node 151
# node 161: type: TNT_STMT
# child SEQ_CUR for node 161
# node 162: type: TNT_ASSG
# child LHS for node 162
# node 163: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 163
# node 164: type: TNT_SYMBOL sym: i
# child RHS for node 162
# node 165: type: TNT_BAND
# child LHS for node 165
# node 166: type: TNT_SHR
# child LHS for node 166
# node 167: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 167
# node 168: type: TNT_INTCON val: 0
# child RHS for node 166
# node 169: type: TNT_MINUS
# child LHS for node 169
# node 170: type: TNT_INTCON val: 24
# child RHS for node 169
# node 171: type: TNT_MULT
# child LHS for node 171
# node 172: type: TNT_SYMBOL sym: i
# child RHS for node 171
# node 173: type: TNT_INTCON val: 8
# child RHS for node 165
# node 174: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 161
# node 175: type: TNT_STMT
# child SEQ_CUR for node 175
# node 176: type: TNT_ASSG
# child LHS for node 176
# node 177: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 177
# node 178: type: TNT_PLUS
# child LHS for node 178
# node 179: type: TNT_SYMBOL sym: i
# child RHS for node 178
# node 180: type: TNT_INTCON val: 4
# child RHS for node 176
# node 181: type: TNT_BAND
# child LHS for node 181
# node 182: type: TNT_SHR
# child LHS for node 182
# node 183: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 183
# node 184: type: TNT_INTCON val: 1
# child RHS for node 182
# node 185: type: TNT_MINUS
# child LHS for node 185
# node 186: type: TNT_INTCON val: 24
# child RHS for node 185
# node 187: type: TNT_MULT
# child LHS for node 187
# node 188: type: TNT_SYMBOL sym: i
# child RHS for node 187
# node 189: type: TNT_INTCON val: 8
# child RHS for node 181
# node 190: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 175
# node 191: type: TNT_STMT
# child SEQ_CUR for node 191
# node 192: type: TNT_ASSG
# child LHS for node 192
# node 193: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 193
# node 194: type: TNT_PLUS
# child LHS for node 194
# node 195: type: TNT_SYMBOL sym: i
# child RHS for node 194
# node 196: type: TNT_INTCON val: 8
# child RHS for node 192
# node 197: type: TNT_BAND
# child LHS for node 197
# node 198: type: TNT_SHR
# child LHS for node 198
# node 199: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 199
# node 200: type: TNT_INTCON val: 2
# child RHS for node 198
# node 201: type: TNT_MINUS
# child LHS for node 201
# node 202: type: TNT_INTCON val: 24
# child RHS for node 201
# node 203: type: TNT_MULT
# child LHS for node 203
# node 204: type: TNT_SYMBOL sym: i
# child RHS for node 203
# node 205: type: TNT_INTCON val: 8
# child RHS for node 197
# node 206: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 191
# node 207: type: TNT_STMT
# child SEQ_CUR for node 207
# node 208: type: TNT_ASSG
# child LHS for node 208
# node 209: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 209
# node 210: type: TNT_PLUS
# child LHS for node 210
# node 211: type: TNT_SYMBOL sym: i
# child RHS for node 210
# node 212: type: TNT_INTCON val: 12
# child RHS for node 208
# node 213: type: TNT_BAND
# child LHS for node 213
# node 214: type: TNT_SHR
# child LHS for node 214
# node 215: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 215
# node 216: type: TNT_INTCON val: 3
# child RHS for node 214
# node 217: type: TNT_MINUS
# child LHS for node 217
# node 218: type: TNT_INTCON val: 24
# child RHS for node 217
# node 219: type: TNT_MULT
# child LHS for node 219
# node 220: type: TNT_SYMBOL sym: i
# child RHS for node 219
# node 221: type: TNT_INTCON val: 8
# child RHS for node 213
# node 222: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 207
# node 223: type: TNT_STMT
# child SEQ_CUR for node 223
# node 224: type: TNT_ASSG
# child LHS for node 224
# node 225: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 225
# node 226: type: TNT_PLUS
# child LHS for node 226
# node 227: type: TNT_SYMBOL sym: i
# child RHS for node 226
# node 228: type: TNT_INTCON val: 16
# child RHS for node 224
# node 229: type: TNT_BAND
# child LHS for node 229
# node 230: type: TNT_SHR
# child LHS for node 230
# node 231: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 231
# node 232: type: TNT_INTCON val: 4
# child RHS for node 230
# node 233: type: TNT_MINUS
# child LHS for node 233
# node 234: type: TNT_INTCON val: 24
# child RHS for node 233
# node 235: type: TNT_MULT
# child LHS for node 235
# node 236: type: TNT_SYMBOL sym: i
# child RHS for node 235
# node 237: type: TNT_INTCON val: 8
# child RHS for node 229
# node 238: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 223
# node 239: type: TNT_STMT
# child SEQ_CUR for node 239
# node 240: type: TNT_ASSG
# child LHS for node 240
# node 241: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 241
# node 242: type: TNT_PLUS
# child LHS for node 242
# node 243: type: TNT_SYMBOL sym: i
# child RHS for node 242
# node 244: type: TNT_INTCON val: 20
# child RHS for node 240
# node 245: type: TNT_BAND
# child LHS for node 245
# node 246: type: TNT_SHR
# child LHS for node 246
# node 247: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 247
# node 248: type: TNT_INTCON val: 5
# child RHS for node 246
# node 249: type: TNT_MINUS
# child LHS for node 249
# node 250: type: TNT_INTCON val: 24
# child RHS for node 249
# node 251: type: TNT_MULT
# child LHS for node 251
# node 252: type: TNT_SYMBOL sym: i
# child RHS for node 251
# node 253: type: TNT_INTCON val: 8
# child RHS for node 245
# node 254: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 239
# node 255: type: TNT_STMT
# child SEQ_CUR for node 255
# node 256: type: TNT_ASSG
# child LHS for node 256
# node 257: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 257
# node 258: type: TNT_PLUS
# child LHS for node 258
# node 259: type: TNT_SYMBOL sym: i
# child RHS for node 258
# node 260: type: TNT_INTCON val: 24
# child RHS for node 256
# node 261: type: TNT_BAND
# child LHS for node 261
# node 262: type: TNT_SHR
# child LHS for node 262
# node 263: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 263
# node 264: type: TNT_INTCON val: 6
# child RHS for node 262
# node 265: type: TNT_MINUS
# child LHS for node 265
# node 266: type: TNT_INTCON val: 24
# child RHS for node 265
# node 267: type: TNT_MULT
# child LHS for node 267
# node 268: type: TNT_SYMBOL sym: i
# child RHS for node 267
# node 269: type: TNT_INTCON val: 8
# child RHS for node 261
# node 270: type: TNT_INTCON val: 255
# child SEQ_NEXT for node 255
# node 271: type: TNT_STMT
# child SEQ_CUR for node 271
# node 272: type: TNT_ASSG
# child LHS for node 272
# node 273: type: TNT_ARRAY_LOOKUP sym: hash
# child AL_OFFSET for node 273
# node 274: type: TNT_PLUS
# child LHS for node 274
# node 275: type: TNT_SYMBOL sym: i
# child RHS for node 274
# node 276: type: TNT_INTCON val: 28
# child RHS for node 272
# node 277: type: TNT_BAND
# child LHS for node 277
# node 278: type: TNT_SHR
# child LHS for node 278
# node 279: type: TNT_ARRAY_LOOKUP sym: state
# child AL_OFFSET for node 279
# node 280: type: TNT_INTCON val: 7
# child RHS for node 278
# node 281: type: TNT_MINUS
# child LHS for node 281
# node 282: type: TNT_INTCON val: 24
# child RHS for node 281
# node 283: type: TNT_MULT
# child LHS for node 283
# node 284: type: TNT_SYMBOL sym: i
# child RHS for node 283
# node 285: type: TNT_INTCON val: 8
# child RHS for node 277
# node 286: type: TNT_INTCON val: 255
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sha256_from_str
#-----------------------------------------------------------------------------
# size: 6
# sym: string
#   line: 210
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: state
#   line: 212
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x8
# sym: count
#   line: 212
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x3
# sym: block
#   line: 213
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x40
# sym: output
#   line: 213
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x41
# sym: hash
#   line: 213
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x20
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sha256_from_str
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: sha256_init
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_SYMBOL sym: count
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_CALL sym: sha256_update
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 9
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_SYMBOL sym: count
# child SEQ_NEXT for node 13
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 15
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: strlen
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 7
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: sha256_final
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_SYMBOL sym: hash
# child SEQ_NEXT for node 23
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_SYMBOL sym: state
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_SYMBOL sym: block
# child SEQ_NEXT for node 27
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_SYMBOL sym: count
# child SEQ_NEXT for node 21
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: get_hex_str
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_SYMBOL sym: output
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: hash
# child SEQ_NEXT for node 31
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_PRINTF
# child PRINTF_TREE for node 38
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_STRCON str: "input string: '"
# child SEQ_NEXT for node 39
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 43
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "'\n"
# child SEQ_NEXT for node 37
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_PRINTF
# child PRINTF_TREE for node 52
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_STRCON str: "sha256 hash:  "
# child SEQ_NEXT for node 53
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_SYMBOL sym: output
# child SEQ_NEXT for node 57
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: phase_simple_strings
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: phase_simple_strings
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_STRCON str: ""
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_STRCON str: "abc"
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_STRCON str: "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_STRCON str: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_STRCON str: "this is a secret message"
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: sha256_from_str
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_STRCON str: "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: init_k
# child SEQ_NEXT for node 1
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: phase_simple_strings
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: init_k
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1116352408)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1899447441)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1245643825)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-373957723)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (961987163)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1508970993)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1841331548)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1424204075)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-670586216)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (310598401)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (607225278)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1426881987)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (11)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1925078388)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-2132889090)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (13)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1680079193)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (14)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1046744716)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-459576895)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-272742522)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (17)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (264347078)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (18)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (604807628)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (19)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (770255983)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (20)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1249150122)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (21)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1555081692)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (22)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1996064986)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (23)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1740746414)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1473132947)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (25)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1341970488)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (26)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1084653625)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (27)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-958395405)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (28)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-710438585)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (29)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (113926993)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (30)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (338241895)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (31)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (666307205)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (32)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (773529912)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (33)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1294757372)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (34)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1396182291)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (35)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1695183700)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (36)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1986661051)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (37)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-2117940946)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (38)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1838011259)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (39)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1564481375)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (40)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1474664885)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (41)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1035236496)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (42)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-949202525)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (43)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-778901479)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (44)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-694614492)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (45)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-200395387)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (46)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (275423344)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (47)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (430227734)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (48)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (506948616)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (49)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (659060556)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (50)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (883997877)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (51)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (958139571)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (52)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1322822218)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (53)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1537002063)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (54)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1747873779)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (55)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1955562222)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (56)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2024104815)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (57)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-2067236844)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (58)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1933114872)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (59)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1866530822)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (60)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1538233109)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (61)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1090935817)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (62)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-965641998)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (63)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (32)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (32)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   2
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (13)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (22)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   2
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (11)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (25)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (18)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (17)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (19)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: memset
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (buflen)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (val)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (buf)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: strlen
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: get_hex_str
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('0')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('1')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('2')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('3')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('4')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('5')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('6')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('7')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('8')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('9')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('a')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('b')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (11)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('c')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('d')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (13)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('e')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (14)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('f')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (32)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (240)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (out)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (map)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (out)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (64)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (out)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sha256_transform
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   2
# stktemps used: 0
# regargs used:  3
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (j)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (j)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (64)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (e)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (f)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (g)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (h)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (64)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (5)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ch)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (t1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (maj)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (t2)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (h)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (g)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (f)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (t1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (e)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (t1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (t2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (4)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sha256_init
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1779033703)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1150833019)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1013904242)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1521486534)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1359893119)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1694144372)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (528734635)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1541459225)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sha256_update
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (datalen)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (data)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (64)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_transform)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sha256_final
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  3
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (56)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (128)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (56)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (5)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (128)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (64)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (4)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_transform)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (56)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (memset)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (23)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (h)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (l)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (l)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (63)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (l)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (62)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (l)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (61)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (l)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (60)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (59)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (58)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (57)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (56)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_transform)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (7)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (20)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (255)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (28)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sha256_from_str
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   4
# stktemps used: 0
# regargs used:  4
# stkargs used:  1
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_init)
# |
# >
# CNT_LEA
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_SVTEMP (1)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_LEA
# -------
# dest -> ST_SVTEMP (2)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_LEA
# -------
# dest -> ST_SVTEMP (3)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (strlen)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (3)
# src1 -> ST_SVTEMP (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_SVTEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_SVTEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_SVTEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_update)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (state)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (block)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_ARRAY (count)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (3)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_final)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (output)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (hash)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (get_hex_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("input string: '")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("'\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("sha256 hash:  ")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (output)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: phase_simple_strings
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("abc")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("abcdbcdecdefdefgefg
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("aaaaaaaaaaaaaaaaaaa
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("this is a secret me
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("abcdefghbcdefghicde
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sha256_from_str)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (init_k)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (phase_simple_strin

.data

  _k:
    .space 256

  _str0:
    .asciiz "input string: '"
    .align 2

  _str1:
    .asciiz "'\n"
    .align 2

  _str2:
    .asciiz "sha256 hash:  "
    .align 2

  _str3:
    .asciiz "\n"
    .align 2

  _str4:
    .asciiz ""
    .align 2

  _str5:
    .asciiz "abc"
    .align 2

  _str6:
    .asciiz "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    .align 2

  _str7:
    .asciiz "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    .align 2

  _str8:
    .asciiz "this is a secret message"
    .align 2

  _str9:
    .asciiz "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"
    .align 2

.text

_init_k:

  # |--------------------------------|

  li $t0, 1116352408
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1899447441
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1245643825
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -373957723
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 961987163
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1508970993
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1841331548
  li $t1, 6
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1424204075
  li $t1, 7
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -670586216
  li $t1, 8
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 310598401
  li $t1, 9
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 607225278
  li $t1, 10
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1426881987
  li $t1, 11
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1925078388
  li $t1, 12
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2132889090
  li $t1, 13
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1680079193
  li $t1, 14
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1046744716
  li $t1, 15
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -459576895
  li $t1, 16
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -272742522
  li $t1, 17
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 264347078
  li $t1, 18
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 604807628
  li $t1, 19
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 770255983
  li $t1, 20
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1249150122
  li $t1, 21
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1555081692
  li $t1, 22
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1996064986
  li $t1, 23
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1740746414
  li $t1, 24
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1473132947
  li $t1, 25
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1341970488
  li $t1, 26
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1084653625
  li $t1, 27
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -958395405
  li $t1, 28
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -710438585
  li $t1, 29
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 113926993
  li $t1, 30
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 338241895
  li $t1, 31
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 666307205
  li $t1, 32
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 773529912
  li $t1, 33
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1294757372
  li $t1, 34
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1396182291
  li $t1, 35
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1695183700
  li $t1, 36
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1986661051
  li $t1, 37
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2117940946
  li $t1, 38
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1838011259
  li $t1, 39
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1564481375
  li $t1, 40
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1474664885
  li $t1, 41
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1035236496
  li $t1, 42
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -949202525
  li $t1, 43
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -778901479
  li $t1, 44
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -694614492
  li $t1, 45
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -200395387
  li $t1, 46
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 275423344
  li $t1, 47
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 430227734
  li $t1, 48
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 506948616
  li $t1, 49
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 659060556
  li $t1, 50
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 883997877
  li $t1, 51
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 958139571
  li $t1, 52
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1322822218
  li $t1, 53
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1537002063
  li $t1, 54
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1747873779
  li $t1, 55
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1955562222
  li $t1, 56
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2024104815
  li $t1, 57
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2067236844
  li $t1, 58
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1933114872
  li $t1, 59
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1866530822
  li $t1, 60
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1538233109
  li $t1, 61
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1090935817
  li $t1, 62
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -965641998
  li $t1, 63
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_init_k:
  jr $ra

_rotl:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack

  move $t0, $a0
  move $t1, $a1
  sllv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  srlv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotl

__leave_rotl:
  jr $ra

_rotr:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack

  move $t0, $a0
  move $t1, $a1
  srlv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  sllv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotr

__leave_rotr:
  jr $ra

_ch:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  not $t1, $t0
  move $t0, $a2
  and $t3, $t1, $t0
  xor $t0, $t2, $t3
  move $v0, $t0
  j __leave_ch

__leave_ch:
  jr $ra

_maj:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  move $t1, $a2
  and $t3, $t0, $t1
  xor $t0, $t2, $t3
  move $t1, $a1
  move $t2, $a2
  and $t3, $t1, $t2
  xor $t1, $t0, $t3
  move $v0, $t1
  j __leave_maj

__leave_maj:
  jr $ra

_ep0:

  # |--------------------------------|
  # |      <saved value of $a1>      |
  # |--------------------------------| sp+36
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  lw $t0, 32($sp)
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 13
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 22
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep0

__leave_ep0:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 32($sp)
  jr $ra

_ep1:

  # |--------------------------------|
  # |      <saved value of $a1>      |
  # |--------------------------------| sp+36
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  lw $t0, 32($sp)
  li $t1, 6
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 11
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep1

__leave_ep1:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 32($sp)
  jr $ra

_sig0:

  # |--------------------------------|
  # |      <saved value of $a1>      |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 7
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 3
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig0

__leave_sig0:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 24($sp)
  jr $ra

_sig1:

  # |--------------------------------|
  # |      <saved value of $a1>      |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 17
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 19
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 10
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig1

__leave_sig1:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 24($sp)
  jr $ra

_memset:

  # |--------------------------------|
  # |       <buflen is in $a2>       |
  # |--------------------------------| sp+16
  # |        <val is in $a1>         |
  # |--------------------------------| sp+12
  # |        <buf is in $a0>         |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a2
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  move $t0, $a1
  lw $t1, 0($sp)
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:

__leave_memset:
  la $sp, 8($sp)
  jr $ra

_strlen:

  # |--------------------------------|
  # |       <string is in $a0>       |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L2:
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sne $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L2
_L3:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_strlen

__leave_strlen:
  la $sp, 8($sp)
  jr $ra

_get_hex_str:

  # |--------------------------------|
  # |        <hash is in $a1>        |
  # |--------------------------------| sp+28
  # |        <out is in $a0>         |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              map               |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -24($sp)

  li $t0, '0'
  li $t1, 0
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '1'
  li $t1, 1
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '2'
  li $t1, 2
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '3'
  li $t1, 3
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '4'
  li $t1, 4
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '5'
  li $t1, 5
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '6'
  li $t1, 6
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '7'
  li $t1, 7
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '8'
  li $t1, 8
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '9'
  li $t1, 9
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'a'
  li $t1, 10
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'b'
  li $t1, 11
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'c'
  li $t1, 12
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'd'
  li $t1, 13
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'e'
  li $t1, 14
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'f'
  li $t1, 15
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sw $t0, 0($sp)
_L4:
  lw $t0, 0($sp)
  li $t1, 32
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 0($sp)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 240
  and $t2, $t0, $t1
  li $t0, 4
  srlv $t1, $t2, $t0
  la $t0, 4($sp)
  addu $t2, $t0, $t1
  lb $t0, ($t2)
  li $t1, 2
  lw $t2, 0($sp)
  mul $t3, $t1, $t2
  move $t1, $a0
  addu $t2, $t1, $t3
  sb $t0, ($t2)
  lw $t0, 0($sp)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 15
  and $t2, $t0, $t1
  la $t0, 4($sp)
  addu $t1, $t0, $t2
  lb $t0, ($t1)
  li $t1, 2
  lw $t2, 0($sp)
  mul $t3, $t1, $t2
  li $t1, 1
  addu $t2, $t3, $t1
  move $t1, $a0
  addu $t3, $t1, $t2
  sb $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L4
_L5:
  li $t0, 0
  li $t1, 64
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)

__leave_get_hex_str:
  la $sp, 24($sp)
  jr $ra

_sha256_transform:

  # |--------------------------------|
  # |      <saved value of $a2>      |
  # |--------------------------------| sp+344
  # |             block              |
  # |--------------------------------| sp+340
  # |             state              |
  # |--------------------------------| sp+336  <-- start of caller's stack
  # |               m                |
  # |--------------------------------| sp+80
  # |               t2               |
  # |--------------------------------| sp+76
  # |               t1               |
  # |--------------------------------| sp+72
  # |               j                |
  # |--------------------------------| sp+68
  # |               i                |
  # |--------------------------------| sp+64
  # |               h                |
  # |--------------------------------| sp+60
  # |               g                |
  # |--------------------------------| sp+56
  # |               f                |
  # |--------------------------------| sp+52
  # |               e                |
  # |--------------------------------| sp+48
  # |               d                |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -336($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 336($sp)
  sw $a1, 340($sp)
  sw $a2, 344($sp)

  li $t0, 0
  sw $t0, 64($sp)
  li $t0, 0
  sw $t0, 68($sp)
_L6:
  lw $t0, 64($sp)
  li $t1, 16
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  lw $t0, 68($sp)
  lw $t1, 340($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 24
  sllv $t2, $t0, $t1
  lw $t0, 68($sp)
  li $t1, 1
  addu $t3, $t0, $t1
  lw $t0, 340($sp)
  addu $t1, $t0, $t3
  lb $t0, ($t1)
  li $t1, 16
  sllv $t3, $t0, $t1
  or $t0, $t2, $t3
  lw $t1, 68($sp)
  li $t2, 2
  addu $t3, $t1, $t2
  lw $t1, 340($sp)
  addu $t2, $t1, $t3
  lb $t1, ($t2)
  li $t2, 8
  sllv $t3, $t1, $t2
  or $t1, $t0, $t3
  lw $t0, 68($sp)
  li $t2, 3
  addu $t3, $t0, $t2
  lw $t0, 340($sp)
  addu $t2, $t0, $t3
  lb $t0, ($t2)
  li $t2, 255
  and $t3, $t0, $t2
  or $t0, $t1, $t3
  lw $t1, 64($sp)
  sll $t2, $t1, 2
  la $t1, 80($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  lw $t0, 68($sp)
  li $t1, 4
  addu $t2, $t0, $t1
  sw $t2, 68($sp)
  j _L6
_L7:
_L8:
  lw $t0, 64($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L9
  lw $t0, 64($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 80($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  lw $t1, 64($sp)
  li $t2, 7
  sub $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, 80($sp)
  addu $t3, $t2, $t1
  lw $t1, ($t3)
  addu $s0, $t0, $t1
  lw $t0, 64($sp)
  li $t1, 15
  sub $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 80($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  addu $t1, $s0, $t0
  lw $t0, 64($sp)
  li $t2, 16
  sub $t3, $t0, $t2
  sll $t0, $t3, 2
  la $t2, 80($sp)
  addu $t3, $t2, $t0
  lw $t0, ($t3)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  sll $t1, $t0, 2
  la $t0, 80($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  j _L8
_L9:
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 32($sp)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 36($sp)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 40($sp)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 44($sp)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 48($sp)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 52($sp)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 56($sp)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 60($sp)
  li $t0, 0
  sw $t0, 64($sp)
_L10:
  lw $t0, 64($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L11
  lw $s0, 60($sp)
  lw $t0, 48($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  addu $s1, $s0, $t0
  lw $t0, 48($sp)
  lw $t1, 52($sp)
  lw $t2, 56($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _ch
  move $t0, $v0
  addu $t1, $s1, $t0
  lw $t0, 64($sp)
  sll $t2, $t0, 2
  la $t0, _k
  addu $t3, $t0, $t2
  lw $t0, ($t3)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  sll $t1, $t0, 2
  la $t0, 80($sp)
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  addu $t1, $t2, $t0
  sw $t1, 72($sp)
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep0
  move $s0, $v0
  lw $t0, 32($sp)
  lw $t1, 36($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _maj
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 76($sp)
  lw $t0, 56($sp)
  sw $t0, 60($sp)
  lw $t0, 52($sp)
  sw $t0, 56($sp)
  lw $t0, 48($sp)
  sw $t0, 52($sp)
  lw $t0, 44($sp)
  lw $t1, 72($sp)
  addu $t2, $t0, $t1
  sw $t2, 48($sp)
  lw $t0, 40($sp)
  sw $t0, 44($sp)
  lw $t0, 36($sp)
  sw $t0, 40($sp)
  lw $t0, 32($sp)
  sw $t0, 36($sp)
  lw $t0, 72($sp)
  lw $t1, 76($sp)
  addu $t2, $t0, $t1
  sw $t2, 32($sp)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  j _L10
_L11:
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 32($sp)
  addu $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 36($sp)
  addu $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 40($sp)
  addu $t2, $t0, $t1
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 44($sp)
  addu $t2, $t0, $t1
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 48($sp)
  addu $t2, $t0, $t1
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 52($sp)
  addu $t2, $t0, $t1
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 56($sp)
  addu $t2, $t0, $t1
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 60($sp)
  addu $t2, $t0, $t1
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)

__leave_sha256_transform:
  lw $a2, 344($sp)
  lw $a1, 340($sp)
  lw $a0, 336($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 336($sp)
  jr $ra

_sha256_init:

  # |--------------------------------|
  # |       <count is in $a1>        |
  # |--------------------------------| sp+4
  # |       <state is in $a0>        |
  # |--------------------------------| sp+0  <-- start of caller's stack

  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 0
  li $t1, 1
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 0
  li $t1, 2
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1779033703
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1150833019
  li $t1, 1
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1013904242
  li $t1, 2
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1521486534
  li $t1, 3
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1359893119
  li $t1, 4
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1694144372
  li $t1, 5
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 528734635
  li $t1, 6
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1541459225
  li $t1, 7
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_sha256_init:
  jr $ra

_sha256_update:

  # |--------------------------------|
  # |            datalen             |
  # |--------------------------------| sp+48
  # |        <data is in $a3>        |
  # |--------------------------------| sp+44
  # |       <count is in $a2>        |
  # |--------------------------------| sp+40
  # |             block              |
  # |--------------------------------| sp+36
  # |             state              |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  li $t0, 0
  sw $t0, 24($sp)
_L12:
  lw $t0, 24($sp)
  lw $t1, 48($sp)
  slt $t2, $t0, $t1
  beq $t2, $zero, _L15
  lw $t0, 24($sp)
  move $t1, $a3
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a2
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  lw $t2, 36($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 64
  seq $t2, $t0, $t1
  beq $t2, $zero, _L14
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L13
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
_L13:
  lw $t0, 32($sp)
  lw $t1, 36($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a2
  addu $t3, $t1, $t2
  sw $t0, ($t3)
_L14:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L12
_L15:

__leave_sha256_update:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 16($sp)
  la $sp, 32($sp)
  jr $ra

_sha256_final:

  # |--------------------------------|
  # |       <count is in $a3>        |
  # |--------------------------------| sp+52
  # |             block              |
  # |--------------------------------| sp+48
  # |             state              |
  # |--------------------------------| sp+44
  # |              hash              |
  # |--------------------------------| sp+40  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+36
  # |               l                |
  # |--------------------------------| sp+32
  # |               h                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)
  sw $a1, 44($sp)
  sw $a2, 48($sp)

  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 24($sp)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 56
  slt $t2, $t0, $t1
  beq $t2, $zero, _L18
  li $t0, 128
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
_L16:
  lw $t0, 24($sp)
  li $t1, 56
  slt $t2, $t0, $t1
  beq $t2, $zero, _L17
  li $t0, 0
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L16
_L17:
  j _L21
_L18:
  li $t0, 128
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
_L19:
  lw $t0, 24($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L20
  li $t0, 0
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L19
_L20:
  lw $t0, 44($sp)
  lw $t1, 48($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  lw $t0, 48($sp)
  li $t1, 0
  li $t2, 56
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _memset
_L21:
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 9
  sllv $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  li $t1, 23
  srlv $t3, $t0, $t1
  or $t0, $t2, $t3
  sw $t0, 28($sp)
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 9
  sllv $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  li $t1, 3
  sllv $t3, $t0, $t1
  or $t0, $t2, $t3
  sw $t0, 32($sp)
  lw $t0, 32($sp)
  li $t1, 63
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 32($sp)
  li $t1, 8
  srlv $t2, $t0, $t1
  li $t0, 62
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 32($sp)
  li $t1, 16
  srlv $t2, $t0, $t1
  li $t0, 61
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 32($sp)
  li $t1, 24
  srlv $t2, $t0, $t1
  li $t0, 60
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 59
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 28($sp)
  li $t1, 8
  srlv $t2, $t0, $t1
  li $t0, 58
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 16
  srlv $t2, $t0, $t1
  li $t0, 57
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 24
  srlv $t2, $t0, $t1
  li $t0, 56
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 44($sp)
  lw $t1, 48($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  li $t0, 0
  sw $t0, 24($sp)
_L22:
  lw $t0, 24($sp)
  li $t1, 4
  slt $t2, $t0, $t1
  beq $t2, $zero, _L23
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  lw $t1, 40($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 4
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 8
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 12
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 16
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 20
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 24
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 28
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L22
_L23:

__leave_sha256_final:
  lw $a2, 48($sp)
  lw $a1, 44($sp)
  lw $a0, 40($sp)
  lw $ra, 16($sp)
  la $sp, 40($sp)
  jr $ra

_sha256_from_str:

  # |--------------------------------|
  # |      <saved value of $a3>      |
  # |--------------------------------| sp+260
  # |      <saved value of $a2>      |
  # |--------------------------------| sp+256
  # |      <saved value of $a1>      |
  # |--------------------------------| sp+252
  # |             string             |
  # |--------------------------------| sp+248  <-- start of caller's stack
  # |              hash              |
  # |--------------------------------| sp+216
  # |             output             |
  # |--------------------------------| sp+148
  # |             block              |
  # |--------------------------------| sp+84
  # |             count              |
  # |--------------------------------| sp+72
  # |             state              |
  # |--------------------------------| sp+40
  # |              $ra               |
  # |--------------------------------| sp+36
  # |              $s3               |
  # |--------------------------------| sp+32
  # |              $s2               |
  # |--------------------------------| sp+28
  # |              $s1               |
  # |--------------------------------| sp+24
  # |              $s0               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -248($sp)
  sw $s0, 20($sp)
  sw $s1, 24($sp)
  sw $s2, 28($sp)
  sw $s3, 32($sp)
  sw $ra, 36($sp)
  sw $a0, 248($sp)
  sw $a1, 252($sp)
  sw $a2, 256($sp)
  sw $a3, 260($sp)

  la $t0, 40($sp)
  la $t1, 72($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_init
  la $s0, 40($sp)
  la $s1, 84($sp)
  la $s2, 72($sp)
  lw $s3, 248($sp)
  lw $t0, 248($sp)
  move $a0, $t0
  jal _strlen
  move $t0, $v0
  sw $t0, 16($sp)
  move $a3, $s3
  move $a2, $s2
  move $a1, $s1
  move $a0, $s0
  jal _sha256_update
  la $t0, 216($sp)
  la $t1, 40($sp)
  la $t2, 84($sp)
  la $t3, 72($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _sha256_final
  la $t0, 148($sp)
  la $t1, 216($sp)
  move $a1, $t1
  move $a0, $t0
  jal _get_hex_str
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 248($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, 148($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string

__leave_sha256_from_str:
  lw $a3, 260($sp)
  lw $a2, 256($sp)
  lw $a1, 252($sp)
  lw $a0, 248($sp)
  lw $ra, 36($sp)
  lw $s3, 32($sp)
  lw $s2, 28($sp)
  lw $s1, 24($sp)
  lw $s0, 20($sp)
  la $sp, 248($sp)
  jr $ra

_phase_simple_strings:

  # |--------------------------------|
  # |      <saved value of $a0>      |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str4
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str5
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str6
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str7
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str8
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str9
  move $a0, $t0
  jal _sha256_from_str

__leave_phase_simple_strings:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)

  jal _init_k
  jal _phase_simple_strings

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jal __exit

__print_string:
  li $v0, 4
  syscall
  jr $ra

__print_int:
  li $v0, 1
  syscall
  jr $ra

__print_char:
  li $v0, 11
  syscall
  jr $ra

__print_hex:
  li $v0, 34
  syscall
  jr $ra

__exit:
  li $v0, 10
  syscall
  jr $ra
