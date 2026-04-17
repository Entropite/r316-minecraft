// world is 24x24 with a depth of 8 (4 blocks are packed into each word)
int world[24][8][6];

int get_block(int x, int y, int z) {
    return (world[x][y][z >> 2] >> ((z & 3) * 4)) & 0xF;
}

void set_block(int x, int y, int z, int block) {
    register int shift = ((z & 3) * 4);
    world[x][y][z >> 2] &= ~(0xF << shift);
    world[x][y][z >> 2] |= (block << shift);
}

int grass[16][4] = {{43690, 43690, 43690, 43690},
{43690, 43690, 43690, 43690},
{43682, 8738, 8738, 8874},
{41506, 17476, 17476, 16938},
{8772, 17476, 17476, 17442},
{17476, 17476, 17476, 17476},
{17476, 17476, 29764, 17524},
{17476, 17476, 29764, 17527},
{17527, 17476, 17476, 17476},
{17476, 17476, 17476, 17476},
{17476, 17476, 17476, 17476},
{17476, 17476, 17476, 29764},
{17476, 30532, 17476, 29764},
{17476, 18292, 17476, 17476},
{17476, 17476, 17476, 17476},
{17476, 17476, 17476, 17476}};

int cobblestone[16][4] = {{30583, 30856, 34679, 30839},
{30583, 34935, 34680, 34935},
{34696, 34679, 2184, 2184},
{34824, 30584, 2184, 34680},
{30600, 30600, 34679, 34680},
{30600, 30600, 30583, 30592},
{30600, 34952, 34679, 30600},
{30856, 30600, 34952, 34935},
{30855, 30599, 30600, 2167},
{34935, 30839, 30600, 34679},
{34679, 34935, 30600, 34952},
{34952, 34935, 30856, 30856},
{30600, 34952, 34935, 30856},
{30599, 30592, 34679, 30592},
{30599, 30600, 34935, 30848},
{30600, 8, 30600, 136}};

int oak[16][4] = {{1092, 1092, 17476, 17476},
{1088, 1092, 16452, 17476},
{1088, 17412, 16452, 17476},
{16448, 17412, 16452, 17476},
{16452, 17476, 16452, 17476},
{17476, 17476, 16452, 1028},
{17476, 17472, 16452, 1028},
{17412, 17476, 16452, 17412},
{17412, 17472, 16448, 17412},
{17476, 17476, 16452, 17476},
{1028, 17412, 1092, 17476},
{1028, 17476, 1088, 17476},
{1028, 17412, 1088, 17476},
{1092, 17476, 17472, 17476},
{1092, 17472, 17472, 17476},
{17472, 17472, 17472, 17476}};

int leaf[16][4] = {{10530, 35225, 10649, 39058},
{10530, 39065, 10386, 10386},
{39209, 33321, 8738, 10530},
{8857, 37417, 8738, 10530},
{8745, 37417, 8857, 10530},
{8745, 33321, 8856, 10642},
{37528, 39202, 39202, 35202},
{10642, 38946, 37410, 39202},
{8738, 8738, 39209, 37417},
{8850, 10537, 35225, 39209},
{10648, 39049, 8857, 35225},
{10530, 39321, 37410, 10626},
{10530, 37417, 35202, 39202},
{10530, 37513, 35225, 37417},
{10648, 8857, 37410, 37528},
{8745, 37528, 10537, 39202}};

int ct_side[16][4] = {{3822, 57412, 17422, 61152},
{3822, 60928, 238, 61152},
{3822, 61152, 3822, 61152},
{1638, 26208, 1640, 34912},
{3822, 61152, 3816, 59616},
{3816, 61152, 3816, 35040},
{3816, 61152, 3823, 65504},
{1640, 26208, 1647, 65376},
{3816, 65248, 3822, 65504},
{3839, 65248, 3822, 65504},
{3822, 65248, 3822, 65504},
{1638, 26208, 1638, 28512},
{3822, 61152, 3822, 61408},
{3822, 61152, 3822, 61152},
{3822, 61152, 3822, 61152},
{1638, 26208, 1638, 26208}};

int ct_top[16][4] = {{0, 0, 0, 0},
{1632, 26214, 26214, 1632},
{1542, 26214, 26214, 24672},
{96, 0, 0, 1536},
{1632, 26118, 24678, 1632},
{1632, 26118, 24678, 1632},
{1632, 0, 0, 1632},
{1632, 26118, 24678, 1632},
{1632, 26118, 24678, 1632},
{1632, 0, 0, 1632},
{1632, 26118, 24678, 1632},
{1632, 26118, 24678, 1632},
{96, 0, 0, 1536},
{1542, 26214, 26214, 24672},
{1632, 26214, 26214, 1632},
{0, 0, 0, 0}};

