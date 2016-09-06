%macro @fill_ops 0
  @expand_r? @op_fill_r?_by_0
  @op_fill_cx_by_0
  @expand_r?_imm? @op_fill_r?_by_imm?
  @expand_r? @op_fill_r?_by_counter
  @expand_r? @op_fill_counter_by_r?
  @expand_imm? @op_fill_counter_by_imm?
  @expand_list @op_fill_r_x?_by_0, 3, 4, 5, 6, 7, 8
  @expand_list {@op_fill_r?_by_r? 0,}, 1, 2, 3, 4, 5, 6, 7
  @expand_list {@op_fill_r?_by_r? 1,}, 0, 2, 3, 4, 5, 6, 7
  @expand_list {@op_fill_r?_by_r? 2,}, 0, 1, 3, 4, 5, 6, 7
  @expand_list {@op_fill_r?_by_r? 3,}, 0, 1, 2, 4, 5, 6, 7
  @expand_list {@op_fill_r?_by_r? 4,}, 0, 1, 2, 3, 5, 6, 7
  @expand_list {@op_fill_r?_by_r? 5,}, 0, 1, 2, 3, 4, 6, 7
  @expand_list {@op_fill_r?_by_r? 6,}, 0, 1, 2, 3, 4, 5, 7
  @expand_list {@op_fill_r?_by_r? 7,}, 0, 1, 2, 3, 4, 5, 6
%endmacro

%macro @op_fill_r?_by_0 1
  @gen_op fill_r%1_by_0, {xor R%1, R%1}
%endmacro

%macro @op_fill_cx_by_0 0
  @gen_op fill_cx_by_0, {xor CX, CX}
%endmacro

%macro @op_fill_r?_by_imm? 2
  @gen_op fill_r%1_by_imm%2, {consume_imm%2 R%1}
%endmacro

%macro @op_fill_r?_by_counter 1
  @gen_op fill_r%1_by_counter, {mov R%1, CX}
%endmacro

%macro @op_fill_counter_by_r? 1
  @gen_op fill_counter_by_r%1, {mov CX, R%1}
%endmacro

%macro @op_fill_counter_by_imm? 1
  @@op_fill_counter_by_imm%1:
    consume_imm%1 CX
    @next_op
%endmacro

%macro @fill_r_x?_by_0 1
  %assign i 7

  %rep %1
    xor R%+i, R%+i

    %assign i i-1
  %endrep
%endmacro

%macro @op_fill_r_x?_by_0 1
  @gen_op fill_r_x%1_by_0, {@fill_r_x?_by_0 %1}
%endmacro

%macro @op_fill_r?_by_r? 2
  @gen_op fill_r%1_by_r%2, {mov R%1, R%2}
%endmacro

%macro @op_fill_r0_by_r? 1
  @gen_op fill_r0_by_r%1, {mov R0, R%1}
%endmacro
