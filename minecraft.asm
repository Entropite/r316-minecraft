%include "common"

%define return_reg r31
%define stack_pointer r30
%define base_pointer r29
%define term_reg r28
%define return_addr_reg r27

; Initialization and defining basic macros
%define term_base 0x9F80
%define term_height 29
%define term_width 29
 
%eval term_input  term_base 0x00 +
%eval term_raw    term_base 0x04 +
%eval term_single term_base 0x05 +
%eval term_print  term_base 0x25 +
%eval term_term   term_base 0x26 +
%eval term_hrange term_base 0x42 +
%eval term_vrange term_base 0x43 +
%eval term_cursor term_base 0x44 +
%eval term_nlchar term_base 0x45 +
%eval term_colour term_base 0x46 +
%eval term_print_e term_base 0x40 +
%eval term_print_o term_base 0x41 +
%eval term_plot    term_base 0x60 +


%macro push thing
    subs stack_pointer, 1
    st thing, stack_pointer
%endmacro

%macro pop thing
    ld thing, stack_pointer
    adds stack_pointer, 1
%endmacro

%macro call thing
    push return_addr_reg
    jmp return_addr_reg, thing
%endmacro

%macro ret
    mov r26, return_addr_reg
    pop return_addr_reg
    jmp r26
%endmacro

%macro mull x, y
    mul x, x, y
%endmacro

jmp init
global_data_section:
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43690, 43690, 43690, 43690, 43690, 43690, 43690, 43690, 43682, 8738, 8738, 8874, 41506, 17476, 17476, 16938, 8772, 17476, 17476, 17442, 17476, 17476, 17476, 17476, 17476, 17476, 29764, 17524, 17476, 17476, 29764, 17527, 17527, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 29764, 17476, 30532, 17476, 29764, 17476, 18292, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 17476, 30583, 30856, 34679, 30839, 30583, 34935, 34680, 34935, 34696, 34679, 2184, 2184, 34824, 30584, 2184, 34680, 30600, 30600, 34679, 34680, 30600, 30600, 30583, 30592, 30600, 34952, 34679, 30600, 30856, 30600, 34952, 34935, 30855, 30599, 30600, 2167, 34935, 30839, 30600, 34679, 34679, 34935, 30600, 34952, 34952, 34935, 30856, 30856, 30600, 34952, 34935, 30856, 30599, 30592, 34679, 30592, 30599, 30600, 34935, 30848, 30600, 8, 30600, 136, 1092, 1092, 17476, 17476, 1088, 1092, 16452, 17476, 1088, 17412, 16452, 17476, 16448, 17412, 16452, 17476, 16452, 17476, 16452, 17476, 17476, 17476, 16452, 1028, 17476, 17472, 16452, 1028, 17412, 17476, 16452, 17412, 17412, 17472, 16448, 17412, 17476, 17476, 16452, 17476, 1028, 17412, 1092, 17476, 1028, 17476, 1088, 17476, 1028, 17412, 1088, 17476, 1092, 17476, 17472, 17476, 1092, 17472, 17472, 17476, 17472, 17472, 17472, 17476, 10530, 35225, 10649, 39058, 10530, 39065, 10386, 10386, 39209, 33321, 8738, 10530, 8857, 37417, 8738, 10530, 8745, 37417, 8857, 10530, 8745, 33321, 8856, 10642, 37528, 39202, 39202, 35202, 10642, 38946, 37410, 39202, 8738, 8738, 39209, 37417, 8850, 10537, 35225, 39209, 10648, 39049, 8857, 35225, 10530, 39321, 37410, 10626, 10530, 37417, 35202, 39202, 10530, 37513, 35225, 37417, 10648, 8857, 37410, 37528, 8745, 37528, 10537, 39202, 3822, 57412, 17422, 61152, 3822, 60928, 238, 61152, 3822, 61152, 3822, 61152, 1638, 26208, 1640, 34912, 3822, 61152, 3816, 59616, 3816, 61152, 3816, 35040, 3816, 61152, 3823, 65504, 1640, 26208, 1647, 65376, 3816, 65248, 3822, 65504, 3839, 65248, 3822, 65504, 3822, 65248, 3822, 65504, 1638, 26208, 1638, 28512, 3822, 61152, 3822, 61408, 3822, 61152, 3822, 61152, 3822, 61152, 3822, 61152, 1638, 26208, 1638, 26208, 0, 0, 0, 0, 1632, 26214, 26214, 1632, 1542, 26214, 26214, 24672, 96, 0, 0, 1536, 1632, 26118, 24678, 1632, 1632, 26118, 24678, 1632, 1632, 0, 0, 1632, 1632, 26118, 24678, 1632, 1632, 26118, 24678, 1632, 1632, 0, 0, 1632, 1632, 26118, 24678, 1632, 1632, 26118, 24678, 1632, 96, 0, 0, 1536, 1542, 26214, 26214, 24672, 1632, 26214, 26214, 1632, 0, 0, 0, 0, 26214, 26214, 26214, 26216, 26214, 26214, 26214, 26214, 26214, 26214, 26214, 26216, 34952, 34952, 34952, 34952, 26214, 26216, 26214, 26214, 26214, 26216, 26214, 26214, 26214, 26216, 26214, 26214, 34952, 34952, 34952, 34952, 26214, 26214, 26214, 26216, 26214, 26214, 26214, 26216, 26214, 26214, 26214, 26216, 34952, 34952, 34952, 34952, 26214, 26216, 26216, 26214, 26214, 26216, 26214, 26214, 26214, 26214, 26214, 26214, 34952, 34952, 34952, 34952, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30856, 34679, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30600, 34935, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30584, 34951, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30576, 119, 30583, 30583, 30576, 7, 30464, 30583, 30576, 0, 30464, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 119, 30583, 30583, 30576, 7, 30583, 30583, 30583, 30583, 30583, 30576, 1911, 30576, 1911, 30576, 30583, 0, 119, 30576, 30583, 28679, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30582, 26231, 30583, 30583, 30582, 26215, 30566, 30583, 30582, 26214, 30566, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 26231, 30583, 30583, 30582, 26215, 30583, 30583, 30583, 30583, 30583, 30582, 26487, 30582, 26487, 30582, 30583, 26214, 26231, 30582, 30583, 30311, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 30583, 34952, 34952, 34952, 34952, 34679, 30839, 30584, 34680, 34679, 34935, 30600, 34936, 34936, 34936, 30855, 30600, 34951, 30599, 34935, 30584, 34935, 30600, 34935, 30600, 34951, 30584, 34951, 30856, 34952, 30600, 30584, 34952, 34935, 34951, 30583, 34952, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 32768, 8, 34952, 34952, 0, 0, 34952, 34952, 0, 0, 2184, 34944, 0, 0, 2184, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34952, 34679, 30583, 30583, 30584, 34679, 30583, 30583, 30584, 34679, 30720, 135, 30584, 34672, 0, 0, 1912, 34672, 0, 0, 1912, 34672, 0, 0, 1912, 34952, 34952, 34952, 34952, 0, 0, 0, 0, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 0, 0, 0, 0, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 0, 0, 0, 0, 0, 0, 0, 0, 1638, 26214, 26214, 26208, 1638, 26216, 34406, 26208, 1638, 26247, 30822, 26208, 1638, 26247, 30822, 26208, 0, 135, 34816, 0, 1638, 26247, 34918, 26208, 1638, 26216, 34406, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 1638, 26214, 26214, 26208, 0, 0, 0, 0, 26214, 26214, 26214, 26214, 24576, 238, 0, 6, 27840, 4590, 14, 57350, 26483, 4590, 52238, 58166, 27843, 4471, 52238, 59254, 27843, 4471, 3278, 58166, 27843, 4590, 3278, 58166, 26214, 26214, 26214, 26214, 26214, 26214, 26214, 26214, 24576, 0, 0, 4358, 24580, 52224, 3808, 4358, 25668, 52224, 10108, 4406, 25668, 52240, 10108, 4406, 25668, 52242, 3820, 4406, 25668, 52242, 3820, 4406, 26214, 26214, 26214, 26214, 65535, 65535, 65535, 65535, 63897, 39323, 39321, 39327, 63903, 39353, 39321, 39327, 63993, 39321, 39321, 39359, 65433, 39321, 40857, 39839, 63897, 39321, 63897, 47519, 63897, 39327, 39321, 39327, 63929, 39353, 39321, 39327, 64409, 39321, 39321, 39327, 63897, 39321, 63897, 39327, 63897, 39327, 39321, 40863, 63897, 39353, 39321, 63903, 64409, 39321, 39327, 39327, 63897, 39321, 39321, 39327, 63897, 39321, 39321, 39327, 65535, 65535, 65535, 65535, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 65535, 65535, 65535, 65535, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 65535, 65535, 65535, 65535, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 65535, 65535, 65535, 65535, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 52428, 52431, 65535, 65535, 65535, 65535, 32767, 16384, 8192, 5461, 4096, 3277, 2731, 2341, 2048, 1820, 1638, 1489, 1365, 1260, 1170, 1092, 1024, 964, 910, 862, 819, 780, 745, 712, 683, 655, 630, 607, 585, 565, 546, 529, 512, 496, 482, 468, 455, 443, 431, 420, 410, 400, 390, 381, 372, 364, 356, 349, 341, 334, 328, 321, 315, 309, 303, 298, 293, 287, 282, 278, 273, 269, 264, 260, 256, 252, 248, 245, 241, 237, 234, 231, 228, 224, 221, 218, 216, 213, 210, 207, 205, 202, 200, 197, 195, 193, 191, 188, 186, 184, 182, 180, 178, 176, 174, 172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23, 23, 23, 24, 24, 24, 24, 24, 25, 25, 25, 25, 26, 26, 26, 26, 27, 27, 27, 27, 27, 28, 28, 28, 28, 29, 29, 29, 29, 30, 30, 30, 30, 30, 31, 31, 31, 31, 32, 32, 32, 32, 32, 33, 33, 33, 33, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 37, 37, 37, 37, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 46, 46, 46, 46, 46, 47, 47, 47, 47, 47, 47, 48, 48, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 51, 51, 51, 51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 57, 57, 57, 58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 58, 0, 0, 0, 58, 0, 27033, 39318, 4945, 4371, 61713, 63631, 61727, 4383, 39327, 4369, 63631, 4383, 63628, 43423, 61714, 8772, 27030, 39318, 27031, 4369
init:
    mov term_reg, 0x25
                              
    ld r0, term_base              
    mov r1, { term_width 1 - 5 << }
    st r1, term_hrange
    mov r1, { term_height 1 - 5 << }
    st r1, term_vrange
    mov r1, 0x1000
    st r1, term_cursor
    mov r1, 0xF
    st r1, term_colour
    mov r1, 10
    st r1,  term_nlchar

start:
    mov stack_pointer,8191
	mov r1, 0
	st r1, 2337
	mov r1, 1153
	st r1, 2338
	mov r1, 1217
	st r1, 2339
	mov r1, 1281
	st r1, 2340
	mov r1, 1345
	st r1, 2341
	mov r1, 1409
	st r1, 2342
	mov r1, 1537
	st r1, 2343
	mov r1, 1601
	st r1, 2344
	mov r1, 1665
	st r1, 2345
	mov r1, 1729
	st r1, 2346
	mov r1, 1793
	st r1, 2347
	mov r1, 1921
	st r1, 2348
	mov r1, 2049
	st r1, 2349
	mov r1, 2113
	st r1, 2350
	mov r1, 2177
	st r1, 2351
	jmp __tptcc_fn_main
__tptcc_fn_get_block:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	mov r1, 1
	ld r2, base_pointer, 2
	mull r2, 48
	add r1, r2
	ld r2, base_pointer, 3
	mull r2, 6
	add r1, r2
	ld r2, base_pointer, 4
	shr r2, 2
	ld r1, r1, r2
	ld r2, base_pointer, 4
	mov r3, 3
	and r2, r3
	mull r2, 4
	shr r1, r2
	mov r2, 15
	and r1, r2
	mov return_reg, r1
	jmp .exit_get_block
.exit_get_block:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_set_block:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	ld r1, base_pointer, 4
	mov r2, 3
	and r1, r2
	mull r1, 4
	mov r3, r1
	mov r1, 1
	ld r2, base_pointer, 2
	mull r2, 48
	add r1, r2
	ld r2, base_pointer, 3
	mull r2, 6
	add r1, r2
	ld r2, base_pointer, 4
	shr r2, 2
	add r1, r2
	mov r2, 15
	shl r2, r3
	xor r2, 65535
	ld r4, r1
	and r4, r2
	st r4, r1
	mov r1, 1
	ld r2, base_pointer, 2
	mull r2, 48
	add r1, r2
	ld r2, base_pointer, 3
	mull r2, 6
	add r1, r2
	ld r2, base_pointer, 4
	shr r2, 2
	add r1, r2
	ld r2, base_pointer, 5
	shl r2, r3
	ld r3, r1
	or r3, r2
	st r3, r1