int planks[16][4] = {{26214, 26214, 26214, 26216},
{26214, 26214, 26214, 26214},
{26214, 26214, 26214, 26216},
{34952, 34952, 34952, 34952},
{26214, 26216, 26214, 26214},
{26214, 26216, 26214, 26214},
{26214, 26216, 26214, 26214},
{34952, 34952, 34952, 34952},
{26214, 26214, 26214, 26216},
{26214, 26214, 26214, 26216},
{26214, 26214, 26214, 26216},
{34952, 34952, 34952, 34952},
{26214, 26216, 26216, 26214},
{26214, 26216, 26214, 26214},
{26214, 26214, 26214, 26214},
{34952, 34952, 34952, 34952}};

int stone[16][4] = {{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30856, 34679, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30600, 34935, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30584, 34951},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583}};

int coal_ore[16][4] = {{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30576, 119, 30583, 30583},
{30576, 7, 30464, 30583},
{30576, 0, 30464, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 119, 30583},
{30583, 30576, 7, 30583},
{30583, 30583, 30583, 30583},
{30576, 1911, 30576, 1911},
{30576, 30583, 0, 119},
{30576, 30583, 28679, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583}};

int iron_ore[16][4] = {{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583},
{30582, 26231, 30583, 30583},
{30582, 26215, 30566, 30583},
{30582, 26214, 30566, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 26231, 30583},
{30583, 30582, 26215, 30583},
{30583, 30583, 30583, 30583},
{30582, 26487, 30582, 26487},
{30582, 30583, 26214, 26231},
{30582, 30583, 30311, 30583},
{30583, 30583, 30583, 30583},
{30583, 30583, 30583, 30583}};

int furnace_side[16][4] = {{34952, 34952, 34952, 34952},
{34679, 30839, 30584, 34680},
{34679, 34935, 30600, 34936},
{34936, 34936, 30855, 30600},
{34951, 30599, 34935, 30584},
{34935, 30600, 34935, 30600},
{34951, 30584, 34951, 30856},
{34952, 30600, 30584, 34952},
{34935, 34951, 30583, 34952},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34952, 34952, 34952, 34952}};

int furnace_front[16][4] = {{34952, 34952, 34952, 34952},
{34952, 34952, 34952, 34952},
{34952, 34952, 34952, 34952},
{34952, 32768, 8, 34952},
{34952, 0, 0, 34952},
{34952, 0, 0, 2184},
{34944, 0, 0, 2184},
{34952, 34952, 34952, 34952},
{34952, 34952, 34952, 34952},
{34679, 30583, 30583, 30584},
{34679, 30583, 30583, 30584},
{34679, 30720, 135, 30584},
{34672, 0, 0, 1912},
{34672, 0, 0, 1912},
{34672, 0, 0, 1912},
{34952, 34952, 34952, 34952}};

int chest_side[16][4] = {{0, 0, 0, 0},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{0, 0, 0, 0},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{0, 0, 0, 0}};

