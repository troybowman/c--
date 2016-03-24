#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
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
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_PRINTF
# child PRINTF_TREE for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_SHL
# child LHS for node 6
# node 7: type: TNT_INTCON val: 1
# child RHS for node 6
# node 8: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 3
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 1
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_PRINTF
# child PRINTF_TREE for node 14
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_SHL
# child LHS for node 18
# node 19: type: TNT_INTCON val: 1
# child RHS for node 18
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 15
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 13
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_PRINTF
# child PRINTF_TREE for node 26
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 28
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_SHL
# child LHS for node 30
# node 31: type: TNT_INTCON val: 1
# child RHS for node 30
# node 32: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 27
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 25
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_PRINTF
# child PRINTF_TREE for node 38
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_SHL
# child LHS for node 42
# node 43: type: TNT_INTCON val: 1
# child RHS for node 42
# node 44: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 39
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 46
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 37
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_PRINTF
# child PRINTF_TREE for node 50
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_SHL
# child LHS for node 54
# node 55: type: TNT_INTCON val: 1
# child RHS for node 54
# node 56: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 51
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 49
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_PRINTF
# child PRINTF_TREE for node 62
# node 63: type: TNT_STMT
# child SEQ_CUR for node 63
# node 64: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 64
# node 65: type: TNT_ARG
# child SEQ_CUR for node 65
# node 66: type: TNT_SHR
# child LHS for node 66
# node 67: type: TNT_INTCON val: 8
# child RHS for node 66
# node 68: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 63
# node 69: type: TNT_STMT
# child SEQ_CUR for node 69
# node 70: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 70
# node 71: type: TNT_ARG
# child SEQ_CUR for node 71
# node 72: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 61
# node 73: type: TNT_STMT
# child SEQ_CUR for node 73
# node 74: type: TNT_PRINTF
# child PRINTF_TREE for node 74
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 76
# node 77: type: TNT_ARG
# child SEQ_CUR for node 77
# node 78: type: TNT_SHR
# child LHS for node 78
# node 79: type: TNT_INTCON val: 8
# child RHS for node 78
# node 80: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 75
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 82
# node 83: type: TNT_ARG
# child SEQ_CUR for node 83
# node 84: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 73
# node 85: type: TNT_STMT
# child SEQ_CUR for node 85
# node 86: type: TNT_PRINTF
# child PRINTF_TREE for node 86
# node 87: type: TNT_STMT
# child SEQ_CUR for node 87
# node 88: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 88
# node 89: type: TNT_ARG
# child SEQ_CUR for node 89
# node 90: type: TNT_SHR
# child LHS for node 90
# node 91: type: TNT_INTCON val: 8
# child RHS for node 90
# node 92: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 87
# node 93: type: TNT_STMT
# child SEQ_CUR for node 93
# node 94: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 94
# node 95: type: TNT_ARG
# child SEQ_CUR for node 95
# node 96: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 85
# node 97: type: TNT_STMT
# child SEQ_CUR for node 97
# node 98: type: TNT_PRINTF
# child PRINTF_TREE for node 98
# node 99: type: TNT_STMT
# child SEQ_CUR for node 99
# node 100: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 100
# node 101: type: TNT_ARG
# child SEQ_CUR for node 101
# node 102: type: TNT_SHR
# child LHS for node 102
# node 103: type: TNT_INTCON val: 8
# child RHS for node 102
# node 104: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 99
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 106
# node 107: type: TNT_ARG
# child SEQ_CUR for node 107
# node 108: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 97
# node 109: type: TNT_STMT
# child SEQ_CUR for node 109
# node 110: type: TNT_PRINTF
# child PRINTF_TREE for node 110
# node 111: type: TNT_STMT
# child SEQ_CUR for node 111
# node 112: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 112
# node 113: type: TNT_ARG
# child SEQ_CUR for node 113
# node 114: type: TNT_SHR
# child LHS for node 114
# node 115: type: TNT_INTCON val: 8
# child RHS for node 114
# node 116: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 111
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 118
# node 119: type: TNT_ARG
# child SEQ_CUR for node 119
# node 120: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 109
# node 121: type: TNT_STMT
# child SEQ_CUR for node 121
# node 122: type: TNT_PRINTF
# child PRINTF_TREE for node 122
# node 123: type: TNT_STMT
# child SEQ_CUR for node 123
# node 124: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 124
# node 125: type: TNT_ARG
# child SEQ_CUR for node 125
# node 126: type: TNT_BAND
# child LHS for node 126
# node 127: type: TNT_INTCON val: 1
# child RHS for node 126
# node 128: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 123
# node 129: type: TNT_STMT
# child SEQ_CUR for node 129
# node 130: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 130
# node 131: type: TNT_ARG
# child SEQ_CUR for node 131
# node 132: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 121
# node 133: type: TNT_STMT
# child SEQ_CUR for node 133
# node 134: type: TNT_PRINTF
# child PRINTF_TREE for node 134
# node 135: type: TNT_STMT
# child SEQ_CUR for node 135
# node 136: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 136
# node 137: type: TNT_ARG
# child SEQ_CUR for node 137
# node 138: type: TNT_BAND
# child LHS for node 138
# node 139: type: TNT_INTCON val: 1
# child RHS for node 138
# node 140: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 135
# node 141: type: TNT_STMT
# child SEQ_CUR for node 141
# node 142: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 142
# node 143: type: TNT_ARG
# child SEQ_CUR for node 143
# node 144: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 133
# node 145: type: TNT_STMT
# child SEQ_CUR for node 145
# node 146: type: TNT_PRINTF
# child PRINTF_TREE for node 146
# node 147: type: TNT_STMT
# child SEQ_CUR for node 147
# node 148: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 148
# node 149: type: TNT_ARG
# child SEQ_CUR for node 149
# node 150: type: TNT_BAND
# child LHS for node 150
# node 151: type: TNT_INTCON val: 1
# child RHS for node 150
# node 152: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 147
# node 153: type: TNT_STMT
# child SEQ_CUR for node 153
# node 154: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 154
# node 155: type: TNT_ARG
# child SEQ_CUR for node 155
# node 156: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 145
# node 157: type: TNT_STMT
# child SEQ_CUR for node 157
# node 158: type: TNT_PRINTF
# child PRINTF_TREE for node 158
# node 159: type: TNT_STMT
# child SEQ_CUR for node 159
# node 160: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 160
# node 161: type: TNT_ARG
# child SEQ_CUR for node 161
# node 162: type: TNT_BAND
# child LHS for node 162
# node 163: type: TNT_INTCON val: 1
# child RHS for node 162
# node 164: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 159
# node 165: type: TNT_STMT
# child SEQ_CUR for node 165
# node 166: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 166
# node 167: type: TNT_ARG
# child SEQ_CUR for node 167
# node 168: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 157
# node 169: type: TNT_STMT
# child SEQ_CUR for node 169
# node 170: type: TNT_PRINTF
# child PRINTF_TREE for node 170
# node 171: type: TNT_STMT
# child SEQ_CUR for node 171
# node 172: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 172
# node 173: type: TNT_ARG
# child SEQ_CUR for node 173
# node 174: type: TNT_BAND
# child LHS for node 174
# node 175: type: TNT_INTCON val: 1
# child RHS for node 174
# node 176: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 171
# node 177: type: TNT_STMT
# child SEQ_CUR for node 177
# node 178: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 178
# node 179: type: TNT_ARG
# child SEQ_CUR for node 179
# node 180: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 169
# node 181: type: TNT_STMT
# child SEQ_CUR for node 181
# node 182: type: TNT_PRINTF
# child PRINTF_TREE for node 182
# node 183: type: TNT_STMT
# child SEQ_CUR for node 183
# node 184: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 184
# node 185: type: TNT_ARG
# child SEQ_CUR for node 185
# node 186: type: TNT_BOR
# child LHS for node 186
# node 187: type: TNT_INTCON val: 1
# child RHS for node 186
# node 188: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 183
# node 189: type: TNT_STMT
# child SEQ_CUR for node 189
# node 190: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 190
# node 191: type: TNT_ARG
# child SEQ_CUR for node 191
# node 192: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 181
# node 193: type: TNT_STMT
# child SEQ_CUR for node 193
# node 194: type: TNT_PRINTF
# child PRINTF_TREE for node 194
# node 195: type: TNT_STMT
# child SEQ_CUR for node 195
# node 196: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 196
# node 197: type: TNT_ARG
# child SEQ_CUR for node 197
# node 198: type: TNT_BOR
# child LHS for node 198
# node 199: type: TNT_INTCON val: 1
# child RHS for node 198
# node 200: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 195
# node 201: type: TNT_STMT
# child SEQ_CUR for node 201
# node 202: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 202
# node 203: type: TNT_ARG
# child SEQ_CUR for node 203
# node 204: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 193
# node 205: type: TNT_STMT
# child SEQ_CUR for node 205
# node 206: type: TNT_PRINTF
# child PRINTF_TREE for node 206
# node 207: type: TNT_STMT
# child SEQ_CUR for node 207
# node 208: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 208
# node 209: type: TNT_ARG
# child SEQ_CUR for node 209
# node 210: type: TNT_BOR
# child LHS for node 210
# node 211: type: TNT_INTCON val: 1
# child RHS for node 210
# node 212: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 207
# node 213: type: TNT_STMT
# child SEQ_CUR for node 213
# node 214: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 214
# node 215: type: TNT_ARG
# child SEQ_CUR for node 215
# node 216: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 205
# node 217: type: TNT_STMT
# child SEQ_CUR for node 217
# node 218: type: TNT_PRINTF
# child PRINTF_TREE for node 218
# node 219: type: TNT_STMT
# child SEQ_CUR for node 219
# node 220: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 220
# node 221: type: TNT_ARG
# child SEQ_CUR for node 221
# node 222: type: TNT_BOR
# child LHS for node 222
# node 223: type: TNT_INTCON val: 1
# child RHS for node 222
# node 224: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 219
# node 225: type: TNT_STMT
# child SEQ_CUR for node 225
# node 226: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 226
# node 227: type: TNT_ARG
# child SEQ_CUR for node 227
# node 228: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 217
# node 229: type: TNT_STMT
# child SEQ_CUR for node 229
# node 230: type: TNT_PRINTF
# child PRINTF_TREE for node 230
# node 231: type: TNT_STMT
# child SEQ_CUR for node 231
# node 232: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 232
# node 233: type: TNT_ARG
# child SEQ_CUR for node 233
# node 234: type: TNT_BOR
# child LHS for node 234
# node 235: type: TNT_INTCON val: 1
# child RHS for node 234
# node 236: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 231
# node 237: type: TNT_STMT
# child SEQ_CUR for node 237
# node 238: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 238
# node 239: type: TNT_ARG
# child SEQ_CUR for node 239
# node 240: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 229
# node 241: type: TNT_STMT
# child SEQ_CUR for node 241
# node 242: type: TNT_PRINTF
# child PRINTF_TREE for node 242
# node 243: type: TNT_STMT
# child SEQ_CUR for node 243
# node 244: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 244
# node 245: type: TNT_ARG
# child SEQ_CUR for node 245
# node 246: type: TNT_XOR
# child LHS for node 246
# node 247: type: TNT_INTCON val: 0
# child RHS for node 246
# node 248: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 243
# node 249: type: TNT_STMT
# child SEQ_CUR for node 249
# node 250: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 250
# node 251: type: TNT_ARG
# child SEQ_CUR for node 251
# node 252: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 241
# node 253: type: TNT_STMT
# child SEQ_CUR for node 253
# node 254: type: TNT_PRINTF
# child PRINTF_TREE for node 254
# node 255: type: TNT_STMT
# child SEQ_CUR for node 255
# node 256: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 256
# node 257: type: TNT_ARG
# child SEQ_CUR for node 257
# node 258: type: TNT_XOR
# child LHS for node 258
# node 259: type: TNT_INTCON val: 1
# child RHS for node 258
# node 260: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 255
# node 261: type: TNT_STMT
# child SEQ_CUR for node 261
# node 262: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 262
# node 263: type: TNT_ARG
# child SEQ_CUR for node 263
# node 264: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 253
# node 265: type: TNT_STMT
# child SEQ_CUR for node 265
# node 266: type: TNT_PRINTF
# child PRINTF_TREE for node 266
# node 267: type: TNT_STMT
# child SEQ_CUR for node 267
# node 268: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 268
# node 269: type: TNT_ARG
# child SEQ_CUR for node 269
# node 270: type: TNT_XOR
# child LHS for node 270
# node 271: type: TNT_INTCON val: 2
# child RHS for node 270
# node 272: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 267
# node 273: type: TNT_STMT
# child SEQ_CUR for node 273
# node 274: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 274
# node 275: type: TNT_ARG
# child SEQ_CUR for node 275
# node 276: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 265
# node 277: type: TNT_STMT
# child SEQ_CUR for node 277
# node 278: type: TNT_PRINTF
# child PRINTF_TREE for node 278
# node 279: type: TNT_STMT
# child SEQ_CUR for node 279
# node 280: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 280
# node 281: type: TNT_ARG
# child SEQ_CUR for node 281
# node 282: type: TNT_XOR
# child LHS for node 282
# node 283: type: TNT_INTCON val: 3
# child RHS for node 282
# node 284: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 279
# node 285: type: TNT_STMT
# child SEQ_CUR for node 285
# node 286: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 286
# node 287: type: TNT_ARG
# child SEQ_CUR for node 287
# node 288: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 277
# node 289: type: TNT_STMT
# child SEQ_CUR for node 289
# node 290: type: TNT_PRINTF
# child PRINTF_TREE for node 290
# node 291: type: TNT_STMT
# child SEQ_CUR for node 291
# node 292: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 292
# node 293: type: TNT_ARG
# child SEQ_CUR for node 293
# node 294: type: TNT_XOR
# child LHS for node 294
# node 295: type: TNT_INTCON val: 4
# child RHS for node 294
# node 296: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 291
# node 297: type: TNT_STMT
# child SEQ_CUR for node 297
# node 298: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 298
# node 299: type: TNT_ARG
# child SEQ_CUR for node 299
# node 300: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 289
# node 301: type: TNT_STMT
# child SEQ_CUR for node 301
# node 302: type: TNT_PRINTF
# child PRINTF_TREE for node 302
# node 303: type: TNT_STMT
# child SEQ_CUR for node 303
# node 304: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 304
# node 305: type: TNT_ARG
# child SEQ_CUR for node 305
# node 306: type: TNT_BNOT
# child RHS for node 306
# node 307: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 303
# node 308: type: TNT_STMT
# child SEQ_CUR for node 308
# node 309: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 309
# node 310: type: TNT_ARG
# child SEQ_CUR for node 310
# node 311: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 301
# node 312: type: TNT_STMT
# child SEQ_CUR for node 312
# node 313: type: TNT_PRINTF
# child PRINTF_TREE for node 313
# node 314: type: TNT_STMT
# child SEQ_CUR for node 314
# node 315: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 315
# node 316: type: TNT_ARG
# child SEQ_CUR for node 316
# node 317: type: TNT_BNOT
# child RHS for node 317
# node 318: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 314
# node 319: type: TNT_STMT
# child SEQ_CUR for node 319
# node 320: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 320
# node 321: type: TNT_ARG
# child SEQ_CUR for node 321
# node 322: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 312
# node 323: type: TNT_STMT
# child SEQ_CUR for node 323
# node 324: type: TNT_PRINTF
# child PRINTF_TREE for node 324
# node 325: type: TNT_STMT
# child SEQ_CUR for node 325
# node 326: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 326
# node 327: type: TNT_ARG
# child SEQ_CUR for node 327
# node 328: type: TNT_BNOT
# child RHS for node 328
# node 329: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 325
# node 330: type: TNT_STMT
# child SEQ_CUR for node 330
# node 331: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 331
# node 332: type: TNT_ARG
# child SEQ_CUR for node 332
# node 333: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 323
# node 334: type: TNT_STMT
# child SEQ_CUR for node 334
# node 335: type: TNT_PRINTF
# child PRINTF_TREE for node 335
# node 336: type: TNT_STMT
# child SEQ_CUR for node 336
# node 337: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 337
# node 338: type: TNT_ARG
# child SEQ_CUR for node 338
# node 339: type: TNT_BNOT
# child RHS for node 339
# node 340: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 336
# node 341: type: TNT_STMT
# child SEQ_CUR for node 341
# node 342: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 342
# node 343: type: TNT_ARG
# child SEQ_CUR for node 343
# node 344: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 334
# node 345: type: TNT_STMT
# child SEQ_CUR for node 345
# node 346: type: TNT_PRINTF
# child PRINTF_TREE for node 346
# node 347: type: TNT_STMT
# child SEQ_CUR for node 347
# node 348: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 348
# node 349: type: TNT_ARG
# child SEQ_CUR for node 349
# node 350: type: TNT_BNOT
# child RHS for node 350
# node 351: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 347
# node 352: type: TNT_STMT
# child SEQ_CUR for node 352
# node 353: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 353
# node 354: type: TNT_ARG
# child SEQ_CUR for node 354
# node 355: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
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
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
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

.data

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

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

  li $t0, 1
  li $t1, 0
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 0
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 1
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 2
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 3
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 4
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  li $t1, 0
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 2
  li $t1, 1
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 3
  li $t1, 2
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  li $t1, 3
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 2
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 3
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 24($sp)
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