.exit_set_block:
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_sqrt:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	mov r3, 255
	mov r4, 0
	ld r5, base_pointer, 2
	mov r1, r5
	cmp r1, 255
	jle .label_1
	jmp .label_0
	.label_1:
	mov r3, r5
	jmp .label_2
	.label_0:
	.label_2:
	.label_3:
	mov r1, r4
	cmp r1, r3
	jle .label_5
	jmp .label_4
	.label_5:
	mov r1, r4
	add r1, r3
	shr r1, 1
	mov r6, r1
	mov r1, r6
	mov r2, r6
	mull r1, r2
	mov r2, r1
	cmp r2, r5
	je .label_7
	jmp .label_6
	.label_7:
	mov r1, r6
	mov return_reg, r1
	jmp .exit_sqrt
	jmp .label_8
	.label_6:
	cmp r1, r5
	jl .label_10
	jmp .label_9
	.label_10:
	mov r1, r6
	add r1, 1
	mov r4, r1
	jmp .label_11
	.label_9:
	mov r1, r6
	sub r1, 1
	mov r3, r1
	.label_11:
	.label_8:
	jmp .label_3
	.label_4:
	mov r1, r3
	mov return_reg, r1
	jmp .exit_sqrt
.exit_sqrt:
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_plot_square:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 2
	ld r2, base_pointer, 3
	ld r3, base_pointer, 4
	shl r1, 1
	shl r2, 9
	add r1, r2
	st r1, r3, term_plot
	add r1, 1
	st r1, r3, term_plot
	add r1, 0x100
	st r1, r3, term_plot
	sub r1, 1
	st r1, r3, term_plot
	pop r3
	pop r2
	pop r1
.exit_plot_square:
	pop base_pointer
	ret
__tptcc_fn_arithmetic_right_shift:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	ld r1, base_pointer, 2
	cmp r1, 0
	jl .label_13
	jmp .label_12
	.label_13:
	ld r3, base_pointer, 2
	ld r1, base_pointer, 3
	shr r3, r1
	mov r4, 65535
	mov r1, 16
	ld r2, base_pointer, 3
	sub r1, r2
	shl r4, r1
	or r3, r4
	mov return_reg, r3
	jmp .exit_arithmetic_right_shift
	jmp .label_14
	.label_12:
	.label_14:
	ld r1, base_pointer, 2
	ld r2, base_pointer, 3
	shr r1, r2
	mov return_reg, r1
	jmp .exit_arithmetic_right_shift
.exit_arithmetic_right_shift:
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_sin:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 2
	cmp r1, 402
	jle .label_16
	jmp .label_15
	.label_16:
	mov r1, 2396
	ld r2, base_pointer, 2
	ld r1, r1, r2
	mov return_reg, r1
	jmp .exit_sin
	jmp .label_17
	.label_15:
	ld r1, base_pointer, 2
	cmp r1, 804
	jle .label_19
	jmp .label_18
	.label_19:
	mov r2, 2396
	mov r3, 804
	ld r1, base_pointer, 2
	sub r3, r1
	mov r1, r2
	ld r1, r1, r3
	mov return_reg, r1
	jmp .exit_sin
	jmp .label_20
	.label_18:
	ld r1, base_pointer, 2
	cmp r1, 1206
	jle .label_22
	jmp .label_21
	.label_22:
	mov r1, 2396
	ld r2, base_pointer, 2
	sub r2, 804
	ld r1, r1, r2
	xor r1, 65535
	add r1, 1
	mov return_reg, r1
	jmp .exit_sin
	jmp .label_23
	.label_21:
	mov r1, 2396
	mov r2, 1608
	ld r3, base_pointer, 2
	sub r2, r3
	ld r1, r1, r2
	xor r1, 65535
	add r1, 1
	mov return_reg, r1
	jmp .exit_sin
	.label_23:
	.label_20:
	.label_17:
.exit_sin:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_cos:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 2
	add r1, 402
	mulh r2, r1, 40
	mul r3, r2, 1608
	sub r3, r1, r3
	cmp r3, 1608
	ja .label_24
	add r2, 1
	sub r3, 1608
	.label_24:
	push r3
	call __tptcc_fn_sin
	add stack_pointer, 1
	mov r1, return_reg
	mov return_reg, r1
	jmp .exit_cos
.exit_cos:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_add_vector:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 2
	ld r2, base_pointer, 3
	ld r3, r1
	ld r2, r2
	add r3, r2
	st r3, r1
	ld r1, base_pointer, 2
	add r1, 1
	ld r2, base_pointer, 3
	add r2, 1
	ld r3, r1
	ld r2, r2
	add r3, r2
	st r3, r1
	ld r2, base_pointer, 2
	add r2, 2
	ld r1, base_pointer, 3
	add r1, 2
	ld r3, r2
	ld r1, r1
	add r3, r1
	st r3, r2
.exit_add_vector:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_rotate_vector:
	sub stack_pointer, 3
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	ld r1, base_pointer, 6
	ld r1, r1, 0
	ld r2, base_pointer, 6
	ld r2, r2, 1
	push r2
	call __tptcc_fn_cos
	add stack_pointer, 1
	mov r3, return_reg
	push r1
	call __tptcc_fn_cos
	add stack_pointer, 1
	mov r4, return_reg
	push r2
	call __tptcc_fn_sin
	add stack_pointer, 1
	mov r2, return_reg
	push r1
	call __tptcc_fn_sin
	add stack_pointer, 1
	mov r1, return_reg
	mov r5, 6
	push r5
	ld r5, base_pointer, 5
	ld r5, r5, 2
	mov r6, r3
	mull r5, r6
	push r5
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r5, return_reg
	mov r6, r4
	mull r5, r6
	ld r6, base_pointer, 5
	ld r6, r6, 0
	mov r7, r2
	mull r6, r7
	sub r5, r6
	mov r6, 6
	push r6
	ld r6, base_pointer, 5
	ld r6, r6, 1
	mov r7, r3
	mull r6, r7
	push r6
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r6, return_reg
	mov r7, r1
	mull r6, r7
	add r5, r6
	st r5, base_pointer, 1
	mov r5, 6
	push r5
	ld r5, base_pointer, 1
	push r5
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r5, return_reg
	st r5, base_pointer, 1
	mov r5, 6
	push r5
	ld r5, base_pointer, 5
	ld r5, r5, 2
	mov r6, r2
	mull r5, r6
	push r5
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r5, return_reg
	mov r6, r4
	mull r5, r6
	ld r6, base_pointer, 5
	ld r6, r6, 0
	mull r6, r3
	add r5, r6
	mov r3, 6
	push r3
	ld r3, base_pointer, 5
	ld r3, r3, 1
	mull r3, r2
	push r3
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r2, return_reg
	mov r3, r1
	mull r2, r3
	add r5, r2
	st r5, base_pointer, 2
	mov r2, 6
	push r2
	ld r2, base_pointer, 2
	push r2
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r2, return_reg
	st r2, base_pointer, 2
	ld r2, base_pointer, 5
	ld r2, r2, 1
	mov r3, r4
	mull r2, r3
	ld r3, base_pointer, 5
	ld r3, r3, 2
	mull r3, r1
	sub r2, r3
	st r2, base_pointer, 3
	mov r1, 6
	push r1
	ld r1, base_pointer, 3
	push r1
	call __tptcc_fn_arithmetic_right_shift
	add stack_pointer, 2
	mov r1, return_reg
	st r1, base_pointer, 3
	ld r1, base_pointer, 5
	add r1, 2
	ld r2, base_pointer, 1
	st r2, r1
	ld r1, base_pointer, 5
	ld r2, base_pointer, 2
	st r2, r1
	ld r1, base_pointer, 5
	add r1, 1
	ld r2, base_pointer, 3
	st r2, r1
.exit_rotate_vector:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 3
	ret
__tptcc_fn_get_vector_length:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	ld r1, base_pointer, 2
	ld r1, r1, 0
	shl r1, 1
	ld r2, base_pointer, 2
	ld r2, r2, 1
	shl r2, 1
	ld r3, base_pointer, 2
	ld r3, r3, 2
	shl r3, 1
	mov r4, r1
	mull r4, r1
	mov r1, r2
	mull r1, r2
	add r4, r1
	mov r2, r3
	mov r1, r3
	mull r2, r1
	add r4, r2
	push r4
	call __tptcc_fn_sqrt
	add stack_pointer, 1
	mov r1, return_reg
	mov return_reg, r1
	jmp .exit_get_vector_length
.exit_get_vector_length:
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_scale_vector:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 2
	ld r2, r1
	ld r3, base_pointer, 3
	mull r2, r3
	st r2, r1
	ld r1, base_pointer, 2
	add r1, 1
	ld r2, r1
	ld r3, base_pointer, 3
	mull r2, r3
	st r2, r1
	ld r1, base_pointer, 2
	add r1, 2
	ld r2, r1
	ld r3, base_pointer, 3
	mull r2, r3
	st r2, r1
.exit_scale_vector:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_divide_vector:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	ld r1, base_pointer, 2
	ld r1, r1, 0
	cmp r1, 0
	jl .label_26
	jmp .label_25
	.label_26:
	ld r1, base_pointer, 2
	ld r2, base_pointer, 2
	ld r2, r2, 0
	xor r2, 65535
	add r2, 1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_28:
	cmp r6, 0
	jl .label_30
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_29
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_29:
	sub r6, 1
	jmp .label_28
	.label_30:
	xor r4, 65535
	add r4, 1
	st r4, r1
	jmp .label_27
	.label_25:
	ld r1, base_pointer, 2
	ld r2, r1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_31:
	cmp r6, 0
	jl .label_33
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_32
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_32:
	sub r6, 1
	jmp .label_31
	.label_33:
	st r4, r1
	.label_27:
	ld r1, base_pointer, 2
	ld r1, r1, 1
	cmp r1, 0
	jl .label_35
	jmp .label_34
	.label_35:
	ld r1, base_pointer, 2
	add r1, 1
	ld r2, base_pointer, 2
	ld r2, r2, 1
	xor r2, 65535
	add r2, 1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_37:
	cmp r6, 0
	jl .label_39
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_38
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_38:
	sub r6, 1
	jmp .label_37
	.label_39:
	xor r4, 65535
	add r4, 1
	st r4, r1
	jmp .label_36
	.label_34:
	ld r1, base_pointer, 2
	add r1, 1
	ld r2, r1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_40:
	cmp r6, 0
	jl .label_42
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_41
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_41:
	sub r6, 1
	jmp .label_40
	.label_42:
	st r4, r1
	.label_36:
	ld r1, base_pointer, 2
	ld r1, r1, 2
	cmp r1, 0
	jl .label_44
	jmp .label_43
	.label_44:
	ld r1, base_pointer, 2
	add r1, 2
	ld r2, base_pointer, 2
	ld r2, r2, 2
	xor r2, 65535
	add r2, 1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_46:
	cmp r6, 0
	jl .label_48
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_47
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_47:
	sub r6, 1
	jmp .label_46
	.label_48:
	xor r4, 65535
	add r4, 1
	st r4, r1
	jmp .label_45
	.label_43:
	ld r1, base_pointer, 2
	add r1, 2
	ld r2, r1
	ld r3, base_pointer, 3
	mov r4, 0
	mov r5, 0
	mov r6, 15
	.label_49:
	cmp r6, 0
	jl .label_51
	shl r5, 1
	shr r7, r2, r6
	and r7, 1
	or r5, r7
	cmp r5, r3
	jl .label_50
	sub r5, r3
	mov r7, 1
	shl r7, r6
	or r4, r7
	.label_50:
	sub r6, 1
	jmp .label_49
	.label_51:
	st r4, r1
	.label_45:
.exit_divide_vector:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_get_basis_vectors:
	sub stack_pointer, 2
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	ld r1, base_pointer, 5
	mov r2, 2799
	ld r2, r2, 0
	st r2, r1
	ld r1, base_pointer, 5
	add r1, 1
	mov r2, 2799
	ld r2, r2, 1
	st r2, r1
	ld r1, base_pointer, 5
	add r1, 2
	mov r2, 2799
	ld r2, r2, 2
	st r2, r1
	ld r1, base_pointer, 6
	mov r2, 2802
	ld r2, r2, 0
	st r2, r1
	ld r1, base_pointer, 6
	add r1, 1
	mov r2, 2802
	ld r2, r2, 1
	st r2, r1
	ld r1, base_pointer, 6
	add r1, 2
	mov r2, 2802
	ld r2, r2, 2
	st r2, r1
	ld r1, base_pointer, 4
	add r1, 3
	push r1
	ld r1, base_pointer, 5
	push r1
	call __tptcc_fn_rotate_vector
	add stack_pointer, 2
	ld r1, base_pointer, 4
	add r1, 3
	push r1
	ld r1, base_pointer, 6
	push r1
	call __tptcc_fn_rotate_vector
	add stack_pointer, 2
	ld r1, base_pointer, 5
	push r1
	call __tptcc_fn_get_vector_length
	add stack_pointer, 1
	mov r1, return_reg
	st r1, base_pointer, 1
	ld r1, base_pointer, 6
	push r1
	call __tptcc_fn_get_vector_length
	add stack_pointer, 1
	mov r1, return_reg
	st r1, base_pointer, 2
	mov r1, 1
	shl r1, 9
	sub r1, 1
	push r1
	ld r1, base_pointer, 5
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	mov r1, 1
	shl r1, 9
	sub r1, 1
	push r1
	ld r1, base_pointer, 6
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	ld r1, base_pointer, 1
	push r1
	ld r1, base_pointer, 5
	push r1
	call __tptcc_fn_divide_vector
	add stack_pointer, 2
	ld r1, base_pointer, 2
	push r1
	ld r1, base_pointer, 6
	push r1
	call __tptcc_fn_divide_vector
	add stack_pointer, 2
.exit_get_basis_vectors:
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 2
	ret
__tptcc_fn_simple_raycast:
	sub stack_pointer, 12
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	ld r1, base_pointer, 15
	ld r1, r1, 0
	st r1, base_pointer, 1
	ld r1, base_pointer, 15
	ld r1, r1, 1
	st r1, base_pointer, 2
	ld r1, base_pointer, 15
	ld r1, r1, 2
	st r1, base_pointer, 3
	ld r1, base_pointer, 14
	ld r1, r1, 0
	st r1, base_pointer, 4
	ld r1, base_pointer, 14
	ld r1, r1, 1
	st r1, base_pointer, 5
	ld r1, base_pointer, 14
	ld r1, r1, 2
	st r1, base_pointer, 6
	ld r1, base_pointer, 4
	ld r2, base_pointer, 1
	add r1, r2
	ld r2, base_pointer, 5
	ld r3, base_pointer, 2
	add r2, r3
	ld r3, base_pointer, 6
	ld r4, base_pointer, 3
	add r3, r4
	ld r4, base_pointer, 1
	cmp r4, 0
	jg .label_53
	jmp .label_52
	.label_53:
	mov r4, 1
	jmp .label_54
	.label_52:
	ld r4, base_pointer, 1
	cmp r4, 0
	jl .label_56
	jmp .label_55
	.label_56:
	mov r4, 65535
	jmp .label_57
	.label_55:
	mov r4, 0
	.label_57:
	.label_54:
	ld r5, base_pointer, 2
	cmp r5, 0
	jg .label_59
	jmp .label_58
	.label_59:
	mov r5, 1
	jmp .label_60
	.label_58:
	ld r5, base_pointer, 2
	cmp r5, 0
	jl .label_62
	jmp .label_61
	.label_62:
	mov r5, 65535
	jmp .label_63
	.label_61:
	mov r5, 0
	.label_63:
	.label_60:
	ld r6, base_pointer, 3
	cmp r6, 0
	jg .label_65
	jmp .label_64
	.label_65:
	mov r6, 1
	jmp .label_66
	.label_64:
	ld r6, base_pointer, 3
	cmp r6, 0
	jl .label_68
	jmp .label_67
	.label_68:
	mov r6, 65535
	jmp .label_69
	.label_67:
	mov r6, 0
	.label_69:
	.label_66:
	ld r7, base_pointer, 1
	cmp r7, 0
	jg .label_71
	jmp .label_70
	.label_71:
	ld r7, base_pointer, 1
	jmp .label_72
	.label_70:
	ld r7, base_pointer, 1
	xor r7, 65535
	add r7, 1
	.label_72:
	st r7, base_pointer, 7
	ld r7, base_pointer, 2
	cmp r7, 0
	jg .label_74
	jmp .label_73
	.label_74:
	ld r7, base_pointer, 2
	jmp .label_75
	.label_73:
	ld r7, base_pointer, 2
	xor r7, 65535
	add r7, 1
	.label_75:
	st r7, base_pointer, 8
	ld r7, base_pointer, 3
	cmp r7, 0
	jg .label_77
	jmp .label_76
	.label_77:
	ld r7, base_pointer, 3
	jmp .label_78
	.label_76:
	ld r7, base_pointer, 3
	xor r7, 65535
	add r7, 1
	.label_78:
	st r7, base_pointer, 9
	mov r7, 2241
	ld r8, base_pointer, 7
	ld r7, r7, r8
	mov r8, 2241
	ld r9, base_pointer, 8
	ld r8, r8, r9
	mov r9, 2241
	ld r10, base_pointer, 9
	ld r9, r9, r10
	mov r10, r1
	shr r10, 10
	mov r11, r2
	shr r11, 10
	mov r12, r3
	shr r12, 10
	mov r13, 0
	st r13, base_pointer, 10
	mov r13, r4
	cmp r13, 0
	jg .label_80
	jmp .label_79
	.label_80:
	mov r13, r10
	add r13, 1
	shl r13, 10
	sub r13, r1
	st r13, base_pointer, 10
	jmp .label_81
	.label_79:
	mov r13, r4
	cmp r13, 0
	jl .label_83
	jmp .label_82
	.label_83:
	mov r13, r10
	shl r13, 10
	sub r1, r13
	st r1, base_pointer, 10
	jmp .label_84
	.label_82:
	.label_84:
	.label_81:
	mov r1, 0
	st r1, base_pointer, 11
	mov r1, r5
	cmp r1, 0
	jg .label_86
	jmp .label_85
	.label_86:
	mov r1, r11
	add r1, 1
	shl r1, 10
	sub r1, r2
	st r1, base_pointer, 11
	jmp .label_87
	.label_85:
	mov r1, r5
	cmp r1, 0
	jl .label_89
	jmp .label_88
	.label_89:
	mov r1, r2
	mov r2, r11
	shl r2, 10
	sub r1, r2
	st r1, base_pointer, 11
	jmp .label_90
	.label_88:
	.label_90:
	.label_87:
	mov r1, 0
	st r1, base_pointer, 12
	mov r1, r6
	cmp r1, 0
	jg .label_92
	jmp .label_91
	.label_92:
	mov r1, r12
	add r1, 1
	shl r1, 10
	sub r1, r3
	st r1, base_pointer, 12
	jmp .label_93
	.label_91:
	mov r1, r6
	cmp r1, 0
	jl .label_95
	jmp .label_94
	.label_95:
	mov r1, r3
	mov r2, r12
	shl r2, 10
	sub r1, r2
	st r1, base_pointer, 12
	jmp .label_96
	.label_94:
	.label_96:
	.label_93:
	ld r1, base_pointer, 7
	cmp r1, 0
	je .label_98
	jmp .label_97
	.label_98:
	mov r1, 1
	shl r1, 15
	sub r1, 1
	jmp .label_99
	.label_97:
	ld r1, base_pointer, 10
	shl r1, 4
	ld r2, base_pointer, 7
	mov r3, 0
	mov r13, 0
	mov r14, 15
	.label_100:
	cmp r14, 0
	jl .label_102
	shl r13, 1
	shr r15, r1, r14
	and r15, 1
	or r13, r15
	cmp r13, r2
	jl .label_101
	sub r13, r2
	mov r15, 1
	shl r15, r14
	or r3, r15
	.label_101:
	sub r14, 1
	jmp .label_100
	.label_102:
	mov r1, r3
	.label_99:
	ld r2, base_pointer, 8
	cmp r2, 0
	je .label_104
	jmp .label_103
	.label_104:
	mov r2, 1
	shl r2, 15
	sub r2, 1
	jmp .label_105
	.label_103:
	ld r2, base_pointer, 11
	shl r2, 4
	ld r3, base_pointer, 8
	mov r13, 0
	mov r14, 0
	mov r15, 15
	.label_106:
	cmp r15, 0
	jl .label_108
	shl r14, 1
	shr r16, r2, r15
	and r16, 1
	or r14, r16
	cmp r14, r3
	jl .label_107
	sub r14, r3
	mov r16, 1
	shl r16, r15
	or r13, r16
	.label_107:
	sub r15, 1
	jmp .label_106
	.label_108:
	mov r2, r13
	.label_105:
	ld r3, base_pointer, 9
	cmp r3, 0
	je .label_110
	jmp .label_109
	.label_110:
	mov r3, 1
	shl r3, 15
	sub r3, 1
	jmp .label_111
	.label_109:
	ld r3, base_pointer, 12
	shl r3, 4
	ld r13, base_pointer, 9
	mov r14, 0
	mov r15, 0
	mov r16, 15
	.label_112:
	cmp r16, 0
	jl .label_114
	shl r15, 1
	shr r17, r3, r16
	and r17, 1
	or r15, r17
	cmp r15, r13
	jl .label_113
	sub r15, r13
	mov r17, 1
	shl r17, r16
	or r14, r17
	.label_113:
	sub r16, 1
	jmp .label_112
	.label_114:
	mov r3, r14
	.label_111:
	mov r13, 'x'
	.label_115:
	mov r14, 1
	cmp r14, 0
	je .label_116
	.label_117:
	mov r14, r10
	cmp r14, 24
	jge .label_119
	.label_121:
	mov r14, r10
	cmp r14, 0
	jl .label_119
	.label_122:
	mov r14, r11
	cmp r14, 8
	jge .label_119
	.label_123:
	mov r14, r11
	cmp r14, 0
	jl .label_119
	.label_124:
	mov r14, r12
	cmp r14, 24
	jge .label_119
	.label_125:
	mov r14, r12
	cmp r14, 0
	jl .label_119
	jmp .label_118
	.label_119:
	ld r1, base_pointer, 16
	mov r2, 65535
	st r2, r1
	jmp .exit_simple_raycast
	jmp .label_120
	.label_118:
	.label_120:
	push r12
	push r11
	push r10
	call __tptcc_fn_get_block
	add stack_pointer, 3
	mov r14, return_reg
	cmp r14, 0
	jg .label_127
	jmp .label_126
	.label_127:
	ld r1, base_pointer, 16
	st r10, r1
	ld r1, base_pointer, 16
	add r1, 1
	st r11, r1
	ld r1, base_pointer, 16
	add r1, 2
	st r12, r1
	ld r1, base_pointer, 16
	add r1, 3
	mov r2, 0
	st r2, r1
	ld r1, base_pointer, 16
	add r1, 3
	add r1, 1
	mov r2, 0
	st r2, r1
	ld r1, base_pointer, 16
	add r1, 3
	add r1, 2
	mov r2, 0
	st r2, r1
	mov r1, r13
	cmp r1, 'x'
	je .label_130
	jmp .label_129
	.label_130:
	ld r1, base_pointer, 16
	add r1, 3
	mov r2, r4
	xor r2, 65535
	add r2, 1
	st r2, r1
	jmp .label_131
	.label_129:
	mov r1, r13
	cmp r1, 'y'
	je .label_133
	jmp .label_132
	.label_133:
	ld r1, base_pointer, 16
	add r1, 3
	add r1, 1
	mov r2, r5
	xor r2, 65535
	add r2, 1
	st r2, r1
	jmp .label_134
	.label_132:
	ld r1, base_pointer, 16
	add r1, 3
	add r1, 2
	mov r2, r6
	xor r2, 65535
	add r2, 1
	st r2, r1
	.label_134:
	.label_131:
	jmp .exit_simple_raycast
	jmp .label_128
	.label_126:
	.label_128:
	mov r13, r1
	cmp r13, r2
	jle .label_138
	jmp .label_135
	.label_138:
	mov r13, r1
	cmp r13, r3
	jle .label_136
	jmp .label_135
	.label_136:
	mov r13, 'x'
	mov r14, r1
	cmp r14, r2
	je .label_140
	jmp .label_139
	.label_140:
	add r11, r5
	add r2, r8
	mov r13, 'y'
	jmp .label_141
	.label_139:
	mov r14, r1
	cmp r14, r3
	je .label_143
	jmp .label_142
	.label_143:
	add r12, r6
	add r3, r9
	jmp .label_144
	.label_142:
	.label_144:
	.label_141:
	add r10, r4
	add r1, r7
	jmp .label_137
	.label_135:
	mov r13, r2
	cmp r13, r3
	jle .label_146
	jmp .label_145
	.label_146:
	mov r13, 'y'
	mov r14, r2
	cmp r14, r3
	je .label_149
	jmp .label_148
	.label_149:
	add r12, r6
	add r3, r9
	jmp .label_150
	.label_148:
	.label_150:
	add r11, r5
	add r2, r8
	jmp .label_147
	.label_145:
	mov r13, 'z'
	add r12, r6
	add r3, r9
	.label_147:
	.label_137:
	jmp .label_115
	.label_116:
.exit_simple_raycast:
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 12
	ret
__tptcc_fn_camera_render:
	sub stack_pointer, 31
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r18
	push r19
	ld r1, base_pointer, 33
	ld r1, r1, 0
	st r1, base_pointer, 1
	ld r1, base_pointer, 33
	ld r1, r1, 1
	st r1, base_pointer, 2
	ld r1, base_pointer, 33
	ld r1, r1, 2
	st r1, base_pointer, 3
	add r1, base_pointer, 7
	push r1
	add r1, base_pointer, 4
	push r1
	ld r1, base_pointer, 33
	push r1
	call __tptcc_fn_get_basis_vectors
	add stack_pointer, 3
	mov r1, 0
	st r1, base_pointer, 10
	mov r1, 0
	st r1, base_pointer, 11
	mov r1, 57
	st r1, base_pointer, 12
	ld r1, base_pointer, 33
	add r1, 3
	push r1
	add r1, base_pointer, 10
	push r1
	call __tptcc_fn_rotate_vector
	add stack_pointer, 2
	mov r1, 0
	.label_151:
	mov r2, r1
	cmp r2, 116
	jl .label_154
	jmp .label_153
	.label_154:
	mov r2, 0
	.label_155:
	mov r3, r2
	cmp r3, 116
	jl .label_158
	jmp .label_157
	.label_158:
	mov r3, r2
	sub r3, 58
	add r4, base_pointer, 4
	ld r4, r4, 0
	mull r3, r4
	mov r4, r1
	sub r4, 58
	add r5, base_pointer, 7
	ld r5, r5, 0
	mull r4, r5
	add r3, r4
	st r3, base_pointer, 13
	mov r3, r2
	sub r3, 58
	add r4, base_pointer, 4
	ld r4, r4, 1
	mull r3, r4
	mov r4, r1
	sub r4, 58
	add r5, base_pointer, 7
	ld r5, r5, 1
	mull r4, r5
	add r3, r4
	st r3, base_pointer, 14
	mov r3, r2
	sub r3, 58
	add r4, base_pointer, 4
	ld r4, r4, 2
	mull r3, r4
	mov r4, r1
	sub r4, 58
	add r5, base_pointer, 7
	ld r5, r5, 2
	mull r4, r5
	add r3, r4
	st r3, base_pointer, 15
	ld r3, base_pointer, 13
	shr r3, 8
	ld r4, base_pointer, 13
	cmp r4, 0
	jl .label_160
	jmp .label_159
	.label_160:
	mov r4, 65280
	jmp .label_161
	.label_159:
	mov r4, 0
	.label_161:
	or r3, r4
	add r4, base_pointer, 10
	ld r4, r4, 0
	add r3, r4
	st r3, base_pointer, 13
	ld r3, base_pointer, 14
	shr r3, 8
	ld r4, base_pointer, 14
	cmp r4, 0
	jl .label_163
	jmp .label_162
	.label_163:
	mov r4, 65280
	jmp .label_164
	.label_162:
	mov r4, 0
	.label_164:
	or r3, r4
	add r4, base_pointer, 10
	ld r4, r4, 1
	add r3, r4
	st r3, base_pointer, 14
	ld r3, base_pointer, 15
	shr r3, 8
	ld r4, base_pointer, 15
	cmp r4, 0
	jl .label_166
	jmp .label_165
	.label_166:
	mov r4, 65280
	jmp .label_167
	.label_165:
	mov r4, 0
	.label_167:
	or r3, r4
	add r4, base_pointer, 10
	ld r4, r4, 2
	add r3, r4
	st r3, base_pointer, 15
	ld r3, base_pointer, 1
	ld r4, base_pointer, 13
	add r3, r4
	st r3, base_pointer, 16
	ld r3, base_pointer, 2
	ld r4, base_pointer, 14
	add r3, r4
	st r3, base_pointer, 17
	ld r3, base_pointer, 3
	ld r4, base_pointer, 15
	add r3, r4
	st r3, base_pointer, 18
	ld r3, base_pointer, 16
	cmp r3, 0
	jl .label_169
	.label_171:
	ld r3, base_pointer, 17
	cmp r3, 0
	jl .label_169
	.label_172:
	ld r3, base_pointer, 18
	cmp r3, 0
	jl .label_169
	jmp .label_168
	.label_169:
	mov r3, 9
	push r3
	push r1
	push r2
	call __tptcc_fn_plot_square
	add stack_pointer, 3
	jmp .label_156
	jmp .label_170
	.label_168:
	.label_170:
	ld r3, base_pointer, 13
	cmp r3, 0
	jg .label_174
	jmp .label_173
	.label_174:
	mov r3, 1
	jmp .label_175
	.label_173:
	ld r3, base_pointer, 13
	cmp r3, 0
	jl .label_177
	jmp .label_176
	.label_177:
	mov r3, 65535
	jmp .label_178
	.label_176:
	mov r3, 0
	.label_178:
	.label_175:
	ld r4, base_pointer, 14
	cmp r4, 0
	jg .label_180
	jmp .label_179
	.label_180:
	mov r4, 1
	jmp .label_181
	.label_179:
	ld r4, base_pointer, 14
	cmp r4, 0
	jl .label_183
	jmp .label_182
	.label_183:
	mov r4, 65535
	jmp .label_184
	.label_182:
	mov r4, 0
	.label_184:
	.label_181:
	ld r5, base_pointer, 15
	cmp r5, 0
	jg .label_186
	jmp .label_185
	.label_186:
	mov r5, 1
	jmp .label_187
	.label_185:
	ld r5, base_pointer, 15
	cmp r5, 0
	jl .label_189
	jmp .label_188
	.label_189:
	mov r5, 65535
	jmp .label_190
	.label_188:
	mov r5, 0
	.label_190:
	.label_187:
	ld r6, base_pointer, 13
	cmp r6, 0
	jg .label_192
	jmp .label_191
	.label_192:
	ld r6, base_pointer, 13
	jmp .label_193
	.label_191:
	ld r6, base_pointer, 13
	xor r6, 65535
	add r6, 1
	.label_193:
	st r6, base_pointer, 19
	ld r6, base_pointer, 14
	cmp r6, 0
	jg .label_195
	jmp .label_194
	.label_195:
	ld r6, base_pointer, 14
	jmp .label_196
	.label_194:
	ld r6, base_pointer, 14
	xor r6, 65535
	add r6, 1
	.label_196:
	st r6, base_pointer, 20
	ld r6, base_pointer, 15
	cmp r6, 0
	jg .label_198
	jmp .label_197
	.label_198:
	ld r6, base_pointer, 15
	jmp .label_199
	.label_197:
	ld r6, base_pointer, 15
	xor r6, 65535
	add r6, 1
	.label_199:
	st r6, base_pointer, 21
	mov r6, 2241
	ld r7, base_pointer, 19
	ld r6, r6, r7
	mov r7, 2241
	ld r8, base_pointer, 20
	ld r7, r7, r8
	mov r8, 2241
	ld r9, base_pointer, 21
	ld r8, r8, r9
	ld r9, base_pointer, 16
	shr r9, 10
	ld r10, base_pointer, 17
	shr r10, 10
	ld r11, base_pointer, 18
	shr r11, 10
	mov r12, 0
	st r12, base_pointer, 22
	mov r12, r3
	cmp r12, 0
	jg .label_201
	jmp .label_200
	.label_201:
	mov r12, r9
	add r12, 1
	shl r12, 10
	ld r13, base_pointer, 16
	sub r12, r13
	st r12, base_pointer, 22
	jmp .label_202
	.label_200:
	mov r12, r3
	cmp r12, 0
	jl .label_204
	jmp .label_203
	.label_204:
	ld r12, base_pointer, 16
	mov r13, r9
	shl r13, 10
	sub r12, r13
	st r12, base_pointer, 22
	jmp .label_205
	.label_203:
	.label_205:
	.label_202:
	mov r12, 0
	st r12, base_pointer, 23
	mov r12, r4
	cmp r12, 0
	jg .label_207
	jmp .label_206
	.label_207:
	mov r12, r10
	add r12, 1
	shl r12, 10
	ld r13, base_pointer, 17
	sub r12, r13
	st r12, base_pointer, 23
	jmp .label_208
	.label_206:
	mov r12, r4
	cmp r12, 0
	jl .label_210
	jmp .label_209
	.label_210:
	ld r12, base_pointer, 17
	mov r13, r10
	shl r13, 10
	sub r12, r13
	st r12, base_pointer, 23
	jmp .label_211
	.label_209:
	.label_211:
	.label_208:
	mov r12, 0
	st r12, base_pointer, 24
	mov r12, r5
	cmp r12, 0
	jg .label_213
	jmp .label_212
	.label_213:
	mov r12, r11
	add r12, 1
	shl r12, 10
	ld r13, base_pointer, 18
	sub r12, r13
	st r12, base_pointer, 24
	jmp .label_214
	.label_212:
	mov r12, r5
	cmp r12, 0
	jl .label_216
	jmp .label_215
	.label_216:
	ld r12, base_pointer, 18
	mov r13, r11
	shl r13, 10
	sub r12, r13
	st r12, base_pointer, 24
	jmp .label_217
	.label_215:
	.label_217:
	.label_214:
	ld r12, base_pointer, 19
	cmp r12, 0
	je .label_219
	jmp .label_218
	.label_219:
	mov r12, 1
	shl r12, 15
	sub r12, 1
	jmp .label_220
	.label_218:
	ld r12, base_pointer, 22
	shl r12, 4
	ld r13, base_pointer, 19
	mov r14, 0
	mov r15, 0
	mov r16, 15
	.label_221:
	cmp r16, 0
	jl .label_223
	shl r15, 1
	shr r17, r12, r16
	and r17, 1
	or r15, r17
	cmp r15, r13
	jl .label_222
	sub r15, r13
	mov r17, 1
	shl r17, r16
	or r14, r17
	.label_222:
	sub r16, 1
	jmp .label_221
	.label_223:
	mov r12, r14
	.label_220:
	ld r13, base_pointer, 20
	cmp r13, 0
	je .label_225
	jmp .label_224
	.label_225:
	mov r13, 1
	shl r13, 15
	sub r13, 1
	jmp .label_226
	.label_224:
	ld r13, base_pointer, 23
	shl r13, 4
	ld r14, base_pointer, 20
	mov r15, 0
	mov r16, 0
	mov r17, 15
	.label_227:
	cmp r17, 0
	jl .label_229
	shl r16, 1
	shr r18, r13, r17
	and r18, 1
	or r16, r18
	cmp r16, r14
	jl .label_228
	sub r16, r14
	mov r18, 1
	shl r18, r17
	or r15, r18
	.label_228:
	sub r17, 1
	jmp .label_227
	.label_229:
	mov r13, r15
	.label_226:
	ld r14, base_pointer, 21
	cmp r14, 0
	je .label_231
	jmp .label_230
	.label_231:
	mov r14, 1
	shl r14, 15
	sub r14, 1
	jmp .label_232
	.label_230:
	ld r14, base_pointer, 24
	shl r14, 4
	ld r15, base_pointer, 21
	mov r16, 0
	mov r17, 0
	mov r18, 15
	.label_233:
	cmp r18, 0
	jl .label_235
	shl r17, 1
	shr r19, r14, r18
	and r19, 1
	or r17, r19
	cmp r17, r15
	jl .label_234
	sub r17, r15
	mov r19, 1
	shl r19, r18
	or r16, r19
	.label_234:
	sub r18, 1
	jmp .label_233
	.label_235:
	mov r14, r16
	.label_232:
	mov r15, 'x'
	.label_236:
	mov r16, 1
	cmp r16, 0
	je .label_237
	.label_238:
	mov r16, r9
	cmp r16, 24
	jge .label_240
	.label_242:
	mov r16, r9
	cmp r16, 0
	jl .label_240
	.label_243:
	mov r16, r10
	cmp r16, 8
	jge .label_240
	.label_244:
	mov r16, r10
	cmp r16, 0
	jl .label_240
	.label_245:
	mov r16, r11
	cmp r16, 24
	jge .label_240
	.label_246:
	mov r16, r11
	cmp r16, 0
	jl .label_240
	jmp .label_239
	.label_240:
	mov r3, 9
	push r3
	push r1
	push r2
	call __tptcc_fn_plot_square
	add stack_pointer, 3
	jmp .label_237
	jmp .label_241
	.label_239:
	.label_241:
	push r11
	push r10
	push r9
	call __tptcc_fn_get_block
	add stack_pointer, 3
	mov r16, return_reg
	mov r17, r16
	cmp r17, 0
	jg .label_248
	jmp .label_247
	.label_248:
	mov r17, r16
	cmp r17, 3
	je .label_253
	jmp .label_250
	.label_253:
	mov r17, r12
	sub r17, r6
	mov r18, r13
	sub r18, r7
	cmp r17, r18
	je .label_259
	jmp .label_258
	.label_259:
	mov r17, 1
	jmp .label_260
	.label_258:
	mov r17, 0
	.label_260:
	cmp r17, 0
	je .label_257
	jmp .label_255
	.label_257:
	mov r17, r12
	sub r17, r6
	mov r18, r14
	sub r18, r8
	cmp r17, r18
	je .label_262
	jmp .label_261
	.label_262:
	mov r17, 1
	jmp .label_263
	.label_261:
	mov r17, 0
	.label_263:
	cmp r17, 0
	je .label_254
	.label_255:
	mov r17, 1
	jmp .label_256
	.label_254:
	mov r17, 0
	.label_256:
	cmp r17, 0
	je .label_250
	.label_251:
	mov r15, 'x'
	jmp .label_252
	.label_250:
	.label_252:
	mov r17, 1
	st r17, base_pointer, 25
	mov r17, 65535
	st r17, base_pointer, 26
	mov r17, 65535
	st r17, base_pointer, 27
	mov r17, r15
	cmp r17, 'x'
	je .label_265
	jmp .label_264
	.label_265:
	mov r15, r12
	sub r15, r6
	st r15, base_pointer, 28
	ld r15, base_pointer, 28
	ld r17, base_pointer, 14
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 17
	add r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	shr r15, 6
	st r15, base_pointer, 26
	ld r15, base_pointer, 28
	ld r17, base_pointer, 15
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 18
	add r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	shr r15, 6
	st r15, base_pointer, 27
	mov r15, 2337
	ld r15, r15, r16
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	jmp .label_266
	.label_264:
	mov r17, r15
	cmp r17, 'y'
	je .label_268
	jmp .label_267
	.label_268:
	mov r15, r13
	sub r15, r7
	st r15, base_pointer, 29
	ld r15, base_pointer, 29
	ld r17, base_pointer, 13
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 16
	add r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	shr r15, 6
	st r15, base_pointer, 26
	ld r15, base_pointer, 29
	ld r17, base_pointer, 15
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 18
	add r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	shr r15, 6
	st r15, base_pointer, 27
	mov r15, r16
	cmp r15, 1
	je .label_271
	jmp .label_270
	.label_271:
	mov r15, r4
	cmp r15, 0
	jl .label_274
	jmp .label_273
	.label_274:
	mov r15, 4
	st r15, base_pointer, 25
	jmp .label_275
	.label_273:
	mov r15, 10
	st r15, base_pointer, 25
	.label_275:
	jmp .label_272
	.label_270:
	mov r15, r16
	cmp r15, 3
	je .label_277
	jmp .label_276
	.label_277:
	mov r15, 14
	st r15, base_pointer, 25
	jmp .label_278
	.label_276:
	mov r15, r16
	cmp r15, 5
	je .label_280
	jmp .label_279
	.label_280:
	mov r15, r4
	cmp r15, 0
	jl .label_283
	jmp .label_282
	.label_283:
	mov r15, 14
	st r15, base_pointer, 25
	jmp .label_284
	.label_282:
	mov r15, 1473
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	.label_284:
	jmp .label_281
	.label_279:
	mov r15, r16
	cmp r15, 10
	je .label_286
	jmp .label_285
	.label_286:
	mov r15, 1217
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	jmp .label_287
	.label_285:
	mov r15, r16
	cmp r15, 11
	je .label_289
	jmp .label_288
	.label_289:
	mov r15, 6
	st r15, base_pointer, 25
	jmp .label_290
	.label_288:
	mov r15, r16
	cmp r15, 12
	je .label_292
	jmp .label_291
	.label_292:
	mov r15, 1537
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	jmp .label_293
	.label_291:
	mov r15, r13
	sub r15, r7
	st r15, base_pointer, 30
	ld r15, base_pointer, 30
	ld r17, base_pointer, 13
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 16
	add r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	shr r15, 6
	st r15, base_pointer, 26
	ld r15, base_pointer, 30
	ld r17, base_pointer, 15
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 18
	add r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	shr r15, 6
	st r15, base_pointer, 27
	mov r15, 2337
	ld r15, r15, r16
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	.label_293:
	.label_290:
	.label_287:
	.label_281:
	.label_278:
	.label_272:
	jmp .label_269
	.label_267:
	cmp r15, 'z'
	je .label_295
	jmp .label_294
	.label_295:
	mov r15, r14
	sub r15, r8
	st r15, base_pointer, 31
	ld r15, base_pointer, 31
	ld r17, base_pointer, 14
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 17
	add r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 26
	ld r15, base_pointer, 26
	shr r15, 6
	st r15, base_pointer, 26
	ld r15, base_pointer, 31
	ld r17, base_pointer, 13
	mull r15, r17
	shr r15, 4
	ld r17, base_pointer, 16
	add r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	mov r17, 1023
	and r15, r17
	st r15, base_pointer, 27
	ld r15, base_pointer, 27
	shr r15, 6
	st r15, base_pointer, 27
	mov r15, r16
	cmp r15, 10
	je .label_302
	.label_304:
	mov r15, r16
	cmp r15, 11
	je .label_302
	jmp .label_301
	.label_302:
	mov r15, 1
	jmp .label_303
	.label_301:
	mov r15, 0
	.label_303:
	cmp r15, 0
	je .label_297
	.label_300:
	mov r15, r5
	cmp r15, 1
	je .label_298
	jmp .label_297
	.label_298:
	mov r15, r16
	cmp r15, 10
	je .label_306
	jmp .label_305
	.label_306:
	mov r15, 1857
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	jmp .label_307
	.label_305:
	mov r15, 1985
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	.label_307:
	jmp .label_299
	.label_297:
	mov r15, 2337
	ld r15, r15, r16
	ld r16, base_pointer, 26
	mull r16, 4
	add r15, r16
	ld r16, base_pointer, 27
	shr r16, 2
	ld r15, r15, r16
	mov r16, 4
	ld r17, base_pointer, 27
	mov r18, 3
	xor r17, r18
	mull r16, r17
	shr r15, r16
	st r15, base_pointer, 25
	.label_299:
	jmp .label_296
	.label_294:
	.label_296:
	.label_269:
	.label_266:
	mov r15, 2390
	ld r15, r15, 0
	cmp r15, r9
	je .label_315
	jmp .label_312
	.label_315:
	mov r15, 2390
	ld r15, r15, 1
	cmp r15, r10
	je .label_316
	jmp .label_312
	.label_316:
	mov r15, 2390
	ld r15, r15, 2
	cmp r15, r11
	je .label_313
	jmp .label_312
	.label_313:
	mov r15, 1
	jmp .label_314
	.label_312:
	mov r15, 0
	.label_314:
	cmp r15, 0
	je .label_308
	.label_311:
	ld r15, base_pointer, 26
	cmp r15, 15
	je .label_318
	.label_320:
	ld r15, base_pointer, 26
	cmp r15, 0
	je .label_318
	.label_321:
	ld r15, base_pointer, 27
	cmp r15, 15
	je .label_318
	.label_322:
	ld r15, base_pointer, 27
	cmp r15, 0
	je .label_318
	jmp .label_317
	.label_318:
	mov r15, 1
	jmp .label_319
	.label_317:
	mov r15, 0
	.label_319:
	cmp r15, 0
	je .label_308
	.label_309:
	mov r15, 0
	st r15, base_pointer, 25
	jmp .label_310
	.label_308:
	.label_310:
	ld r15, base_pointer, 25
	mov r16, 15
	and r15, r16
	st r15, base_pointer, 25
	ld r15, base_pointer, 25
	cmp r15, 9
	jne .label_324
	jmp .label_323
	.label_324:
	ld r3, base_pointer, 25
	push r3
	push r1
	push r2
	call __tptcc_fn_plot_square
	add stack_pointer, 3
	jmp .label_237
	jmp .label_325
	.label_323:
	.label_325:
	jmp .label_249
	.label_247:
	.label_249:
	mov r15, r12
	cmp r15, r13
	jle .label_329
	jmp .label_326
	.label_329:
	mov r15, r12
	cmp r15, r14
	jle .label_327
	jmp .label_326
	.label_327:
	mov r15, 'x'
	mov r16, r12
	cmp r16, r13
	je .label_331
	jmp .label_330
	.label_331:
	add r10, r4
	add r13, r7
	mov r15, 'y'
	jmp .label_332
	.label_330:
	mov r16, r12
	cmp r16, r14
	je .label_334
	jmp .label_333
	.label_334:
	add r11, r5
	add r14, r8
	jmp .label_335
	.label_333:
	.label_335:
	.label_332:
	add r9, r3
	add r12, r6
	jmp .label_328
	.label_326:
	mov r15, r13
	cmp r15, r14
	jle .label_337
	jmp .label_336
	.label_337:
	mov r15, 'y'
	mov r16, r13
	cmp r16, r14
	je .label_340
	jmp .label_339
	.label_340:
	add r11, r5
	add r14, r8
	jmp .label_341
	.label_339:
	.label_341:
	add r10, r4
	add r13, r7
	jmp .label_338
	.label_336:
	mov r15, 'z'
	add r11, r5
	add r14, r8
	.label_338:
	.label_328:
	jmp .label_236
	.label_237:
	.label_156:
	mov r3, r2
	add r2, 1
	jmp .label_155
	.label_157:
	.label_152:
	mov r2, r1
	add r1, 1
	jmp .label_151
	.label_153:
.exit_camera_render:
	pop r19
	pop r18
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 31
	ret
__tptcc_fn_draw_compacted_sprite:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	mov r3, 0
	.label_342:
	mov r1, r3
	cmp r1, 16
	jl .label_345
	jmp .label_344
	.label_345:
	mov r4, 0
	.label_346:
	mov r1, r4
	cmp r1, 4
	jl .label_349
	jmp .label_348
	.label_349:
	ld r1, base_pointer, 4
	mov r2, r3
	mull r2, 4
	add r1, r2
	add r1, r4
	ld r5, r1
	mov r6, 0
	.label_350:
	mov r1, r6
	cmp r1, 4
	jl .label_353
	jmp .label_352
	.label_353:
	mov r2, r5
	mov r7, 4
	mov r1, 3
	sub r1, r6
	mull r7, r1
	shr r2, r7
	mov r1, 15
	and r2, r1
	mov r1, r2
	mov r24, r1
	ld r1, base_pointer, 3
	add r1, r3
	mov r23, r1
	ld r1, base_pointer, 2
	mov r2, r4
	mull r2, 4
	add r1, r2
	add r1, r6
	mov r22, r1
	call __tptcc_fn_plot
	.label_351:
	mov r1, r6
	add r6, 1
	jmp .label_350
	.label_352:
	.label_347:
	mov r1, r4
	add r4, 1
	jmp .label_346
	.label_348:
	.label_343:
	mov r1, r3
	add r3, 1
	jmp .label_342
	.label_344:
.exit_draw_compacted_sprite:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_draw_digit:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	mov r1, 2805
	ld r2, base_pointer, 2
	shl r2, 1
	add r1, r2
	ld r4, r1
	mov r1, 2805
	ld r2, base_pointer, 2
	shl r2, 1
	add r2, 1
	add r1, r2
	ld r5, r1
	mov r6, 0
	.label_354:
	mov r1, r6
	cmp r1, 4
	jl .label_357
	jmp .label_356
	.label_357:
	mov r7, 0
	.label_358:
	mov r1, r7
	cmp r1, 4
	jl .label_361
	jmp .label_360
	.label_361:
	mov r1, r4
	mov r2, 4
	mov r3, 3
	sub r3, r7
	mull r2, r3
	add r2, 3
	sub r2, r6
	shr r1, r2
	mov r2, 1
	and r1, r2
	mov r8, r1
	mov r1, r5
	mov r2, 4
	mov r3, 3
	sub r3, r7
	mull r2, r3
	add r2, 3
	sub r2, r6
	shr r1, r2
	mov r2, 1
	and r1, r2
	cmp r8, 0
	je .label_362
	.label_363:
	mov r24, 15
	ld r2, base_pointer, 4
	add r2, r7
	mov r23, r2
	ld r2, base_pointer, 3
	add r2, r6
	mov r22, r2
	call __tptcc_fn_plot
	jmp .label_364
	.label_362:
	.label_364:
	cmp r1, 0
	je .label_365
	.label_366:
	mov r24, 15
	ld r1, base_pointer, 4
	add r1, 4
	add r1, r7
	mov r23, r1
	ld r1, base_pointer, 3
	add r1, r6
	mov r22, r1
	call __tptcc_fn_plot
	jmp .label_367
	.label_365:
	.label_367:
	.label_359:
	mov r1, r7
	add r7, 1
	jmp .label_358
	.label_360:
	.label_355:
	mov r1, r6
	add r6, 1
	jmp .label_354
	.label_356:
.exit_draw_digit:
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_draw_item:
	sub stack_pointer, 2
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	ld r1, base_pointer, 7
	push r1
	ld r1, base_pointer, 5
	push r1
	ld r1, base_pointer, 4
	push r1
	call __tptcc_fn_draw_compacted_sprite
	add stack_pointer, 3
	ld r3, base_pointer, 6
	mulh r1, r3, 6553
	mul r2, r1, 10
	sub r2, r3, r2
	cmp r2, 10
	ja .label_368
	add r1, 1
	sub r2, 10
	.label_368:
	st r1, base_pointer, 1
	ld r1, base_pointer, 6
	ld r2, base_pointer, 1
	mull r2, 10
	sub r1, r2
	st r1, base_pointer, 2
	ld r1, base_pointer, 1
	cmp r1, 0
	jg .label_370
	jmp .label_369
	.label_370:
	ld r1, base_pointer, 5
	add r1, 8
	push r1
	ld r1, base_pointer, 4
	add r1, 6
	push r1
	ld r1, base_pointer, 1
	push r1
	call __tptcc_fn_draw_digit
	add stack_pointer, 3
	jmp .label_371
	.label_369:
	.label_371:
	ld r1, base_pointer, 5
	add r1, 8
	push r1
	ld r1, base_pointer, 4
	add r1, 11
	push r1
	ld r1, base_pointer, 2
	push r1
	call __tptcc_fn_draw_digit
	add stack_pointer, 3
.exit_draw_item:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 2
	ret
__tptcc_fn_draw_cursor:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r6
	push r3
	push r4
	push r5
	mov r1, 58
	ld r2, base_pointer, 2
	shr r2, 1
	sub r1, r2
	mov r5, r1
	mov r1, 58
	ld r2, base_pointer, 2
	shr r2, 1
	add r1, r2
	mov r3, 58
	mov r4, 58
	.label_372:
	mov r2, r5
	cmp r2, r1
	jle .label_375
	jmp .label_374
	.label_375:
	mov r2, r3
	.label_376:
	mov r6, r2
	cmp r6, r4
	jle .label_379
	jmp .label_378
	.label_379:
	mov r6, 15
	push r6
	push r2
	push r5
	call __tptcc_fn_plot_square
	add stack_pointer, 3
	mov r6, 15
	push r6
	push r5
	push r2
	call __tptcc_fn_plot_square
	add stack_pointer, 3
	.label_377:
	mov r6, r2
	add r2, 1
	jmp .label_376
	.label_378:
	.label_373:
	mov r2, r5
	add r5, 1
	jmp .label_372
	.label_374:
.exit_draw_cursor:
	pop r5
	pop r4
	pop r3
	pop r6
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_generate_tree:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	mov r1, 0
	.label_380:
	mov r2, r1
	cmp r2, 3
	jl .label_383
	jmp .label_382
	.label_383:
	mov r2, 3
	push r2
	ld r2, base_pointer, 4
	push r2
	ld r2, base_pointer, 3
	sub r2, r1
	push r2
	ld r2, base_pointer, 2
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_381:
	mov r2, r1
	add r1, 1
	jmp .label_380
	.label_382:
	mov r2, 65535
	.label_384:
	mov r1, r2
	cmp r1, 2
	jl .label_387
	jmp .label_386
	.label_387:
	mov r3, 65535
	.label_388:
	mov r1, r3
	cmp r1, 2
	jl .label_391
	jmp .label_390
	.label_391:
	mov r4, 3
	.label_392:
	mov r1, r4
	cmp r1, 5
	jl .label_395
	jmp .label_394
	.label_395:
	mov r1, 4
	push r1
	ld r1, base_pointer, 4
	add r1, r3
	push r1
	ld r1, base_pointer, 3
	sub r1, r4
	push r1
	ld r1, base_pointer, 2
	add r1, r2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_393:
	mov r1, r4
	add r4, 1
	jmp .label_392
	.label_394:
	.label_389:
	mov r1, r3
	add r3, 1
	jmp .label_388
	.label_390:
	.label_385:
	mov r1, r2
	add r2, 1
	jmp .label_384
	.label_386:
.exit_generate_tree:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_max:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	ld r1, base_pointer, 2
	ld r2, base_pointer, 3
	cmp r1, r2
	jg .label_397
	jmp .label_396
	.label_397:
	ld r1, base_pointer, 2
	jmp .label_398
	.label_396:
	ld r1, base_pointer, 3
	.label_398:
	mov return_reg, r1
	jmp .exit_max
.exit_max:
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_min:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	ld r1, base_pointer, 2
	ld r2, base_pointer, 3
	cmp r1, r2
	jl .label_400
	jmp .label_399
	.label_400:
	ld r1, base_pointer, 2
	jmp .label_401
	.label_399:
	ld r1, base_pointer, 3
	.label_401:
	mov return_reg, r1
	jmp .exit_min
.exit_min:
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_add_to_inventory:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	mov r1, 3
	.label_402:
	mov r2, r1
	cmp r2, 0
	jge .label_405
	jmp .label_404
	.label_405:
	mov r2, 0
	.label_406:
	mov r3, r2
	cmp r3, 9
	jl .label_409
	jmp .label_408
	.label_409:
	mov r3, 2352
	mov r4, r1
	mull r4, 9
	add r3, r4
	ld r3, r3, r2
	shr r3, 8
	mov r4, 2352
	mov r5, r1
	mull r5, 9
	add r4, r5
	ld r4, r4, r2
	mov r5, 255
	and r4, r5
	ld r5, base_pointer, 2
	cmp r3, r5
	je .label_413
	jmp .label_410
	.label_413:
	mov r3, r4
	cmp r3, 64
	jl .label_411
	jmp .label_410
	.label_411:
	ld r3, base_pointer, 3
	push r3
	mov r3, 64
	sub r3, r4
	push r3
	call __tptcc_fn_min
	add stack_pointer, 2
	mov r3, return_reg
	mov r4, 2352
	mov r5, r1
	mull r5, 9
	add r4, r5
	add r4, r2
	ld r5, r4
	add r5, r3
	st r5, r4
	ld r4, base_pointer, 3
	sub r4, r3
	st r4, base_pointer, 3
	ld r3, base_pointer, 3
	cmp r3, 0
	je .label_415
	jmp .label_414
	.label_415:
	jmp .exit_add_to_inventory
	jmp .label_416
	.label_414:
	.label_416:
	jmp .label_412
	.label_410:
	.label_412:
	.label_407:
	mov r3, r2
	add r2, 1
	jmp .label_406
	.label_408:
	.label_403:
	mov r2, r1
	sub r1, 1
	jmp .label_402
	.label_404:
	mov r5, 3
	.label_417:
	mov r1, r5
	cmp r1, 0
	jge .label_420
	jmp .label_419
	.label_420:
	mov r6, 0
	.label_421:
	mov r1, r6
	cmp r1, 9
	jl .label_424
	jmp .label_423
	.label_424:
	mov r1, 2352
	mov r2, r5
	mull r2, 9
	add r1, r2
	ld r1, r1, r6
	shr r1, 8
	cmp r1, 0
	je .label_426
	jmp .label_425
	.label_426:
	ld r1, base_pointer, 3
	push r1
	mov r1, 64
	push r1
	call __tptcc_fn_min
	add stack_pointer, 2
	mov r1, return_reg
	mov r2, 2352
	mov r3, r5
	mull r3, 9
	add r2, r3
	add r2, r6
	ld r3, base_pointer, 2
	shl r3, 8
	mov r4, r1
	or r3, r4
	st r3, r2
	ld r2, base_pointer, 3
	sub r2, r1
	st r2, base_pointer, 3
	ld r1, base_pointer, 3
	cmp r1, 0
	je .label_429
	jmp .label_428
	.label_429:
	jmp .exit_add_to_inventory
	jmp .label_430
	.label_428:
	.label_430:
	jmp .label_427
	.label_425:
	.label_427:
	.label_422:
	mov r1, r6
	add r6, 1
	jmp .label_421
	.label_423:
	.label_418:
	mov r1, r5
	sub r5, 1
	jmp .label_417
	.label_419:
.exit_add_to_inventory:
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_place_block:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	mov r1, 2352
	add r1, 27
	mov r2, 2352
	ld r2, r2, 37
	ld r1, r1, r2
	shr r1, 8
	mov r2, 2390
	ld r2, r2, 0
	cmp r2, 0
	jge .label_434
	jmp .label_431
	.label_434:
	mov r2, r1
	cmp r2, 0
	jg .label_432
	jmp .label_431
	.label_432:
	push r1
	mov r1, 2390
	ld r1, r1, 2
	mov r2, 2390
	add r2, 3
	ld r2, r2, 2
	add r1, r2
	push r1
	mov r1, 2390
	ld r1, r1, 1
	mov r2, 2390
	add r2, 3
	ld r2, r2, 1
	add r1, r2
	push r1
	mov r1, 2390
	ld r1, r1, 0
	mov r2, 2390
	add r2, 3
	ld r2, r2, 0
	add r1, r2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 2352
	add r1, 27
	mov r2, 2352
	ld r2, r2, 37
	add r1, r2
	ld r2, r1
	mov r3, 1
	sub r2, r3
	st r2, r1
	mov r1, 2352
	add r1, 27
	mov r2, 2352
	add r2, 37
	mov r3, r1
	ld r1, r2
	add r3, r1
	ld r1, r3
	mov r2, 255
	and r1, r2
	cmp r1, 0
	je .label_436
	jmp .label_435
	.label_436:
	mov r1, 2352
	add r1, 27
	mov r2, 2352
	ld r2, r2, 37
	add r1, r2
	mov r2, 0
	st r2, r1
	jmp .label_437
	.label_435:
	.label_437:
	jmp .label_433
	.label_431:
	.label_433:
.exit_place_block:
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_remove_block:
	sub stack_pointer, 1
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	mov r1, 2390
	ld r1, r1, 0
	cmp r1, 0
	jge .label_439
	jmp .label_438
	.label_439:
	mov r1, 2390
	ld r1, r1, 2
	push r1
	mov r1, 2390
	ld r1, r1, 1
	push r1
	mov r1, 2390
	ld r1, r1, 0
	push r1
	call __tptcc_fn_get_block
	add stack_pointer, 3
	mov r1, return_reg
	st r1, base_pointer, 1
	mov r1, 0
	push r1
	mov r1, 2390
	ld r1, r1, 2
	push r1
	mov r1, 2390
	ld r1, r1, 1
	push r1
	mov r1, 2390
	ld r1, r1, 0
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 1
	push r1
	ld r1, base_pointer, 1
	push r1
	call __tptcc_fn_add_to_inventory
	add stack_pointer, 2
	jmp .label_440
	.label_438:
	.label_440:
.exit_remove_block:
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 1
	ret
__tptcc_fn_draw_rectangle:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	ld r4, base_pointer, 6
	mov r5, 0
	.label_441:
	mov r1, r5
	ld r2, base_pointer, 5
	cmp r1, r2
	jl .label_444
	jmp .label_443
	.label_444:
	mov r1, 0
	.label_445:
	mov r2, r1
	ld r3, base_pointer, 4
	cmp r2, r3
	jl .label_448
	jmp .label_447
	.label_448:
	mov r24, r4
	ld r2, base_pointer, 3
	add r2, r5
	mov r23, r2
	ld r2, base_pointer, 2
	add r2, r1
	mov r22, r2
	call __tptcc_fn_plot
	.label_446:
	mov r2, r1
	add r1, 1
	jmp .label_445
	.label_447:
	.label_442:
	mov r1, r5
	add r5, 1
	jmp .label_441
	.label_443:
.exit_draw_rectangle:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_draw_hotbar:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r3
	push r4
	push r2
	push r5
	push r6
	ld r3, base_pointer, 2
	ld r4, base_pointer, 3
	mov r1, 8
	push r1
	mov r1, 2
	push r1
	mov r1, 184
	push r1
	push r4
	push r3
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	mov r1, 8
	push r1
	mov r1, 2
	push r1
	mov r1, 184
	push r1
	mov r1, r4
	add r1, 18
	push r1
	push r3
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	mov r1, 8
	push r1
	mov r1, 16
	push r1
	mov r1, 4
	push r1
	mov r1, r4
	add r1, 2
	push r1
	mov r1, r3
	add r1, 180
	push r1
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	mov r1, 15
	push r1
	mov r1, 20
	push r1
	mov r1, 24
	push r1
	push r4
	mov r1, 2352
	ld r1, r1, 37
	mull r1, 20
	add r1, r3
	push r1
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	mov r5, 0
	.label_449:
	mov r1, r5
	cmp r1, 9
	jl .label_452
	jmp .label_451
	.label_452:
	mov r1, 2352
	add r1, 27
	ld r1, r1, r5
	shr r1, 8
	mov r6, r1
	mov r1, r6
	cmp r1, 0
	jg .label_454
	jmp .label_453
	.label_454:
	mov r1, r6
	cmp r1, 10
	je .label_457
	jmp .label_456
	.label_457:
	mov r1, 1857
	jmp .label_458
	.label_456:
	mov r1, 2337
	ld r1, r1, r6
	.label_458:
	push r1
	mov r1, 2352
	add r1, 27
	ld r1, r1, r5
	mov r2, 255
	and r1, r2
	push r1
	mov r1, 2
	add r1, r4
	push r1
	mov r1, r5
	mull r1, 20
	add r1, 4
	add r1, r3
	push r1
	call __tptcc_fn_draw_item
	add stack_pointer, 4
	jmp .label_455
	.label_453:
	mov r1, 7
	push r1
	mov r1, 16
	push r1
	mov r1, 16
	push r1
	mov r1, 2
	add r1, r4
	push r1
	mov r1, r5
	mull r1, 20
	add r1, 4
	add r1, r3
	push r1
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	.label_455:
	mov r1, r5
	mov r2, 2352
	ld r2, r2, 37
	cmp r1, r2
	je .label_460
	.label_462:
	mov r1, r5
	sub r1, 1
	mov r2, 2352
	ld r2, r2, 37
	cmp r1, r2
	je .label_460
	jmp .label_459
	.label_460:
	mov r1, 15
	push r1
	mov r1, 16
	push r1
	mov r1, 4
	push r1
	mov r1, 2
	add r1, r4
	push r1
	mov r1, r5
	mull r1, 20
	add r1, r3
	push r1
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	jmp .label_461
	.label_459:
	mov r1, 8
	push r1
	mov r1, 16
	push r1
	mov r1, 4
	push r1
	mov r1, 2
	add r1, r4
	push r1
	mov r1, r5
	mull r1, 20
	add r1, r3
	push r1
	call __tptcc_fn_draw_rectangle
	add stack_pointer, 5
	.label_461:
	.label_450:
	mov r1, r5
	add r5, 1
	jmp .label_449
	.label_451:
.exit_draw_hotbar:
	pop r6
	pop r5
	pop r2
	pop r4
	pop r3
	pop r1
	pop base_pointer
	ret
__tptcc_fn_create_house:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	mov r1, 0
	.label_463:
	mov r2, r1
	cmp r2, 5
	jl .label_466
	jmp .label_465
	.label_466:
	mov r2, 0
	.label_467:
	mov r3, r2
	cmp r3, 5
	jl .label_470
	jmp .label_469
	.label_470:
	mov r3, 2
	push r3
	ld r3, base_pointer, 4
	add r3, r2
	push r3
	ld r3, base_pointer, 3
	push r3
	ld r3, base_pointer, 2
	add r3, r1
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r3, 3
	push r3
	ld r3, base_pointer, 4
	add r3, r2
	push r3
	ld r3, base_pointer, 3
	sub r3, 4
	push r3
	ld r3, base_pointer, 2
	add r3, r1
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_468:
	mov r3, r2
	add r2, 1
	jmp .label_467
	.label_469:
	.label_464:
	mov r2, r1
	add r1, 1
	jmp .label_463
	.label_465:
	mov r1, 1
	.label_471:
	mov r2, r1
	cmp r2, 4
	jl .label_474
	jmp .label_473
	.label_474:
	mov r2, 2
	push r2
	ld r2, base_pointer, 4
	push r2
	ld r2, base_pointer, 3
	sub r2, r1
	push r2
	ld r2, base_pointer, 2
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r2, 2
	push r2
	ld r2, base_pointer, 4
	push r2
	ld r2, base_pointer, 3
	sub r2, r1
	push r2
	ld r2, base_pointer, 2
	add r2, 4
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r2, 2
	push r2
	ld r2, base_pointer, 4
	add r2, 4
	push r2
	ld r2, base_pointer, 3
	sub r2, r1
	push r2
	ld r2, base_pointer, 2
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r2, 2
	push r2
	ld r2, base_pointer, 4
	add r2, 4
	push r2
	ld r2, base_pointer, 3
	sub r2, r1
	push r2
	ld r2, base_pointer, 2
	add r2, 4
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r2, 1
	.label_475:
	mov r3, r2
	cmp r3, 4
	jl .label_478
	jmp .label_477
	.label_478:
	mov r3, 6
	push r3
	ld r3, base_pointer, 4
	push r3
	ld r3, base_pointer, 3
	sub r3, r1
	push r3
	ld r3, base_pointer, 2
	add r3, r2
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r3, 6
	push r3
	ld r3, base_pointer, 4
	add r3, r2
	push r3
	ld r3, base_pointer, 3
	sub r3, r1
	push r3
	ld r3, base_pointer, 2
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r3, 6
	push r3
	ld r3, base_pointer, 4
	add r3, r2
	push r3
	ld r3, base_pointer, 3
	sub r3, r1
	push r3
	ld r3, base_pointer, 2
	add r3, 4
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r3, 6
	push r3
	ld r3, base_pointer, 4
	add r3, 4
	push r3
	ld r3, base_pointer, 3
	sub r3, r1
	push r3
	ld r3, base_pointer, 2
	add r3, r2
	push r3
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_476:
	mov r3, r2
	add r2, 1
	jmp .label_475
	.label_477:
	.label_472:
	mov r2, r1
	add r1, 1
	jmp .label_471
	.label_473:
	mov r1, 5
	push r1
	ld r1, base_pointer, 4
	add r1, 3
	push r1
	ld r1, base_pointer, 3
	sub r1, 1
	push r1
	ld r1, base_pointer, 2
	add r1, 3
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 11
	push r1
	ld r1, base_pointer, 4
	add r1, 3
	push r1
	ld r1, base_pointer, 3
	sub r1, 1
	push r1
	ld r1, base_pointer, 2
	add r1, 2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 13
	push r1
	ld r1, base_pointer, 4
	push r1
	ld r1, base_pointer, 3
	sub r1, 2
	push r1
	ld r1, base_pointer, 2
	add r1, 2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 13
	push r1
	ld r1, base_pointer, 4
	add r1, 4
	push r1
	ld r1, base_pointer, 3
	sub r1, 2
	push r1
	ld r1, base_pointer, 2
	add r1, 2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	ld r1, base_pointer, 2
	cmp r1, 8
	jge .label_480
	jmp .label_479
	.label_480:
	mov r1, 1
	.label_482:
	mov r2, r1
	cmp r2, 4
	jl .label_485
	jmp .label_484
	.label_485:
	mov r2, 12
	push r2
	ld r2, base_pointer, 4
	add r2, r1
	push r2
	ld r2, base_pointer, 3
	sub r2, 1
	push r2
	ld r2, base_pointer, 2
	add r2, 3
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_483:
	mov r2, r1
	add r1, 1
	jmp .label_482
	.label_484:
	mov r1, 0
	push r1
	ld r1, base_pointer, 4
	add r1, 2
	push r1
	ld r1, base_pointer, 3
	sub r1, 1
	push r1
	ld r1, base_pointer, 2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 0
	push r1
	ld r1, base_pointer, 4
	add r1, 2
	push r1
	ld r1, base_pointer, 3
	sub r1, 2
	push r1
	ld r1, base_pointer, 2
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	jmp .label_481
	.label_479:
	mov r1, 1
	.label_486:
	mov r2, r1
	cmp r2, 4
	jl .label_489
	jmp .label_488
	.label_489:
	mov r2, 12
	push r2
	ld r2, base_pointer, 4
	add r2, r1
	push r2
	ld r2, base_pointer, 3
	sub r2, 1
	push r2
	ld r2, base_pointer, 2
	add r2, 1
	push r2
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_487:
	mov r2, r1
	add r1, 1
	jmp .label_486
	.label_488:
	mov r1, 0
	push r1
	ld r1, base_pointer, 4
	add r1, 2
	push r1
	ld r1, base_pointer, 3
	sub r1, 1
	push r1
	ld r1, base_pointer, 2
	add r1, 4
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	mov r1, 0
	push r1
	ld r1, base_pointer, 4
	add r1, 2
	push r1
	ld r1, base_pointer, 3
	sub r1, 2
	push r1
	ld r1, base_pointer, 2
	add r1, 4
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_481:
.exit_create_house:
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_create_pyramid:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	mov r2, 0
	.label_490:
	mov r1, r2
	ld r3, base_pointer, 5
	cmp r1, r3
	jl .label_493
	jmp .label_492
	.label_493:
	mov r1, 2
	ld r3, base_pointer, 5
	mull r1, r3
	sub r1, 1
	sub r1, r2
	mov r3, r1
	mov r4, r2
	.label_494:
	mov r1, r4
	cmp r1, r3
	jl .label_497
	jmp .label_496
	.label_497:
	mov r5, r2
	.label_498:
	mov r1, r5
	cmp r1, r3
	jl .label_501
	jmp .label_500
	.label_501:
	mov r1, 14
	push r1
	ld r1, base_pointer, 4
	add r1, r5
	push r1
	ld r1, base_pointer, 3
	sub r1, r2
	push r1
	ld r1, base_pointer, 2
	add r1, r4
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_499:
	mov r1, r5
	add r5, 1
	jmp .label_498
	.label_500:
	.label_495:
	mov r1, r4
	add r4, 1
	jmp .label_494
	.label_496:
	.label_491:
	mov r1, r2
	add r2, 1
	jmp .label_490
	.label_492:
.exit_create_pyramid:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_create_scene:
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r3
	push r4
	push r5
	mov r1, 0
	.label_502:
	mov r2, r1
	cmp r2, 24
	jl .label_505
	jmp .label_504
	.label_505:
	mov r2, 0
	.label_506:
	mov r3, r2
	cmp r3, 2
	jl .label_509
	jmp .label_508
	.label_509:
	mov r3, 0
	.label_510:
	mov r4, r3
	cmp r4, 24
	jl .label_513
	jmp .label_512
	.label_513:
	mov r4, r2
	cmp r4, 0
	je .label_515
	jmp .label_514
	.label_515:
	mov r4, 1
	push r4
	push r3
	mov r4, 6
	push r4
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	jmp .label_516
	.label_514:
	mov r4, 7
	push r4
	push r3
	mov r4, 7
	push r4
	push r1
	call __tptcc_fn_set_block
	add stack_pointer, 4
	.label_516:
	.label_511:
	mov r4, r3
	add r3, 1
	jmp .label_510
	.label_512:
	.label_507:
	mov r3, r2
	add r2, 1
	jmp .label_506
	.label_508:
	.label_503:
	mov r2, r1
	add r1, 1
	jmp .label_502
	.label_504:
	mov r1, 1
	push r1
	mov r1, 6
	push r1
	mov r1, 0
	push r1
	call __tptcc_fn_create_house
	add stack_pointer, 3
	mov r1, 10
	push r1
	mov r1, 6
	push r1
	mov r1, 0
	push r1
	call __tptcc_fn_create_house
	add stack_pointer, 3
	mov r1, 5
	push r1
	mov r1, 7
	push r1
	mov r1, 5
	push r1
	mov r1, 7
	push r1
	call __tptcc_fn_create_pyramid
	add stack_pointer, 4
	mov r1, 3
	push r1
	mov r1, 5
	push r1
	mov r1, 11
	push r1
	call __tptcc_fn_generate_tree
	add stack_pointer, 3
	mov r1, 9
	push r1
	mov r1, 5
	push r1
	mov r1, 20
	push r1
	call __tptcc_fn_generate_tree
	add stack_pointer, 3
	mov r1, 15
	push r1
	mov r1, 5
	push r1
	mov r1, 19
	push r1
	call __tptcc_fn_generate_tree
	add stack_pointer, 3
	mov r1, 19
	push r1
	mov r1, 6
	push r1
	mov r1, 19
	push r1
	call __tptcc_fn_create_house
	add stack_pointer, 3