int chest_front[16][4] = {{0, 0, 0, 0},
{1638, 26214, 26214, 26208},
{1638, 26216, 34406, 26208},
{1638, 26247, 30822, 26208},
{1638, 26247, 30822, 26208},
{0, 135, 34816, 0},
{1638, 26247, 34918, 26208},
{1638, 26216, 34406, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{1638, 26214, 26214, 26208},
{0, 0, 0, 0}};

int book_case_side[16][4] = {{26214, 26214, 26214, 26214},
{24576, 238, 0, 6},
{27840, 4590, 14, 57350},
{26483, 4590, 52238, 58166},
{27843, 4471, 52238, 59254},
{27843, 4471, 3278, 58166},
{27843, 4590, 3278, 58166},
{26214, 26214, 26214, 26214},
{26214, 26214, 26214, 26214},
{24576, 0, 0, 4358},
{24580, 52224, 3808, 4358},
{25668, 52224, 10108, 4406},
{25668, 52240, 10108, 4406},
{25668, 52242, 3820, 4406},
{25668, 52242, 3820, 4406},
{26214, 26214, 26214, 26214}};

int glass[16][4] = {{65535, 65535, 65535, 65535},
{63897, 39323, 39321, 39327},
{63903, 39353, 39321, 39327},
{63993, 39321, 39321, 39359},
{65433, 39321, 40857, 39839},
{63897, 39321, 63897, 47519},
{63897, 39327, 39321, 39327},
{63929, 39353, 39321, 39327},
{64409, 39321, 39321, 39327},
{63897, 39321, 63897, 39327},
{63897, 39327, 39321, 40863},
{63897, 39353, 39321, 63903},
{64409, 39321, 39327, 39327},
{63897, 39321, 39321, 39327},
{63897, 39321, 39321, 39327},
{65535, 65535, 65535, 65535}};

int bricks[16][4] = {{52431, 52428, 52431, 52428},
{52431, 52428, 52431, 52428},
{52431, 52428, 52431, 52428},
{65535, 65535, 65535, 65535},
{52428, 52431, 52428, 52431},
{52428, 52431, 52428, 52431},
{52428, 52431, 52428, 52431},
{65535, 65535, 65535, 65535},
{52431, 52428, 52431, 52428},
{52431, 52428, 52431, 52428},
{52431, 52428, 52431, 52428},
{65535, 65535, 65535, 65535},
{52428, 52431, 52428, 52431},
{52428, 52431, 52428, 52431},
{52428, 52431, 52428, 52431},
{65535, 65535, 65535, 65535}};



int quotient_table[] = {32767, 16384, 8192, 5461, 4096, 3277, 2731, 2341, 2048, 1820, 1638, 1489, 1365, 1260, 1170, 1092, 1024, 964, 910, 862, 819, 780, 745, 712, 683, 655, 630, 607, 585, 565, 546, 529, 512, 496, 482, 468, 455, 443, 431, 420, 410, 400, 390, 381, 372, 364, 356, 349, 341, 334, 328, 321, 315, 309, 303, 298, 293, 287, 282, 278, 273, 269, 264, 260, 256, 252, 248, 245, 241, 237, 234, 231, 228, 224, 221, 218, 216, 213, 210, 207, 205, 202, 200, 197, 195, 193, 191, 188, 186, 184, 182, 180, 178, 176, 174, 172};

int (*block_id_to_texture[])[4] = {((int(*)[4])0), grass, cobblestone, oak, leaf, ct_side, planks, stone, coal_ore, iron_ore, furnace_side, chest_side, book_case_side, glass, bricks};

enum BlockType {
    AIR = 0,
    GRASS = 1,
    COBBLESTONE = 2,
    OAK = 3,
    LEAF = 4,
    CRAFTING_TABLE = 5,
    PLANKS = 6,
    STONE = 7,
    COAL_ORE = 8,
    IRON_ORE = 9,
    FURNACE = 10,
    CHEST= 11,
    BOOK_CASE = 12,
    GLASS = 13,
    BRICKS = 14
};

struct Vector3 {
    int x, y, z;
};

struct Camera {
    struct Vector3 position;
    struct Vector3 rotation;
};

struct Surface {
    struct Vector3 block;
    struct Vector3 normal;
};

struct {
    int inventory[3][9];
    int hotbar[9];
    int selected_slot_row;
    int selected_slot_column;
} Inventory;

struct Surface hit;

int sqrt(int n) {
    register int hi = 255, lo = 0;
    register int num = n;
    if(num <= 255) {
        hi = num;
    }
    while (lo <= hi) {
        register int mid = (lo + hi) >> 1;
        register int mid_sq = mid * mid;
        if (mid_sq == num) {
            return mid;
        } else if (mid_sq < num) {
            lo = mid + 1;
        } else {
            hi = mid - 1;
        }
    }

    return hi;
}

void plot_square(int x, int y, int colour) {
    asm(
        "shl r1, 1"
        "shl r2, 9"
        "add r1, r2"
        "st r1, r3, term_plot"
        "add r1, 1"
        "st r1, r3, term_plot"
        "add r1, 0x100"
        "st r1, r3, term_plot"
        "sub r1, 1"
        "st r1, r3, term_plot"
        :r1=x, r2=y, r3=colour
        :
        :r1, r2, r3
    );
}


int sine_table[403] = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23, 23, 23, 24, 24, 24, 24, 24, 25, 25, 25, 25, 26, 26, 26, 26, 27, 27, 27, 27, 27, 28, 28, 28, 28, 29, 29, 29, 29, 30, 30, 30, 30, 30, 31, 31, 31, 31, 32, 32, 32, 32, 32, 33, 33, 33, 33, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 37, 37, 37, 37, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 46, 46, 46, 46, 46, 47, 47, 47, 47, 47, 47, 48, 48, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 51, 51, 51, 51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 57, 57, 57, 58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64};


int arithmetic_right_shift(int value, int shift) {
    if(value < 0) {
        return (value >> shift) | (0xFFFF << 16 - shift);
    }

    return value >> shift;
}

int sin(int angle) {
    // angle is [0, 1608)
    if(angle <= 402) {
        return sine_table[angle];
    } else if(angle <= 804) {
        return sine_table[804 - angle];
    } else if(angle <= 1206) {
        return -sine_table[angle - 804];
    } else {
        return -sine_table[1608 - angle];
    }
}

int cos(int angle) {
    return sin((angle + 402) % 1608);
}

void add_vector(struct Vector3 *vector, struct Vector3 *other) {
    vector->x += other->x;
    vector->y += other->y;
    vector->z += other->z;
}

