%macro @test_gte_?_? 2
  cmp %1, %2 
  setge cl
%endmacro

%macro @test_gte_r?_r? 2
  @#assert_numeric_diff %1, %2
  @test_gte_?_? R%1, R%2
%endmacro

%macro @test_gte_r?_int? 2
  consume_int C, %2
  @test_gte_?_? R%1, C64
%endmacro

%macro @test_gte_r?_uint? 2
  consume_uint C, %2
  @test_gte_?_? R%1, C64
%endmacro

%define @test_gte_r?_const?(a, b) @test_gte_?_? R%+a, b