.exit_create_scene:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop base_pointer
	ret
__tptcc_fn_main:
	sub stack_pointer, 13
	push base_pointer
	mov base_pointer, stack_pointer
	push r1
	push r2
	push r4
	push r3
	call __tptcc_fn_create_scene
	mov r1, 48
	push r1
	mov r1, 10
	push r1
	call __tptcc_fn_add_to_inventory
	add stack_pointer, 2
	mov r1, 3
	push r1
	mov r1, 12
	push r1
	call __tptcc_fn_add_to_inventory
	add stack_pointer, 2
	mov r1, 7
	push r1
	mov r1, 6
	push r1
	call __tptcc_fn_add_to_inventory
	add stack_pointer, 2
	add r1, base_pointer, 1
	mov r2, 8192
	sub r2, 512
	st r2, r1
	add r1, base_pointer, 2
	mov r2, 4608
	st r2, r1
	add r1, base_pointer, 3
	mov r2, 1024
	sub r2, 512
	st r2, r1
	add r1, base_pointer, 4
	mov r2, 0
	st r2, r1
	add r1, base_pointer, 4
	add r1, 1
	mov r2, 0
	st r2, r1
	add r1, base_pointer, 4
	add r1, 2
	mov r2, 0
	st r2, r1
	.label_517:
	mov r1, 1
	cmp r1, 0
	je .label_518
	.label_519:
	mov r1, 0
	st r1, base_pointer, 7
	mov r1, 0
	st r1, base_pointer, 8
	mov r1, 32
	st r1, base_pointer, 9
	add r1, base_pointer, 4
	push r1
	add r1, base_pointer, 7
	push r1
	call __tptcc_fn_rotate_vector
	add stack_pointer, 2
	mov r1, 2390
	push r1
	add r1, base_pointer, 7
	push r1
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_simple_raycast
	add stack_pointer, 3
	add r1, base_pointer, 8
	mov r2, 0
	st r2, r1
	mov r1, 32
	push r1
	add r1, base_pointer, 7
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	mov r1, 32
	st r1, base_pointer, 10
	mov r1, 0
	st r1, base_pointer, 11
	mov r1, 0
	st r1, base_pointer, 12
	add r1, base_pointer, 4
	push r1
	add r1, base_pointer, 10
	push r1
	call __tptcc_fn_rotate_vector
	add stack_pointer, 2
	add r1, base_pointer, 11
	mov r2, 0
	st r2, r1
	mov r1, 32
	push r1
	add r1, base_pointer, 10
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_camera_render
	add stack_pointer, 1
	mov r1, 8
	push r1
	call __tptcc_fn_draw_cursor
	add stack_pointer, 1
	mov r1, 210
	push r1
	mov r1, 26
	push r1
	call __tptcc_fn_draw_hotbar
	add stack_pointer, 2
	call __tptcc_fn_getchar
	mov r1, return_reg
	st r1, base_pointer, 13
	ld r1, base_pointer, 13
	cmp r1, 'w'
	je .label_521
	jmp .label_520
	.label_521:
	add r1, base_pointer, 7
	push r1
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_add_vector
	add stack_pointer, 2
	jmp .label_522
	.label_520:
	ld r1, base_pointer, 13
	cmp r1, 's'
	je .label_524
	jmp .label_523
	.label_524:
	mov r1, 65535
	push r1
	add r1, base_pointer, 7
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	add r1, base_pointer, 7
	push r1
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_add_vector
	add stack_pointer, 2
	jmp .label_525
	.label_523:
	ld r1, base_pointer, 13
	cmp r1, 'a'
	je .label_527
	jmp .label_526
	.label_527:
	mov r1, 65535
	push r1
	add r1, base_pointer, 10
	push r1
	call __tptcc_fn_scale_vector
	add stack_pointer, 2
	add r1, base_pointer, 10
	push r1
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_add_vector
	add stack_pointer, 2
	jmp .label_528
	.label_526:
	ld r1, base_pointer, 13
	cmp r1, 'd'
	je .label_530
	jmp .label_529
	.label_530:
	add r1, base_pointer, 10
	push r1
	add r1, base_pointer, 1
	push r1
	call __tptcc_fn_add_vector
	add stack_pointer, 2
	jmp .label_531
	.label_529:
	ld r1, base_pointer, 13
	cmp r1, 'q'
	je .label_533
	jmp .label_532
	.label_533:
	add r1, base_pointer, 2
	ld r2, r1
	mov r3, 1024
	add r2, r3
	st r2, r1
	jmp .label_534
	.label_532:
	ld r1, base_pointer, 13
	cmp r1, 'e'
	je .label_536
	jmp .label_535
	.label_536:
	add r1, base_pointer, 2
	ld r2, r1
	mov r3, 1024
	sub r2, r3
	st r2, r1
	jmp .label_537
	.label_535:
	ld r1, base_pointer, 13
	cmp r1, 'i'
	je .label_539
	jmp .label_538
	.label_539:
	add r1, base_pointer, 4
	add r2, base_pointer, 4
	ld r2, r2, 0
	add r2, 67
	mulh r3, r2, 40
	mul r4, r3, 1608
	sub r4, r2, r4
	cmp r4, 1608
	ja .label_541
	add r3, 1
	sub r4, 1608
	.label_541:
	st r4, r1
	jmp .label_540
	.label_538:
	ld r1, base_pointer, 13
	cmp r1, 'k'
	je .label_543
	jmp .label_542
	.label_543:
	add r1, base_pointer, 4
	ld r2, r1
	mov r3, 67
	sub r2, r3
	st r2, r1
	add r1, base_pointer, 4
	ld r1, r1, 0
	cmp r1, 0
	jl .label_546
	jmp .label_545
	.label_546:
	add r1, base_pointer, 4
	ld r2, r1
	mov r3, 1608
	add r2, r3
	st r2, r1
	jmp .label_547
	.label_545:
	.label_547:
	jmp .label_544
	.label_542:
	ld r1, base_pointer, 13
	cmp r1, 'j'
	je .label_549
	jmp .label_548
	.label_549:
	add r1, base_pointer, 4
	add r1, 1
	ld r2, r1
	mov r3, 67
	sub r2, r3
	st r2, r1
	add r1, base_pointer, 4
	ld r1, r1, 1
	cmp r1, 0
	jl .label_552
	jmp .label_551
	.label_552:
	add r1, base_pointer, 4
	add r1, 1
	ld r2, r1
	mov r3, 1608
	add r2, r3
	st r2, r1
	jmp .label_553
	.label_551:
	.label_553:
	jmp .label_550
	.label_548:
	ld r1, base_pointer, 13
	cmp r1, 'l'
	je .label_555
	jmp .label_554
	.label_555:
	add r1, base_pointer, 4
	add r1, 1
	add r2, base_pointer, 4
	add r2, 1
	ld r4, r2
	add r4, 67
	mulh r3, r4, 40
	mul r2, r3, 1608
	sub r2, r4, r2
	cmp r2, 1608
	ja .label_557
	add r3, 1
	sub r2, 1608
	.label_557:
	st r2, r1
	jmp .label_556
	.label_554:
	ld r2, base_pointer, 13
	cmp r2, 'r'
	je .label_559
	jmp .label_558
	.label_559:
	call __tptcc_fn_remove_block
	jmp .label_560
	.label_558:
	ld r2, base_pointer, 13
	cmp r2, 'f'
	je .label_562
	jmp .label_561
	.label_562:
	call __tptcc_fn_place_block
	jmp .label_563
	.label_561:
	ld r2, base_pointer, 13
	cmp r2, '0'
	jge .label_567
	jmp .label_564
	.label_567:
	ld r2, base_pointer, 13
	cmp r2, '9'
	jle .label_565
	jmp .label_564
	.label_565:
	mov r2, 2352
	add r2, 37
	ld r1, base_pointer, 13
	sub r1, '0'
	sub r1, 1
	st r1, r2
	jmp .label_566
	.label_564:
	.label_566:
	.label_563:
	.label_560:
	.label_556:
	.label_550:
	.label_544:
	.label_540:
	.label_537:
	.label_534:
	.label_531:
	.label_528:
	.label_525:
	.label_522:
	jmp .label_517
	.label_518:
.exit_main:
	pop r3
	pop r4
	pop r2
	pop r1
	pop base_pointer
	add stack_pointer, 13
	hlt
__tptcc_fn_print_unsigned_int:
	test r22, r22
	jnz .__print_unsigned_int_not_zero
	mov r22, '0'
	st r22, term_print
	jmp .__print_unsigned_int_exit
.__print_unsigned_int_not_zero:
	mov r23, 4		; p = 4
.__print_unsigned_int_fixed_point:
	mulh r24, r22, 52429	; q = (n * 52429) >> 16
	shr r24, 3		; q >>= 3
	mul r25, r24, 10		; d*q
	sub r22, r25		; remainder = n - d*q
	st r22, r23, .__print_unsigned_int_buf		
	sub r23, 1		; p--;
	movf r22, r24		; n = q
	jnz .__print_unsigned_int_fixed_point

	add r23, 1
.__print_unsigned_int_print_int:
	ld r22, r23, .__print_unsigned_int_buf
	add r22, '0'
	st r22, term_reg, term_base
	add r23, 1
	cmp r23, 5
	jne .__print_unsigned_int_print_int
	
.__print_unsigned_int_exit:
	ret
.__print_unsigned_int_buf:
	dw 0, 0, 0, 0, 0

__tptcc_fn_print_signed_int:
    cmp r22, 0
    jge .__print_signed_int_not_negative
    mov r23, '-'
    st r23, term_reg, term_base
	xor r22, 65535
    add r22, 1
.__print_signed_int_not_negative:
    call __tptcc_fn_print_unsigned_int
    ret
    
__tptcc_fn_print_char_array:
    ld r23, r22
    test r23, r23
    jz .__print_char_array_exit
    st r23, term_reg, term_base
    add r22, 1
    jmp __tptcc_fn_print_char_array
.__print_char_array_exit:
    ret

__tptcc_fn_putchar:
    st r22, term_reg, term_base
    ret

__tptcc_fn_getchar:
    ld return_reg, term_input
    test return_reg, return_reg
    jz __tptcc_fn_getchar
    ret

__tptcc_fn_getchar_nb:
    ld return_reg, term_input
    ret

__tptcc_fn_set_colour:
    ; r22 = background, r23 = foreground
    shl r22, 4
    add r22, r23
    st r22, term_colour
    ret

__tptcc_fn_set_text_colour:
    st r22, term_colour
    ret

__tptcc_fn_send_raw:
    st r22, r23
    ret

__tptcc_fn_set_zero_char:
    exh r23, r0, r23
    mov r22, r23, r22
    st r22, term_print_e
    exh r25, r0, r25
    mov r24, r25, r24
    st r24, term_print_o
    ret


__tptcc_fn_set_cursor:
    ; r22 = row, r23 = column
    shl r22, 5
    add r22, r23
    st r22, term_cursor
    ret

__tptcc_fn_scan_unsigned_int:
    mov r23, 0
__scan_unsigned_int_loop:
    call __tptcc_fn_getchar
    st return_reg, term_reg, term_base
    sub return_reg, '0'
    cmp return_reg, 9
    jg __scan_unsigned_int_not_digit
    cmp return_reg, 0
    jl __scan_unsigned_int_not_digit
    mull r23, 10
    add r23, return_reg
    jmp __scan_unsigned_int_loop
__scan_unsigned_int_not_digit:
    st r23, r22
    ret

__tptcc_fn_vscroll:
    mov r22, ' '
    st r22, term_raw
    ret

__tptcc_fn_hscroll:
    mov r22, ' '
    st r22, term_base
    ret

__tptcc_fn_set_terminal_mode:
    mov term_reg, r22
    ret

__tptcc_fn_get_terminal_mode:
    mov return_reg, term_reg
    ret

__tptcc_fn_plot:
    ; r22 = column/x, r23 = row/y, r24 = colour
    shl r23, 8
    add r23, r22
    st r23, r24, term_plot
    ret