void rotate_vector(struct Vector3 *vector, struct Vector3 *angle) {
    register int rx = angle->x;
    register int ry = angle->y;

    register int cos_ry = cos(ry);
    register int cos_rx = cos(rx);
    register int sin_ry = sin(ry);
    register int sin_rx = sin(rx);



    int new_z = (arithmetic_right_shift(vector->z * cos_ry, 6) * cos_rx - vector->x * sin_ry + arithmetic_right_shift(vector->y * cos_ry, 6) * sin_rx);
    new_z = arithmetic_right_shift(new_z, 6);
    int new_x = (arithmetic_right_shift(vector->z * sin_ry, 6) * cos_rx + vector->x * cos_ry + arithmetic_right_shift(vector->y * sin_ry, 6) * sin_rx);
    new_x = arithmetic_right_shift(new_x, 6);
    int new_y = (vector->y * cos_rx - vector->z * sin_rx);
    new_y = arithmetic_right_shift(new_y, 6);
    vector->z = new_z;
    vector->x = new_x;
    vector->y = new_y;
}

struct Vector3 default_hbasis = {58, 0, 0};
struct Vector3 default_vbasis = {0, 58, 0};

int get_vector_length(struct Vector3 *vector) {
    // gets vector length in q15.1
    register int x = vector->x << 1;
    register int y = vector->y << 1;
    register int z = vector->z << 1;

    return sqrt(x * x + y * y + z * z);
}

void scale_vector(struct Vector3 *vector, int scale) {
    vector->x *= scale;
    vector->y *= scale;
    vector->z *= scale;
}

void divide_vector(struct Vector3 *vector, int scale) {
    if(vector->x < 0) {
        vector->x = -((-vector->x) / scale);
    } else {
        vector->x /= scale;
    }
    if(vector->y < 0) {
        vector->y = -((-vector->y) / scale);
    } else {
        vector->y /= scale;
    }
    if(vector->z < 0) {
        vector->z = -((-vector->z) / scale);
    } else {
        vector->z /= scale;
    }
}



void get_basis_vectors(struct Camera *camera, struct Vector3 *hbasis, struct Vector3 *vbasis) {
    // provides the horisontal and vertical basis vectors for the camera in q7.8

    hbasis->x = default_hbasis.x;
    hbasis->y = default_hbasis.y;
    hbasis->z = default_hbasis.z;
    vbasis->x = default_vbasis.x;
    vbasis->y = default_vbasis.y;
    vbasis->z = default_vbasis.z;

    rotate_vector(hbasis, &camera->rotation);
    rotate_vector(vbasis, &camera->rotation);
    

    int hbasis_length = get_vector_length(hbasis);
    
    int vbasis_length = get_vector_length(vbasis);

    scale_vector(hbasis, (1 << 9) - 1);
    scale_vector(vbasis, (1 << 9) - 1);
    
    divide_vector(hbasis, hbasis_length);
    divide_vector(vbasis, vbasis_length);

}

void simple_raycast(struct Vector3 *origin, struct Vector3 *direction, struct Surface *hit) {
    int dx = direction->x;
    int dy = direction->y;
    int dz = direction->z;
    int ox = origin->x;
    int oy = origin->y;
    int oz = origin->z;
    
    register int rx = ox + dx;
    register int ry = oy + dy;
    register int rz = oz + dz;

    register int step_x = dx > 0 ? 1 : (dx < 0 ? -1 : 0);
    register int step_y = dy > 0 ? 1 : (dy < 0 ? -1 : 0);
    register int step_z = dz > 0 ? 1 : (dz < 0 ? -1 : 0);

    int adx = dx > 0 ? dx : -dx;
    int ady = dy > 0 ? dy : -dy;
    int adz = dz > 0 ? dz : -dz;


    register int delta_x = quotient_table[adx];
    register int delta_y = quotient_table[ady];
    register int delta_z = quotient_table[adz];

    register int vx = rx >> 10;
    register int vy = ry >> 10;
    register int vz = rz >> 10;

    int dist_x = 0;
    if(step_x > 0) {
        dist_x = ((vx + 1) << 10) - rx;
    } else if(step_x < 0) {
        dist_x = rx - (vx << 10);
    }

    int dist_y = 0;
    if(step_y > 0) {
        dist_y = ((vy + 1) << 10) - ry;
    } else if(step_y < 0) {
        dist_y = ry - (vy << 10);
    }
    int dist_z = 0;
    if(step_z > 0) {
        dist_z = ((vz + 1) << 10) - rz;
    } else if(step_z < 0) {
        dist_z = rz - (vz << 10);
    }

    register int tmax_x = adx == 0 ? (1 << 15) - 1 : (dist_x << 4) / adx;
    register int tmax_y = ady == 0 ? (1 << 15) - 1 : (dist_y << 4) / ady;
    register int tmax_z = adz == 0 ? (1 << 15) - 1 : (dist_z << 4) / adz;

    register int axis = 'x';
    while(1) {

        if(vx >= 24 || vx < 0 || vy >= 8 || vy < 0 || vz >= 24 || vz < 0) {
            hit->block.x = -1;
            return;
        }

        if(get_block(vx, vy, vz) > 0) {
            hit->block.x = vx;
            hit->block.y = vy;
            hit->block.z = vz;
            // clean normal vector
            hit->normal.x = 0;
            hit->normal.y = 0;
            hit->normal.z = 0;
            if(axis == 'x') {
                hit->normal.x = -step_x;
            } else if(axis == 'y') {
                hit->normal.y = -step_y;
            } else {
                hit->normal.z = -step_z;
            }

            return;
        }

        if(tmax_x <= tmax_y && tmax_x <= tmax_z) {
            axis = 'x';
            if(tmax_x == tmax_y) {
                vy += step_y;
                tmax_y += delta_y;
                axis = 'y';
            } else if(tmax_x == tmax_z) {
                vz += step_z;
                tmax_z += delta_z;
            }
            vx += step_x;
            tmax_x += delta_x;
            
        } else if(tmax_y <= tmax_z) {
            axis = 'y';
            if(tmax_y == tmax_z) {
                vz += step_z;
                tmax_z += delta_z;
                
            }
            vy += step_y;
            tmax_y += delta_y;
        } else {
            axis = 'z';
            vz += step_z;
            tmax_z += delta_z;
        }
    }

}


void camera_render(struct Camera *camera) {
    
    int ox = camera->position.x;
    int oy = camera->position.y;
    int oz = camera->position.z;

    struct Vector3 hbasis;
    struct Vector3 vbasis;
    get_basis_vectors(camera, &hbasis, &vbasis);

    struct Vector3 viewport_center = {0, 0, 57};

    rotate_vector(&viewport_center, &camera->rotation);
    

    for(register int y = 0; y < 116; y++) {
        for(register int x = 0; x < 116; x++) {
            int dx = (x - 58) * hbasis.x + (y - 58) * vbasis.x;
            int dy = (x - 58) * hbasis.y + (y - 58) * vbasis.y;
            int dz = (x - 58) * hbasis.z + (y - 58) * vbasis.z;

            dx = ((dx >> 8)  | (dx < 0 ? 0xFF00 : 0)) + viewport_center.x; 
            dy = ((dy >> 8) | (dy < 0 ? 0xFF00 : 0)) + viewport_center.y;
            dz = ((dz >> 8)  | (dz < 0 ? 0xFF00 : 0)) + viewport_center.z;
            
            int rx = ox + dx;
            int ry = oy + dy;
            int rz = oz + dz;
            if(rx < 0 || ry < 0 || rz < 0) {
                plot_square(x, y, BLUE);
                continue;
            }

            register int step_x = dx > 0 ? 1 : (dx < 0 ? -1 : 0);
            register int step_y = dy > 0 ? 1 : (dy < 0 ? -1 : 0);
            register int step_z = dz > 0 ? 1 : (dz < 0 ? -1 : 0);

            int adx = dx > 0 ? dx : -dx;
            int ady = dy > 0 ? dy : -dy;
            int adz = dz > 0 ? dz : -dz;


            register int delta_x = quotient_table[adx];
            register int delta_y = quotient_table[ady];
            register int delta_z = quotient_table[adz];

            register int vx = rx >> 10;
            register int vy = ry >> 10;
            register int vz = rz >> 10;

            int dist_x = 0;
            if(step_x > 0) {
                dist_x = ((vx + 1) << 10) - rx;
            } else if(step_x < 0) {
                dist_x = rx - (vx << 10);
            }

            int dist_y = 0;
            if(step_y > 0) {
                dist_y = ((vy + 1) << 10) - ry;
            } else if(step_y < 0) {
                dist_y = ry - (vy << 10);
            }
            int dist_z = 0;
            if(step_z > 0) {
                dist_z = ((vz + 1) << 10) - rz;
            } else if(step_z < 0) {
                dist_z = rz - (vz << 10);
            }

            register int tmax_x = adx == 0 ? (1 << 15) - 1 : (dist_x << 4) / adx;
            register int tmax_y = ady == 0 ? (1 << 15) - 1 : (dist_y << 4) / ady;
            register int tmax_z = adz == 0 ? (1 << 15) - 1 : (dist_z << 4) / adz;

            register char axis = 'x';
            while(1) {

                if(vx >= 24 || vx < 0 || vy >= 8 || vy < 0 || vz >= 24 || vz < 0) {
                    plot_square(x, y, BLUE);
                    break;
                }
                register int type = get_block(vx, vy, vz);
                if(type > 0) {

                    // Exception to the rule that the top texture prevails over the side textures in case of a tie
                    if(type == OAK && ((tmax_x - delta_x == tmax_y - delta_y) || (tmax_x - delta_x == tmax_z - delta_z))) {
                        axis = 'x';
                    }

                    int colour = 1;
                    int u = -1, v = -1;
                    if(axis == 'x') {
                        int prev_tmax = tmax_x - delta_x;
                        u = ((prev_tmax * dy) >> 4) + ry;
                        u = u & 1023;
                        u = u >> 6;
                        v = ((prev_tmax * dz) >> 4) + rz;
                        v = v & 1023;
                        v = v >> 6;
                        colour = block_id_to_texture[type][u][v >> 2] >> 4 * (v ^ 3);
                    }
                    else if(axis == 'y') {
                        // UV coords are needed for when the block is being focused on
                        int prev_tmax = tmax_y - delta_y;
                        u = ((prev_tmax * dx) >> 4) + rx;
                        u = u & 1023;
                        u = u >> 6;
                        v = ((prev_tmax * dz) >> 4) + rz;
                        v = v & 1023;
                        v = v >> 6;

                        if(type == GRASS) {
                            if(step_y < 0) {
                                colour = DARK_RED;
                            } else {
                                colour = GREEN;
                            }
                        } else if(type == OAK) {
                            colour = YELLOW;
                        } else if(type == CRAFTING_TABLE) {
                            if(step_y < 0) {
                                colour = YELLOW;
                            } else {
                                colour = ct_top[u][v >> 2] >> 4 * (v ^ 3);
                            }
                        } else if(type == FURNACE) {
                            colour = cobblestone[u][v >> 2] >> 4 * (v ^ 3);
                        } else if(type == CHEST) {
                            colour = DARK_YELLOW;
                        } else if(type == BOOK_CASE) {
                            colour = planks[u][v >> 2] >> 4 * (v ^ 3);
                        } else {
                            prev_tmax = tmax_y - delta_y;
                            u = ((prev_tmax * dx) >> 4) + rx;
                            u = u & 1023;
                            u = u >> 6;
                            v = ((prev_tmax * dz) >> 4) + rz;
                            v = v & 1023;
                            v = v >> 6;
                            colour = block_id_to_texture[type][u][v >> 2] >> 4 * (v ^ 3);
                        }
                    }
                    else if(axis == 'z') {
                        int prev_tmax = tmax_z - delta_z;
                        u = ((prev_tmax * dy) >> 4) + ry;
                        u = u & 1023;
                        u = u >> 6;
                        v = ((prev_tmax * dx) >> 4) + rx;
                        v = v & 1023;
                        v = v >> 6;

                        if((type == FURNACE || type == CHEST) && step_z == 1) {
                            if(type == FURNACE) {
                                colour = furnace_front[u][v >> 2] >> 4 * (v ^ 3);
                            } else {
                                colour = chest_front[u][v >> 2] >> 4 * (v ^ 3);
                            }
                        } else {
                            colour = block_id_to_texture[type][u][v >> 2] >> 4 * (v ^ 3);
                        }
                    }

                    if((hit.block.x == vx && hit.block.y == vy && hit.block.z == vz) && (u == 15 || u == 0 || v == 15 || v == 0)) {
                        colour = BLACK;
                    }
                    
                    colour &= 0xF;
                    if(colour != BLUE) { // BLUE is the transparent colour

                        plot_square(x, y, colour);
                        break;
                    }
                }

                if(tmax_x <= tmax_y && tmax_x <= tmax_z) {
                    axis = 'x';
                    if(tmax_x == tmax_y) {
                        vy += step_y;
                        tmax_y += delta_y;
                        axis = 'y';
                    } else if(tmax_x == tmax_z) {
                        vz += step_z;
                        tmax_z += delta_z;
                    }
                    vx += step_x;
                    tmax_x += delta_x;
                    
                } else if(tmax_y <= tmax_z) {
                    axis = 'y';
                    if(tmax_y == tmax_z) {
                        vz += step_z;
                        tmax_z += delta_z;
                        
                    }
                    vy += step_y;
                    tmax_y += delta_y;
                    
                } else {
                    axis = 'z';
                    vz += step_z;
                    tmax_z += delta_z;
                    
                }
            }

        }
    }
}

int numbers[] = {0x6999, 0x9996, 0x1351, 0x1113, 0xf111, 0xf88f, 0xf11f, 0x111f, 0x999f, 0x1111, 0xf88f, 0x111f, 0xf88c, 0xa99f, 0xf112, 0x2244, 0x6996, 0x9996, 0x6997, 0x1111};

void draw_compacted_sprite(int x, int y, int (*sprite)[4]) {
    for(register int i = 0; i < 16; i++) {
        for(register int j = 0; j < 4; j++) {
            register int encoded_pixel_data = sprite[i][j];
            for(register int k = 0; k < 4; k++) {
                register int pixel_data = (encoded_pixel_data >> 4 * (3 - k)) & 0xF;
                plot(x + j * 4 + k, y + i, pixel_data);
            }
        }

    }
}

void draw_digit(int digit, int x, int y) {
    register int top = numbers[digit << 1];
    register int bottom = numbers[(digit << 1) + 1];
    for(register int i = 0; i < 4; i++) {
        for(register int j = 0; j < 4; j++) {
            register int top_pixel = top >> (4 * (3 - j) + 3 - i) & 0x1;
            register int bottom_pixel = bottom >> (4 * (3 - j) + 3 - i) & 0x1;
            if(top_pixel) {
                plot(x + i, y + j, WHITE);
            }
            if(bottom_pixel) {
                plot(x + i, y + 4 + j, WHITE);
            }
        }
    }
}

void draw_item(int x, int y, int quantity, int (*sprite)[4]) {
    draw_compacted_sprite(x, y, sprite);
    int first = quantity / 10;
    int second = quantity - first * 10;
    if(first > 0) {
        draw_digit(first, x + 6, y + 8);
    }
    draw_digit(second, x + 11, y + 8);
}


void draw_cursor(int size) {
    register int hlow_x = 58 - (size >> 1);
    register int hhigh_x = 58 + (size >> 1);
    register int hlow_y = 58;
    register int hhigh_y = 58;
    for(register int i = hlow_x; i <= hhigh_x; i++) {
        for(register int j = hlow_y; j <= hhigh_y; j++) {
            plot_square(i, j, WHITE);
            plot_square(j, i, WHITE);
        }
    }
}

void generate_tree(int x, int y, int z) {
    for(register int i = 0; i < 3; i++) {
        set_block(x, y - i, z, 3);
    }

    for(register int i = -1; i < 2; i++) {
        for(register int j = -1; j < 2; j++) {
            for(register int k = 3; k < 5; k++) {
                set_block(x + i, y - k, z + j, 4);
            }
        }
    }
}

int max(int a, int b) {
    return a > b ? a : b;
}

int min(int a, int b) {
    return a < b ? a : b;
}

void add_to_inventory(int block_type, int quantity) {
    // find stack of block type
    for(register int i = 3; i >= 0; i--) {
        for(register int j = 0; j < 9; j++) {
            register int type = Inventory.inventory[i][j] >> 8;
            register int count = Inventory.inventory[i][j] & 0xFF;
            if(type == block_type && count < 64) {
                register int quantity_moved = min(64 - count, quantity);
                Inventory.inventory[i][j] += quantity_moved;
                quantity -= quantity_moved;
                if(quantity == 0) {
                    return;
                }
            }

            
        }
    }
    // find empty stack
    for(register int i = 3; i >= 0; i--) {
        for(register int j = 0; j < 9; j++) {
            if(Inventory.inventory[i][j] >> 8 == 0) {
                register int quantity_moved = min(64, quantity);
                Inventory.inventory[i][j] = (block_type << 8) | quantity_moved;
                quantity -= quantity_moved;
                if(quantity == 0) {
                    return;
                }
            }
        }
    }
}

void place_block() {
    register int block_type = Inventory.hotbar[Inventory.selected_slot_column] >> 8;
    if(hit.block.x >= 0 && block_type > 0) {
        set_block(hit.block.x + hit.normal.x, hit.block.y + hit.normal.y, hit.block.z + hit.normal.z, block_type);

        Inventory.hotbar[Inventory.selected_slot_column] -= 1;
        if((Inventory.hotbar[Inventory.selected_slot_column] & 0xFF) == 0) {
            Inventory.hotbar[Inventory.selected_slot_column] = 0;
        }
    }
}

void remove_block() {
    if(hit.block.x >= 0) {
        int type = get_block(hit.block.x, hit.block.y, hit.block.z);
        set_block(hit.block.x, hit.block.y, hit.block.z, 0);
        add_to_inventory(type, 1);
    }
}

void draw_rectangle(int x, int y, int width, int height, int colour) {
    register int col = colour;
    for(register int i = 0; i < height; i++) {
        for(register int j = 0; j < width; j++) {
            plot(x + j, y + i,  col);
        }
    }
}
// default corrds: 6, 210
void draw_hotbar(int x, int y) {
    register int rx = x;
    register int ry = y;
    draw_rectangle(rx, ry, 184, 2, DARK_GREY);
    draw_rectangle(rx, ry + 18, 184, 2, DARK_GREY);
    draw_rectangle(rx + 180, ry + 2, 4, 16, DARK_GREY);

    draw_rectangle(Inventory.selected_slot_column * 20 +rx, ry, 24, 20, WHITE);
    for(register int i = 0; i < 9; i++) {
        register int type = Inventory.hotbar[i] >> 8;
        if(type > 0) {
            draw_item(i * 20 + 4 + rx, 2 + ry, Inventory.hotbar[i] & 0xFF, type == FURNACE ? furnace_front : block_id_to_texture[type]); // demo hack so the furnace sprite doesn't look weird
        } else {
            draw_rectangle(i * 20 + 4 + rx, 2 + ry, 16, 16, GREY);
        }
        if(i == Inventory.selected_slot_column || i - 1 == Inventory.selected_slot_column) {
            draw_rectangle(i * 20 + rx, 2 + ry, 4, 16, WHITE);
        } else {
            draw_rectangle(i * 20 + rx, 2 + ry, 4, 16, DARK_GREY);
        }
    }
}

void create_house(int x, int y, int z) {
    for(register int i = 0; i < 5; i++) {
        for(register int j = 0; j < 5; j++) {
            set_block(x + i, y, z + j, COBBLESTONE);
            set_block(x + i, y - 4, z + j, OAK);
        }
    }
    for(register int i = 1; i < 4; i++) {
        set_block(x, y - i, z, COBBLESTONE);
        set_block(x + 4, y - i, z, COBBLESTONE);
        set_block(x, y - i, z + 4, COBBLESTONE);
        set_block(x + 4, y - i, z + 4, COBBLESTONE);
        for(register int j = 1; j < 4; j++) {
            set_block(x + j, y - i, z, PLANKS);
            set_block(x, y - i, z + j, PLANKS);
            set_block(x + 4, y - i, z + j, PLANKS);
            set_block(x + j, y - i, z + 4, PLANKS);
        }
    }

    set_block(x + 3, y - 1, z + 3, CRAFTING_TABLE);
    set_block(x + 2, y - 1, z + 3, CHEST);

    set_block(x + 2, y - 2, z, GLASS);
    set_block(x + 2, y - 2, z + 4, GLASS);

    if(x >= 8) {
        for(register int i = 1; i < 4; i++) {
            set_block(x + 3, y - 1, z + i, BOOK_CASE);
        }

        set_block(x, y - 1, z + 2, AIR);
        set_block(x, y - 2, z + 2, AIR);
    } else {
        for(register int i = 1; i < 4; i++) {
            set_block(x + 1, y - 1, z + i, BOOK_CASE);
        }

        set_block(x+4, y - 1, z + 2, AIR);
        set_block(x+4, y - 2, z + 2, AIR);
    }
}

void create_pyramid(int x, int y, int z, int height) {
    for(register int i = 0; i < height; i++) {
        register int limit = (2 * height - 1) - i;
        for(register int j = i; j < limit; j++) {
            for(register int k = i; k < limit; k++) {
            set_block(x + j, y - i, z + k, BRICKS);
            }
        }
    }
}

void create_scene() {
    for(register int i = 0; i < 24; i++) {
        for(register int j = 0; j < 2; j++) {
            for(register int k = 0; k < 24; k++) {
                if(j == 0) {
                    set_block(i, 6, k, GRASS);
                } else {
                    set_block(i, 7, k, STONE);
                }
            }
        }
    }

    create_house(0, 6, 1);
    create_house(0, 6, 10);
    create_pyramid(7, 5, 7, 5);
    generate_tree(11, 5, 3);
    generate_tree(20, 5, 9);
    generate_tree(19, 5, 15);
    create_house(19, 6, 19);
}

int main() {

    create_scene();

    add_to_inventory(FURNACE, 48);
    add_to_inventory(BOOK_CASE, 3);
    add_to_inventory(PLANKS, 7);

    struct Camera camera;
    camera.position.x = 8192 - 512;
    camera.position.y = 4096 + 512;
    camera.position.z = 1024 - 512;
    camera.rotation.x = 0;
    camera.rotation.y = 0;
    camera.rotation.z = 0;

    while(1) {
        struct Vector3 forward = {0, 0, 32};

        rotate_vector(&forward, &camera.rotation);
        simple_raycast(&camera.position, &forward, &hit);

        forward.y = 0;
        scale_vector(&forward, 32);

        struct Vector3 right = {32, 0, 0};
        rotate_vector(&right, &camera.rotation);
        right.y = 0;
        scale_vector(&right, 32);


        camera_render(&camera);

        draw_cursor(8);
        draw_hotbar(26, 210);
        char next = getchar();
        if(next == 'w') {
            add_vector(&camera.position, &forward);
        } else if(next == 's') {
            scale_vector(&forward, -1);
            add_vector(&camera.position, &forward);
        } else if(next == 'a') {
            scale_vector(&right, -1);
            add_vector(&camera.position, &right);
        } else if(next == 'd') {
            add_vector(&camera.position, &right);
        } else if(next == 'q') {
            camera.position.y += 1024;
        } else if(next == 'e') {
            camera.position.y -= 1024;
        } else if(next == 'i') {
            camera.rotation.x = (camera.rotation.x + 67) % 1608;
        } else if(next == 'k') {
            camera.rotation.x -= 67;
            if(camera.rotation.x < 0) {
                camera.rotation.x += 1608;
            }
        } else if(next == 'j') {
            camera.rotation.y -= 67;
            if(camera.rotation.y < 0) {
                camera.rotation.y += 1608;
            }
        } else if(next == 'l') {
            camera.rotation.y = (camera.rotation.y + 67) % 1608;
        } else if(next == 'r') {
            remove_block();
        } else if(next == 'f') {
            place_block();
        } else if(next >= '0' && next <= '9') {
            Inventory.selected_slot_column = next - '0' - 1;
        }
    }
}