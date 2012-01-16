
/*
 ** License Applicability. Except to the extent portions of this file are
 ** made subject to an alternative license as permitted in the SGI Free
 ** Software License B, Version 1.1 (the "License"), the contents of this
 ** file are subject only to the provisions of the License. You may not use
 ** this file except in compliance with the License. You may obtain a copy
 ** of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
 ** Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
 ** 
 ** http://oss.sgi.com/projects/FreeB
 ** 
 ** Note that, as provided in the License, the Software is distributed on an
 ** "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
 ** DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
 ** CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
 ** PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
 ** 
 ** Original Code. The Original Code is: OpenGL Sample Implementation,
 ** Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
 ** Inc. The Original Code is Copyright (c) 1991-2004 Silicon Graphics, Inc.
 ** Copyright in any portions created by third parties is as indicated
 ** elsewhere herein. All Rights Reserved.
 ** 
 ** Additional Notice Provisions: This software was created using the
 ** OpenGL(R) version 1.2.1 Sample Implementation published by SGI, but has
 ** not been independently verified as being compliant with the OpenGL(R)
 ** version 1.2.1 Specification.
 */

private{
alias uint      GLenum;
alias ubyte     GLboolean;
alias uint      GLbitfield;
alias void      GLvoid;
alias byte      GLbyte;
alias short     GLshort;
alias int       GLint;
alias ubyte     GLubyte;
alias ushort    GLushort;
alias uint      GLuint;
alias int       GLsizei;
alias float     GLfloat;
alias float     GLclampf;
alias double    GLdouble;
alias double    GLclampd;
alias char      GLchar;
alias ptrdiff_t GLintptr;
alias ptrdiff_t GLsizeiptr;
}

private import std.loader;
/*
 * Constants
 */
/*
 * ARB Extensions
 */
// 1 - GL_ARB_multitexture
const uint GL_TEXTURE0_ARB				= 0x84C0;
const uint GL_TEXTURE1_ARB				= 0x84C1;
const uint GL_TEXTURE2_ARB				= 0x84C2;
const uint GL_TEXTURE3_ARB				= 0x84C3;
const uint GL_TEXTURE4_ARB				= 0x84C4;
const uint GL_TEXTURE5_ARB				= 0x84C5;
const uint GL_TEXTURE6_ARB				= 0x84C6;
const uint GL_TEXTURE7_ARB				= 0x84C7;
const uint GL_TEXTURE8_ARB				= 0x84C8;
const uint GL_TEXTURE9_ARB				= 0x84C9;
const uint GL_TEXTURE10_ARB				= 0x84CA;
const uint GL_TEXTURE11_ARB				= 0x84CB;
const uint GL_TEXTURE12_ARB				= 0x84CC;
const uint GL_TEXTURE13_ARB				= 0x84CD;
const uint GL_TEXTURE14_ARB				= 0x84CE;
const uint GL_TEXTURE15_ARB				= 0x84CF;
const uint GL_TEXTURE16_ARB				= 0x84D0;
const uint GL_TEXTURE17_ARB				= 0x84D1;
const uint GL_TEXTURE18_ARB				= 0x84D2;
const uint GL_TEXTURE19_ARB				= 0x84D3;
const uint GL_TEXTURE20_ARB				= 0x84D4;
const uint GL_TEXTURE21_ARB				= 0x84D5;
const uint GL_TEXTURE22_ARB				= 0x84D6;
const uint GL_TEXTURE23_ARB				= 0x84D7;
const uint GL_TEXTURE24_ARB				= 0x84D8;
const uint GL_TEXTURE25_ARB				= 0x84D9;
const uint GL_TEXTURE26_ARB				= 0x84DA;
const uint GL_TEXTURE27_ARB				= 0x84DB;
const uint GL_TEXTURE28_ARB				= 0x84DC;
const uint GL_TEXTURE29_ARB				= 0x84DD;
const uint GL_TEXTURE30_ARB				= 0x84DE;
const uint GL_TEXTURE31_ARB				= 0x84DF;
const uint GL_ACTIVE_TEXTURE_ARB			= 0x84E0;
const uint GL_CLIENT_ACTIVE_TEXTURE_ARB		= 0x84E1;
const uint GL_MAX_TEXTURE_UNITS_ARB			= 0x84E2;

// 2 - GL_ARB_transpose_matrix
const uint GL_TRANSPOSE_MODELVIEW_MATRIX_ARB		= 0x84E3;
const uint GL_TRANSPOSE_PROJECTION_MATRIX_ARB		= 0x84E4;
const uint GL_TRANSPOSE_TEXTURE_MATRIX_ARB		= 0x84E5;
const uint GL_TRANSPOSE_COLOR_MATRIX_ARB		= 0x84E6;

// 5 - GL_ARB_multisample
const uint GL_MULTISAMPLE_ARB				= 0x809D;
const uint GL_SAMPLE_ALPHA_TO_COVERAGE_ARB		= 0x809E;
const uint GL_SAMPLE_ALPHA_TO_ONE_ARB			= 0x809F;
const uint GL_SAMPLE_COVERAGE_ARB			= 0x80A0;
const uint GL_SAMPLE_BUFFERS_ARB			= 0x80A8;
const uint GL_SAMPLES_ARB				= 0x80A9;
const uint GL_SAMPLE_COVERAGE_VALUE_ARB		= 0x80AA;
const uint GL_SAMPLE_COVERAGE_INVERT_ARB		= 0x80AB;
const uint GL_MULTISAMPLE_BIT_ARB			= 0x20000000;

// 7 - GL_ARB_texture_cube_map
const uint GL_NORMAL_MAP_ARB				= 0x8511;
const uint GL_REFLECTION_MAP_ARB			= 0x8512;
const uint GL_TEXTURE_CUBE_MAP_ARB			= 0x8513;
const uint GL_TEXTURE_BINDING_CUBE_MAP_ARB		= 0x8514;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB		= 0x8515;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB		= 0x8516;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB		= 0x8517;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB		= 0x8518;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB		= 0x8519;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB		= 0x851A;
const uint GL_PROXY_TEXTURE_CUBE_MAP_ARB		= 0x851B;
const uint GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB		= 0x851C;

// 12 - GL_ARB_texture_compression
const uint GL_COMPRESSED_ALPHA_ARB			= 0x84E9;
const uint GL_COMPRESSED_LUMINANCE_ARB		= 0x84EA;
const uint GL_COMPRESSED_LUMINANCE_ALPHA_ARB		= 0x84EB;
const uint GL_COMPRESSED_INTENSITY_ARB		= 0x84EC;
const uint GL_COMPRESSED_RGB_ARB			= 0x84ED;
const uint GL_COMPRESSED_RGBA_ARB			= 0x84EE;
const uint GL_TEXTURE_COMPRESSION_HINT_ARB		= 0x84EF;
const uint GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB	= 0x86A0;
const uint GL_TEXTURE_COMPRESSED_ARB			= 0x86A1;
const uint GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB	= 0x86A2;
const uint GL_COMPRESSED_TEXTURE_FORMATS_ARB		= 0x86A3;

// 13 - GL_ARB_texture_border_clamp
const uint GL_CLAMP_TO_BORDER_ARB			= 0x812D;

// 14 - GL_ARB_point_parameters
const uint GL_POINT_SIZE_MIN_ARB			= 0x8126;
const uint GL_POINT_SIZE_MAX_ARB			= 0x8127;
const uint GL_POINT_FADE_THRESHOLD_SIZE_ARB		= 0x8128;
const uint GL_POINT_DISTANCE_ATTENUATION_ARB		= 0x8129;

// 15 - GL_ARB_vertex_blend
const uint GL_MAX_VERTEX_UNITS_ARB			= 0x86A4;
const uint GL_ACTIVE_VERTEX_UNITS_ARB			= 0x86A5;
const uint GL_WEIGHT_SUM_UNITY_ARB			= 0x86A6;
const uint GL_VERTEX_BLEND_ARB			= 0x86A7;
const uint GL_CURRENT_WEIGHT_ARB			= 0x86A8;
const uint GL_WEIGHT_ARRAY_TYPE_ARB			= 0x86A9;
const uint GL_WEIGHT_ARRAY_STRIDE_ARB			= 0x86AA;
const uint GL_WEIGHT_ARRAY_SIZE_ARB			= 0x86AB;
const uint GL_WEIGHT_ARRAY_POINTER_ARB		= 0x86AC;
const uint GL_WEIGHT_ARRAY_ARB			= 0x86AD;
const uint GL_MODELVIEW0_ARB				= 0x1700;
const uint GL_MODELVIEW1_ARB				= 0x850A;
const uint GL_MODELVIEW2_ARB				= 0x8722;
const uint GL_MODELVIEW3_ARB				= 0x8723;
const uint GL_MODELVIEW4_ARB				= 0x8724;
const uint GL_MODELVIEW5_ARB				= 0x8725;
const uint GL_MODELVIEW6_ARB				= 0x8726;
const uint GL_MODELVIEW7_ARB				= 0x8727;
const uint GL_MODELVIEW8_ARB				= 0x8728;
const uint GL_MODELVIEW9_ARB				= 0x8729;
const uint GL_MODELVIEW10_ARB				= 0x872A;
const uint GL_MODELVIEW11_ARB				= 0x872B;
const uint GL_MODELVIEW12_ARB				= 0x872C;
const uint GL_MODELVIEW13_ARB				= 0x872D;
const uint GL_MODELVIEW14_ARB				= 0x872E;
const uint GL_MODELVIEW15_ARB				= 0x872F;
const uint GL_MODELVIEW16_ARB				= 0x8730;
const uint GL_MODELVIEW17_ARB				= 0x8731;
const uint GL_MODELVIEW18_ARB				= 0x8732;
const uint GL_MODELVIEW19_ARB				= 0x8733;
const uint GL_MODELVIEW20_ARB				= 0x8734;
const uint GL_MODELVIEW21_ARB				= 0x8735;
const uint GL_MODELVIEW22_ARB				= 0x8736;
const uint GL_MODELVIEW23_ARB				= 0x8737;
const uint GL_MODELVIEW24_ARB				= 0x8738;
const uint GL_MODELVIEW25_ARB				= 0x8739;
const uint GL_MODELVIEW26_ARB				= 0x873A;
const uint GL_MODELVIEW27_ARB				= 0x873B;
const uint GL_MODELVIEW28_ARB				= 0x873C;
const uint GL_MODELVIEW29_ARB				= 0x873D;
const uint GL_MODELVIEW30_ARB				= 0x873E;
const uint GL_MODELVIEW31_ARB				= 0x873F;

// 16 - GL_ARB_matrix_palette
const uint GL_MATRIX_PALETTE_ARB			= 0x8840;
const uint GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB	= 0x8841;
const uint GL_MAX_PALETTE_MATRICES_ARB		= 0x8842;
const uint GL_CURRENT_PALETTE_MATRIX_ARB		= 0x8843;
const uint GL_MATRIX_INDEX_ARRAY_ARB			= 0x8844;
const uint GL_CURRENT_MATRIX_INDEX_ARB		= 0x8845;
const uint GL_MATRIX_INDEX_ARRAY_SIZE_ARB		= 0x8846;
const uint GL_MATRIX_INDEX_ARRAY_TYPE_ARB		= 0x8847;
const uint GL_MATRIX_INDEX_ARRAY_STRIDE_ARB		= 0x8848;
const uint GL_MATRIX_INDEX_ARRAY_POINTER_ARB		= 0x8849;

// 17 - GL_ARB_texture_env_combine
const uint GL_COMBINE_ARB				= 0x8570;
const uint GL_COMBINE_RGB_ARB				= 0x8571;
const uint GL_COMBINE_ALPHA_ARB			= 0x8572;
const uint GL_SOURCE0_RGB_ARB				= 0x8580;
const uint GL_SOURCE1_RGB_ARB				= 0x8581;
const uint GL_SOURCE2_RGB_ARB				= 0x8582;
const uint GL_SOURCE0_ALPHA_ARB			= 0x8588;
const uint GL_SOURCE1_ALPHA_ARB			= 0x8589;
const uint GL_SOURCE2_ALPHA_ARB			= 0x858A;
const uint GL_OPERAND0_RGB_ARB			= 0x8590;
const uint GL_OPERAND1_RGB_ARB			= 0x8591;
const uint GL_OPERAND2_RGB_ARB			= 0x8592;
const uint GL_OPERAND0_ALPHA_ARB			= 0x8598;
const uint GL_OPERAND1_ALPHA_ARB			= 0x8599;
const uint GL_OPERAND2_ALPHA_ARB			= 0x859A;
const uint GL_RGB_SCALE_ARB				= 0x8573;
const uint GL_ADD_SIGNED_ARB				= 0x8574;
const uint GL_INTERPOLATE_ARB				= 0x8575;
const uint GL_SUBTRACT_ARB				= 0x84E7;
const uint GL_CONSTANT_ARB				= 0x8576;
const uint GL_PRIMARY_COLOR_ARB			= 0x8577;
const uint GL_PREVIOUS_ARB				= 0x8578;

// 19 - GL_ARB_texture_env_dot3
const uint GL_DOT3_RGB_ARB				= 0x86AE;
const uint GL_DOT3_RGBA_ARB				= 0x86AF;

// 21 - GL_ARB_texture_mirrored_repeat
const uint GL_MIRRORED_REPEAT_ARB			= 0x8370;

// 22 - GL_ARB_depth_texture
const uint GL_DEPTH_COMPONENT16_ARB			= 0x81A5;
const uint GL_DEPTH_COMPONENT24_ARB			= 0x81A6;
const uint GL_DEPTH_COMPONENT32_ARB			= 0x81A7;
const uint GL_TEXTURE_DEPTH_SIZE_ARB			= 0x884A;
const uint GL_DEPTH_TEXTURE_MODE_ARB			= 0x884B;

// 23 - GL_ARB_shadow
const uint GL_TEXTURE_COMPARE_MODE_ARB		= 0x884C;
const uint GL_TEXTURE_COMPARE_FUNC_ARB		= 0x884D;
const uint GL_COMPARE_R_TO_TEXTURE_ARB		= 0x884E;

// 24 - GL_ARB_shadow_ambient
const uint GL_TEXTURE_COMPARE_FAIL_VALUE_ARB		= 0x80BF;

// 26 - GL_ARB_vertex_program
const uint GL_COLOR_SUM_ARB				= 0x8458;
const uint GL_VERTEX_PROGRAM_ARB			= 0x8620;
const uint GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB		= 0x8622;
const uint GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB		= 0x8623;
const uint GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB		= 0x8624;
const uint GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB		= 0x8625;
const uint GL_CURRENT_VERTEX_ATTRIB_ARB		= 0x8626;
const uint GL_PROGRAM_LENGTH_ARB			= 0x8627;
const uint GL_PROGRAM_STRING_ARB			= 0x8628;
const uint GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB	= 0x862E;
const uint GL_MAX_PROGRAM_MATRICES_ARB		= 0x862F;
const uint GL_CURRENT_MATRIX_STACK_DEPTH_ARB		= 0x8640;
const uint GL_CURRENT_MATRIX_ARB			= 0x8641;
const uint GL_VERTEX_PROGRAM_POINT_SIZE_ARB		= 0x8642;
const uint GL_VERTEX_PROGRAM_TWO_SIDE_ARB		= 0x8643;
const uint GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB		= 0x8645;
const uint GL_PROGRAM_ERROR_POSITION_ARB		= 0x864B;
const uint GL_PROGRAM_BINDING_ARB			= 0x8677;
const uint GL_MAX_VERTEX_ATTRIBS_ARB			= 0x8869;
const uint GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB	= 0x886A;
const uint GL_PROGRAM_ERROR_STRING_ARB		= 0x8874;
const uint GL_PROGRAM_FORMAT_ASCII_ARB		= 0x8875;
const uint GL_PROGRAM_FORMAT_ARB			= 0x8876;
const uint GL_PROGRAM_INSTRUCTIONS_ARB		= 0x88A0;
const uint GL_MAX_PROGRAM_INSTRUCTIONS_ARB		= 0x88A1;
const uint GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB		= 0x88A2;
const uint GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB	= 0x88A3;
const uint GL_PROGRAM_TEMPORARIES_ARB			= 0x88A4;
const uint GL_MAX_PROGRAM_TEMPORARIES_ARB		= 0x88A5;
const uint GL_PROGRAM_NATIVE_TEMPORARIES_ARB		= 0x88A6;
const uint GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB	= 0x88A7;
const uint GL_PROGRAM_PARAMETERS_ARB			= 0x88A8;
const uint GL_MAX_PROGRAM_PARAMETERS_ARB		= 0x88A9;
const uint GL_PROGRAM_NATIVE_PARAMETERS_ARB		= 0x88AA;
const uint GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB	= 0x88AB;
const uint GL_PROGRAM_ATTRIBS_ARB			= 0x88AC;
const uint GL_MAX_PROGRAM_ATTRIBS_ARB			= 0x88AD;
const uint GL_PROGRAM_NATIVE_ATTRIBS_ARB		= 0x88AE;
const uint GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB		= 0x88AF;
const uint GL_PROGRAM_ADDRESS_REGISTERS_ARB		=  0x88B0;
const uint GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB	= 0x88B1;
const uint GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB	= 0x88B2;
const uint GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB= 0x88B3;
const uint GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB	= 0x88B4;
const uint GL_MAX_PROGRAM_ENV_PARAMETERS_ARB		= 0x88B5;
const uint GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB		= 0x88B6;
const uint GL_TRANSPOSE_CURRENT_MATRIX_ARB		= 0x88B7;
const uint GL_MATRIX0_ARB				= 0x88C0;
const uint GL_MATRIX1_ARB				= 0x88C1;
const uint GL_MATRIX2_ARB				= 0x88C2;
const uint GL_MATRIX3_ARB				= 0x88C3;
const uint GL_MATRIX4_ARB				= 0x88C4;
const uint GL_MATRIX5_ARB				= 0x88C5;
const uint GL_MATRIX6_ARB				= 0x88C6;
const uint GL_MATRIX7_ARB				= 0x88C7;
const uint GL_MATRIX8_ARB				= 0x88C8;
const uint GL_MATRIX9_ARB				= 0x88C9;
const uint GL_MATRIX10_ARB				= 0x88CA;
const uint GL_MATRIX11_ARB				= 0x88CB;
const uint GL_MATRIX12_ARB				= 0x88CC;
const uint GL_MATRIX13_ARB				= 0x88CD;
const uint GL_MATRIX14_ARB				= 0x88CE;
const uint GL_MATRIX15_ARB				= 0x88CF;
const uint GL_MATRIX16_ARB				= 0x88D0;
const uint GL_MATRIX17_ARB				= 0x88D1;
const uint GL_MATRIX18_ARB				= 0x88D2;
const uint GL_MATRIX19_ARB				= 0x88D3;
const uint GL_MATRIX20_ARB				= 0x88D4;
const uint GL_MATRIX21_ARB				= 0x88D5;
const uint GL_MATRIX22_ARB				= 0x88D6;
const uint GL_MATRIX23_ARB				= 0x88D7;
const uint GL_MATRIX24_ARB				= 0x88D8;
const uint GL_MATRIX25_ARB				= 0x88D9;
const uint GL_MATRIX26_ARB				= 0x88DA;
const uint GL_MATRIX27_ARB				= 0x88DB;
const uint GL_MATRIX28_ARB				= 0x88DC;
const uint GL_MATRIX29_ARB				= 0x88DD;
const uint GL_MATRIX30_ARB				= 0x88DE;
const uint GL_MATRIX31_ARB				= 0x88DF;

// 27 - GL_ARB_fragment_program
const uint GL_FRAGMENT_PROGRAM_ARB			= 0x8804;
const uint GL_PROGRAM_ALU_INSTRUCTIONS_ARB		= 0x8805;
const uint GL_PROGRAM_TEX_INSTRUCTIONS_ARB		= 0x8806;
const uint GL_PROGRAM_TEX_INDIRECTIONS_ARB		= 0x8807;
const uint GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB	= 0x8808;
const uint GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB	= 0x8809;
const uint GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB	= 0x880A;
const uint GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB	= 0x880B;
const uint GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB	= 0x880C;
const uint GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB	= 0x880D;
const uint GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB	= 0x880E;
const uint GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB	= 0x880F;
const uint GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB	= 0x8810;
const uint GL_MAX_TEXTURE_COORDS_ARB			= 0x8871;
const uint GL_MAX_TEXTURE_IMAGE_UNITS_ARB		= 0x8872;

// 28 - GL_ARB_vertex_buffer_object
const uint GL_BUFFER_SIZE_ARB				= 0x8764;
const uint GL_BUFFER_USAGE_ARB			= 0x8765;
const uint GL_ARRAY_BUFFER_ARB			= 0x8892;
const uint GL_ELEMENT_ARRAY_BUFFER_ARB		= 0x8893;
const uint GL_ARRAY_BUFFER_BINDING_ARB		= 0x8894;
const uint GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB	= 0x8895;
const uint GL_VERTEX_ARRAY_BUFFER_BINDING_ARB		= 0x8896;
const uint GL_NORMAL_ARRAY_BUFFER_BINDING_ARB		= 0x8897;
const uint GL_COLOR_ARRAY_BUFFER_BINDING_ARB		= 0x8898;
const uint GL_INDEX_ARRAY_BUFFER_BINDING_ARB		= 0x8899;
const uint GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB	= 0x889A;
const uint GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB	= 0x889B;
const uint GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB= 0x889C;
const uint GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB	= 0x889D;
const uint GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB		= 0x889E;
const uint GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB	= 0x889F;
const uint GL_READ_ONLY_ARB				= 0x88B8;
const uint GL_WRITE_ONLY_ARB				= 0x88B9;
const uint GL_READ_WRITE_ARB				= 0x88BA;
const uint GL_BUFFER_ACCESS_ARB			= 0x88BB;
const uint GL_BUFFER_MAPPED_ARB			= 0x88BC;
const uint GL_BUFFER_MAP_POINTER_ARB			= 0x88BD;
const uint GL_STREAM_DRAW_ARB				= 0x88E0;
const uint GL_STREAM_READ_ARB				= 0x88E1;
const uint GL_STREAM_COPY_ARB				= 0x88E2;
const uint GL_STATIC_DRAW_ARB				= 0x88E4;
const uint GL_STATIC_READ_ARB				= 0x88E5;
const uint GL_STATIC_COPY_ARB				= 0x88E6;
const uint GL_DYNAMIC_DRAW_ARB			= 0x88E8;
const uint GL_DYNAMIC_READ_ARB			= 0x88E9;
const uint GL_DYNAMIC_COPY_ARB			= 0x88EA;

// 29 - GL_ARB_occlusion_query
const uint GL_QUERY_COUNTER_BITS_ARB			= 0x8864;
const uint GL_CURRENT_QUERY_ARB			= 0x8865;
const uint GL_QUERY_RESULT_ARB			= 0x8866;
const uint GL_QUERY_RESULT_AVAILABLE_ARB		= 0x8867;
const uint GL_SAMPLES_PASSED_ARB			= 0x8914;

// 30 - GL_ARB_shader_objects
const uint GL_PROGRAM_OBJECT_ARB			= 0x8B40;
const uint GL_SHADER_OBJECT_ARB			= 0x8B48;
const uint GL_OBJECT_TYPE_ARB				= 0x8B4E;
const uint GL_OBJECT_SUBTYPE_ARB			= 0x8B4F;
const uint GL_FLOAT_VEC2_ARB				= 0x8B50;
const uint GL_FLOAT_VEC3_ARB				= 0x8B51;
const uint GL_FLOAT_VEC4_ARB				= 0x8B52;
const uint GL_INT_VEC2_ARB				= 0x8B53;
const uint GL_INT_VEC3_ARB				= 0x8B54;
const uint GL_INT_VEC4_ARB				= 0x8B55;
const uint GL_BOOL_ARB				= 0x8B56;
const uint GL_BOOL_VEC2_ARB				= 0x8B57;
const uint GL_BOOL_VEC3_ARB				= 0x8B58;
const uint GL_BOOL_VEC4_ARB				= 0x8B59;
const uint GL_FLOAT_MAT2_ARB				= 0x8B5A;
const uint GL_FLOAT_MAT3_ARB				= 0x8B5B;
const uint GL_FLOAT_MAT4_ARB				= 0x8B5C;
const uint GL_SAMPLER_1D_ARB				= 0x8B5D;
const uint GL_SAMPLER_2D_ARB				= 0x8B5E;
const uint GL_SAMPLER_3D_ARB				= 0x8B5F;
const uint GL_SAMPLER_CUBE_ARB			= 0x8B60;
const uint GL_SAMPLER_1D_SHADOW_ARB			= 0x8B61;
const uint GL_SAMPLER_2D_SHADOW_ARB			= 0x8B62;
const uint GL_SAMPLER_2D_RECT_ARB			= 0x8B63;
const uint GL_SAMPLER_2D_RECT_SHADOW_ARB		= 0x8B64;
const uint GL_OBJECT_DELETE_STATUS_ARB		= 0x8B80;
const uint GL_OBJECT_COMPILE_STATUS_ARB		= 0x8B81;
const uint GL_OBJECT_LINK_STATUS_ARB			= 0x8B82;
const uint GL_OBJECT_VALIDATE_STATUS_ARB		= 0x8B83;
const uint GL_OBJECT_INFO_LOG_LENGTH_ARB		= 0x8B84;
const uint GL_OBJECT_ATTACHED_OBJECTS_ARB		= 0x8B85;
const uint GL_OBJECT_ACTIVE_UNIFORMS_ARB		= 0x8B86;
const uint GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB	= 0x8B87;
const uint GL_OBJECT_SHADER_SOURCE_LENGTH_ARB		= 0x8B88;

// 31 - GL_ARB_vertex_shader
const uint GL_VERTEX_SHADER_ARB			= 0x8B31;
const uint GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB	= 0x8B4A;
const uint GL_MAX_VARYING_FLOATS_ARB			= 0x8B4B;
const uint GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB	= 0x8B4C;
const uint GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB	= 0x8B4D;
const uint GL_OBJECT_ACTIVE_ATTRIBUTES_ARB		= 0x8B89;
const uint GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB	= 0x8B8A;

// 32 - GL_ARB_fragment_shader
const uint GL_FRAGMENT_SHADER_ARB			= 0x8B30;
const uint GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB	= 0x8B49;
const uint GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB	= 0x8B8B;

// 33 - GL_ARB_shading_language_100
const uint GL_SHADING_LANGUAGE_VERSION_ARB		= 0x8B8C;

// 35 - GL_ARB_point_sprite
const uint GL_POINT_SPRITE_ARB			= 0x8861;
const uint GL_COORD_REPLACE_ARB			= 0x8862;

// 37 - GL_ARB_draw_buffers
const uint GL_MAX_DRAW_BUFFERS_ARB			= 0x8824;
const uint GL_DRAW_BUFFER0_ARB			= 0x8825;
const uint GL_DRAW_BUFFER1_ARB			= 0x8826;
const uint GL_DRAW_BUFFER2_ARB			= 0x8827;
const uint GL_DRAW_BUFFER3_ARB			= 0x8828;
const uint GL_DRAW_BUFFER4_ARB			= 0x8829;
const uint GL_DRAW_BUFFER5_ARB			= 0x882A;
const uint GL_DRAW_BUFFER6_ARB			= 0x882B;
const uint GL_DRAW_BUFFER7_ARB			= 0x882C;
const uint GL_DRAW_BUFFER8_ARB			= 0x882D;
const uint GL_DRAW_BUFFER9_ARB			= 0x882E;
const uint GL_DRAW_BUFFER10_ARB			= 0x882F;
const uint GL_DRAW_BUFFER11_ARB			= 0x8830;
const uint GL_DRAW_BUFFER12_ARB			= 0x8831;
const uint GL_DRAW_BUFFER13_ARB			= 0x8832;
const uint GL_DRAW_BUFFER14_ARB			= 0x8833;
const uint GL_DRAW_BUFFER15_ARB			= 0x8834;

// 38 - GL_ARB_texture_rectangle
const uint GL_TEXTURE_RECTANGLE_ARB			= 0x84F5;
const uint GL_TEXTURE_BINDING_RECTANGLE_ARB		= 0x84F6;
const uint GL_PROXY_TEXTURE_RECTANGLE_ARB		= 0x84F7;
const uint GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB		= 0x84F8;

// 39 - GL_ARB_color_buffer_float
const uint GL_RGBA_FLOAT_MODE_ARB			= 0x8820;
const uint GL_CLAMP_VERTEX_COLOR_ARB			= 0x891A;
const uint GL_CLAMP_FRAGMENT_COLOR_ARB		= 0x891B;
const uint GL_CLAMP_READ_COLOR_ARB			= 0x891C;
const uint GL_FIXED_ONLY_ARB				= 0x891D;

// 40 - GL_ARB_half_float_pixel
const uint GL_HALF_FLOAT_ARB				= 0x140B;

// 41 - GL_ARB_texture_float
const uint GL_TEXTURE_RED_TYPE_ARB			= 0x8C10;
const uint GL_TEXTURE_GREEN_TYPE_ARB			= 0x8C11;
const uint GL_TEXTURE_BLUE_TYPE_ARB			= 0x8C12;
const uint GL_TEXTURE_ALPHA_TYPE_ARB			= 0x8C13;
const uint GL_TEXTURE_LUMINANCE_TYPE_ARB		= 0x8C14;
const uint GL_TEXTURE_INTENSITY_TYPE_ARB		= 0x8C15;
const uint GL_TEXTURE_DEPTH_TYPE_ARB			= 0x8C16;
const uint GL_UNSIGNED_NORMALIZED_ARB			= 0x8C17;
const uint GL_RGBA32F_ARB				= 0x8814;
const uint GL_RGB32F_ARB				= 0x8815;
const uint GL_ALPHA32F_ARB				= 0x8816;
const uint GL_INTENSITY32F_ARB			= 0x8817;
const uint GL_LUMINANCE32F_ARB			= 0x8818;
const uint GL_LUMINANCE_ALPHA32F_ARB			= 0x8819;
const uint GL_RGBA16F_ARB				= 0x881A;
const uint GL_RGB16F_ARB				= 0x881B;
const uint GL_ALPHA16F_ARB				= 0x881C;
const uint GL_INTENSITY16F_ARB			= 0x881D;
const uint GL_LUMINANCE16F_ARB			= 0x881E;
const uint GL_LUMINANCE_ALPHA16F_ARB			= 0x881F;

// 42 - GL_ARB_pixel_buffer_object
const uint GL_PIXEL_PACK_BUFFER_ARB			= 0x88EB;
const uint GL_PIXEL_UNPACK_BUFFER_ARB			= 0x88EC;
const uint GL_PIXEL_PACK_BUFFER_BINDING_ARB		= 0x88ED;
const uint GL_PIXEL_UNPACK_BUFFER_BINDING_ARB		= 0x88EF;

/*
 * Non-ARB Extensions
 */
// 1 - GL_EXT_abgr
const uint GL_ABGR_EXT				= 0x8000;

// 2 - GL_EXT_blend_color
const uint GL_CONSTANT_COLOR_EXT			= 0x8001;
const uint GL_ONE_MINUS_CONSTANT_COLOR_EXT		= 0x8002;
const uint GL_CONSTANT_ALPHA_EXT			= 0x8003;
const uint GL_ONE_MINUS_CONSTANT_ALPHA_EXT		= 0x8004;
const uint GL_BLEND_COLOR_EXT				= 0x8005;

// 3 - GL_EXT_polygon_offset
const uint GL_POLYGON_OFFSET_EXT			= 0x8037;
const uint GL_POLYGON_OFFSET_FACTOR_EXT		= 0x8038;
const uint GL_POLYGON_OFFSET_BIAS_EXT			= 0x8039;

// 4 - GL_EXT_texture
const uint GL_ALPHA4_EXT				= 0x803B;
const uint GL_ALPHA8_EXT				= 0x803C;
const uint GL_ALPHA12_EXT				= 0x803D;
const uint GL_ALPHA16_EXT				= 0x803E;
const uint GL_LUMINANCE4_EXT				= 0x803F;
const uint GL_LUMINANCE8_EXT				= 0x8040;
const uint GL_LUMINANCE12_EXT				= 0x8041;
const uint GL_LUMINANCE16_EXT				= 0x8042;
const uint GL_LUMINANCE4_ALPHA4_EXT			= 0x8043;
const uint GL_LUMINANCE6_ALPHA2_EXT			= 0x8044;
const uint GL_LUMINANCE8_ALPHA8_EXT			= 0x8045;
const uint GL_LUMINANCE12_ALPHA4_EXT			= 0x8046;
const uint GL_LUMINANCE12_ALPHA12_EXT			= 0x8047;
const uint GL_LUMINANCE16_ALPHA16_EXT			= 0x8048;
const uint GL_INTENSITY_EXT				= 0x8049;
const uint GL_INTENSITY4_EXT				= 0x804A;
const uint GL_INTENSITY8_EXT				= 0x804B;
const uint GL_INTENSITY12_EXT				= 0x804C;
const uint GL_INTENSITY16_EXT				= 0x804D;
const uint GL_RGB2_EXT				= 0x804E;
const uint GL_RGB4_EXT				= 0x804F;
const uint GL_RGB5_EXT				= 0x8050;
const uint GL_RGB8_EXT				= 0x8051;
const uint GL_RGB10_EXT				= 0x8052;
const uint GL_RGB12_EXT				= 0x8053;
const uint GL_RGB16_EXT				= 0x8054;
const uint GL_RGBA2_EXT				= 0x8055;
const uint GL_RGBA4_EXT				= 0x8056;
const uint GL_RGB5_A1_EXT				= 0x8057;
const uint GL_RGBA8_EXT				= 0x8058;
const uint GL_RGB10_A2_EXT				= 0x8059;
const uint GL_RGBA12_EXT				= 0x805A;
const uint GL_RGBA16_EXT				= 0x805B;
const uint GL_TEXTURE_RED_SIZE_EXT			= 0x805C;
const uint GL_TEXTURE_GREEN_SIZE_EXT			= 0x805D;
const uint GL_TEXTURE_BLUE_SIZE_EXT			= 0x805E;
const uint GL_TEXTURE_ALPHA_SIZE_EXT			= 0x805F;
const uint GL_TEXTURE_LUMINANCE_SIZE_EXT		= 0x8060;
const uint GL_TEXTURE_INTENSITY_SIZE_EXT		= 0x8061;
const uint GL_REPLACE_EXT				= 0x8062;
const uint GL_PROXY_TEXTURE_1D_EXT			= 0x8063;
const uint GL_PROXY_TEXTURE_2D_EXT			= 0x8064;
const uint GL_TEXTURE_TOO_LARGE_EXT			= 0x8065;

// 6 - GL_EXT_texture3D
const uint GL_PACK_SKIP_IMAGES_EXT			= 0x806B;
const uint GL_PACK_IMAGE_HEIGHT_EXT			= 0x806C;
const uint GL_UNPACK_SKIP_IMAGES_EXT			= 0x806D;
const uint GL_UNPACK_IMAGE_HEIGHT_EXT			= 0x806E;
const uint GL_TEXTURE_3D_EXT				= 0x806F;
const uint GL_PROXY_TEXTURE_3D_EXT			= 0x8070;
const uint GL_TEXTURE_DEPTH_EXT			= 0x8071;
const uint GL_TEXTURE_WRAP_R_EXT			= 0x8072;
const uint GL_MAX_3D_TEXTURE_SIZE_EXT			= 0x8073;

// 7 - GL_SGIS_texture_filter4
const uint GL_FILTER4_SGIS				= 0x8146;
const uint GL_TEXTURE_FILTER4_SIZE_SGIS		= 0x8147;

// 11 - GL_EXT_histogram
const uint GL_HISTOGRAM_EXT				= 0x8024;
const uint GL_PROXY_HISTOGRAM_EXT			= 0x8025;
const uint GL_HISTOGRAM_WIDTH_EXT			= 0x8026;
const uint GL_HISTOGRAM_FORMAT_EXT			= 0x8027;
const uint GL_HISTOGRAM_RED_SIZE_EXT			= 0x8028;
const uint GL_HISTOGRAM_GREEN_SIZE_EXT		= 0x8029;
const uint GL_HISTOGRAM_BLUE_SIZE_EXT			= 0x802A;
const uint GL_HISTOGRAM_ALPHA_SIZE_EXT		= 0x802B;
const uint GL_HISTOGRAM_LUMINANCE_SIZE_EXT		= 0x802C;
const uint GL_HISTOGRAM_SINK_EXT			= 0x802D;
const uint GL_MINMAX_EXT				= 0x802E;
const uint GL_MINMAX_FORMAT_EXT			= 0x802F;
const uint GL_MINMAX_SINK_EXT				= 0x8030;
const uint GL_TABLE_TOO_LARGE_EXT			= 0x8031;

// 12 - GL_EXT_convolution
const uint GL_CONVOLUTION_1D_EXT			= 0x8010;
const uint GL_CONVOLUTION_2D_EXT			= 0x8011;
const uint GL_SEPARABLE_2D_EXT			= 0x8012;
const uint GL_CONVOLUTION_BORDER_MODE_EXT		= 0x8013;
const uint GL_CONVOLUTION_FILTER_SCALE_EXT		= 0x8014;
const uint GL_CONVOLUTION_FILTER_BIAS_EXT		= 0x8015;
const uint GL_REDUCE_EXT				= 0x8016;
const uint GL_CONVOLUTION_FORMAT_EXT			= 0x8017;
const uint GL_CONVOLUTION_WIDTH_EXT			= 0x8018;
const uint GL_CONVOLUTION_HEIGHT_EXT			= 0x8019;
const uint GL_MAX_CONVOLUTION_WIDTH_EXT		= 0x801A;
const uint GL_MAX_CONVOLUTION_HEIGHT_EXT		= 0x801B;
const uint GL_POST_CONVOLUTION_RED_SCALE_EXT		= 0x801C;
const uint GL_POST_CONVOLUTION_GREEN_SCALE_EXT	= 0x801D;
const uint GL_POST_CONVOLUTION_BLUE_SCALE_EXT		= 0x801E;
const uint GL_POST_CONVOLUTION_ALPHA_SCALE_EXT	= 0x801F;
const uint GL_POST_CONVOLUTION_RED_BIAS_EXT		= 0x8020;
const uint GL_POST_CONVOLUTION_GREEN_BIAS_EXT		= 0x8021;
const uint GL_POST_CONVOLUTION_BLUE_BIAS_EXT		= 0x8022;
const uint GL_POST_CONVOLUTION_ALPHA_BIAS_EXT		= 0x8023;

// 13 - GL_SGI_color_matrix
const uint GL_COLOR_MATRIX_SGI			= 0x80B1;
const uint GL_COLOR_MATRIX_STACK_DEPTH_SGI		= 0x80B2;
const uint GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI	= 0x80B3;
const uint GL_POST_COLOR_MATRIX_RED_SCALE_SGI		= 0x80B4;
const uint GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI	= 0x80B5;
const uint GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI	= 0x80B6;
const uint GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI	= 0x80B7;
const uint GL_POST_COLOR_MATRIX_RED_BIAS_SGI		= 0x80B8;
const uint GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI	= 0x80B9;
const uint GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI		= 0x80BA;
const uint GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI	= 0x80BB;

// 14 - GL_SGI_color_table
const uint GL_COLOR_TABLE_SGI				= 0x80D0;
const uint GL_POST_CONVOLUTION_COLOR_TABLE_SGI	= 0x80D1;
const uint GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI	= 0x80D2;
const uint GL_PROXY_COLOR_TABLE_SGI			= 0x80D3;
const uint GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI	= 0x80D4;
const uint GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI	= 0x80D5;
const uint GL_COLOR_TABLE_SCALE_SGI			= 0x80D6;
const uint GL_COLOR_TABLE_BIAS_SGI			= 0x80D7;
const uint GL_COLOR_TABLE_FORMAT_SGI			= 0x80D8;
const uint GL_COLOR_TABLE_WIDTH_SGI			= 0x80D9;
const uint GL_COLOR_TABLE_RED_SIZE_SGI		= 0x80DA;
const uint GL_COLOR_TABLE_GREEN_SIZE_SGI		= 0x80DB;
const uint GL_COLOR_TABLE_BLUE_SIZE_SGI		= 0x80DC;
const uint GL_COLOR_TABLE_ALPHA_SIZE_SGI		= 0x80DD;
const uint GL_COLOR_TABLE_LUMINANCE_SIZE_SGI		= 0x80DE;
const uint GL_COLOR_TABLE_INTENSITY_SIZE_SGI		= 0x80DF;

// 15 - GL_SGIS_pixel_texture
const uint GL_PIXEL_TEXTURE_SGIS			= 0x8353;
const uint GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS		= 0x8354;
const uint GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS	= 0x8355;
const uint GL_PIXEL_GROUP_COLOR_SGIS			= 0x8356;

// 15a - GL_SGIX_pixel_texture
const uint GL_PIXEL_TEX_GEN_SGIX			= 0x8139;
const uint GL_PIXEL_TEX_GEN_MODE_SGIX			= 0x832B;

// 16 - GL_SGIS_texture4D
const uint GL_PACK_SKIP_VOLUMES_SGIS			= 0x8130;
const uint GL_PACK_IMAGE_DEPTH_SGIS			= 0x8131;
const uint GL_UNPACK_SKIP_VOLUMES_SGIS		= 0x8132;
const uint GL_UNPACK_IMAGE_DEPTH_SGIS			= 0x8133;
const uint GL_TEXTURE_4D_SGIS				= 0x8134;
const uint GL_PROXY_TEXTURE_4D_SGIS			= 0x8135;
const uint GL_TEXTURE_4DSIZE_SGIS			= 0x8136;
const uint GL_TEXTURE_WRAP_Q_SGIS			= 0x8137;
const uint GL_MAX_4D_TEXTURE_SIZE_SGIS		= 0x8138;
const uint GL_TEXTURE_4D_BINDING_SGIS			= 0x814F;

// 17 - GL_SGI_texture_color_table
const uint GL_TEXTURE_COLOR_TABLE_SGI			= 0x80BC;
const uint GL_PROXY_TEXTURE_COLOR_TABLE_SGI		= 0x80BD;

// 18 - GL_EXT_cmyka
const uint GL_CMYK_EXT				= 0x800C;
const uint GL_CMYKA_EXT				= 0x800D;
const uint GL_PACK_CMYK_HINT_EXT			= 0x800E;
const uint GL_UNPACK_CMYK_HINT_EXT			= 0x800F;

// 20 - GL_EXT_texture_object
const uint GL_TEXTURE_PRIORITY_EXT			= 0x8066;
const uint GL_TEXTURE_RESIDENT_EXT			= 0x8067;
const uint GL_TEXTURE_1D_BINDING_EXT			= 0x8068;
const uint GL_TEXTURE_2D_BINDING_EXT			= 0x8069;
const uint GL_TEXTURE_3D_BINDING_EXT			= 0x806A;

// 21 - GL_SGIS_detail_texture
const uint GL_DETAIL_TEXTURE_2D_SGIS			= 0x8095;
const uint GL_DETAIL_TEXTURE_2D_BINDING_SGIS		= 0x8096;
const uint GL_LINEAR_DETAIL_SGIS			= 0x8097;
const uint GL_LINEAR_DETAIL_ALPHA_SGIS		= 0x8098;
const uint GL_LINEAR_DETAIL_COLOR_SGIS		= 0x8099;
const uint GL_DETAIL_TEXTURE_LEVEL_SGIS		= 0x809A;
const uint GL_DETAIL_TEXTURE_MODE_SGIS		= 0x809B;
const uint GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS		= 0x809C;

// 22 - GL_SGIS_sharpen_texture
const uint GL_LINEAR_SHARPEN_SGIS			= 0x80AD;
const uint GL_LINEAR_SHARPEN_ALPHA_SGIS		= 0x80AE;
const uint GL_LINEAR_SHARPEN_COLOR_SGIS		= 0x80AF;
const uint GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS	= 0x80B0;

// 23 - GL_EXT_packed_pixels
const uint GL_UNSIGNED_BYTE_3_3_2_EXT			= 0x8032;
const uint GL_UNSIGNED_SHORT_4_4_4_4_EXT		= 0x8033;
const uint GL_UNSIGNED_SHORT_5_5_5_1_EXT		= 0x8034;
const uint GL_UNSIGNED_INT_8_8_8_8_EXT		= 0x8035;
const uint GL_UNSIGNED_INT_10_10_10_2_EXT		= 0x8036;

// 24 - GL_SGIS_texture_lod
const uint GL_TEXTURE_MIN_LOD_SGIS			= 0x813A;
const uint GL_TEXTURE_MAX_LOD_SGIS			= 0x813B;
const uint GL_TEXTURE_BASE_LEVEL_SGIS			= 0x813C;
const uint GL_TEXTURE_MAX_LEVEL_SGIS			= 0x813D;

// 25 - GL_SGIS_multisample
const uint GL_MULTISAMPLE_SGIS			= 0x809D;
const uint GL_SAMPLE_ALPHA_TO_MASK_SGIS		= 0x809E;
const uint GL_SAMPLE_ALPHA_TO_ONE_SGIS		= 0x809F;
const uint GL_SAMPLE_MASK_SGIS			= 0x80A0;
const uint GL_1PASS_SGIS				= 0x80A1;
const uint GL_2PASS_0_SGIS				= 0x80A2;
const uint GL_2PASS_1_SGIS				= 0x80A3;
const uint GL_4PASS_0_SGIS				= 0x80A4;
const uint GL_4PASS_1_SGIS				= 0x80A5;
const uint GL_4PASS_2_SGIS				= 0x80A6;
const uint GL_4PASS_3_SGIS				= 0x80A7;
const uint GL_SAMPLE_BUFFERS_SGIS			= 0x80A8;
const uint GL_SAMPLES_SGIS				= 0x80A9;
const uint GL_SAMPLE_MASK_VALUE_SGIS			= 0x80AA;
const uint GL_SAMPLE_MASK_INVERT_SGIS			= 0x80AB;
const uint GL_SAMPLE_PATTERN_SGIS			= 0x80AC;

// 27 - GL_EXT_rescale_normal
const uint GL_RESCALE_NORMAL_EXT			= 0x803A;

// 30 - GL_EXT_vertex_array
const uint GL_VERTEX_ARRAY_EXT			= 0x8074;
const uint GL_NORMAL_ARRAY_EXT			= 0x8075;
const uint GL_COLOR_ARRAY_EXT				= 0x8076;
const uint GL_INDEX_ARRAY_EXT				= 0x8077;
const uint GL_TEXTURE_COORD_ARRAY_EXT			= 0x8078;
const uint GL_EDGE_FLAG_ARRAY_EXT			= 0x8079;
const uint GL_VERTEX_ARRAY_SIZE_EXT			= 0x807A;
const uint GL_VERTEX_ARRAY_TYPE_EXT			= 0x807B;
const uint GL_VERTEX_ARRAY_STRIDE_EXT			= 0x807C;
const uint GL_VERTEX_ARRAY_COUNT_EXT			= 0x807D;
const uint GL_NORMAL_ARRAY_TYPE_EXT			= 0x807E;
const uint GL_NORMAL_ARRAY_STRIDE_EXT			= 0x807F;
const uint GL_NORMAL_ARRAY_COUNT_EXT			= 0x8080;
const uint GL_COLOR_ARRAY_SIZE_EXT			= 0x8081;
const uint GL_COLOR_ARRAY_TYPE_EXT			= 0x8082;
const uint GL_COLOR_ARRAY_STRIDE_EXT			= 0x8083;
const uint GL_COLOR_ARRAY_COUNT_EXT			= 0x8084;
const uint GL_INDEX_ARRAY_TYPE_EXT			= 0x8085;
const uint GL_INDEX_ARRAY_STRIDE_EXT			= 0x8086;
const uint GL_INDEX_ARRAY_COUNT_EXT			= 0x8087;
const uint GL_TEXTURE_COORD_ARRAY_SIZE_EXT		= 0x8088;
const uint GL_TEXTURE_COORD_ARRAY_TYPE_EXT		= 0x8089;
const uint GL_TEXTURE_COORD_ARRAY_STRIDE_EXT		= 0x808A;
const uint GL_TEXTURE_COORD_ARRAY_COUNT_EXT		= 0x808B;
const uint GL_EDGE_FLAG_ARRAY_STRIDE_EXT		= 0x808C;
const uint GL_EDGE_FLAG_ARRAY_COUNT_EXT		= 0x808D;
const uint GL_VERTEX_ARRAY_POINTER_EXT		= 0x808E;
const uint GL_NORMAL_ARRAY_POINTER_EXT		= 0x808F;
const uint GL_COLOR_ARRAY_POINTER_EXT			= 0x8090;
const uint GL_INDEX_ARRAY_POINTER_EXT			= 0x8091;
const uint GL_TEXTURE_COORD_ARRAY_POINTER_EXT		= 0x8092;
const uint GL_EDGE_FLAG_ARRAY_POINTER_EXT		= 0x8093;

// 32 - GL_SGIS_generate_mipmap
const uint GL_GENERATE_MIPMAP_SGIS			= 0x8191;
const uint GL_GENERATE_MIPMAP_HINT_SGIS		= 0x8192;

// 33 - GL_SGIX_clipmap
const uint GL_LINEAR_CLIPMAP_LINEAR_SGIX		= 0x8170;
const uint GL_TEXTURE_CLIPMAP_CENTER_SGIX		= 0x8171;
const uint GL_TEXTURE_CLIPMAP_FRAME_SGIX		= 0x8172;
const uint GL_TEXTURE_CLIPMAP_OFFSET_SGIX		= 0x8173;
const uint GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX	= 0x8174;
const uint GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX		= 0x8175;
const uint GL_TEXTURE_CLIPMAP_DEPTH_SGIX		= 0x8176;
const uint GL_MAX_CLIPMAP_DEPTH_SGIX			= 0x8177;
const uint GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX		= 0x8178;
const uint GL_NEAREST_CLIPMAP_NEAREST_SGIX		= 0x844D;
const uint GL_NEAREST_CLIPMAP_LINEAR_SGIX		= 0x844E;
const uint GL_LINEAR_CLIPMAP_NEAREST_SGIX		= 0x844F;

// 34 - GL_SGIX_shadow
const uint GL_TEXTURE_COMPARE_SGIX			= 0x819A;
const uint GL_TEXTURE_COMPARE_OPERATOR_SGIX		= 0x819B;
const uint GL_TEXTURE_LEQUAL_R_SGIX			= 0x819C;
const uint GL_TEXTURE_GEQUAL_R_SGIX			= 0x819D;

// 35 - GL_SGIS_texture_edge_clamp
const uint GL_CLAMP_TO_EDGE_SGIS			= 0x812F;

// 36 - GL_SGIS_texture_border_clamp
const uint GL_CLAMP_TO_BORDER_SGIS			= 0x812D;

// 37 - GL_EXT_blend_minmax
const uint GL_FUNC_ADD_EXT				= 0x8006;
const uint GL_MIN_EXT					= 0x8007;
const uint GL_MAX_EXT					= 0x8008;
const uint GL_BLEND_EQUATION_EXT			= 0x8009;

// 38 - GL_EXT_blend_subtract
const uint GL_FUNC_SUBTRACT_EXT			= 0x800A;
const uint GL_FUNC_REVERSE_SUBTRACT_EXT		= 0x800B;

// 45 - GL_SGIX_interlace
const uint GL_INTERLACE_SGIX				= 0x8094;

// ? - GL_SGIX_pixel_tiles
const uint GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX		= 0x813E;
const uint GL_PIXEL_TILE_CACHE_INCREMENT_SGIX		= 0x813F;
const uint GL_PIXEL_TILE_WIDTH_SGIX			= 0x8140;
const uint GL_PIXEL_TILE_HEIGHT_SGIX			= 0x8141;
const uint GL_PIXEL_TILE_GRID_WIDTH_SGIX		= 0x8142;
const uint GL_PIXEL_TILE_GRID_HEIGHT_SGIX		= 0x8143;
const uint GL_PIXEL_TILE_GRID_DEPTH_SGIX		= 0x8144;
const uint GL_PIXEL_TILE_CACHE_SIZE_SGIX		= 0x8145;

// 51 - GL_SGIS_texture_select
const uint GL_DUAL_ALPHA4_SGIS			= 0x8110;
const uint GL_DUAL_ALPHA8_SGIS			= 0x8111;
const uint GL_DUAL_ALPHA12_SGIS			= 0x8112;
const uint GL_DUAL_ALPHA16_SGIS			= 0x8113;
const uint GL_DUAL_LUMINANCE4_SGIS			= 0x8114;
const uint GL_DUAL_LUMINANCE8_SGIS			= 0x8115;
const uint GL_DUAL_LUMINANCE12_SGIS			= 0x8116;
const uint GL_DUAL_LUMINANCE16_SGIS			= 0x8117;
const uint GL_DUAL_INTENSITY4_SGIS			= 0x8118;
const uint GL_DUAL_INTENSITY8_SGIS			= 0x8119;
const uint GL_DUAL_INTENSITY12_SGIS			= 0x811A;
const uint GL_DUAL_INTENSITY16_SGIS			= 0x811B;
const uint GL_DUAL_LUMINANCE_ALPHA4_SGIS		= 0x811C;
const uint GL_DUAL_LUMINANCE_ALPHA8_SGIS		= 0x811D;
const uint GL_QUAD_ALPHA4_SGIS			= 0x811E;
const uint GL_QUAD_ALPHA8_SGIS			= 0x811F;
const uint GL_QUAD_LUMINANCE4_SGIS			= 0x8120;
const uint GL_QUAD_LUMINANCE8_SGIS			= 0x8121;
const uint GL_QUAD_INTENSITY4_SGIS			= 0x8122;
const uint GL_QUAD_INTENSITY8_SGIS			= 0x8123;
const uint GL_DUAL_TEXTURE_SELECT_SGIS		= 0x8124;
const uint GL_QUAD_TEXTURE_SELECT_SGIS		= 0x8125;

// 52 - GL_SGIX_sprite
const uint GL_SPRITE_SGIX				= 0x8148;
const uint GL_SPRITE_MODE_SGIX			= 0x8149;
const uint GL_SPRITE_AXIS_SGIX			= 0x814A;
const uint GL_SPRITE_TRANSLATION_SGIX			= 0x814B;
const uint GL_SPRITE_AXIAL_SGIX			= 0x814C;
const uint GL_SPRITE_OBJECT_ALIGNED_SGIX		= 0x814D;
const uint GL_SPRITE_EYE_ALIGNED_SGIX			= 0x814E;

// 53 - GL_SGIX_texture_multi_buffer
const uint GL_TEXTURE_MULTI_BUFFER_HINT_SGIX		= 0x812E;

// 54 - GL_EXT_point_parameters
const uint GL_POINT_SIZE_MIN_EXT			= 0x8126;
const uint GL_POINT_SIZE_MAX_EXT			= 0x8127;
const uint GL_POINT_FADE_THRESHOLD_SIZE_EXT		= 0x8128;
const uint GL_DISTANCE_ATTENUATION_EXT		= 0x8129;

// ? - GL_SGIS_point_parameters
const uint GL_POINT_SIZE_MIN_SGIS			= 0x8126;
const uint GL_POINT_SIZE_MAX_SGIS			= 0x8127;
const uint GL_POINT_FADE_THRESHOLD_SIZE_SGIS		= 0x8128;
const uint GL_DISTANCE_ATTENUATION_SGIS		= 0x8129;

// 55 - GL_SGIX_instruments
const uint GL_INSTRUMENT_BUFFER_POINTER_SGIX		= 0x8180;
const uint GL_INSTRUMENT_MEASUREMENTS_SGIX		= 0x8181;

// 56 - GL_SGIX_texture_scale_bias
const uint GL_POST_TEXTURE_FILTER_BIAS_SGIX		= 0x8179;
const uint GL_POST_TEXTURE_FILTER_SCALE_SGIX		= 0x817A;
const uint GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX	= 0x817B;
const uint GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX	= 0x817C;

// 57 - GL_SGIX_framezoom
const uint GL_FRAMEZOOM_SGIX				= 0x818B;
const uint GL_FRAMEZOOM_FACTOR_SGIX			= 0x818C;
const uint GL_MAX_FRAMEZOOM_FACTOR_SGIX		= 0x818D;

// ? - GL_FfdMaskSGIX
const uint GL_TEXTURE_DEFORMATION_BIT_SGIX		= 0x00000001;
const uint GL_GEOMETRY_DEFORMATION_BIT_SGIX		= 0x00000002;

// ? - GL_SGIX_polynomial_ffd
const uint GL_GEOMETRY_DEFORMATION_SGIX		= 0x8194;
const uint GL_TEXTURE_DEFORMATION_SGIX		= 0x8195;
const uint GL_DEFORMATIONS_MASK_SGIX			= 0x8196;
const uint GL_MAX_DEFORMATION_ORDER_SGIX		= 0x8197;

// 60 - GL_SGIX_reference_plane
const uint GL_REFERENCE_PLANE_SGIX			= 0x817D;
const uint GL_REFERENCE_PLANE_EQUATION_SGIX		= 0x817E;

// 63 - GL_SGIX_depth_texture
const uint GL_DEPTH_COMPONENT16_SGIX			= 0x81A5;
const uint GL_DEPTH_COMPONENT24_SGIX			= 0x81A6;
const uint GL_DEPTH_COMPONENT32_SGIX			= 0x81A7;

// 64 - GL_SGIS_fog_function
const uint GL_FOG_FUNC_SGIS				= 0x812A;
const uint GL_FOG_FUNC_POINTS_SGIS			= 0x812B;
const uint GL_MAX_FOG_FUNC_POINTS_SGIS		= 0x812C;

// 65 - GL_SGIX_fog_offset
const uint GL_FOG_OFFSET_SGIX				= 0x8198;
const uint GL_FOG_OFFSET_VALUE_SGIX			= 0x8199;

// 66 - GL_HP_image_transform
const uint GL_IMAGE_SCALE_X_HP			= 0x8155;
const uint GL_IMAGE_SCALE_Y_HP			= 0x8156;
const uint GL_IMAGE_TRANSLATE_X_HP			= 0x8157;
const uint GL_IMAGE_TRANSLATE_Y_HP			= 0x8158;
const uint GL_IMAGE_ROTATE_ANGLE_HP			= 0x8159;
const uint GL_IMAGE_ROTATE_ORIGIN_X_HP		= 0x815A;
const uint GL_IMAGE_ROTATE_ORIGIN_Y_HP		= 0x815B;
const uint GL_IMAGE_MAG_FILTER_HP			= 0x815C;
const uint GL_IMAGE_MIN_FILTER_HP			= 0x815D;
const uint GL_IMAGE_CUBIC_WEIGHT_HP			= 0x815E;
const uint GL_CUBIC_HP				= 0x815F;
const uint GL_AVERAGE_HP				= 0x8160;
const uint GL_IMAGE_TRANSFORM_2D_HP			= 0x8161;
const uint GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP	= 0x8162;
const uint GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP= 0x8163;

// 67 - GL_HP_convolution_border_modes
const uint GL_IGNORE_BORDER_HP			= 0x8150;
const uint GL_CONSTANT_BORDER_HP			= 0x8151;
const uint GL_REPLICATE_BORDER_HP			= 0x8153;
const uint GL_CONVOLUTION_BORDER_COLOR_HP		= 0x8154;

// 69 - GL_SGIX_texture_add_env
const uint GL_TEXTURE_ENV_BIAS_SGIX			= 0x80BE;

// 76 - GL_PGI_vertex_hints
const uint GL_VERTEX_DATA_HINT_PGI			= 0x1A22A;
const uint GL_VERTEX_CONSISTENT_HINT_PGI		= 0x1A22B;
const uint GL_MATERIAL_SIDE_HINT_PGI			= 0x1A22C;
const uint GL_MAX_VERTEX_HINT_PGI			= 0x1A22D;
const uint GL_COLOR3_BIT_PGI				= 0x00010000;
const uint GL_COLOR4_BIT_PGI				= 0x00020000;
const uint GL_EDGEFLAG_BIT_PGI			= 0x00040000;
const uint GL_INDEX_BIT_PGI				= 0x00080000;
const uint GL_MAT_AMBIENT_BIT_PGI			= 0x00100000;
const uint GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI		= 0x00200000;
const uint GL_MAT_DIFFUSE_BIT_PGI			= 0x00400000;
const uint GL_MAT_EMISSION_BIT_PGI			= 0x00800000;
const uint GL_MAT_COLOR_INDEXES_BIT_PGI		= 0x01000000;
const uint GL_MAT_SHININESS_BIT_PGI			= 0x02000000;
const uint GL_MAT_SPECULAR_BIT_PGI			= 0x04000000;
const uint GL_NORMAL_BIT_PGI				= 0x08000000;
const uint GL_TEXCOORD1_BIT_PGI			= 0x10000000;
const uint GL_TEXCOORD2_BIT_PGI			= 0x20000000;
const uint GL_TEXCOORD3_BIT_PGI			= 0x40000000;
const uint GL_TEXCOORD4_BIT_PGI			= 0x80000000;
const uint GL_VERTEX23_BIT_PGI			= 0x00000004;
const uint GL_VERTEX4_BIT_PGI				= 0x00000008;

// 77 - GL_PGI_misc_hints
const uint GL_PREFER_DOUBLEBUFFER_HINT_PGI		= 0x1A1F8;
const uint GL_CONSERVE_MEMORY_HINT_PGI		= 0x1A1FD;
const uint GL_RECLAIM_MEMORY_HINT_PGI			= 0x1A1FE;
const uint GL_NATIVE_GRAPHICS_HANDLE_PGI		= 0x1A202;
const uint GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI		= 0x1A203;
const uint GL_NATIVE_GRAPHICS_END_HINT_PGI		= 0x1A204;
const uint GL_ALWAYS_FAST_HINT_PGI			= 0x1A20C;
const uint GL_ALWAYS_SOFT_HINT_PGI			= 0x1A20D;
const uint GL_ALLOW_DRAW_OBJ_HINT_PGI			= 0x1A20E;
const uint GL_ALLOW_DRAW_WIN_HINT_PGI			= 0x1A20F;
const uint GL_ALLOW_DRAW_FRG_HINT_PGI			= 0x1A210;
const uint GL_ALLOW_DRAW_MEM_HINT_PGI			= 0x1A211;
const uint GL_STRICT_DEPTHFUNC_HINT_PGI		= 0x1A216;
const uint GL_STRICT_LIGHTING_HINT_PGI		= 0x1A217;
const uint GL_STRICT_SCISSOR_HINT_PGI			= 0x1A218;
const uint GL_FULL_STIPPLE_HINT_PGI			= 0x1A219;
const uint GL_CLIP_NEAR_HINT_PGI			= 0x1A220;
const uint GL_CLIP_FAR_HINT_PGI			= 0x1A221;
const uint GL_WIDE_LINE_HINT_PGI			= 0x1A222;
const uint GL_BACK_NORMALS_HINT_PGI			= 0x1A223;

// 78 - GL_EXT_paletted_texture
const uint GL_COLOR_INDEX1_EXT			= 0x80E2;
const uint GL_COLOR_INDEX2_EXT			= 0x80E3;
const uint GL_COLOR_INDEX4_EXT			= 0x80E4;
const uint GL_COLOR_INDEX8_EXT			= 0x80E5;
const uint GL_COLOR_INDEX12_EXT			= 0x80E6;
const uint GL_COLOR_INDEX16_EXT			= 0x80E7;
const uint GL_TEXTURE_INDEX_SIZE_EXT			= 0x80ED;

// 79 - GL_EXT_clip_volume_hint
const uint GL_CLIP_VOLUME_CLIPPING_HINT_EXT		= 0x80F0;

// 80 - GL_SGIX_list_priority
const uint GL_LIST_PRIORITY_SGIX			= 0x8182;

// 81 - GL_SGIX_ir_instrument1
const uint GL_IR_INSTRUMENT1_SGIX			= 0x817F;

// ? - GL_SGIX_calligraphic_fragment
const uint GL_CALLIGRAPHIC_FRAGMENT_SGIX		= 0x8183;

// 84 - GL_SGIX_texture_lod_bias
const uint GL_TEXTURE_LOD_BIAS_S_SGIX			= 0x818E;
const uint GL_TEXTURE_LOD_BIAS_T_SGIX			= 0x818F;
const uint GL_TEXTURE_LOD_BIAS_R_SGIX			= 0x8190;

// 90 - GL_SGIX_shadow_ambient
const uint GL_SHADOW_AMBIENT_SGIX			= 0x80BF;

// 94 - GL_EXT_index_material
const uint GL_INDEX_MATERIAL_EXT			= 0x81B8;
const uint GL_INDEX_MATERIAL_PARAMETER_EXT		= 0x81B9;
const uint GL_INDEX_MATERIAL_FACE_EXT			= 0x81BA;

// 95 - GL_EXT_index_func
const uint GL_INDEX_TEST_EXT				= 0x81B5;
const uint GL_INDEX_TEST_FUNC_EXT			= 0x81B6;
const uint GL_INDEX_TEST_REF_EXT			= 0x81B7;

// 96 - GL_EXT_index_array_formats
const uint GL_IUI_V2F_EXT				= 0x81AD;
const uint GL_IUI_V3F_EXT				= 0x81AE;
const uint GL_IUI_N3F_V2F_EXT				= 0x81AF;
const uint GL_IUI_N3F_V3F_EXT				= 0x81B0;
const uint GL_T2F_IUI_V2F_EXT				= 0x81B1;
const uint GL_T2F_IUI_V3F_EXT				= 0x81B2;
const uint GL_T2F_IUI_N3F_V2F_EXT			= 0x81B3;
const uint GL_T2F_IUI_N3F_V3F_EXT			= 0x81B4;

// 97 - GL_EXT_compiled_vertex_array
const uint GL_ARRAY_ELEMENT_LOCK_FIRST_EXT		= 0x81A8;
const uint GL_ARRAY_ELEMENT_LOCK_COUNT_EXT		= 0x81A9;

// 98 - GL_EXT_cull_vertex
const uint GL_CULL_VERTEX_EXT				= 0x81AA;
const uint GL_CULL_VERTEX_EYE_POSITION_EXT		= 0x81AB;
const uint GL_CULL_VERTEX_OBJECT_POSITION_EXT		= 0x81AC;

// 101 - GL_SGIX_ycrcb
const uint GL_YCRCB_422_SGIX				= 0x81BB;
const uint GL_YCRCB_444_SGIX				= 0x81BC;

// 102 - GL_SGIX_fragment_lighting
const uint GL_FRAGMENT_LIGHTING_SGIX			= 0x8400;
const uint GL_FRAGMENT_COLOR_MATERIAL_SGIX		= 0x8401;
const uint GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX	= 0x8402;
const uint GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX	= 0x8403;
const uint GL_MAX_FRAGMENT_LIGHTS_SGIX		= 0x8404;
const uint GL_MAX_ACTIVE_LIGHTS_SGIX			= 0x8405;
const uint GL_CURRENT_RASTER_NORMAL_SGIX		= 0x8406;
const uint GL_LIGHT_ENV_MODE_SGIX			= 0x8407;
const uint GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX	= 0x8408;
const uint GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX	= 0x8409;
const uint GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX	= 0x840A;
const uint GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX= 0x840B;
const uint GL_FRAGMENT_LIGHT0_SGIX			= 0x840C;
const uint GL_FRAGMENT_LIGHT1_SGIX			= 0x840D;
const uint GL_FRAGMENT_LIGHT2_SGIX			= 0x840E;
const uint GL_FRAGMENT_LIGHT3_SGIX			= 0x840F;
const uint GL_FRAGMENT_LIGHT4_SGIX			= 0x8410;
const uint GL_FRAGMENT_LIGHT5_SGIX			= 0x8411;
const uint GL_FRAGMENT_LIGHT6_SGIX			= 0x8412;
const uint GL_FRAGMENT_LIGHT7_SGIX			= 0x8413;

// 110 - GL_IBM_rasterpos_clip
const uint GL_RASTER_POSITION_UNCLIPPED_IBM		= 0x19262;

// 111 - GL_HP_texture_lighting
const uint GL_TEXTURE_LIGHTING_MODE_HP		= 0x8167;
const uint GL_TEXTURE_POST_SPECULAR_HP		= 0x8168;
const uint GL_TEXTURE_PRE_SPECULAR_HP			= 0x8169;

// 112 - GL_EXT_draw_range_elements
const uint GL_MAX_ELEMENTS_VERTICES_EXT		= 0x80E8;
const uint GL_MAX_ELEMENTS_INDICES_EXT		= 0x80E9;

// 113 - GL_WIN_phong_shading
const uint GL_PHONG_WIN				= 0x80EA;
const uint GL_PHONG_HINT_WIN				= 0x80EB;

// 114 - GL_WIN_specular_fog
const uint GL_FOG_SPECULAR_TEXTURE_WIN		= 0x80EC;

// 117 - GL_EXT_light_texture
const uint GL_FRAGMENT_MATERIAL_EXT			= 0x8349;
const uint GL_FRAGMENT_NORMAL_EXT			= 0x834A;
const uint GL_FRAGMENT_COLOR_EXT			= 0x834C;
const uint GL_ATTENUATION_EXT				= 0x834D;
const uint GL_SHADOW_ATTENUATION_EXT			= 0x834E;
const uint GL_TEXTURE_APPLICATION_MODE_EXT		= 0x834F;
const uint GL_TEXTURE_LIGHT_EXT			= 0x8350;
const uint GL_TEXTURE_MATERIAL_FACE_EXT		= 0x8351;
const uint GL_TEXTURE_MATERIAL_PARAMETER_EXT		= 0x8352;

// 119 - GL_SGIX_blend_alpha_minmax
const uint GL_ALPHA_MIN_SGIX				= 0x8320;
const uint GL_ALPHA_MAX_SGIX				= 0x8321;

// ? - GL_SGIX_impact_pixel_texture
const uint GL_PIXEL_TEX_GEN_Q_CEILING_SGIX		= 0x8184;
const uint GL_PIXEL_TEX_GEN_Q_ROUND_SGIX		= 0x8185;
const uint GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX		= 0x8186;
const uint GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX	= 0x8187;
const uint GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX	= 0x8188;
const uint GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX		= 0x8189;
const uint GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX		= 0x818A;

// 129 - GL_EXT_bgra
const uint GL_BGR_EXT					= 0x80E0;
const uint GL_BGRA_EXT				= 0x80E1;

// 132 - GL_SGIX_async
const uint GL_ASYNC_MARKER_SGIX			= 0x8329;

// 133 - GL_SGIX_async_pixel
const uint GL_ASYNC_TEX_IMAGE_SGIX			= 0x835C;
const uint GL_ASYNC_DRAW_PIXELS_SGIX			= 0x835D;
const uint GL_ASYNC_READ_PIXELS_SGIX			= 0x835E;
const uint GL_MAX_ASYNC_TEX_IMAGE_SGIX		= 0x835F;
const uint GL_MAX_ASYNC_DRAW_PIXELS_SGIX		= 0x8360;
const uint GL_MAX_ASYNC_READ_PIXELS_SGIX		= 0x8361;

// 134 - GL_SGIX_async_histogram
const uint GL_ASYNC_HISTOGRAM_SGIX			= 0x832C;
const uint GL_MAX_ASYNC_HISTOGRAM_SGIX		= 0x832D;

// 136 - GL_INTEL_parallel_arrays
const uint GL_PARALLEL_ARRAYS_INTEL			= 0x83F4;
const uint GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL	= 0x83F5;
const uint GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL	= 0x83F6;
const uint GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL	= 0x83F7;
const uint GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL= 0x83F8;

// 137 - GL_HP_occlusion_test
const uint GL_OCCLUSION_TEST_HP			= 0x8165;
const uint GL_OCCLUSION_TEST_RESULT_HP		= 0x8166;

// 138 - GL_EXT_pixel_transform
const uint GL_PIXEL_TRANSFORM_2D_EXT			= 0x8330;
const uint GL_PIXEL_MAG_FILTER_EXT			= 0x8331;
const uint GL_PIXEL_MIN_FILTER_EXT			= 0x8332;
const uint GL_PIXEL_CUBIC_WEIGHT_EXT			= 0x8333;
const uint GL_CUBIC_EXT				= 0x8334;
const uint GL_AVERAGE_EXT				= 0x8335;
const uint GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT	= 0x8336;
const uint GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT	= 0x8337;
const uint GL_PIXEL_TRANSFORM_2D_MATRIX_EXT		= 0x8338;

// 141 - GL_EXT_shared_texture_palette
const uint GL_SHARED_TEXTURE_PALETTE_EXT		= 0x81FB;

// 144 - GL_EXT_separate_specular_color
const uint GL_LIGHT_MODEL_COLOR_CONTROL_EXT		= 0x81F8;
const uint GL_SINGLE_COLOR_EXT			= 0x81F9;
const uint GL_SEPARATE_SPECULAR_COLOR_EXT		= 0x81FA;

// 145 - GL_EXT_secondary_color
const uint GL_COLOR_SUM_EXT				= 0x8458;
const uint GL_CURRENT_SECONDARY_COLOR_EXT		= 0x8459;
const uint GL_SECONDARY_COLOR_ARRAY_SIZE_EXT		= 0x845A;
const uint GL_SECONDARY_COLOR_ARRAY_TYPE_EXT		= 0x845B;
const uint GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT	= 0x845C;
const uint GL_SECONDARY_COLOR_ARRAY_POINTER_EXT	= 0x845D;
const uint GL_SECONDARY_COLOR_ARRAY_EXT		= 0x845E;

// 147 - GL_EXT_texture_perturb_normal
const uint GL_PERTURB_EXT				= 0x85AE;
const uint GL_TEXTURE_NORMAL_EXT			= 0x85AF;

// 149 GL_EXT_fog_coord
const uint GL_FOG_COORDINATE_SOURCE_EXT		= 0x8450;
const uint GL_FOG_COORDINATE_EXT			= 0x8451;
const uint GL_FRAGMENT_DEPTH_EXT			= 0x8452;
const uint GL_CURRENT_FOG_COORDINATE_EXT		= 0x8453;
const uint GL_FOG_COORDINATE_ARRAY_TYPE_EXT		= 0x8454;
const uint GL_FOG_COORDINATE_ARRAY_STRIDE_EXT		= 0x8455;
const uint GL_FOG_COORDINATE_ARRAY_POINTER_EXT	= 0x8456;
const uint GL_FOG_COORDINATE_ARRAY_EXT		= 0x8457;

// 155 - GL_REND_screen_coordinates
const uint GL_SCREEN_COORDINATES_REND			= 0x8490;
const uint GL_INVERTED_SCREEN_W_REND			= 0x8491;

// 156 - GL_EXT_coordinate_frame
const uint GL_TANGENT_ARRAY_EXT			= 0x8439;
const uint GL_BINORMAL_ARRAY_EXT			= 0x843A;
const uint GL_CURRENT_TANGENT_EXT			= 0x843B;
const uint GL_CURRENT_BINORMAL_EXT			= 0x843C;
const uint GL_TANGENT_ARRAY_TYPE_EXT			= 0x843E;
const uint GL_TANGENT_ARRAY_STRIDE_EXT		= 0x843F;
const uint GL_BINORMAL_ARRAY_TYPE_EXT			= 0x8440;
const uint GL_BINORMAL_ARRAY_STRIDE_EXT		= 0x8441;
const uint GL_TANGENT_ARRAY_POINTER_EXT		= 0x8442;
const uint GL_BINORMAL_ARRAY_POINTER_EXT		= 0x8443;
const uint GL_MAP1_TANGENT_EXT			= 0x8444;
const uint GL_MAP2_TANGENT_EXT			= 0x8445;
const uint GL_MAP1_BINORMAL_EXT			= 0x8446;
const uint GL_MAP2_BINORMAL_EXT			= 0x8447;

// 158 - GL_EXT_texture_env_combine
const uint GL_COMBINE_EXT				= 0x8570;
const uint GL_COMBINE_RGB_EXT				= 0x8571;
const uint GL_COMBINE_ALPHA_EXT			= 0x8572;
const uint GL_RGB_SCALE_EXT				= 0x8573;
const uint GL_ADD_SIGNED_EXT				= 0x8574;
const uint GL_INTERPOLATE_EXT				= 0x8575;
const uint GL_CONSTANT_EXT				= 0x8576;
const uint GL_PRIMARY_COLOR_EXT			= 0x8577;
const uint GL_PREVIOUS_EXT				= 0x8578;
const uint GL_SOURCE0_RGB_EXT				= 0x8580;
const uint GL_SOURCE1_RGB_EXT				= 0x8581;
const uint GL_SOURCE2_RGB_EXT				= 0x8582;
const uint GL_SOURCE0_ALPHA_EXT			= 0x8588;
const uint GL_SOURCE1_ALPHA_EXT			= 0x8589;
const uint GL_SOURCE2_ALPHA_EXT			= 0x858A;
const uint GL_OPERAND0_RGB_EXT			= 0x8590;
const uint GL_OPERAND1_RGB_EXT			= 0x8591;
const uint GL_OPERAND2_RGB_EXT			= 0x8592;
const uint GL_OPERAND0_ALPHA_EXT			= 0x8598;
const uint GL_OPERAND1_ALPHA_EXT			= 0x8599;
const uint GL_OPERAND2_ALPHA_EXT			= 0x859A;

// 159 - GL_APPLE_specular_vector
const uint GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE	= 0x85B0;

// 160 - GL_APPLE_transform_hint
const uint GL_TRANSFORM_HINT_APPLE			= 0x85B1;

// ? - GL_SGIX_fog_scale
const uint GL_FOG_SCALE_SGIX				= 0x81FC;
const uint GL_FOG_SCALE_VALUE_SGIX			= 0x81FD;

// 163 - GL_SUNX_constant_data
const uint GL_UNPACK_CONSTANT_DATA_SUNX		= 0x81D5;
const uint GL_TEXTURE_CONSTANT_DATA_SUNX		= 0x81D6;

// 164 - GL_SUN_global_alpha
const uint GL_GLOBAL_ALPHA_SUN			= 0x81D9;
const uint GL_GLOBAL_ALPHA_FACTOR_SUN			= 0x81DA;

// 165 - GL_SUN_triangle_list
const uint GL_RESTART_SUN				= 0x0001;
const uint GL_REPLACE_MIDDLE_SUN			= 0x0002;
const uint GL_REPLACE_OLDEST_SUN			= 0x0003;
const uint GL_TRIANGLE_LIST_SUN			= 0x81D7;
const uint GL_REPLACEMENT_CODE_SUN			= 0x81D8;
const uint GL_REPLACEMENT_CODE_ARRAY_SUN		= 0x85C0;
const uint GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN		= 0x85C1;
const uint GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN	= 0x85C2;
const uint GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN	= 0x85C3;
const uint GL_R1UI_V3F_SUN				= 0x85C4;
const uint GL_R1UI_C4UB_V3F_SUN			= 0x85C5;
const uint GL_R1UI_C3F_V3F_SUN			= 0x85C6;
const uint GL_R1UI_N3F_V3F_SUN			= 0x85C7;
const uint GL_R1UI_C4F_N3F_V3F_SUN			= 0x85C8;
const uint GL_R1UI_T2F_V3F_SUN			= 0x85C9;
const uint GL_R1UI_T2F_N3F_V3F_SUN			= 0x85CA;
const uint GL_R1UI_T2F_C4F_N3F_V3F_SUN		= 0x85CB;

// 173 - GL_EXT_blend_func_separate
const uint GL_BLEND_DST_RGB_EXT			= 0x80C8;
const uint GL_BLEND_SRC_RGB_EXT			= 0x80C9;
const uint GL_BLEND_DST_ALPHA_EXT			= 0x80CA;
const uint GL_BLEND_SRC_ALPHA_EXT			= 0x80CB;

// 174 - GL_INGR_color_clamp
const uint GL_RED_MIN_CLAMP_INGR			= 0x8560;
const uint GL_GREEN_MIN_CLAMP_INGR			= 0x8561;
const uint GL_BLUE_MIN_CLAMP_INGR			= 0x8562;
const uint GL_ALPHA_MIN_CLAMP_INGR			= 0x8563;
const uint GL_RED_MAX_CLAMP_INGR			= 0x8564;
const uint GL_GREEN_MAX_CLAMP_INGR			= 0x8565;
const uint GL_BLUE_MAX_CLAMP_INGR			= 0x8566;
const uint GL_ALPHA_MAX_CLAMP_INGR			= 0x8567;

// 175 - GL_INGR_interlace_read
const uint GL_INTERLACE_READ_INGR			= 0x8568;

// 176 - GL_EXT_stencil_wrap
const uint GL_INCR_WRAP_EXT				= 0x8507;
const uint GL_DECR_WRAP_EXT				= 0x8508;

// 178 - GL_EXT_422_pixels
const uint GL_422_EXT					= 0x80CC;
const uint GL_422_REV_EXT				= 0x80CD;
const uint GL_422_AVERAGE_EXT				= 0x80CE;
const uint GL_422_REV_AVERAGE_EXT			= 0x80CF;

// 179 - GL_NV_texgen_reflection
const uint GL_NORMAL_MAP_NV				= 0x8511;
const uint GL_REFLECTION_MAP_NV			= 0x8512;

// ? - GL_EXT_texture_cube_map
const uint GL_NORMAL_MAP_EXT				= 0x8511;
const uint GL_REFLECTION_MAP_EXT			= 0x8512;
const uint GL_TEXTURE_CUBE_MAP_EXT			= 0x8513;
const uint GL_TEXTURE_BINDING_CUBE_MAP_EXT		= 0x8514;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT		= 0x8515;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT		= 0x8516;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT		= 0x8517;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT		= 0x8518;
const uint GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT		= 0x8519;
const uint GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT		= 0x851A;
const uint GL_PROXY_TEXTURE_CUBE_MAP_EXT		= 0x851B;
const uint GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT		= 0x851C;

// 182 - GL_SUN_convolution_border_modes
const uint GL_WRAP_BORDER_SUN				= 0x81D4;

// 186 - GL_EXT_texture_lod_bias
const uint GL_MAX_TEXTURE_LOD_BIAS_EXT		= 0x84FD;
const uint GL_TEXTURE_FILTER_CONTROL_EXT		= 0x8500;
const uint GL_TEXTURE_LOD_BIAS_EXT			= 0x8501;

// 187 - GL_EXT_texture_filter_anisotropic
const uint GL_TEXTURE_MAX_ANISOTROPY_EXT		= 0x84FE;
const uint GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT		= 0x84FF;

// 188 - GL_EXT_vertex_weighting
const uint GL_MODELVIEW0_STACK_DEPTH_EXT		= 0x0BA3;
const uint GL_MODELVIEW1_STACK_DEPTH_EXT		= 0x8502;
const uint GL_MODELVIEW0_MATRIX_EXT			= 0x0BA6;
const uint GL_MODELVIEW1_MATRIX_EXT			= 0x8506;
const uint GL_VERTEX_WEIGHTING_EXT			= 0x8509;
const uint GL_MODELVIEW0_EXT				= 0x1700;
const uint GL_MODELVIEW1_EXT				= 0x850A;
const uint GL_CURRENT_VERTEX_WEIGHT_EXT		= 0x850B;
const uint GL_VERTEX_WEIGHT_ARRAY_EXT			= 0x850C;
const uint GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT		= 0x850D;
const uint GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT		= 0x850E;
const uint GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT		= 0x850F;
const uint GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT		= 0x8510;

// 189 - GL_NV_light_max_exponent
const uint GL_MAX_SHININESS_NV			= 0x8504;
const uint GL_MAX_SPOT_EXPONENT_NV			= 0x8505;

// 190 - GL_NV_vertex_array_range
const uint GL_VERTEX_ARRAY_RANGE_NV			= 0x851D;
const uint GL_VERTEX_ARRAY_RANGE_LENGTH_NV		= 0x851E;
const uint GL_VERTEX_ARRAY_RANGE_VALID_NV		= 0x851F;
const uint GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV	= 0x8520;
const uint GL_VERTEX_ARRAY_RANGE_POINTER_NV		= 0x8521;

// 191 - GL_NV_register_combiners
const uint GL_REGISTER_COMBINERS_NV			= 0x8522;
const uint GL_VARIABLE_A_NV				= 0x8523;
const uint GL_VARIABLE_B_NV				= 0x8524;
const uint GL_VARIABLE_C_NV				= 0x8525;
const uint GL_VARIABLE_D_NV				= 0x8526;
const uint GL_VARIABLE_E_NV				= 0x8527;
const uint GL_VARIABLE_F_NV				= 0x8528;
const uint GL_VARIABLE_G_NV				= 0x8529;
const uint GL_CONSTANT_COLOR0_NV			= 0x852A;
const uint GL_CONSTANT_COLOR1_NV			= 0x852B;
const uint GL_PRIMARY_COLOR_NV			= 0x852C;
const uint GL_SECONDARY_COLOR_NV			= 0x852D;
const uint GL_SPARE0_NV				= 0x852E;
const uint GL_SPARE1_NV				= 0x852F;
const uint GL_DISCARD_NV				= 0x8530;
const uint GL_E_TIMES_F_NV				= 0x8531;
const uint GL_SPARE0_PLUS_SECONDARY_COLOR_NV		= 0x8532;
const uint GL_UNSIGNED_IDENTITY_NV			= 0x8536;
const uint GL_UNSIGNED_INVERT_NV			= 0x8537;
const uint GL_EXPAND_NORMAL_NV			= 0x8538;
const uint GL_EXPAND_NEGATE_NV			= 0x8539;
const uint GL_HALF_BIAS_NORMAL_NV			= 0x853A;
const uint GL_HALF_BIAS_NEGATE_NV			= 0x853B;
const uint GL_SIGNED_IDENTITY_NV			= 0x853C;
const uint GL_SIGNED_NEGATE_NV			= 0x853D;
const uint GL_SCALE_BY_TWO_NV				= 0x853E;
const uint GL_SCALE_BY_FOUR_NV			= 0x853F;
const uint GL_SCALE_BY_ONE_HALF_NV			= 0x8540;
const uint GL_BIAS_BY_NEGATIVE_ONE_HALF_NV		= 0x8541;
const uint GL_COMBINER_INPUT_NV			= 0x8542;
const uint GL_COMBINER_MAPPING_NV			= 0x8543;
const uint GL_COMBINER_COMPONENT_USAGE_NV		= 0x8544;
const uint GL_COMBINER_AB_DOT_PRODUCT_NV		= 0x8545;
const uint GL_COMBINER_CD_DOT_PRODUCT_NV		= 0x8546;
const uint GL_COMBINER_MUX_SUM_NV			= 0x8547;
const uint GL_COMBINER_SCALE_NV			= 0x8548;
const uint GL_COMBINER_BIAS_NV			= 0x8549;
const uint GL_COMBINER_AB_OUTPUT_NV			= 0x854A;
const uint GL_COMBINER_CD_OUTPUT_NV			= 0x854B;
const uint GL_COMBINER_SUM_OUTPUT_NV			= 0x854C;
const uint GL_MAX_GENERAL_COMBINERS_NV		= 0x854D;
const uint GL_NUM_GENERAL_COMBINERS_NV		= 0x854E;
const uint GL_COLOR_SUM_CLAMP_NV			= 0x854F;
const uint GL_COMBINER0_NV				= 0x8550;
const uint GL_COMBINER1_NV				= 0x8551;
const uint GL_COMBINER2_NV				= 0x8552;
const uint GL_COMBINER3_NV				= 0x8553;
const uint GL_COMBINER4_NV				= 0x8554;
const uint GL_COMBINER5_NV				= 0x8555;
const uint GL_COMBINER6_NV				= 0x8556;
const uint GL_COMBINER7_NV				= 0x8557;

// 192 - GL_NV_fog_distance
const uint GL_FOG_DISTANCE_MODE_NV			= 0x855A;
const uint GL_EYE_RADIAL_NV				= 0x855B;
const uint GL_EYE_PLANE_ABSOLUTE_NV			= 0x855C;

// 193 - GL_NV_texgen_emboss
const uint GL_EMBOSS_LIGHT_NV				= 0x855D;
const uint GL_EMBOSS_CONSTANT_NV			= 0x855E;
const uint GL_EMBOSS_MAP_NV				= 0x855F;

// 195 - GL_NV_texture_env_combine4
const uint GL_COMBINE4_NV				= 0x8503;
const uint GL_SOURCE3_RGB_NV				= 0x8583;
const uint GL_SOURCE3_ALPHA_NV			= 0x858B;
const uint GL_OPERAND3_RGB_NV				= 0x8593;
const uint GL_OPERAND3_ALPHA_NV			= 0x859B;

// 198 - GL_EXT_texture_compression_s3tc
const uint GL_COMPRESSED_RGB_S3TC_DXT1_EXT		= 0x83F0;
const uint GL_COMPRESSED_RGBA_S3TC_DXT1_EXT		= 0x83F1;
const uint GL_COMPRESSED_RGBA_S3TC_DXT3_EXT		= 0x83F2;
const uint GL_COMPRESSED_RGBA_S3TC_DXT5_EXT		= 0x83F3;

// 199 - GL_IBM_cull_vertex
const uint GL_CULL_VERTEX_IBM				= 103050;

// 201 - GL_IBM_vertex_array_lists
const uint GL_VERTEX_ARRAY_LIST_IBM			= 103070;
const uint GL_NORMAL_ARRAY_LIST_IBM			= 103071;
const uint GL_COLOR_ARRAY_LIST_IBM			= 103072;
const uint GL_INDEX_ARRAY_LIST_IBM			= 103073;
const uint GL_TEXTURE_COORD_ARRAY_LIST_IBM		= 103074;
const uint GL_EDGE_FLAG_ARRAY_LIST_IBM		= 103075;
const uint GL_FOG_COORDINATE_ARRAY_LIST_IBM		= 103076;
const uint GL_SECONDARY_COLOR_ARRAY_LIST_IBM		= 103077;
const uint GL_VERTEX_ARRAY_LIST_STRIDE_IBM		= 103080;
const uint GL_NORMAL_ARRAY_LIST_STRIDE_IBM		= 103081;
const uint GL_COLOR_ARRAY_LIST_STRIDE_IBM		= 103082;
const uint GL_INDEX_ARRAY_LIST_STRIDE_IBM		= 103083;
const uint GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM	= 103084;
const uint GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM		= 103085;
const uint GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM	= 103086;
const uint GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM	= 103087;

// ? - GL_SGIX_subsample
const uint GL_PACK_SUBSAMPLE_RATE_SGIX		= 0x85A0;
const uint GL_UNPACK_SUBSAMPLE_RATE_SGIX		= 0x85A1;
const uint GL_PIXEL_SUBSAMPLE_4444_SGIX		= 0x85A2;
const uint GL_PIXEL_SUBSAMPLE_2424_SGIX		= 0x85A3;
const uint GL_PIXEL_SUBSAMPLE_4242_SGIX		= 0x85A4;

// ? - GL_SGIX_ycrcba	
const uint GL_YCRCB_SGIX				= 0x8318;
const uint GL_YCRCBA_SGIX				= 0x8319;

// ? - GL_SGI_depth_pass_instrument
const uint GL_DEPTH_PASS_INSTRUMENT_SGIX		= 0x8310;
const uint GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX	= 0x8311;
const uint GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX		= 0x8312;

// 206 - GL_3DFX_texture_compression_FXT1
const uint GL_COMPRESSED_RGB_FXT1_3DFX		= 0x86B0;
const uint GL_COMPRESSED_RGBA_FXT1_3DFX		= 0x86B1;

// 207 - GL_3DFX_multisample
const uint GL_MULTISAMPLE_3DFX			= 0x86B2;
const uint GL_SAMPLE_BUFFERS_3DFX			= 0x86B3;
const uint GL_SAMPLES_3DFX				= 0x86B4;
const uint GL_MULTISAMPLE_BIT_3DFX			= 0x20000000;

// 209 - GL_EXT_multisample
const uint GL_MULTISAMPLE_EXT				= 0x809D;
const uint GL_SAMPLE_ALPHA_TO_MASK_EXT		= 0x809E;
const uint GL_SAMPLE_ALPHA_TO_ONE_EXT			= 0x809F;
const uint GL_SAMPLE_MASK_EXT				= 0x80A0;
const uint GL_1PASS_EXT				= 0x80A1;
const uint GL_2PASS_0_EXT				= 0x80A2;
const uint GL_2PASS_1_EXT				= 0x80A3;
const uint GL_4PASS_0_EXT				= 0x80A4;
const uint GL_4PASS_1_EXT				= 0x80A5;
const uint GL_4PASS_2_EXT				= 0x80A6;
const uint GL_4PASS_3_EXT				= 0x80A7;
const uint GL_SAMPLE_BUFFERS_EXT			= 0x80A8;
const uint GL_SAMPLES_EXT				= 0x80A9;
const uint GL_SAMPLE_MASK_VALUE_EXT			= 0x80AA;
const uint GL_SAMPLE_MASK_INVERT_EXT			= 0x80AB;
const uint GL_SAMPLE_PATTERN_EXT			= 0x80AC;
const uint GL_MULTISAMPLE_BIT_EXT			= 0x20000000;

// 210 - GL_SGIX_vertex_preclip
const uint GL_VERTEX_PRECLIP_SGIX			= 0x83EE;
const uint GL_VERTEX_PRECLIP_HINT_SGIX		= 0x83EF;

// ? - GL_SGIX_convolution_accuracy
const uint GL_CONVOLUTION_HINT_SGIX			= 0x8316;

// 212 - GL_SGIX_resample
const uint GL_PACK_RESAMPLE_SGIX			= 0x842C;
const uint GL_UNPACK_RESAMPLE_SGIX			= 0x842D;
const uint GL_RESAMPLE_REPLICATE_SGIX			= 0x842E;
const uint GL_RESAMPLE_ZERO_FILL_SGIX			= 0x842F;
const uint GL_RESAMPLE_DECIMATE_SGIX			= 0x8430;

// ? - GL_SGIS_point_line_texgen
const uint GL_EYE_DISTANCE_TO_POINT_SGIS		= 0x81F0;
const uint GL_OBJECT_DISTANCE_TO_POINT_SGIS		= 0x81F1;
const uint GL_EYE_DISTANCE_TO_LINE_SGIS		= 0x81F2;
const uint GL_OBJECT_DISTANCE_TO_LINE_SGIS		= 0x81F3;
const uint GL_EYE_POINT_SGIS				= 0x81F4;
const uint GL_OBJECT_POINT_SGIS			= 0x81F5;
const uint GL_EYE_LINE_SGIS				= 0x81F6;
const uint GL_OBJECT_LINE_SGIS			= 0x81F7;

// 214 - GL_SGIS_texture_color_mask
const uint GL_TEXTURE_COLOR_WRITEMASK_SGIS		= 0x81EF;

// 220 - GL_EXT_texture_env_dot3
const uint GL_DOT3_RGB_EXT				= 0x8740;
const uint GL_DOT3_RGBA_EXT				= 0x8741;

// 221 - GL_ATI_texture_mirror_once
const uint GL_MIRROR_CLAMP_ATI			= 0x8742;
const uint GL_MIRROR_CLAMP_TO_EDGE_ATI		= 0x8743;

// 222 - GL_NV_fence
const uint GL_ALL_COMPLETED_NV			= 0x84F2;
const uint GL_FENCE_STATUS_NV				= 0x84F3;
const uint GL_FENCE_CONDITION_NV			= 0x84F4;

// 224 - GL_IBM_texture_mirrored_repeat
const uint GL_MIRRORED_REPEAT_IBM			= 0x8370;

// 225 - GL_NV_evaluators
const uint GL_EVAL_2D_NV				= 0x86C0;
const uint GL_EVAL_TRIANGULAR_2D_NV			= 0x86C1;
const uint GL_MAP_TESSELLATION_NV			= 0x86C2;
const uint GL_MAP_ATTRIB_U_ORDER_NV			= 0x86C3;
const uint GL_MAP_ATTRIB_V_ORDER_NV			= 0x86C4;
const uint GL_EVAL_FRACTIONAL_TESSELLATION_NV		= 0x86C5;
const uint GL_EVAL_VERTEX_ATTRIB0_NV			= 0x86C6;
const uint GL_EVAL_VERTEX_ATTRIB1_NV			= 0x86C7;
const uint GL_EVAL_VERTEX_ATTRIB2_NV			= 0x86C8;
const uint GL_EVAL_VERTEX_ATTRIB3_NV			= 0x86C9;
const uint GL_EVAL_VERTEX_ATTRIB4_NV			= 0x86CA;
const uint GL_EVAL_VERTEX_ATTRIB5_NV			= 0x86CB;
const uint GL_EVAL_VERTEX_ATTRIB6_NV			= 0x86CC;
const uint GL_EVAL_VERTEX_ATTRIB7_NV			= 0x86CD;
const uint GL_EVAL_VERTEX_ATTRIB8_NV			= 0x86CE;
const uint GL_EVAL_VERTEX_ATTRIB9_NV			= 0x86CF;
const uint GL_EVAL_VERTEX_ATTRIB10_NV			= 0x86D0;
const uint GL_EVAL_VERTEX_ATTRIB11_NV			= 0x86D1;
const uint GL_EVAL_VERTEX_ATTRIB12_NV			= 0x86D2;
const uint GL_EVAL_VERTEX_ATTRIB13_NV			= 0x86D3;
const uint GL_EVAL_VERTEX_ATTRIB14_NV			= 0x86D4;
const uint GL_EVAL_VERTEX_ATTRIB15_NV			= 0x86D5;
const uint GL_MAX_MAP_TESSELLATION_NV			= 0x86D6;
const uint GL_MAX_RATIONAL_EVAL_ORDER_NV		= 0x86D7;

// 226 - GL_NV_packed_depth_stencil
const uint GL_DEPTH_STENCIL_NV			= 0x84F9;
const uint GL_UNSIGNED_INT_24_8_NV			= 0x84FA;

// 227 - GL_NV_register_combiners2
const uint GL_PER_STAGE_CONSTANTS_NV			= 0x8535;

// 229 - GL_NV_texture_rectangle
const uint GL_TEXTURE_RECTANGLE_NV			= 0x84F5;
const uint GL_TEXTURE_BINDING_RECTANGLE_NV		= 0x84F6;
const uint GL_PROXY_TEXTURE_RECTANGLE_NV		= 0x84F7;
const uint GL_MAX_RECTANGLE_TEXTURE_SIZE_NV		= 0x84F8;

// 230 - GL_NV_texture_shader
const uint GL_OFFSET_TEXTURE_RECTANGLE_NV		= 0x864C;
const uint GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV	= 0x864D;
const uint GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV	= 0x864E;
const uint GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV	= 0x86D9;
const uint GL_UNSIGNED_INT_S8_S8_8_8_NV		= 0x86DA;
const uint GL_UNSIGNED_INT_8_8_S8_S8_REV_NV		= 0x86DB;
const uint GL_DSDT_MAG_INTENSITY_NV			= 0x86DC;
const uint GL_SHADER_CONSISTENT_NV			= 0x86DD;
const uint GL_TEXTURE_SHADER_NV			= 0x86DE;
const uint GL_SHADER_OPERATION_NV			= 0x86DF;
const uint GL_CULL_MODES_NV				= 0x86E0;
const uint GL_OFFSET_TEXTURE_MATRIX_NV		= 0x86E1;
const uint GL_OFFSET_TEXTURE_SCALE_NV			= 0x86E2;
const uint GL_OFFSET_TEXTURE_BIAS_NV			= 0x86E3;
const uint GL_OFFSET_TEXTURE_2D_MATRIX_NV		= GL_OFFSET_TEXTURE_MATRIX_NV;
const uint GL_OFFSET_TEXTURE_2D_SCALE_NV		= GL_OFFSET_TEXTURE_SCALE_NV;
const uint GL_OFFSET_TEXTURE_2D_BIAS_NV		= GL_OFFSET_TEXTURE_BIAS_NV;
const uint GL_PREVIOUS_TEXTURE_INPUT_NV		= 0x86E4;
const uint GL_CONST_EYE_NV				= 0x86E5;
const uint GL_PASS_THROUGH_NV				= 0x86E6;
const uint GL_CULL_FRAGMENT_NV			= 0x86E7;
const uint GL_OFFSET_TEXTURE_2D_NV			= 0x86E8;
const uint GL_DEPENDENT_AR_TEXTURE_2D_NV		= 0x86E9;
const uint GL_DEPENDENT_GB_TEXTURE_2D_NV		= 0x86EA;
const uint GL_DOT_PRODUCT_NV				= 0x86EC;
const uint GL_DOT_PRODUCT_DEPTH_REPLACE_NV		= 0x86ED;
const uint GL_DOT_PRODUCT_TEXTURE_2D_NV		= 0x86EE;
const uint GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV		= 0x86F0;
const uint GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV		= 0x86F1;
const uint GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV		= 0x86F2;
const uint GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV= 0x86F3;
const uint GL_HILO_NV					= 0x86F4;
const uint GL_DSDT_NV					= 0x86F5;
const uint GL_DSDT_MAG_NV				= 0x86F6;
const uint GL_DSDT_MAG_VIB_NV				= 0x86F7;
const uint GL_HILO16_NV				= 0x86F8;
const uint GL_SIGNED_HILO_NV				= 0x86F9;
const uint GL_SIGNED_HILO16_NV			= 0x86FA;
const uint GL_SIGNED_RGBA_NV				= 0x86FB;
const uint GL_SIGNED_RGBA8_NV				= 0x86FC;
const uint GL_SIGNED_RGB_NV				= 0x86FE;
const uint GL_SIGNED_RGB8_NV				= 0x86FF;
const uint GL_SIGNED_LUMINANCE_NV			= 0x8701;
const uint GL_SIGNED_LUMINANCE8_NV			= 0x8702;
const uint GL_SIGNED_LUMINANCE_ALPHA_NV		= 0x8703;
const uint GL_SIGNED_LUMINANCE8_ALPHA8_NV		= 0x8704;
const uint GL_SIGNED_ALPHA_NV				= 0x8705;
const uint GL_SIGNED_ALPHA8_NV			= 0x8706;
const uint GL_SIGNED_INTENSITY_NV			= 0x8707;
const uint GL_SIGNED_INTENSITY8_NV			= 0x8708;
const uint GL_DSDT8_NV				= 0x8709;
const uint GL_DSDT8_MAG8_NV				= 0x870A;
const uint GL_DSDT8_MAG8_INTENSITY8_NV		= 0x870B;
const uint GL_SIGNED_RGB_UNSIGNED_ALPHA_NV		= 0x870C;
const uint GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV		= 0x870D;
const uint GL_HI_SCALE_NV				= 0x870E;
const uint GL_LO_SCALE_NV				= 0x870F;
const uint GL_DS_SCALE_NV				= 0x8710;
const uint GL_DT_SCALE_NV				= 0x8711;
const uint GL_MAGNITUDE_SCALE_NV			= 0x8712;
const uint GL_VIBRANCE_SCALE_NV			= 0x8713;
const uint GL_HI_BIAS_NV				= 0x8714;
const uint GL_LO_BIAS_NV				= 0x8715;
const uint GL_DS_BIAS_NV				= 0x8716;
const uint GL_DT_BIAS_NV				= 0x8717;
const uint GL_MAGNITUDE_BIAS_NV			= 0x8718;
const uint GL_VIBRANCE_BIAS_NV			= 0x8719;
const uint GL_TEXTURE_BORDER_VALUES_NV		= 0x871A;
const uint GL_TEXTURE_HI_SIZE_NV			= 0x871B;
const uint GL_TEXTURE_LO_SIZE_NV			= 0x871C;
const uint GL_TEXTURE_DS_SIZE_NV			= 0x871D;
const uint GL_TEXTURE_DT_SIZE_NV			= 0x871E;
const uint GL_TEXTURE_MAG_SIZE_NV			= 0x871F;

// 231 - GL_NV_texture_shader2
const uint GL_DOT_PRODUCT_TEXTURE_3D_NV		= 0x86EF;

// 232 - GL_NV_vertex_array_range2
const uint GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV	= 0x8533;

// 233 - GL_NV_vertex_program
const uint GL_VERTEX_PROGRAM_NV			= 0x8620;
const uint GL_VERTEX_STATE_PROGRAM_NV			= 0x8621;
const uint GL_ATTRIB_ARRAY_SIZE_NV			= 0x8623;
const uint GL_ATTRIB_ARRAY_STRIDE_NV			= 0x8624;
const uint GL_ATTRIB_ARRAY_TYPE_NV			= 0x8625;
const uint GL_CURRENT_ATTRIB_NV			= 0x8626;
const uint GL_PROGRAM_LENGTH_NV			= 0x8627;
const uint GL_PROGRAM_STRING_NV			= 0x8628;
const uint GL_MODELVIEW_PROJECTION_NV			= 0x8629;
const uint GL_IDENTITY_NV				= 0x862A;
const uint GL_INVERSE_NV				= 0x862B;
const uint GL_TRANSPOSE_NV				= 0x862C;
const uint GL_INVERSE_TRANSPOSE_NV			= 0x862D;
const uint GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV		= 0x862E;
const uint GL_MAX_TRACK_MATRICES_NV			= 0x862F;
const uint GL_MATRIX0_NV				= 0x8630;
const uint GL_MATRIX1_NV				= 0x8631;
const uint GL_MATRIX2_NV				= 0x8632;
const uint GL_MATRIX3_NV				= 0x8633;
const uint GL_MATRIX4_NV				= 0x8634;
const uint GL_MATRIX5_NV				= 0x8635;
const uint GL_MATRIX6_NV				= 0x8636;
const uint GL_MATRIX7_NV				= 0x8637;
const uint GL_CURRENT_MATRIX_STACK_DEPTH_NV		= 0x8640;
const uint GL_CURRENT_MATRIX_NV			= 0x8641;
const uint GL_VERTEX_PROGRAM_POINT_SIZE_NV		= 0x8642;
const uint GL_VERTEX_PROGRAM_TWO_SIDE_NV		= 0x8643;
const uint GL_PROGRAM_PARAMETER_NV			= 0x8644;
const uint GL_ATTRIB_ARRAY_POINTER_NV			= 0x8645;
const uint GL_PROGRAM_TARGET_NV			= 0x8646;
const uint GL_PROGRAM_RESIDENT_NV			= 0x8647;
const uint GL_TRACK_MATRIX_NV				= 0x8648;
const uint GL_TRACK_MATRIX_TRANSFORM_NV		= 0x8649;
const uint GL_VERTEX_PROGRAM_BINDING_NV		= 0x864A;
const uint GL_PROGRAM_ERROR_POSITION_NV		= 0x864B;
const uint GL_VERTEX_ATTRIB_ARRAY0_NV			= 0x8650;
const uint GL_VERTEX_ATTRIB_ARRAY1_NV			= 0x8651;
const uint GL_VERTEX_ATTRIB_ARRAY2_NV			= 0x8652;
const uint GL_VERTEX_ATTRIB_ARRAY3_NV			= 0x8653;
const uint GL_VERTEX_ATTRIB_ARRAY4_NV			= 0x8654;
const uint GL_VERTEX_ATTRIB_ARRAY5_NV			= 0x8655;
const uint GL_VERTEX_ATTRIB_ARRAY6_NV			= 0x8656;
const uint GL_VERTEX_ATTRIB_ARRAY7_NV			= 0x8657;
const uint GL_VERTEX_ATTRIB_ARRAY8_NV			= 0x8658;
const uint GL_VERTEX_ATTRIB_ARRAY9_NV			= 0x8659;
const uint GL_VERTEX_ATTRIB_ARRAY10_NV		= 0x865A;
const uint GL_VERTEX_ATTRIB_ARRAY11_NV		= 0x865B;
const uint GL_VERTEX_ATTRIB_ARRAY12_NV		= 0x865C;
const uint GL_VERTEX_ATTRIB_ARRAY13_NV		= 0x865D;
const uint GL_VERTEX_ATTRIB_ARRAY14_NV		= 0x865E;
const uint GL_VERTEX_ATTRIB_ARRAY15_NV		= 0x865F;
const uint GL_MAP1_VERTEX_ATTRIB0_4_NV		= 0x8660;
const uint GL_MAP1_VERTEX_ATTRIB1_4_NV		= 0x8661;
const uint GL_MAP1_VERTEX_ATTRIB2_4_NV		= 0x8662;
const uint GL_MAP1_VERTEX_ATTRIB3_4_NV		= 0x8663;
const uint GL_MAP1_VERTEX_ATTRIB4_4_NV		= 0x8664;
const uint GL_MAP1_VERTEX_ATTRIB5_4_NV		= 0x8665;
const uint GL_MAP1_VERTEX_ATTRIB6_4_NV		= 0x8666;
const uint GL_MAP1_VERTEX_ATTRIB7_4_NV		= 0x8667;
const uint GL_MAP1_VERTEX_ATTRIB8_4_NV		= 0x8668;
const uint GL_MAP1_VERTEX_ATTRIB9_4_NV		= 0x8669;
const uint GL_MAP1_VERTEX_ATTRIB10_4_NV		= 0x866A;
const uint GL_MAP1_VERTEX_ATTRIB11_4_NV		= 0x866B;
const uint GL_MAP1_VERTEX_ATTRIB12_4_NV		= 0x866C;
const uint GL_MAP1_VERTEX_ATTRIB13_4_NV		= 0x866D;
const uint GL_MAP1_VERTEX_ATTRIB14_4_NV		= 0x866E;
const uint GL_MAP1_VERTEX_ATTRIB15_4_NV		= 0x866F;
const uint GL_MAP2_VERTEX_ATTRIB0_4_NV		= 0x8670;
const uint GL_MAP2_VERTEX_ATTRIB1_4_NV		= 0x8671;
const uint GL_MAP2_VERTEX_ATTRIB2_4_NV		= 0x8672;
const uint GL_MAP2_VERTEX_ATTRIB3_4_NV		= 0x8673;
const uint GL_MAP2_VERTEX_ATTRIB4_4_NV		= 0x8674;
const uint GL_MAP2_VERTEX_ATTRIB5_4_NV		= 0x8675;
const uint GL_MAP2_VERTEX_ATTRIB6_4_NV		= 0x8676;
const uint GL_MAP2_VERTEX_ATTRIB7_4_NV		= 0x8677;
const uint GL_MAP2_VERTEX_ATTRIB8_4_NV		= 0x8678;
const uint GL_MAP2_VERTEX_ATTRIB9_4_NV		= 0x8679;
const uint GL_MAP2_VERTEX_ATTRIB10_4_NV		= 0x867A;
const uint GL_MAP2_VERTEX_ATTRIB11_4_NV		= 0x867B;
const uint GL_MAP2_VERTEX_ATTRIB12_4_NV		= 0x867C;
const uint GL_MAP2_VERTEX_ATTRIB13_4_NV		= 0x867D;
const uint GL_MAP2_VERTEX_ATTRIB14_4_NV		= 0x867E;
const uint GL_MAP2_VERTEX_ATTRIB15_4_NV		= 0x867F;

// 235 - GL_SGIX_texture_coordinate_clamp
const uint GL_TEXTURE_MAX_CLAMP_S_SGIX		= 0x8369;
const uint GL_TEXTURE_MAX_CLAMP_T_SGIX		= 0x836A;
const uint GL_TEXTURE_MAX_CLAMP_R_SGIX		= 0x836B;

// ? - GL_SGIX_scalebias_hint
const uint GL_SCALEBIAS_HINT_SGIX			= 0x8322;

// 239 - GL_OML_interlace
const uint GL_INTERLACE_OML				= 0x8980;
const uint GL_INTERLACE_READ_OML			= 0x8981;

// 240 - GL_OML_subsample
const uint GL_FORMAT_SUBSAMPLE_24_24_OML		= 0x8982;
const uint GL_FORMAT_SUBSAMPLE_244_244_OML		= 0x8983;

// 241 - GL_OML_resample
const uint GL_PACK_RESAMPLE_OML			= 0x8984;
const uint GL_UNPACK_RESAMPLE_OML			= 0x8985;
const uint GL_RESAMPLE_REPLICATE_OML			= 0x8986;
const uint GL_RESAMPLE_ZERO_FILL_OML			= 0x8987;
const uint GL_RESAMPLE_AVERAGE_OML			= 0x8988;
const uint GL_RESAMPLE_DECIMATE_OML			= 0x8989;

// 243 - GL_NV_copy_depth_to_color
const uint GL_DEPTH_STENCIL_TO_RGBA_NV		= 0x886E;
const uint GL_DEPTH_STENCIL_TO_BGRA_NV		= 0x886F;

// 244 - GL_ATI_envmap_bumpmap
const uint GL_BUMP_ROT_MATRIX_ATI			= 0x8775;
const uint GL_BUMP_ROT_MATRIX_SIZE_ATI		= 0x8776;
const uint GL_BUMP_NUM_TEX_UNITS_ATI			= 0x8777;
const uint GL_BUMP_TEX_UNITS_ATI			= 0x8778;
const uint GL_DUDV_ATI				= 0x8779;
const uint GL_DU8DV8_ATI				= 0x877A;
const uint GL_BUMP_ENVMAP_ATI				= 0x877B;
const uint GL_BUMP_TARGET_ATI				= 0x877C;

// 245 - GL_ATI_fragment_shader
const uint GL_FRAGMENT_SHADER_ATI			= 0x8920;
const uint GL_REG_0_ATI				= 0x8921;
const uint GL_REG_1_ATI				= 0x8922;
const uint GL_REG_2_ATI				= 0x8923;
const uint GL_REG_3_ATI				= 0x8924;
const uint GL_REG_4_ATI				= 0x8925;
const uint GL_REG_5_ATI				= 0x8926;
const uint GL_REG_6_ATI				= 0x8927;
const uint GL_REG_7_ATI				= 0x8928;
const uint GL_REG_8_ATI				= 0x8929;
const uint GL_REG_9_ATI				= 0x892A;
const uint GL_REG_10_ATI				= 0x892B;
const uint GL_REG_11_ATI				= 0x892C;
const uint GL_REG_12_ATI				= 0x892D;
const uint GL_REG_13_ATI				= 0x892E;
const uint GL_REG_14_ATI				= 0x892F;
const uint GL_REG_15_ATI				= 0x8930;
const uint GL_REG_16_ATI				= 0x8931;
const uint GL_REG_17_ATI				= 0x8932;
const uint GL_REG_18_ATI				= 0x8933;
const uint GL_REG_19_ATI				= 0x8934;
const uint GL_REG_20_ATI				= 0x8935;
const uint GL_REG_21_ATI				= 0x8936;
const uint GL_REG_22_ATI				= 0x8937;
const uint GL_REG_23_ATI				= 0x8938;
const uint GL_REG_24_ATI				= 0x8939;
const uint GL_REG_25_ATI				= 0x893A;
const uint GL_REG_26_ATI				= 0x893B;
const uint GL_REG_27_ATI				= 0x893C;
const uint GL_REG_28_ATI				= 0x893D;
const uint GL_REG_29_ATI				= 0x893E;
const uint GL_REG_30_ATI				= 0x893F;
const uint GL_REG_31_ATI				= 0x8940;
const uint GL_CON_0_ATI				= 0x8941;
const uint GL_CON_1_ATI				= 0x8942;
const uint GL_CON_2_ATI				= 0x8943;
const uint GL_CON_3_ATI				= 0x8944;
const uint GL_CON_4_ATI				= 0x8945;
const uint GL_CON_5_ATI				= 0x8946;
const uint GL_CON_6_ATI				= 0x8947;
const uint GL_CON_7_ATI				= 0x8948;
const uint GL_CON_8_ATI				= 0x8949;
const uint GL_CON_9_ATI				= 0x894A;
const uint GL_CON_10_ATI				= 0x894B;
const uint GL_CON_11_ATI				= 0x894C;
const uint GL_CON_12_ATI				= 0x894D;
const uint GL_CON_13_ATI				= 0x894E;
const uint GL_CON_14_ATI				= 0x894F;
const uint GL_CON_15_ATI				= 0x8950;
const uint GL_CON_16_ATI				= 0x8951;
const uint GL_CON_17_ATI				= 0x8952;
const uint GL_CON_18_ATI				= 0x8953;
const uint GL_CON_19_ATI				= 0x8954;
const uint GL_CON_20_ATI				= 0x8955;
const uint GL_CON_21_ATI				= 0x8956;
const uint GL_CON_22_ATI				= 0x8957;
const uint GL_CON_23_ATI				= 0x8958;
const uint GL_CON_24_ATI				= 0x8959;
const uint GL_CON_25_ATI				= 0x895A;
const uint GL_CON_26_ATI				= 0x895B;
const uint GL_CON_27_ATI				= 0x895C;
const uint GL_CON_28_ATI				= 0x895D;
const uint GL_CON_29_ATI				= 0x895E;
const uint GL_CON_30_ATI				= 0x895F;
const uint GL_CON_31_ATI				= 0x8960;
const uint GL_MOV_ATI					= 0x8961;
const uint GL_ADD_ATI					= 0x8963;
const uint GL_MUL_ATI					= 0x8964;
const uint GL_SUB_ATI					= 0x8965;
const uint GL_DOT3_ATI				= 0x8966;
const uint GL_DOT4_ATI				= 0x8967;
const uint GL_MAD_ATI					= 0x8968;
const uint GL_LERP_ATI				= 0x8969;
const uint GL_CND_ATI					= 0x896A;
const uint GL_CND0_ATI				= 0x896B;
const uint GL_DOT2_ADD_ATI				= 0x896C;
const uint GL_SECONDARY_INTERPOLATOR_ATI		= 0x896D;
const uint GL_NUM_FRAGMENT_REGISTERS_ATI		= 0x896E;
const uint GL_NUM_FRAGMENT_CONSTANTS_ATI		= 0x896F;
const uint GL_NUM_PASSES_ATI				= 0x8970;
const uint GL_NUM_INSTRUCTIONS_PER_PASS_ATI		= 0x8971;
const uint GL_NUM_INSTRUCTIONS_TOTAL_ATI		= 0x8972;
const uint GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI	= 0x8973;
const uint GL_NUM_LOOPBACK_COMPONENTS_ATI		= 0x8974;
const uint GL_COLOR_ALPHA_PAIRING_ATI			= 0x8975;
const uint GL_SWIZZLE_STR_ATI				= 0x8976;
const uint GL_SWIZZLE_STQ_ATI				= 0x8977;
const uint GL_SWIZZLE_STR_DR_ATI			= 0x8978;
const uint GL_SWIZZLE_STQ_DQ_ATI			= 0x8979;
const uint GL_SWIZZLE_STRQ_ATI			= 0x897A;
const uint GL_SWIZZLE_STRQ_DQ_ATI			= 0x897B;
const uint GL_RED_BIT_ATI				= 0x00000001;
const uint GL_GREEN_BIT_ATI				= 0x00000002;
const uint GL_BLUE_BIT_ATI				= 0x00000004;
const uint GL_2X_BIT_ATI				= 0x00000001;
const uint GL_4X_BIT_ATI				= 0x00000002;
const uint GL_8X_BIT_ATI				= 0x00000004;
const uint GL_HALF_BIT_ATI				= 0x00000008;
const uint GL_QUARTER_BIT_ATI				= 0x00000010;
const uint GL_EIGHTH_BIT_ATI				= 0x00000020;
const uint GL_SATURATE_BIT_ATI			= 0x00000040;
const uint GL_COMP_BIT_ATI				= 0x00000002;
const uint GL_NEGATE_BIT_ATI				= 0x00000004;
const uint GL_BIAS_BIT_ATI				= 0x00000008;

// 246 - GL_ATI_pn_triangles
const uint GL_PN_TRIANGLES_ATI			= 0x87F0;
const uint GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI	= 0x87F1;
const uint GL_PN_TRIANGLES_POINT_MODE_ATI		= 0x87F2;
const uint GL_PN_TRIANGLES_NORMAL_MODE_ATI		= 0x87F3;
const uint GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI	= 0x87F4;
const uint GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI	= 0x87F5;
const uint GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI	= 0x87F6;
const uint GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI	= 0x87F7;
const uint GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI	= 0x87F8;

// 247 - GL_ATI_vertex_array_object
const uint GL_STATIC_ATI				= 0x8760;
const uint GL_DYNAMIC_ATI				= 0x8761;
const uint GL_PRESERVE_ATI				= 0x8762;
const uint GL_DISCARD_ATI				= 0x8763;
const uint GL_OBJECT_BUFFER_SIZE_ATI			= 0x8764;
const uint GL_OBJECT_BUFFER_USAGE_ATI			= 0x8765;
const uint GL_ARRAY_OBJECT_BUFFER_ATI			= 0x8766;
const uint GL_ARRAY_OBJECT_OFFSET_ATI			= 0x8767;

// 248 - GL_EXT_vertex_shader
const uint GL_VERTEX_SHADER_EXT			= 0x8780;
const uint GL_VERTEX_SHADER_BINDING_EXT		= 0x8781;
const uint GL_OP_INDEX_EXT				= 0x8782;
const uint GL_OP_NEGATE_EXT				= 0x8783;
const uint GL_OP_DOT3_EXT				= 0x8784;
const uint GL_OP_DOT4_EXT				= 0x8785;
const uint GL_OP_MUL_EXT				= 0x8786;
const uint GL_OP_ADD_EXT				= 0x8787;
const uint GL_OP_MADD_EXT				= 0x8788;
const uint GL_OP_FRAC_EXT				= 0x8789;
const uint GL_OP_MAX_EXT				= 0x878A;
const uint GL_OP_MIN_EXT				= 0x878B;
const uint GL_OP_SET_GE_EXT				= 0x878C;
const uint GL_OP_SET_LT_EXT				= 0x878D;
const uint GL_OP_CLAMP_EXT				= 0x878E;
const uint GL_OP_FLOOR_EXT				= 0x878F;
const uint GL_OP_ROUND_EXT				= 0x8790;
const uint GL_OP_EXP_BASE_2_EXT			= 0x8791;
const uint GL_OP_LOG_BASE_2_EXT			= 0x8792;
const uint GL_OP_POWER_EXT				= 0x8793;
const uint GL_OP_RECIP_EXT				= 0x8794;
const uint GL_OP_RECIP_SQRT_EXT			= 0x8795;
const uint GL_OP_SUB_EXT				= 0x8796;
const uint GL_OP_CROSS_PRODUCT_EXT			= 0x8797;
const uint GL_OP_MULTIPLY_MATRIX_EXT			= 0x8798;
const uint GL_OP_MOV_EXT				= 0x8799;
const uint GL_OUTPUT_VERTEX_EXT			= 0x879A;
const uint GL_OUTPUT_COLOR0_EXT			= 0x879B;
const uint GL_OUTPUT_COLOR1_EXT			= 0x879C;
const uint GL_OUTPUT_TEXTURE_COORD0_EXT		= 0x879D;
const uint GL_OUTPUT_TEXTURE_COORD1_EXT		= 0x879E;
const uint GL_OUTPUT_TEXTURE_COORD2_EXT		= 0x879F;
const uint GL_OUTPUT_TEXTURE_COORD3_EXT		= 0x87A0;
const uint GL_OUTPUT_TEXTURE_COORD4_EXT		= 0x87A1;
const uint GL_OUTPUT_TEXTURE_COORD5_EXT		= 0x87A2;
const uint GL_OUTPUT_TEXTURE_COORD6_EXT		= 0x87A3;
const uint GL_OUTPUT_TEXTURE_COORD7_EXT		= 0x87A4;
const uint GL_OUTPUT_TEXTURE_COORD8_EXT		= 0x87A5;
const uint GL_OUTPUT_TEXTURE_COORD9_EXT		= 0x87A6;
const uint GL_OUTPUT_TEXTURE_COORD10_EXT		= 0x87A7;
const uint GL_OUTPUT_TEXTURE_COORD11_EXT		= 0x87A8;
const uint GL_OUTPUT_TEXTURE_COORD12_EXT		= 0x87A9;
const uint GL_OUTPUT_TEXTURE_COORD13_EXT		= 0x87AA;
const uint GL_OUTPUT_TEXTURE_COORD14_EXT		= 0x87AB;
const uint GL_OUTPUT_TEXTURE_COORD15_EXT		= 0x87AC;
const uint GL_OUTPUT_TEXTURE_COORD16_EXT		= 0x87AD;
const uint GL_OUTPUT_TEXTURE_COORD17_EXT		= 0x87AE;
const uint GL_OUTPUT_TEXTURE_COORD18_EXT		= 0x87AF;
const uint GL_OUTPUT_TEXTURE_COORD19_EXT		= 0x87B0;
const uint GL_OUTPUT_TEXTURE_COORD20_EXT		= 0x87B1;
const uint GL_OUTPUT_TEXTURE_COORD21_EXT		= 0x87B2;
const uint GL_OUTPUT_TEXTURE_COORD22_EXT		= 0x87B3;
const uint GL_OUTPUT_TEXTURE_COORD23_EXT		= 0x87B4;
const uint GL_OUTPUT_TEXTURE_COORD24_EXT		= 0x87B5;
const uint GL_OUTPUT_TEXTURE_COORD25_EXT		= 0x87B6;
const uint GL_OUTPUT_TEXTURE_COORD26_EXT		= 0x87B7;
const uint GL_OUTPUT_TEXTURE_COORD27_EXT		= 0x87B8;
const uint GL_OUTPUT_TEXTURE_COORD28_EXT		= 0x87B9;
const uint GL_OUTPUT_TEXTURE_COORD29_EXT		= 0x87BA;
const uint GL_OUTPUT_TEXTURE_COORD30_EXT		= 0x87BB;
const uint GL_OUTPUT_TEXTURE_COORD31_EXT		= 0x87BC;
const uint GL_OUTPUT_FOG_EXT				= 0x87BD;
const uint GL_SCALAR_EXT				= 0x87BE;
const uint GL_VECTOR_EXT				= 0x87BF;
const uint GL_MATRIX_EXT				= 0x87C0;
const uint GL_VARIANT_EXT				= 0x87C1;
const uint GL_INVARIANT_EXT				= 0x87C2;
const uint GL_LOCAL_CONSTANT_EXT			= 0x87C3;
const uint GL_LOCAL_EXT				= 0x87C4;
const uint GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT	= 0x87C5;
const uint GL_MAX_VERTEX_SHADER_VARIANTS_EXT		= 0x87C6;
const uint GL_MAX_VERTEX_SHADER_INVARIANTS_EXT	= 0x87C7;
const uint GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT	= 0x87C8;
const uint GL_MAX_VERTEX_SHADER_LOCALS_EXT		= 0x87C9;
const uint GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT= 0x87CA;
const uint GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT= 0x87CB;
const uint GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT= 0x87CC;
const uint GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT= 0x87CD;
const uint GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT	= 0x87CE;
const uint GL_VERTEX_SHADER_INSTRUCTIONS_EXT		= 0x87CF;
const uint GL_VERTEX_SHADER_VARIANTS_EXT		= 0x87D0;
const uint GL_VERTEX_SHADER_INVARIANTS_EXT		= 0x87D1;
const uint GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT	= 0x87D2;
const uint GL_VERTEX_SHADER_LOCALS_EXT		= 0x87D3;
const uint GL_VERTEX_SHADER_OPTIMIZED_EXT		= 0x87D4;
const uint GL_X_EXT					= 0x87D5;
const uint GL_Y_EXT					= 0x87D6;
const uint GL_Z_EXT					= 0x87D7;
const uint GL_W_EXT					= 0x87D8;
const uint GL_NEGATIVE_X_EXT				= 0x87D9;
const uint GL_NEGATIVE_Y_EXT				= 0x87DA;
const uint GL_NEGATIVE_Z_EXT				= 0x87DB;
const uint GL_NEGATIVE_W_EXT				= 0x87DC;
const uint GL_ZERO_EXT				= 0x87DD;
const uint GL_ONE_EXT					= 0x87DE;
const uint GL_NEGATIVE_ONE_EXT			= 0x87DF;
const uint GL_NORMALIZED_RANGE_EXT			= 0x87E0;
const uint GL_FULL_RANGE_EXT				= 0x87E1;
const uint GL_CURRENT_VERTEX_EXT			= 0x87E2;
const uint GL_MVP_MATRIX_EXT				= 0x87E3;
const uint GL_VARIANT_VALUE_EXT			= 0x87E4;
const uint GL_VARIANT_DATATYPE_EXT			= 0x87E5;
const uint GL_VARIANT_ARRAY_STRIDE_EXT		= 0x87E6;
const uint GL_VARIANT_ARRAY_TYPE_EXT			= 0x87E7;
const uint GL_VARIANT_ARRAY_EXT			= 0x87E8;
const uint GL_VARIANT_ARRAY_POINTER_EXT		= 0x87E9;
const uint GL_INVARIANT_VALUE_EXT			= 0x87EA;
const uint GL_INVARIANT_DATATYPE_EXT			= 0x87EB;
const uint GL_LOCAL_CONSTANT_VALUE_EXT		= 0x87EC;
const uint GL_LOCAL_CONSTANT_DATATYPE_EXT		= 0x87ED;

// 249 - GL_ATI_vertex_streams
const uint GL_MAX_VERTEX_STREAMS_ATI			= 0x876B;
const uint GL_VERTEX_STREAM0_ATI			= 0x876C;
const uint GL_VERTEX_STREAM1_ATI			= 0x876D;
const uint GL_VERTEX_STREAM2_ATI			= 0x876E;
const uint GL_VERTEX_STREAM3_ATI			= 0x876F;
const uint GL_VERTEX_STREAM4_ATI			= 0x8770;
const uint GL_VERTEX_STREAM5_ATI			= 0x8771;
const uint GL_VERTEX_STREAM6_ATI			= 0x8772;
const uint GL_VERTEX_STREAM7_ATI			= 0x8773;
const uint GL_VERTEX_SOURCE_ATI			= 0x8774;

// 256 - GL_ATI_element_array
const uint GL_ELEMENT_ARRAY_ATI			= 0x8768;
const uint GL_ELEMENT_ARRAY_TYPE_ATI			= 0x8769;
const uint GL_ELEMENT_ARRAY_POINTER_ATI		= 0x876A;

// 257 - GL_SUN_mesh_array
const uint GL_QUAD_MESH_SUN				= 0x8614;
const uint GL_TRIANGLE_MESH_SUN			= 0x8615;

// 258 - GL_SUN_slice_accum
const uint GL_SLICE_ACCUM_SUN				= 0x85CC;

// 259 - GL_NV_multisample_filter_hint
const uint GL_MULTISAMPLE_FILTER_HINT_NV		= 0x8534;

// 260 - GL_NV_depth_clamp
const uint GL_DEPTH_CLAMP_NV				= 0x864F;

// 261 - GL_NV_occlusion_query
const uint GL_PIXEL_COUNTER_BITS_NV			= 0x8864;
const uint GL_CURRENT_OCCLUSION_QUERY_ID_NV		= 0x8865;
const uint GL_PIXEL_COUNT_NV				= 0x8866;
const uint GL_PIXEL_COUNT_AVAILABLE_NV		= 0x8867;

// 262 - GL_NV_point_sprite
const uint GL_POINT_SPRITE_NV				= 0x8861;
const uint GL_COORD_REPLACE_NV			= 0x8862;
const uint GL_POINT_SPRITE_R_MODE_NV			= 0x8863;

// 265 - GL_NV_texture_shader3
const uint GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV		= 0x8850;
const uint GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV	= 0x8851;
const uint GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV	= 0x8852;
const uint GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV= 0x8853;
const uint GL_OFFSET_HILO_TEXTURE_2D_NV		= 0x8854;
const uint GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV	= 0x8855;
const uint GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV	= 0x8856;
const uint GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV= 0x8857;
const uint GL_DEPENDENT_HILO_TEXTURE_2D_NV		= 0x8858;
const uint GL_DEPENDENT_RGB_TEXTURE_3D_NV		= 0x8859;
const uint GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV	= 0x885A;
const uint GL_DOT_PRODUCT_PASS_THROUGH_NV		= 0x885B;
const uint GL_DOT_PRODUCT_TEXTURE_1D_NV		= 0x885C;
const uint GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV	= 0x885D;
const uint GL_HILO8_NV				= 0x885E;
const uint GL_SIGNED_HILO8_NV				= 0x885F;
const uint GL_FORCE_BLUE_TO_ONE_NV			= 0x8860;

// 268 - GL_EXT_stencil_two_side
const uint GL_STENCIL_TEST_TWO_SIDE_EXT		= 0x8910;
const uint GL_ACTIVE_STENCIL_FACE_EXT			= 0x8911;

// 269 - GL_ATI_text_fragment_shader
const uint GL_TEXT_FRAGMENT_SHADER_ATI		= 0x8200;

// 270 - GL_APPLE_client_storage
const uint GL_UNPACK_CLIENT_STORAGE_APPLE		= 0x85B2;

// 271 - GL_APPLE_element_array
const uint GL_ELEMENT_ARRAY_APPLE			= 0x8768;
const uint GL_ELEMENT_ARRAY_TYPE_APPLE		= 0x8769;
const uint GL_ELEMENT_ARRAY_POINTER_APPLE		= 0x876A;

// 272 - GL_APPLE_fence
const uint GL_DRAW_PIXELS_APPLE			= 0x8A0A;
const uint GL_FENCE_APPLE				= 0x8A0B;

// 273 - GL_APPLE_vertex_array_object
const uint GL_VERTEX_ARRAY_BINDING_APPLE		= 0x85B5;

// 274 - GL_APPLE_vertex_array_range
const uint GL_VERTEX_ARRAY_RANGE_APPLE		= 0x851D;
const uint GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE		= 0x851E;
const uint GL_VERTEX_ARRAY_STORAGE_HINT_APPLE		= 0x851F;
const uint GL_VERTEX_ARRAY_RANGE_POINTER_APPLE	= 0x8521;
const uint GL_STORAGE_CACHED_APPLE			= 0x85BE;
const uint GL_STORAGE_SHARED_APPLE			= 0x85BF;

// 275 - GL_APPLE_ycbcr_422
const uint GL_YCBCR_422_APPLE				= 0x85B9;
const uint GL_UNSIGNED_SHORT_8_8_APPLE		= 0x85BA;
const uint GL_UNSIGNED_SHORT_8_8_REV_APPLE		= 0x85BB;

// 276 - GL_S3_s3tc
const uint GL_RGB_S3TC				= 0x83A0;
const uint GL_RGB4_S3TC				= 0x83A1;
const uint GL_RGBA_S3TC				= 0x83A2;
const uint GL_RGBA4_S3TC				= 0x83A3;

// 277 - GL_ATI_draw_buffers
const uint GL_MAX_DRAW_BUFFERS_ATI			= 0x8824;
const uint GL_DRAW_BUFFER0_ATI			= 0x8825;
const uint GL_DRAW_BUFFER1_ATI			= 0x8826;
const uint GL_DRAW_BUFFER2_ATI			= 0x8827;
const uint GL_DRAW_BUFFER3_ATI			= 0x8828;
const uint GL_DRAW_BUFFER4_ATI			= 0x8829;
const uint GL_DRAW_BUFFER5_ATI			= 0x882A;
const uint GL_DRAW_BUFFER6_ATI			= 0x882B;
const uint GL_DRAW_BUFFER7_ATI			= 0x882C;
const uint GL_DRAW_BUFFER8_ATI			= 0x882D;
const uint GL_DRAW_BUFFER9_ATI			= 0x882E;
const uint GL_DRAW_BUFFER10_ATI			= 0x882F;
const uint GL_DRAW_BUFFER11_ATI			= 0x8830;
const uint GL_DRAW_BUFFER12_ATI			= 0x8831;
const uint GL_DRAW_BUFFER13_ATI			= 0x8832;
const uint GL_DRAW_BUFFER14_ATI			= 0x8833;
const uint GL_DRAW_BUFFER15_ATI			= 0x8834;

// 278 - GL_ATI_pixel_format_float
const uint GL_TYPE_RGBA_FLOAT_ATI			= 0x8820;
const uint GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI		= 0x8835;

// 279 - GL_ATI_texture_env_combine3
const uint GL_MODULATE_ADD_ATI			= 0x8744;
const uint GL_MODULATE_SIGNED_ADD_ATI			= 0x8745;
const uint GL_MODULATE_SUBTRACT_ATI			= 0x8746;

// 280 - GL_ATI_texture_float
const uint GL_RGBA_FLOAT32_ATI			= 0x8814;
const uint GL_RGB_FLOAT32_ATI				= 0x8815;
const uint GL_ALPHA_FLOAT32_ATI			= 0x8816;
const uint GL_INTENSITY_FLOAT32_ATI			= 0x8817;
const uint GL_LUMINANCE_FLOAT32_ATI			= 0x8818;
const uint GL_LUMINANCE_ALPHA_FLOAT32_ATI		= 0x8819;
const uint GL_RGBA_FLOAT16_ATI			= 0x881A;
const uint GL_RGB_FLOAT16_ATI				= 0x881B;
const uint GL_ALPHA_FLOAT16_ATI			= 0x881C;
const uint GL_INTENSITY_FLOAT16_ATI			= 0x881D;
const uint GL_LUMINANCE_FLOAT16_ATI			= 0x881E;
const uint GL_LUMINANCE_ALPHA_FLOAT16_ATI		= 0x881F;

// 281 - GL_NV_float_buffer
const uint GL_FLOAT_R_NV				= 0x8880;
const uint GL_FLOAT_RG_NV				= 0x8881;
const uint GL_FLOAT_RGB_NV				= 0x8882;
const uint GL_FLOAT_RGBA_NV				= 0x8883;
const uint GL_FLOAT_R16_NV				= 0x8884;
const uint GL_FLOAT_R32_NV				= 0x8885;
const uint GL_FLOAT_RG16_NV				= 0x8886;
const uint GL_FLOAT_RG32_NV				= 0x8887;
const uint GL_FLOAT_RGB16_NV				= 0x8888;
const uint GL_FLOAT_RGB32_NV				= 0x8889;
const uint GL_FLOAT_RGBA16_NV				= 0x888A;
const uint GL_FLOAT_RGBA32_NV				= 0x888B;
const uint GL_TEXTURE_FLOAT_COMPONENTS_NV		= 0x888C;
const uint GL_FLOAT_CLEAR_COLOR_VALUE_NV		= 0x888D;
const uint GL_FLOAT_RGBA_MODE_NV			= 0x888E;

// 282 - GL_NV_fragment_program
const uint GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV= 0x8868;
const uint GL_FRAGMENT_PROGRAM_NV			= 0x8870;
const uint GL_MAX_TEXTURE_COORDS_NV			= 0x8871;
const uint GL_MAX_TEXTURE_IMAGE_UNITS_NV		= 0x8872;
const uint GL_FRAGMENT_PROGRAM_BINDING_NV		= 0x8873;
const uint GL_PROGRAM_ERROR_STRING_NV			= 0x8874;

// 283 - GL_NV_half_float
const uint GL_HALF_FLOAT_NV				= 0x140B;

// 284 - GL_NV_pixel_data_range
const uint GL_WRITE_PIXEL_DATA_RANGE_NV		= 0x8878;
const uint GL_READ_PIXEL_DATA_RANGE_NV		= 0x8879;
const uint GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV	= 0x887A;
const uint GL_READ_PIXEL_DATA_RANGE_LENGTH_NV		= 0x887B;
const uint GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV	= 0x887C;
const uint GL_READ_PIXEL_DATA_RANGE_POINTER_NV	= 0x887D;

// 285 - GL_NV_primitive_restart
const uint GL_PRIMITIVE_RESTART_NV			= 0x8558;
const uint GL_PRIMITIVE_RESTART_INDEX_NV		= 0x8559;

// 286 - GL_NV_texture_expand_normal
const uint GL_TEXTURE_UNSIGNED_REMAP_MODE_NV		= 0x888F;

// 289 - GL_ATI_separate_stencil
const uint GL_STENCIL_BACK_FUNC_ATI			= 0x8800;
const uint GL_STENCIL_BACK_FAIL_ATI			= 0x8801;
const uint GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI	= 0x8802;
const uint GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI	= 0x8803;

// 295 - GL_OES_read_format
const uint GL_IMPLEMENTATION_COLOR_READ_TYPE_OES	= 0x8B9A;
const uint GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES	= 0x8B9B;

// 297 - GL_EXT_depth_bounds_test
const uint GL_DEPTH_BOUNDS_TEST_EXT			= 0x8890;
const uint GL_DEPTH_BOUNDS_EXT			= 0x8891;

// 298 - GL_EXT_texture_mirror_clamp
const uint GL_MIRROR_CLAMP_EXT			= 0x8742;
const uint GL_MIRROR_CLAMP_TO_EDGE_EXT		= 0x8743;
const uint GL_MIRROR_CLAMP_TO_BORDER_EXT		= 0x8912;

// 299 - GL_EXT_blend_equation_separate
const uint GL_BLEND_EQUATION_RGB_EXT			= 0x8009;
const uint GL_BLEND_EQUATION_ALPHA_EXT		= 0x883D;

// 300 - GL_MESA_pack_invert
const uint GL_PACK_INVERT_MESA			= 0x8758;

// 301 - GL_MESA_ycbcr_texture
const uint GL_UNSIGNED_SHORT_8_8_MESA			= 0x85BA;
const uint GL_UNSIGNED_SHORT_8_8_REV_MESA		= 0x85BB;
const uint GL_YCBCR_MESA				= 0x8757;

// 302 - GL_EXT_pixel_buffer_object
const uint GL_PIXEL_PACK_BUFFER_EXT			= 0x88EB;
const uint GL_PIXEL_UNPACK_BUFFER_EXT			= 0x88EC;
const uint GL_PIXEL_PACK_BUFFER_BINDING_EXT		= 0x88ED;
const uint GL_PIXEL_UNPACK_BUFFER_BINDING_EXT		= 0x88EF;

// 304 - GL_NV_fragment_program2
const uint GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV	= 0x88F4;
const uint GL_MAX_PROGRAM_CALL_DEPTH_NV		= 0x88F5;
const uint GL_MAX_PROGRAM_IF_DEPTH_NV			= 0x88F6;
const uint GL_MAX_PROGRAM_LOOP_DEPTH_NV		= 0x88F7;
const uint GL_MAX_PROGRAM_LOOP_COUNT_NV		= 0x88F8;

// 310 - GL_EXT_framebuffer_object
const uint GL_INVALID_FRAMEBUFFER_OPERATION_EXT	= 0x0506;
const uint GL_MAX_RENDERBUFFER_SIZE_EXT		= 0x84E8;
const uint GL_FRAMEBUFFER_BINDING_EXT			= 0x8CA6;
const uint GL_RENDERBUFFER_BINDING_EXT		= 0x8CA7;
const uint GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT	= 0x8CD0;
const uint GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT	= 0x8CD1;
const uint GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT= 0x8CD2;
const uint GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT= 0x8CD3;
const uint GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT= 0x8CD4;
const uint GL_FRAMEBUFFER_COMPLETE_EXT		= 0x8CD5;
const uint GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT	= 0x8CD6;
const uint GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT= 0x8CD7;
const uint GL_FRAMEBUFFER_INCOMPLETE_DUPLICATE_ATTACHMENT_EXT= 0x8CD8;
const uint GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT	= 0x8CD9;
const uint GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT	= 0x8CDA;
const uint GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT	= 0x8CDB;
const uint GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT	= 0x8CDC;
const uint GL_FRAMEBUFFER_UNSUPPORTED_EXT		= 0x8CDD;
const uint GL_MAX_COLOR_ATTACHMENTS_EXT		= 0x8CDF;
const uint GL_COLOR_ATTACHMENT0_EXT			= 0x8CE0;
const uint GL_COLOR_ATTACHMENT1_EXT			= 0x8CE1;
const uint GL_COLOR_ATTACHMENT2_EXT			= 0x8CE2;
const uint GL_COLOR_ATTACHMENT3_EXT			= 0x8CE3;
const uint GL_COLOR_ATTACHMENT4_EXT			= 0x8CE4;
const uint GL_COLOR_ATTACHMENT5_EXT			= 0x8CE5;
const uint GL_COLOR_ATTACHMENT6_EXT			= 0x8CE6;
const uint GL_COLOR_ATTACHMENT7_EXT			= 0x8CE7;
const uint GL_COLOR_ATTACHMENT8_EXT			= 0x8CE8;
const uint GL_COLOR_ATTACHMENT9_EXT			= 0x8CE9;
const uint GL_COLOR_ATTACHMENT10_EXT			= 0x8CEA;
const uint GL_COLOR_ATTACHMENT11_EXT			= 0x8CEB;
const uint GL_COLOR_ATTACHMENT12_EXT			= 0x8CEC;
const uint GL_COLOR_ATTACHMENT13_EXT			= 0x8CED;
const uint GL_COLOR_ATTACHMENT14_EXT			= 0x8CEE;
const uint GL_COLOR_ATTACHMENT15_EXT			= 0x8CEF;
const uint GL_DEPTH_ATTACHMENT_EXT			= 0x8D00;
const uint GL_STENCIL_ATTACHMENT_EXT			= 0x8D20;
const uint GL_FRAMEBUFFER_EXT				= 0x8D40;
const uint GL_RENDERBUFFER_EXT			= 0x8D41;
const uint GL_RENDERBUFFER_WIDTH_EXT			= 0x8D42;
const uint GL_RENDERBUFFER_HEIGHT_EXT			= 0x8D43;
const uint GL_RENDERBUFFER_INTERNAL_FORMAT_EXT	= 0x8D44;
const uint GL_STENCIL_INDEX1_EXT			= 0x8D46;
const uint GL_STENCIL_INDEX4_EXT			= 0x8D47;
const uint GL_STENCIL_INDEX8_EXT			= 0x8D48;
const uint GL_STENCIL_INDEX16_EXT			= 0x8D49;
const uint GL_RENDERBUFFER_RED_SIZE_EXT		= 0x8D50;
const uint GL_RENDERBUFFER_GREEN_SIZE_EXT		= 0x8D51;
const uint GL_RENDERBUFFER_BLUE_SIZE_EXT		= 0x8D52;
const uint GL_RENDERBUFFER_ALPHA_SIZE_EXT		= 0x8D53;
const uint GL_RENDERBUFFER_DEPTH_SIZE_EXT		= 0x8D54;
const uint GL_RENDERBUFFER_STENCIL_SIZE_EXT		= 0x8D55;

// 314 - GL_EXT_stencil_clear_tag
const uint GL_STENCIL_TAG_BITS_EXT			= 0x88F2;
const uint GL_STENCIL_CLEAR_TAG_VALUE_EXT		= 0x88F3;

// 315 - GL_EXT_texture_sRGB
const uint SRGB_EXT					= 0x8C40;
const uint SRGB8_EXT					= 0x8C41;
const uint SRGB_ALPHA_EXT				= 0x8C42;
const uint SRGB8_ALPHA8_EXT				= 0x8C43;
const uint SLUMINANCE_ALPHA_EXT			= 0x8C44;
const uint SLUMINANCE8_ALPHA8_EXT			= 0x8C45;
const uint SLUMINANCE_EXT				= 0x8C46;
const uint SLUMINANCE8_EXT				= 0x8C47;
const uint COMPRESSED_SRGB_EXT			= 0x8C48;
const uint COMPRESSED_SRGB_ALPHA_EXT			= 0x8C49;
const uint COMPRESSED_SLUMINANCE_EXT			= 0x8C4A;
const uint COMPRESSED_SLUMINANCE_ALPHA_EXT		= 0x8C4B;
const uint COMPRESSED_SRGB_S3TC_DXT1_EXT		= 0x8C4C;
const uint COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT	= 0x8C4D;
const uint COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT	= 0x8C4E;
const uint COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT	= 0x8C4F;

// 316 - GL_EXT_framebuffer_blit
const uint READ_FRAMEBUFFER_EXT			= 0x8CA8;
const uint DRAW_FRAMEBUFFER_EXT			= 0x8CA9;
const uint DRAW_FRAMEBUFFER_BINDING_EXT		= 0x8CA6;
const uint READ_FRAMEBUFFER_BINDING_EXT		= 0x8CAA;
const uint FRAMEBUFFER_BINDING_EXT			= DRAW_FRAMEBUFFER_BINDING_EXT;

// 317 - GL_EXT_framebuffer_multisample
const uint RENDERBUFFER_SAMPLES_EXT			= 0x8CAB;

// 318 - GL_MESAX_texture_stack
const uint TEXTURE_1D_STACK_MESAX			= 0x8759;
const uint TEXTURE_2D_STACK_MESAX			= 0x875A;
const uint PROXY_TEXTURE_1D_STACK_MESAX		= 0x875B;
const uint PROXY_TEXTURE_2D_STACK_MESAX		= 0x875C;
const uint TEXTURE_1D_STACK_BINDING_MESAX		= 0x875D;
const uint TEXTURE_2D_STACK_BINDING_MESAX		= 0x875E;

// 319 - GL_EXT_timer_query
const uint TIME_ELAPSED_EXT				= 0x88BF;

// 321 - GL_APPLE_flush_buffer_range
const uint BUFFER_SERIALIZED_MODIFY_APPLE		= 0x8A12;
const uint BUFFER_FLUSHING_UNMAP_APPLE		= 0x8A13;

/*
 * Types
 */
alias ptrdiff_t GLintptrARB;
alias ptrdiff_t GLsizeiptrARB;

alias char GLcharARB;
alias uint GLhandleARB;

alias ushort GLhalfARB;

alias ushort GLhalfNV;

/*
 * Functions
 */
 string failed;
  
private HXModule glextdrv;
import std.stdio;
private void* getProc(string procname) {
	void* symbol = ExeModule_GetSymbol(glextdrv, procname);
	if (symbol is null) {
		try{
			failed~=procname~"\r\n";
		//writeln("Failed to load GLEXT proc address " ~ procname );
		}catch{}
	}
	return (symbol);
}

static this () {
	failed="Failed to load following OpenGL functions:\r\n";
	version (Windows) {
		glextdrv = ExeModule_Load("OpenGL32.dll");
	} else version (linux) {
		glextdrv = ExeModule_Load("libGL.so");
	}
	glActiveTextureARB = cast(pfglActiveTextureARB)getProc("glActiveTextureARB");
	glClientActiveTextureARB = cast(pfglClientActiveTextureARB)getProc("glClientActiveTextureARB");
	glMultiTexCoord1dARB = cast(pfglMultiTexCoord1dARB)getProc("glMultiTexCoord1dARB");
	glMultiTexCoord1dvARB = cast(pfglMultiTexCoord1dvARB)getProc("glMultiTexCoord1dvARB");
	glMultiTexCoord1fARB = cast(pfglMultiTexCoord1fARB)getProc("glMultiTexCoord1fARB");
	glMultiTexCoord1fvARB = cast(pfglMultiTexCoord1fvARB)getProc("glMultiTexCoord1fvARB");
	glMultiTexCoord1iARB = cast(pfglMultiTexCoord1iARB)getProc("glMultiTexCoord1iARB");
	glMultiTexCoord1ivARB = cast(pfglMultiTexCoord1ivARB)getProc("glMultiTexCoord1ivARB");
	glMultiTexCoord1sARB = cast(pfglMultiTexCoord1sARB)getProc("glMultiTexCoord1sARB");
	glMultiTexCoord1svARB = cast(pfglMultiTexCoord1svARB)getProc("glMultiTexCoord1svARB");
	glMultiTexCoord2dARB = cast(pfglMultiTexCoord2dARB)getProc("glMultiTexCoord2dARB");
	glMultiTexCoord2dvARB = cast(pfglMultiTexCoord2dvARB)getProc("glMultiTexCoord2dvARB");
	glMultiTexCoord2fARB = cast(pfglMultiTexCoord2fARB)getProc("glMultiTexCoord2fARB");
	glMultiTexCoord2fvARB = cast(pfglMultiTexCoord2fvARB)getProc("glMultiTexCoord2fvARB");
	glMultiTexCoord2iARB = cast(pfglMultiTexCoord2iARB)getProc("glMultiTexCoord2iARB");
	glMultiTexCoord2ivARB = cast(pfglMultiTexCoord2ivARB)getProc("glMultiTexCoord2ivARB");
	glMultiTexCoord2sARB = cast(pfglMultiTexCoord2sARB)getProc("glMultiTexCoord2sARB");
	glMultiTexCoord2svARB = cast(pfglMultiTexCoord2svARB)getProc("glMultiTexCoord2svARB");
	glMultiTexCoord3dARB = cast(pfglMultiTexCoord3dARB)getProc("glMultiTexCoord3dARB");
	glMultiTexCoord3dvARB = cast(pfglMultiTexCoord3dvARB)getProc("glMultiTexCoord3dvARB");
	glMultiTexCoord3fARB = cast(pfglMultiTexCoord3fARB)getProc("glMultiTexCoord3fARB");
	glMultiTexCoord3fvARB = cast(pfglMultiTexCoord3fvARB)getProc("glMultiTexCoord3fvARB");
	glMultiTexCoord3iARB = cast(pfglMultiTexCoord3iARB)getProc("glMultiTexCoord3iARB");
	glMultiTexCoord3ivARB = cast(pfglMultiTexCoord3ivARB)getProc("glMultiTexCoord3ivARB");
	glMultiTexCoord3sARB = cast(pfglMultiTexCoord3sARB)getProc("glMultiTexCoord3sARB");
	glMultiTexCoord3svARB = cast(pfglMultiTexCoord3svARB)getProc("glMultiTexCoord3svARB");
	glMultiTexCoord4dARB = cast(pfglMultiTexCoord4dARB)getProc("glMultiTexCoord4dARB");
	glMultiTexCoord4dvARB = cast(pfglMultiTexCoord4dvARB)getProc("glMultiTexCoord4dvARB");
	glMultiTexCoord4fARB = cast(pfglMultiTexCoord4fARB)getProc("glMultiTexCoord4fARB");
	glMultiTexCoord4fvARB = cast(pfglMultiTexCoord4fvARB)getProc("glMultiTexCoord4fvARB");
	glMultiTexCoord4iARB = cast(pfglMultiTexCoord4iARB)getProc("glMultiTexCoord4iARB");
	glMultiTexCoord4ivARB = cast(pfglMultiTexCoord4ivARB)getProc("glMultiTexCoord4ivARB");
	glMultiTexCoord4sARB = cast(pfglMultiTexCoord4sARB)getProc("glMultiTexCoord4sARB");
	glMultiTexCoord4svARB = cast(pfglMultiTexCoord4svARB)getProc("glMultiTexCoord4svARB");

	glLoadTransposeMatrixfARB = cast(pfglLoadTransposeMatrixfARB)getProc("glLoadTransposeMatrixfARB");
	glLoadTransposeMatrixdARB = cast(pfglLoadTransposeMatrixdARB)getProc("glLoadTransposeMatrixdARB");
	glMultTransposeMatrixfARB = cast(pfglMultTransposeMatrixfARB)getProc("glMultTransposeMatrixfARB");
	glMultTransposeMatrixdARB = cast(pfglMultTransposeMatrixdARB)getProc("glMultTransposeMatrixdARB");

	glSampleCoverageARB = cast(pfglSampleCoverageARB)getProc("glSampleCoverageARB");

	glCompressedTexImage3DARB = cast(pfglCompressedTexImage3DARB)getProc("glCompressedTexImage3DARB");
	glCompressedTexImage2DARB = cast(pfglCompressedTexImage2DARB)getProc("glCompressedTexImage2DARB");
	glCompressedTexImage1DARB = cast(pfglCompressedTexImage1DARB)getProc("glCompressedTexImage1DARB");
	glCompressedTexSubImage3DARB = cast(pfglCompressedTexSubImage3DARB)getProc("glCompressedTexSubImage3DARB");
	glCompressedTexSubImage2DARB = cast(pfglCompressedTexSubImage2DARB)getProc("glCompressedTexSubImage2DARB");
	glCompressedTexSubImage1DARB = cast(pfglCompressedTexSubImage1DARB)getProc("glCompressedTexSubImage1DARB");
	glGetCompressedTexImageARB = cast(pfglGetCompressedTexImageARB)getProc("glGetCompressedTexImageARB");

	glPointParameterfARB = cast(pfglPointParameterfARB)getProc("glPointParameterfARB");
	glPointParameterfvARB = cast(pfglPointParameterfvARB)getProc("glPointParameterfvARB");

	glWeightbvARB = cast(pfglWeightbvARB)getProc("glWeightbvARB");
	glWeightsvARB = cast(pfglWeightsvARB)getProc("glWeightsvARB");
	glWeightivARB = cast(pfglWeightivARB)getProc("glWeightivARB");
	glWeightfvARB = cast(pfglWeightfvARB)getProc("glWeightfvARB");
	glWeightdvARB = cast(pfglWeightdvARB)getProc("glWeightdvARB");
	glWeightubvARB = cast(pfglWeightubvARB)getProc("glWeightubvARB");
	glWeightusvARB = cast(pfglWeightusvARB)getProc("glWeightusvARB");
	glWeightuivARB = cast(pfglWeightuivARB)getProc("glWeightuivARB");
	glWeightPointerARB = cast(pfglWeightPointerARB)getProc("glWeightPointerARB");
	glVertexBlendARB = cast(pfglVertexBlendARB)getProc("glVertexBlendARB");

	glCurrentPaletteMatrixARB = cast(pfglCurrentPaletteMatrixARB)getProc("glCurrentPaletteMatrixARB");
	glMatrixIndexubvARB = cast(pfglMatrixIndexubvARB)getProc("glMatrixIndexubvARB");
	glMatrixIndexusvARB = cast(pfglMatrixIndexusvARB)getProc("glMatrixIndexusvARB");
	glMatrixIndexuivARB = cast(pfglMatrixIndexuivARB)getProc("glMatrixIndexuivARB");
	glMatrixIndexPointerARB = cast(pfglMatrixIndexPointerARB)getProc("glMatrixIndexPointerARB");

	glWindowPos2dARB = cast(pfglWindowPos2dARB)getProc("glWindowPos2dARB");
	glWindowPos2dvARB = cast(pfglWindowPos2dvARB)getProc("glWindowPos2dvARB");
	glWindowPos2fARB = cast(pfglWindowPos2fARB)getProc("glWindowPos2fARB");
	glWindowPos2fvARB = cast(pfglWindowPos2fvARB)getProc("glWindowPos2fvARB");
	glWindowPos2iARB = cast(pfglWindowPos2iARB)getProc("glWindowPos2iARB");
	glWindowPos2ivARB = cast(pfglWindowPos2ivARB)getProc("glWindowPos2ivARB");
	glWindowPos2sARB = cast(pfglWindowPos2sARB)getProc("glWindowPos2sARB");
	glWindowPos2svARB = cast(pfglWindowPos2svARB)getProc("glWindowPos2svARB");
	glWindowPos3dARB = cast(pfglWindowPos3dARB)getProc("glWindowPos3dARB");
	glWindowPos3dvARB = cast(pfglWindowPos3dvARB)getProc("glWindowPos3dvARB");
	glWindowPos3fARB = cast(pfglWindowPos3fARB)getProc("glWindowPos3fARB");
	glWindowPos3fvARB = cast(pfglWindowPos3fvARB)getProc("glWindowPos3fvARB");
	glWindowPos3iARB = cast(pfglWindowPos3iARB)getProc("glWindowPos3iARB");
	glWindowPos3ivARB = cast(pfglWindowPos3ivARB)getProc("glWindowPos3ivARB");
	glWindowPos3sARB = cast(pfglWindowPos3sARB)getProc("glWindowPos3sARB");
	glWindowPos3svARB = cast(pfglWindowPos3svARB)getProc("glWindowPos3svARB");

	glVertexAttrib1dARB = cast(pfglVertexAttrib1dARB)getProc("glVertexAttrib1dARB");
	glVertexAttrib1dvARB = cast(pfglVertexAttrib1dvARB)getProc("glVertexAttrib1dvARB");
	glVertexAttrib1fARB = cast(pfglVertexAttrib1fARB)getProc("glVertexAttrib1fARB");
	glVertexAttrib1fvARB = cast(pfglVertexAttrib1fvARB)getProc("glVertexAttrib1fvARB");
	glVertexAttrib1sARB = cast(pfglVertexAttrib1sARB)getProc("glVertexAttrib1sARB");
	glVertexAttrib1svARB = cast(pfglVertexAttrib1svARB)getProc("glVertexAttrib1svARB");
	glVertexAttrib2dARB = cast(pfglVertexAttrib2dARB)getProc("glVertexAttrib2dARB");
	glVertexAttrib2dvARB = cast(pfglVertexAttrib2dvARB)getProc("glVertexAttrib2dvARB");
	glVertexAttrib2fARB = cast(pfglVertexAttrib2fARB)getProc("glVertexAttrib2fARB");
	glVertexAttrib2fvARB = cast(pfglVertexAttrib2fvARB)getProc("glVertexAttrib2fvARB");
	glVertexAttrib2sARB = cast(pfglVertexAttrib2sARB)getProc("glVertexAttrib2sARB");
	glVertexAttrib2svARB = cast(pfglVertexAttrib2svARB)getProc("glVertexAttrib2svARB");
	glVertexAttrib3dARB = cast(pfglVertexAttrib3dARB)getProc("glVertexAttrib3dARB");
	glVertexAttrib3dvARB = cast(pfglVertexAttrib3dvARB)getProc("glVertexAttrib3dvARB");
	glVertexAttrib3fARB = cast(pfglVertexAttrib3fARB)getProc("glVertexAttrib3fARB");
	glVertexAttrib3fvARB = cast(pfglVertexAttrib3fvARB)getProc("glVertexAttrib3fvARB");
	glVertexAttrib3sARB = cast(pfglVertexAttrib3sARB)getProc("glVertexAttrib3sARB");
	glVertexAttrib3svARB = cast(pfglVertexAttrib3svARB)getProc("glVertexAttrib3svARB");
	glVertexAttrib4NbvARB = cast(pfglVertexAttrib4NbvARB)getProc("glVertexAttrib4NbvARB");
	glVertexAttrib4NivARB = cast(pfglVertexAttrib4NivARB)getProc("glVertexAttrib4NivARB");
	glVertexAttrib4NsvARB = cast(pfglVertexAttrib4NsvARB)getProc("glVertexAttrib4NsvARB");
	glVertexAttrib4NubARB = cast(pfglVertexAttrib4NubARB)getProc("glVertexAttrib4NubARB");
	glVertexAttrib4NubvARB = cast(pfglVertexAttrib4NubvARB)getProc("glVertexAttrib4NubvARB");
	glVertexAttrib4NuivARB = cast(pfglVertexAttrib4NuivARB)getProc("glVertexAttrib4NuivARB");
	glVertexAttrib4NusvARB = cast(pfglVertexAttrib4NusvARB)getProc("glVertexAttrib4NusvARB");
	glVertexAttrib4bvARB = cast(pfglVertexAttrib4bvARB)getProc("glVertexAttrib4bvARB");
	glVertexAttrib4dARB = cast(pfglVertexAttrib4dARB)getProc("glVertexAttrib4dARB");
	glVertexAttrib4dvARB = cast(pfglVertexAttrib4dvARB)getProc("glVertexAttrib4dvARB");
	glVertexAttrib4fARB = cast(pfglVertexAttrib4fARB)getProc("glVertexAttrib4fARB");
	glVertexAttrib4fvARB = cast(pfglVertexAttrib4fvARB)getProc("glVertexAttrib4fvARB");
	glVertexAttrib4ivARB = cast(pfglVertexAttrib4ivARB)getProc("glVertexAttrib4ivARB");
	glVertexAttrib4sARB = cast(pfglVertexAttrib4sARB)getProc("glVertexAttrib4sARB");
	glVertexAttrib4svARB = cast(pfglVertexAttrib4svARB)getProc("glVertexAttrib4svARB");
	glVertexAttrib4ubvARB = cast(pfglVertexAttrib4ubvARB)getProc("glVertexAttrib4ubvARB");
	glVertexAttrib4uivARB = cast(pfglVertexAttrib4uivARB)getProc("glVertexAttrib4uivARB");
	glVertexAttrib4usvARB = cast(pfglVertexAttrib4usvARB)getProc("glVertexAttrib4usvARB");
	glVertexAttribPointerARB = cast(pfglVertexAttribPointerARB)getProc("glVertexAttribPointerARB");
	glEnableVertexAttribArrayARB = cast(pfglEnableVertexAttribArrayARB)getProc("glEnableVertexAttribArrayARB");
	glDisableVertexAttribArrayARB = cast(pfglDisableVertexAttribArrayARB)getProc("glDisableVertexAttribArrayARB");
	glProgramStringARB = cast(pfglProgramStringARB)getProc("glProgramStringARB");
	glBindProgramARB = cast(pfglBindProgramARB)getProc("glBindProgramARB");
	glDeleteProgramsARB = cast(pfglDeleteProgramsARB)getProc("glDeleteProgramsARB");
	glGenProgramsARB = cast(pfglGenProgramsARB)getProc("glGenProgramsARB");
	glProgramEnvParameter4dARB = cast(pfglProgramEnvParameter4dARB)getProc("glProgramEnvParameter4dARB");
	glProgramEnvParameter4dvARB = cast(pfglProgramEnvParameter4dvARB)getProc("glProgramEnvParameter4dvARB");
	glProgramEnvParameter4fARB = cast(pfglProgramEnvParameter4fARB)getProc("glProgramEnvParameter4fARB");
	glProgramEnvParameter4fvARB = cast(pfglProgramEnvParameter4fvARB)getProc("glProgramEnvParameter4fvARB");
	glProgramLocalParameter4dARB = cast(pfglProgramLocalParameter4dARB)getProc("glProgramLocalParameter4dARB");
	glProgramLocalParameter4dvARB = cast(pfglProgramLocalParameter4dvARB)getProc("glProgramLocalParameter4dvARB");
	glProgramLocalParameter4fARB = cast(pfglProgramLocalParameter4fARB)getProc("glProgramLocalParameter4fARB");
	glProgramLocalParameter4fvARB = cast(pfglProgramLocalParameter4fvARB)getProc("glProgramLocalParameter4fvARB");
	glGetProgramEnvParameterdvARB = cast(pfglGetProgramEnvParameterdvARB)getProc("glGetProgramEnvParameterdvARB");
	glGetProgramEnvParameterfvARB = cast(pfglGetProgramEnvParameterfvARB)getProc("glGetProgramEnvParameterfvARB");
	glGetProgramLocalParameterdvARB = cast(pfglGetProgramLocalParameterdvARB)getProc("glGetProgramLocalParameterdvARB");
	glGetProgramLocalParameterfvARB = cast(pfglGetProgramLocalParameterfvARB)getProc("glGetProgramLocalParameterfvARB");
	glGetProgramivARB = cast(pfglGetProgramivARB)getProc("glGetProgramivARB");
	glGetProgramStringARB = cast(pfglGetProgramStringARB)getProc("glGetProgramStringARB");
	glGetVertexAttribdvARB = cast(pfglGetVertexAttribdvARB)getProc("glGetVertexAttribdvARB");
	glGetVertexAttribfvARB = cast(pfglGetVertexAttribfvARB)getProc("glGetVertexAttribfvARB");
	glGetVertexAttribivARB = cast(pfglGetVertexAttribivARB)getProc("glGetVertexAttribivARB");
	glGetVertexAttribPointervARB = cast(pfglGetVertexAttribPointervARB)getProc("glGetVertexAttribPointervARB");
	glIsProgramARB = cast(pfglIsProgramARB)getProc("glIsProgramARB");

	glBindBufferARB = cast(pfglBindBufferARB)getProc("glBindBufferARB");
	glDeleteBuffersARB = cast(pfglDeleteBuffersARB)getProc("glDeleteBuffersARB");
	glGenBuffersARB = cast(pfglGenBuffersARB)getProc("glGenBuffersARB");
	glIsBufferARB = cast(pfglIsBufferARB)getProc("glIsBufferARB");
	glBufferDataARB = cast(pfglBufferDataARB)getProc("glBufferDataARB");
	glBufferSubDataARB = cast(pfglBufferSubDataARB)getProc("glBufferSubDataARB");
	glGetBufferSubDataARB = cast(pfglGetBufferSubDataARB)getProc("glGetBufferSubDataARB");
	glMapBufferARB = cast(pfglMapBufferARB)getProc("glMapBufferARB");
	glUnmapBufferARB = cast(pfglUnmapBufferARB)getProc("glUnmapBufferARB");
	glGetBufferParameterivARB = cast(pfglGetBufferParameterivARB)getProc("glGetBufferParameterivARB");
	glGetBufferPointervARB = cast(pfglGetBufferPointervARB)getProc("glGetBufferPointervARB");

	glGenQueriesARB = cast(pfglGenQueriesARB)getProc("glGenQueriesARB");
	glDeleteQueriesARB = cast(pfglDeleteQueriesARB)getProc("glDeleteQueriesARB");
	glIsQueryARB = cast(pfglIsQueryARB)getProc("glIsQueryARB");
	glBeginQueryARB = cast(pfglBeginQueryARB)getProc("glBeginQueryARB");
	glEndQueryARB = cast(pfglEndQueryARB)getProc("glEndQueryARB");
	glGetQueryivARB = cast(pfglGetQueryivARB)getProc("glGetQueryivARB");
	glGetQueryObjectivARB = cast(pfglGetQueryObjectivARB)getProc("glGetQueryObjectivARB");
	glGetQueryObjectuivARB = cast(pfglGetQueryObjectuivARB)getProc("glGetQueryObjectuivARB");

	glDeleteObjectARB = cast(pfglDeleteObjectARB)getProc("glDeleteObjectARB");
	glGetHandleARB = cast(pfglGetHandleARB)getProc("glGetHandleARB");
	glDetachObjectARB = cast(pfglDetachObjectARB)getProc("glDetachObjectARB");
	glCreateShaderObjectARB = cast(pfglCreateShaderObjectARB)getProc("glCreateShaderObjectARB");
	glShaderSourceARB = cast(pfglShaderSourceARB)getProc("glShaderSourceARB");
	glCompileShaderARB = cast(pfglCompileShaderARB)getProc("glCompileShaderARB");
	glCreateProgramObjectARB = cast(pfglCreateProgramObjectARB)getProc("glCreateProgramObjectARB");
	glAttachObjectARB = cast(pfglAttachObjectARB)getProc("glAttachObjectARB");
	glLinkProgramARB = cast(pfglLinkProgramARB)getProc("glLinkProgramARB");
	glUseProgramObjectARB = cast(pfglUseProgramObjectARB)getProc("glUseProgramObjectARB");
	glValidateProgramARB = cast(pfglValidateProgramARB)getProc("glValidateProgramARB");
	glUniform1fARB = cast(pfglUniform1fARB)getProc("glUniform1fARB");
	glUniform2fARB = cast(pfglUniform2fARB)getProc("glUniform2fARB");
	glUniform3fARB = cast(pfglUniform3fARB)getProc("glUniform3fARB");
	glUniform4fARB = cast(pfglUniform4fARB)getProc("glUniform4fARB");
	glUniform1iARB = cast(pfglUniform1iARB)getProc("glUniform1iARB");
	glUniform2iARB = cast(pfglUniform2iARB)getProc("glUniform2iARB");
	glUniform3iARB = cast(pfglUniform3iARB)getProc("glUniform3iARB");
	glUniform4iARB = cast(pfglUniform4iARB)getProc("glUniform4iARB");
	glUniform1fvARB = cast(pfglUniform1fvARB)getProc("glUniform1fvARB");
	glUniform2fvARB = cast(pfglUniform2fvARB)getProc("glUniform2fvARB");
	glUniform3fvARB = cast(pfglUniform3fvARB)getProc("glUniform3fvARB");
	glUniform4fvARB = cast(pfglUniform4fvARB)getProc("glUniform4fvARB");
	glUniform1ivARB = cast(pfglUniform1ivARB)getProc("glUniform1ivARB");
	glUniform2ivARB = cast(pfglUniform2ivARB)getProc("glUniform2ivARB");
	glUniform3ivARB = cast(pfglUniform3ivARB)getProc("glUniform3ivARB");
	glUniform4ivARB = cast(pfglUniform4ivARB)getProc("glUniform4ivARB");
	glUniformMatrix2fvARB = cast(pfglUniformMatrix2fvARB)getProc("glUniformMatrix2fvARB");
	glUniformMatrix3fvARB = cast(pfglUniformMatrix3fvARB)getProc("glUniformMatrix3fvARB");
	glUniformMatrix4fvARB = cast(pfglUniformMatrix4fvARB)getProc("glUniformMatrix4fvARB");
	glGetObjectParameterfvARB = cast(pfglGetObjectParameterfvARB)getProc("glGetObjectParameterfvARB");
	glGetObjectParameterivARB = cast(pfglGetObjectParameterivARB)getProc("glGetObjectParameterivARB");
	glGetInfoLogARB = cast(pfglGetInfoLogARB)getProc("glGetInfoLogARB");
	glGetAttachedObjectsARB = cast(pfglGetAttachedObjectsARB)getProc("glGetAttachedObjectsARB");
	glGetUniformLocationARB = cast(pfglGetUniformLocationARB)getProc("glGetUniformLocationARB");
	glGetActiveUniformARB = cast(pfglGetActiveUniformARB)getProc("glGetActiveUniformARB");
	glGetUniformfvARB = cast(pfglGetUniformfvARB)getProc("glGetUniformfvARB");
	glGetUniformivARB = cast(pfglGetUniformivARB)getProc("glGetUniformivARB");
	glGetShaderSourceARB = cast(pfglGetShaderSourceARB)getProc("glGetShaderSourceARB");

	glBindAttribLocationARB = cast(pfglBindAttribLocationARB)getProc("glBindAttribLocationARB");
	glGetActiveAttribARB = cast(pfglGetActiveAttribARB)getProc("glGetActiveAttribARB");
	glGetAttribLocationARB = cast(pfglGetAttribLocationARB)getProc("glGetAttribLocationARB");

	glDrawBuffersARB = cast(pfglDrawBuffersARB)getProc("glDrawBuffersARB");

	glClampColorARB = cast(pfglClampColorARB)getProc("glClampColorARB");

	glBlendColorEXT = cast(pfglBlendColorEXT)getProc("glBlendColorEXT");

	glPolygonOffsetEXT = cast(pfglPolygonOffsetEXT)getProc("glPolygonOffsetEXT");

	glTexImage3DEXT = cast(pfglTexImage3DEXT)getProc("glTexImage3DEXT");
	glTexSubImage3DEXT = cast(pfglTexSubImage3DEXT)getProc("glTexSubImage3DEXT");

	glGetTexFilterFuncSGIS = cast(pfglGetTexFilterFuncSGIS)getProc("glGetTexFilterFuncSGIS");
	glTexFilterFuncSGIS = cast(pfglTexFilterFuncSGIS)getProc("glTexFilterFuncSGIS");

	glTexSubImage1DEXT = cast(pfglTexSubImage1DEXT)getProc("glTexSubImage1DEXT");
	glTexSubImage2DEXT = cast(pfglTexSubImage2DEXT)getProc("glTexSubImage2DEXT");

	glCopyTexImage1DEXT = cast(pfglCopyTexImage1DEXT)getProc("glCopyTexImage1DEXT");
	glCopyTexImage2DEXT = cast(pfglCopyTexImage2DEXT)getProc("glCopyTexImage2DEXT");
	glCopyTexSubImage1DEXT = cast(pfglCopyTexSubImage1DEXT)getProc("glCopyTexSubImage1DEXT");
	glCopyTexSubImage2DEXT = cast(pfglCopyTexSubImage2DEXT)getProc("glCopyTexSubImage2DEXT");
	glCopyTexSubImage3DEXT = cast(pfglCopyTexSubImage3DEXT)getProc("glCopyTexSubImage3DEXT");

	glGetHistogramEXT = cast(pfglGetHistogramEXT)getProc("glGetHistogramEXT");
	glGetHistogramParameterfvEXT = cast(pfglGetHistogramParameterfvEXT)getProc("glGetHistogramParameterfvEXT");
	glGetHistogramParameterivEXT = cast(pfglGetHistogramParameterivEXT)getProc("glGetHistogramParameterivEXT");
	glGetMinmaxEXT = cast(pfglGetMinmaxEXT)getProc("glGetMinmaxEXT");
	glGetMinmaxParameterfvEXT = cast(pfglGetMinmaxParameterfvEXT)getProc("glGetMinmaxParameterfvEXT");
	glGetMinmaxParameterivEXT = cast(pfglGetMinmaxParameterivEXT)getProc("glGetMinmaxParameterivEXT");
	glHistogramEXT = cast(pfglHistogramEXT)getProc("glHistogramEXT");
	glMinmaxEXT = cast(pfglMinmaxEXT)getProc("glMinmaxEXT");
	glResetHistogramEXT = cast(pfglResetHistogramEXT)getProc("glResetHistogramEXT");
	glResetMinmaxEXT = cast(pfglResetMinmaxEXT)getProc("glResetMinmaxEXT");

	glConvolutionFilter1DEXT = cast(pfglConvolutionFilter1DEXT)getProc("glConvolutionFilter1DEXT");
	glConvolutionFilter2DEXT = cast(pfglConvolutionFilter2DEXT)getProc("glConvolutionFilter2DEXT");
	glConvolutionParameterfEXT = cast(pfglConvolutionParameterfEXT)getProc("glConvolutionParameterfEXT");
	glConvolutionParameterfvEXT = cast(pfglConvolutionParameterfvEXT)getProc("glConvolutionParameterfvEXT");
	glConvolutionParameteriEXT = cast(pfglConvolutionParameteriEXT)getProc("glConvolutionParameteriEXT");
	glConvolutionParameterivEXT = cast(pfglConvolutionParameterivEXT)getProc("glConvolutionParameterivEXT");
	glCopyConvolutionFilter1DEXT = cast(pfglCopyConvolutionFilter1DEXT)getProc("glCopyConvolutionFilter1DEXT");
	glCopyConvolutionFilter2DEXT = cast(pfglCopyConvolutionFilter2DEXT)getProc("glCopyConvolutionFilter2DEXT");
	glGetConvolutionFilterEXT = cast(pfglGetConvolutionFilterEXT)getProc("glGetConvolutionFilterEXT");
	glGetConvolutionParameterfvEXT = cast(pfglGetConvolutionParameterfvEXT)getProc("glGetConvolutionParameterfvEXT");
	glGetConvolutionParameterivEXT = cast(pfglGetConvolutionParameterivEXT)getProc("glGetConvolutionParameterivEXT");
	glGetSeparableFilterEXT = cast(pfglGetSeparableFilterEXT)getProc("glGetSeparableFilterEXT");
	glSeparableFilter2DEXT = cast(pfglSeparableFilter2DEXT)getProc("glSeparableFilter2DEXT");

	glColorTableSGI = cast(pfglColorTableSGI)getProc("glColorTableSGI");
	glColorTableParameterfvSGI = cast(pfglColorTableParameterfvSGI)getProc("glColorTableParameterfvSGI");
	glColorTableParameterivSGI = cast(pfglColorTableParameterivSGI)getProc("glColorTableParameterivSGI");
	glCopyColorTableSGI = cast(pfglCopyColorTableSGI)getProc("glCopyColorTableSGI");
	glGetColorTableSGI = cast(pfglGetColorTableSGI)getProc("glGetColorTableSGI");
	glGetColorTableParameterfvSGI = cast(pfglGetColorTableParameterfvSGI)getProc("glGetColorTableParameterfvSGI");
	glGetColorTableParameterivSGI = cast(pfglGetColorTableParameterivSGI)getProc("glGetColorTableParameterivSGI");

	glPixelTexGenParameteriSGIS = cast(pfglPixelTexGenParameteriSGIS)getProc("glPixelTexGenParameteriSGIS");
	glPixelTexGenParameterivSGIS = cast(pfglPixelTexGenParameterivSGIS)getProc("glPixelTexGenParameterivSGIS");
	glPixelTexGenParameterfSGIS = cast(pfglPixelTexGenParameterfSGIS)getProc("glPixelTexGenParameterfSGIS");
	glPixelTexGenParameterfvSGIS = cast(pfglPixelTexGenParameterfvSGIS)getProc("glPixelTexGenParameterfvSGIS");
	glGetPixelTexGenParameterivSGIS = cast(pfglGetPixelTexGenParameterivSGIS)getProc("glGetPixelTexGenParameterivSGIS");
	glGetPixelTexGenParameterfvSGIS = cast(pfglGetPixelTexGenParameterfvSGIS)getProc("glGetPixelTexGenParameterfvSGIS");

	glPixelTexGenSGIX = cast(pfglPixelTexGenSGIX)getProc("glPixelTexGenSGIX");

	glTexImage4DSGIS = cast(pfglTexImage4DSGIS)getProc("glTexImage4DSGIS");
	glTexSubImage4DSGIS = cast(pfglTexSubImage4DSGIS)getProc("glTexSubImage4DSGIS");

	glAreTexturesResidentEXT = cast(pfglAreTexturesResidentEXT)getProc("glAreTexturesResidentEXT");
	glBindTextureEXT = cast(pfglBindTextureEXT)getProc("glBindTextureEXT");
	glDeleteTexturesEXT = cast(pfglDeleteTexturesEXT)getProc("glDeleteTexturesEXT");
	glGenTexturesEXT = cast(pfglGenTexturesEXT)getProc("glGenTexturesEXT");
	glIsTextureEXT = cast(pfglIsTextureEXT)getProc("glIsTextureEXT");
	glPrioritizeTexturesEXT = cast(pfglPrioritizeTexturesEXT)getProc("glPrioritizeTexturesEXT");

	glDetailTexFuncSGIS = cast(pfglDetailTexFuncSGIS)getProc("glDetailTexFuncSGIS");
	glGetDetailTexFuncSGIS = cast(pfglGetDetailTexFuncSGIS)getProc("glGetDetailTexFuncSGIS");

	glSharpenTexFuncSGIS = cast(pfglSharpenTexFuncSGIS)getProc("glSharpenTexFuncSGIS");
	glGetSharpenTexFuncSGIS = cast(pfglGetSharpenTexFuncSGIS)getProc("glGetSharpenTexFuncSGIS");

	glSampleMaskSGIS = cast(pfglSampleMaskSGIS)getProc("glSampleMaskSGIS");
	glSamplePatternSGIS = cast(pfglSamplePatternSGIS)getProc("glSamplePatternSGIS");

	glArrayElementEXT = cast(pfglArrayElementEXT)getProc("glArrayElementEXT");
	glColorPointerEXT = cast(pfglColorPointerEXT)getProc("glColorPointerEXT");
	glDrawArraysEXT = cast(pfglDrawArraysEXT)getProc("glDrawArraysEXT");
	glEdgeFlagPointerEXT = cast(pfglEdgeFlagPointerEXT)getProc("glEdgeFlagPointerEXT");
	glGetPointervEXT = cast(pfglGetPointervEXT)getProc("glGetPointervEXT");
	glIndexPointerEXT = cast(pfglIndexPointerEXT)getProc("glIndexPointerEXT");
	glNormalPointerEXT = cast(pfglNormalPointerEXT)getProc("glNormalPointerEXT");
	glTexCoordPointerEXT = cast(pfglTexCoordPointerEXT)getProc("glTexCoordPointerEXT");
	glVertexPointerEXT = cast(pfglVertexPointerEXT)getProc("glVertexPointerEXT");

	glBlendEquationEXT = cast(pfglBlendEquationEXT)getProc("glBlendEquationEXT");

	glSpriteParameterfSGIX = cast(pfglSpriteParameterfSGIX)getProc("glSpriteParameterfSGIX");
	glSpriteParameterfvSGIX = cast(pfglSpriteParameterfvSGIX)getProc("glSpriteParameterfvSGIX");
	glSpriteParameteriSGIX = cast(pfglSpriteParameteriSGIX)getProc("glSpriteParameteriSGIX");
	glSpriteParameterivSGIX = cast(pfglSpriteParameterivSGIX)getProc("glSpriteParameterivSGIX");

	glPointParameterfEXT = cast(pfglPointParameterfEXT)getProc("glPointParameterfEXT");
	glPointParameterfvEXT = cast(pfglPointParameterfvEXT)getProc("glPointParameterfvEXT");

	glPointParameterfSGIS = cast(pfglPointParameterfSGIS)getProc("glPointParameterfSGIS");
	glPointParameterfvSGIS = cast(pfglPointParameterfvSGIS)getProc("glPointParameterfvSGIS");

	glGetInstrumentsSGIX = cast(pfglGetInstrumentsSGIX)getProc("glGetInstrumentsSGIX");
	glInstrumentsBufferSGIX = cast(pfglInstrumentsBufferSGIX)getProc("glInstrumentsBufferSGIX");
	glPollInstrumentsSGIX = cast(pfglPollInstrumentsSGIX)getProc("glPollInstrumentsSGIX");
	glReadInstrumentsSGIX = cast(pfglReadInstrumentsSGIX)getProc("glReadInstrumentsSGIX");
	glStartInstrumentsSGIX = cast(pfglStartInstrumentsSGIX)getProc("glStartInstrumentsSGIX");
	glStopInstrumentsSGIX = cast(pfglStopInstrumentsSGIX)getProc("glStopInstrumentsSGIX");

	glFrameZoomSGIX = cast(pfglFrameZoomSGIX)getProc("glFrameZoomSGIX");

	glTagSampleBufferSGIX = cast(pfglTagSampleBufferSGIX)getProc("glTagSampleBufferSGIX");

	glDeformationMap3dSGIX = cast(pfglDeformationMap3dSGIX)getProc("glDeformationMap3dSGIX");
	glDeformationMap3fSGIX = cast(pfglDeformationMap3fSGIX)getProc("glDeformationMap3fSGIX");
	glDeformSGIX = cast(pfglDeformSGIX)getProc("glDeformSGIX");
	glLoadIdentityDeformationMapSGIX = cast(pfglLoadIdentityDeformationMapSGIX)getProc("glLoadIdentityDeformationMapSGIX");

	glReferencePlaneSGIX = cast(pfglReferencePlaneSGIX)getProc("glReferencePlaneSGIX");

	glFlushRasterSGIX = cast(pfglFlushRasterSGIX)getProc("glFlushRasterSGIX");

	glFogFuncSGIS = cast(pfglFogFuncSGIS)getProc("glFogFuncSGIS");
	glGetFogFuncSGIS = cast(pfglGetFogFuncSGIS)getProc("glGetFogFuncSGIS");

	glImageTransformParameteriHP = cast(pfglImageTransformParameteriHP)getProc("glImageTransformParameteriHP");
	glImageTransformParameterfHP = cast(pfglImageTransformParameterfHP)getProc("glImageTransformParameterfHP");
	glImageTransformParameterivHP = cast(pfglImageTransformParameterivHP)getProc("glImageTransformParameterivHP");
	glImageTransformParameterfvHP = cast(pfglImageTransformParameterfvHP)getProc("glImageTransformParameterfvHP");
	glGetImageTransformParameterivHP = cast(pfglGetImageTransformParameterivHP)getProc("glGetImageTransformParameterivHP");
	glGetImageTransformParameterfvHP = cast(pfglGetImageTransformParameterfvHP)getProc("glGetImageTransformParameterfvHP");

	glColorSubTableEXT = cast(pfglColorSubTableEXT)getProc("glColorSubTableEXT");
	glCopyColorSubTableEXT = cast(pfglCopyColorSubTableEXT)getProc("glCopyColorSubTableEXT");

	glHintPGI = cast(pfglHintPGI)getProc("glHintPGI");

	glColorTableEXT = cast(pfglColorTableEXT)getProc("glColorTableEXT");
	glGetColorTableEXT = cast(pfglGetColorTableEXT)getProc("glGetColorTableEXT");
	glGetColorTableParameterivEXT = cast(pfglGetColorTableParameterivEXT)getProc("glGetColorTableParameterivEXT");
	glGetColorTableParameterfvEXT = cast(pfglGetColorTableParameterfvEXT)getProc("glGetColorTableParameterfvEXT");

	glGetListParameterfvSGIX = cast(pfglGetListParameterfvSGIX)getProc("glGetListParameterfvSGIX");
	glGetListParameterivSGIX = cast(pfglGetListParameterivSGIX)getProc("glGetListParameterivSGIX");
	glListParameterfSGIX = cast(pfglListParameterfSGIX)getProc("glListParameterfSGIX");
	glListParameterfvSGIX = cast(pfglListParameterfvSGIX)getProc("glListParameterfvSGIX");
	glListParameteriSGIX = cast(pfglListParameteriSGIX)getProc("glListParameteriSGIX");
	glListParameterivSGIX = cast(pfglListParameterivSGIX)getProc("glListParameterivSGIX");

	glIndexMaterialEXT = cast(pfglIndexMaterialEXT)getProc("glIndexMaterialEXT");

	glIndexFuncEXT = cast(pfglIndexFuncEXT)getProc("glIndexFuncEXT");

	glLockArraysEXT = cast(pfglLockArraysEXT)getProc("glLockArraysEXT");
	glUnlockArraysEXT = cast(pfglUnlockArraysEXT)getProc("glUnlockArraysEXT");

	glCullParameterdvEXT = cast(pfglCullParameterdvEXT)getProc("glCullParameterdvEXT");
	glCullParameterfvEXT = cast(pfglCullParameterfvEXT)getProc("glCullParameterfvEXT");

	glFragmentColorMaterialSGIX = cast(pfglFragmentColorMaterialSGIX)getProc("glFragmentColorMaterialSGIX");
	glFragmentLightfSGIX = cast(pfglFragmentLightfSGIX)getProc("glFragmentLightfSGIX");
	glFragmentLightfvSGIX = cast(pfglFragmentLightfvSGIX)getProc("glFragmentLightfvSGIX");
	glFragmentLightiSGIX = cast(pfglFragmentLightiSGIX)getProc("glFragmentLightiSGIX");
	glFragmentLightivSGIX = cast(pfglFragmentLightivSGIX)getProc("glFragmentLightivSGIX");
	glFragmentLightModelfSGIX = cast(pfglFragmentLightModelfSGIX)getProc("glFragmentLightModelfSGIX");
	glFragmentLightModelfvSGIX = cast(pfglFragmentLightModelfvSGIX)getProc("glFragmentLightModelfvSGIX");
	glFragmentLightModeliSGIX = cast(pfglFragmentLightModeliSGIX)getProc("glFragmentLightModeliSGIX");
	glFragmentLightModelivSGIX = cast(pfglFragmentLightModelivSGIX)getProc("glFragmentLightModelivSGIX");
	glFragmentMaterialfSGIX = cast(pfglFragmentMaterialfSGIX)getProc("glFragmentMaterialfSGIX");
	glFragmentMaterialfvSGIX = cast(pfglFragmentMaterialfvSGIX)getProc("glFragmentMaterialfvSGIX");
	glFragmentMaterialiSGIX = cast(pfglFragmentMaterialiSGIX)getProc("glFragmentMaterialiSGIX");
	glFragmentMaterialivSGIX = cast(pfglFragmentMaterialivSGIX)getProc("glFragmentMaterialivSGIX");
	glGetFragmentLightfvSGIX = cast(pfglGetFragmentLightfvSGIX)getProc("glGetFragmentLightfvSGIX");
	glGetFragmentLightivSGIX = cast(pfglGetFragmentLightivSGIX)getProc("glGetFragmentLightivSGIX");
	glGetFragmentMaterialfvSGIX = cast(pfglGetFragmentMaterialfvSGIX)getProc("glGetFragmentMaterialfvSGIX");
	glGetFragmentMaterialivSGIX = cast(pfglGetFragmentMaterialivSGIX)getProc("glGetFragmentMaterialivSGIX");
	glLightEnviSGIX = cast(pfglLightEnviSGIX)getProc("glLightEnviSGIX");

	glDrawRangeElementsEXT = cast(pfglDrawRangeElementsEXT)getProc("glDrawRangeElementsEXT");

	glApplyTextureEXT = cast(pfglApplyTextureEXT)getProc("glApplyTextureEXT");
	glTextureLightEXT = cast(pfglTextureLightEXT)getProc("glTextureLightEXT");
	glTextureMaterialEXT = cast(pfglTextureMaterialEXT)getProc("glTextureMaterialEXT");

	glAsyncMarkerSGIX = cast(pfglAsyncMarkerSGIX)getProc("glAsyncMarkerSGIX");
	glFinishAsyncSGIX = cast(pfglFinishAsyncSGIX)getProc("glFinishAsyncSGIX");
	glPollAsyncSGIX = cast(pfglPollAsyncSGIX)getProc("glPollAsyncSGIX");
	glGenAsyncMarkersSGIX = cast(pfglGenAsyncMarkersSGIX)getProc("glGenAsyncMarkersSGIX");
	glDeleteAsyncMarkersSGIX = cast(pfglDeleteAsyncMarkersSGIX)getProc("glDeleteAsyncMarkersSGIX");
	glIsAsyncMarkerSGIX = cast(pfglIsAsyncMarkerSGIX)getProc("glIsAsyncMarkerSGIX");

	glVertexPointervINTEL = cast(pfglVertexPointervINTEL)getProc("glVertexPointervINTEL");
	glNormalPointervINTEL = cast(pfglNormalPointervINTEL)getProc("glNormalPointervINTEL");
	glColorPointervINTEL = cast(pfglColorPointervINTEL)getProc("glColorPointervINTEL");
	glTexCoordPointervINTEL = cast(pfglTexCoordPointervINTEL)getProc("glTexCoordPointervINTEL");

	glPixelTransformParameteriEXT = cast(pfglPixelTransformParameteriEXT)getProc("glPixelTransformParameteriEXT");
	glPixelTransformParameterfEXT = cast(pfglPixelTransformParameterfEXT)getProc("glPixelTransformParameterfEXT");
	glPixelTransformParameterivEXT = cast(pfglPixelTransformParameterivEXT)getProc("glPixelTransformParameterivEXT");
	glPixelTransformParameterfvEXT = cast(pfglPixelTransformParameterfvEXT)getProc("glPixelTransformParameterfvEXT");

	glSecondaryColor3bEXT = cast(pfglSecondaryColor3bEXT)getProc("glSecondaryColor3bEXT");
	glSecondaryColor3bvEXT = cast(pfglSecondaryColor3bvEXT)getProc("glSecondaryColor3bvEXT");
	glSecondaryColor3dEXT = cast(pfglSecondaryColor3dEXT)getProc("glSecondaryColor3dEXT");
	glSecondaryColor3dvEXT = cast(pfglSecondaryColor3dvEXT)getProc("glSecondaryColor3dvEXT");
	glSecondaryColor3fEXT = cast(pfglSecondaryColor3fEXT)getProc("glSecondaryColor3fEXT");
	glSecondaryColor3fvEXT = cast(pfglSecondaryColor3fvEXT)getProc("glSecondaryColor3fvEXT");
	glSecondaryColor3iEXT = cast(pfglSecondaryColor3iEXT)getProc("glSecondaryColor3iEXT");
	glSecondaryColor3ivEXT = cast(pfglSecondaryColor3ivEXT)getProc("glSecondaryColor3ivEXT");
	glSecondaryColor3sEXT = cast(pfglSecondaryColor3sEXT)getProc("glSecondaryColor3sEXT");
	glSecondaryColor3svEXT = cast(pfglSecondaryColor3svEXT)getProc("glSecondaryColor3svEXT");
	glSecondaryColor3ubEXT = cast(pfglSecondaryColor3ubEXT)getProc("glSecondaryColor3ubEXT");
	glSecondaryColor3ubvEXT = cast(pfglSecondaryColor3ubvEXT)getProc("glSecondaryColor3ubvEXT");
	glSecondaryColor3uiEXT = cast(pfglSecondaryColor3uiEXT)getProc("glSecondaryColor3uiEXT");
	glSecondaryColor3uivEXT = cast(pfglSecondaryColor3uivEXT)getProc("glSecondaryColor3uivEXT");
	glSecondaryColor3usEXT = cast(pfglSecondaryColor3usEXT)getProc("glSecondaryColor3usEXT");
	glSecondaryColor3usvEXT = cast(pfglSecondaryColor3usvEXT)getProc("glSecondaryColor3usvEXT");
	glSecondaryColorPointerEXT = cast(pfglSecondaryColorPointerEXT)getProc("glSecondaryColorPointerEXT");

	glTextureNormalEXT = cast(pfglTextureNormalEXT)getProc("glTextureNormalEXT");

	glMultiDrawArraysEXT = cast(pfglMultiDrawArraysEXT)getProc("glMultiDrawArraysEXT");
	glMultiDrawElementsEXT = cast(pfglMultiDrawElementsEXT)getProc("glMultiDrawElementsEXT");

	glFogCoordfEXT = cast(pfglFogCoordfEXT)getProc("glFogCoordfEXT");
	glFogCoordfvEXT = cast(pfglFogCoordfvEXT)getProc("glFogCoordfvEXT");
	glFogCoorddEXT = cast(pfglFogCoorddEXT)getProc("glFogCoorddEXT");
	glFogCoorddvEXT = cast(pfglFogCoorddvEXT)getProc("glFogCoorddvEXT");
	glFogCoordPointerEXT = cast(pfglFogCoordPointerEXT)getProc("glFogCoordPointerEXT");

	glTangent3bEXT = cast(pfglTangent3bEXT)getProc("glTangent3bEXT");
	glTangent3bvEXT = cast(pfglTangent3bvEXT)getProc("glTangent3bvEXT");
	glTangent3dEXT = cast(pfglTangent3dEXT)getProc("glTangent3dEXT");
	glTangent3dvEXT = cast(pfglTangent3dvEXT)getProc("glTangent3dvEXT");
	glTangent3fEXT = cast(pfglTangent3fEXT)getProc("glTangent3fEXT");
	glTangent3fvEXT = cast(pfglTangent3fvEXT)getProc("glTangent3fvEXT");
	glTangent3iEXT = cast(pfglTangent3iEXT)getProc("glTangent3iEXT");
	glTangent3ivEXT = cast(pfglTangent3ivEXT)getProc("glTangent3ivEXT");
	glTangent3sEXT = cast(pfglTangent3sEXT)getProc("glTangent3sEXT");
	glTangent3svEXT = cast(pfglTangent3svEXT)getProc("glTangent3svEXT");
	glBinormal3bEXT = cast(pfglBinormal3bEXT)getProc("glBinormal3bEXT");
	glBinormal3bvEXT = cast(pfglBinormal3bvEXT)getProc("glBinormal3bvEXT");
	glBinormal3dEXT = cast(pfglBinormal3dEXT)getProc("glBinormal3dEXT");
	glBinormal3dvEXT = cast(pfglBinormal3dvEXT)getProc("glBinormal3dvEXT");
	glBinormal3fEXT = cast(pfglBinormal3fEXT)getProc("glBinormal3fEXT");
	glBinormal3fvEXT = cast(pfglBinormal3fvEXT)getProc("glBinormal3fvEXT");
	glBinormal3iEXT = cast(pfglBinormal3iEXT)getProc("glBinormal3iEXT");
	glBinormal3ivEXT = cast(pfglBinormal3ivEXT)getProc("glBinormal3ivEXT");
	glBinormal3sEXT = cast(pfglBinormal3sEXT)getProc("glBinormal3sEXT");
	glBinormal3svEXT = cast(pfglBinormal3svEXT)getProc("glBinormal3svEXT");
	glTangentPointerEXT = cast(pfglTangentPointerEXT)getProc("glTangentPointerEXT");
	glBinormalPointerEXT = cast(pfglBinormalPointerEXT)getProc("glBinormalPointerEXT");

	glFinishTextureSUNX = cast(pfglFinishTextureSUNX)getProc("glFinishTextureSUNX");

	glGlobalAlphaFactorbSUN = cast(pfglGlobalAlphaFactorbSUN)getProc("glGlobalAlphaFactorbSUN");
	glGlobalAlphaFactorsSUN = cast(pfglGlobalAlphaFactorsSUN)getProc("glGlobalAlphaFactorsSUN");
	glGlobalAlphaFactoriSUN = cast(pfglGlobalAlphaFactoriSUN)getProc("glGlobalAlphaFactoriSUN");
	glGlobalAlphaFactorfSUN = cast(pfglGlobalAlphaFactorfSUN)getProc("glGlobalAlphaFactorfSUN");
	glGlobalAlphaFactordSUN = cast(pfglGlobalAlphaFactordSUN)getProc("glGlobalAlphaFactordSUN");
	glGlobalAlphaFactorubSUN = cast(pfglGlobalAlphaFactorubSUN)getProc("glGlobalAlphaFactorubSUN");
	glGlobalAlphaFactorusSUN = cast(pfglGlobalAlphaFactorusSUN)getProc("glGlobalAlphaFactorusSUN");
	glGlobalAlphaFactoruiSUN = cast(pfglGlobalAlphaFactoruiSUN)getProc("glGlobalAlphaFactoruiSUN");

	glReplacementCodeuiSUN = cast(pfglReplacementCodeuiSUN)getProc("glReplacementCodeuiSUN");
	glReplacementCodeusSUN = cast(pfglReplacementCodeusSUN)getProc("glReplacementCodeusSUN");
	glReplacementCodeubSUN = cast(pfglReplacementCodeubSUN)getProc("glReplacementCodeubSUN");
	glReplacementCodeuivSUN = cast(pfglReplacementCodeuivSUN)getProc("glReplacementCodeuivSUN");
	glReplacementCodeusvSUN = cast(pfglReplacementCodeusvSUN)getProc("glReplacementCodeusvSUN");
	glReplacementCodeubvSUN = cast(pfglReplacementCodeubvSUN)getProc("glReplacementCodeubvSUN");
	glReplacementCodePointerSUN = cast(pfglReplacementCodePointerSUN)getProc("glReplacementCodePointerSUN");

	glColor4ubVertex2fSUN = cast(pfglColor4ubVertex2fSUN)getProc("glColor4ubVertex2fSUN");
	glColor4ubVertex2fvSUN = cast(pfglColor4ubVertex2fvSUN)getProc("glColor4ubVertex2fvSUN");
	glColor4ubVertex3fSUN = cast(pfglColor4ubVertex3fSUN)getProc("glColor4ubVertex3fSUN");
	glColor4ubVertex3fvSUN = cast(pfglColor4ubVertex3fvSUN)getProc("glColor4ubVertex3fvSUN");
	glColor3fVertex3fSUN = cast(pfglColor3fVertex3fSUN)getProc("glColor3fVertex3fSUN");
	glColor3fVertex3fvSUN = cast(pfglColor3fVertex3fvSUN)getProc("glColor3fVertex3fvSUN");
	glNormal3fVertex3fSUN = cast(pfglNormal3fVertex3fSUN)getProc("glNormal3fVertex3fSUN");
	glNormal3fVertex3fvSUN = cast(pfglNormal3fVertex3fvSUN)getProc("glNormal3fVertex3fvSUN");
	glColor4fNormal3fVertex3fSUN = cast(pfglColor4fNormal3fVertex3fSUN)getProc("glColor4fNormal3fVertex3fSUN");
	glColor4fNormal3fVertex3fvSUN = cast(pfglColor4fNormal3fVertex3fvSUN)getProc("glColor4fNormal3fVertex3fvSUN");
	glTexCoord2fVertex3fSUN = cast(pfglTexCoord2fVertex3fSUN)getProc("glTexCoord2fVertex3fSUN");
	glTexCoord2fVertex3fvSUN = cast(pfglTexCoord2fVertex3fvSUN)getProc("glTexCoord2fVertex3fvSUN");
	glTexCoord4fVertex4fSUN = cast(pfglTexCoord4fVertex4fSUN)getProc("glTexCoord4fVertex4fSUN");
	glTexCoord4fVertex4fvSUN = cast(pfglTexCoord4fVertex4fvSUN)getProc("glTexCoord4fVertex4fvSUN");
	glTexCoord2fColor4ubVertex3fSUN = cast(pfglTexCoord2fColor4ubVertex3fSUN)getProc("glTexCoord2fColor4ubVertex3fSUN");
	glTexCoord2fColor4ubVertex3fvSUN = cast(pfglTexCoord2fColor4ubVertex3fvSUN)getProc("glTexCoord2fColor4ubVertex3fvSUN");
	glTexCoord2fColor3fVertex3fSUN = cast(pfglTexCoord2fColor3fVertex3fSUN)getProc("glTexCoord2fColor3fVertex3fSUN");
	glTexCoord2fColor3fVertex3fvSUN = cast(pfglTexCoord2fColor3fVertex3fvSUN)getProc("glTexCoord2fColor3fVertex3fvSUN");
	glTexCoord2fNormal3fVertex3fSUN = cast(pfglTexCoord2fNormal3fVertex3fSUN)getProc("glTexCoord2fNormal3fVertex3fSUN");
	glTexCoord2fNormal3fVertex3fvSUN = cast(pfglTexCoord2fNormal3fVertex3fvSUN)getProc("glTexCoord2fNormal3fVertex3fvSUN");
	glTexCoord2fColor4fNormal3fVertex3fSUN = cast(pfglTexCoord2fColor4fNormal3fVertex3fSUN)getProc("glTexCoord2fColor4fNormal3fVertex3fSUN");
	glTexCoord2fColor4fNormal3fVertex3fvSUN = cast(pfglTexCoord2fColor4fNormal3fVertex3fvSUN)getProc("glTexCoord2fColor4fNormal3fVertex3fvSUN");
	glTexCoord4fColor4fNormal3fVertex4fSUN = cast(pfglTexCoord4fColor4fNormal3fVertex4fSUN)getProc("glTexCoord4fColor4fNormal3fVertex4fSUN");
	glTexCoord4fColor4fNormal3fVertex4fvSUN = cast(pfglTexCoord4fColor4fNormal3fVertex4fvSUN)getProc("glTexCoord4fColor4fNormal3fVertex4fvSUN");
	glReplacementCodeuiVertex3fSUN = cast(pfglReplacementCodeuiVertex3fSUN)getProc("glReplacementCodeuiVertex3fSUN");
	glReplacementCodeuiVertex3fvSUN = cast(pfglReplacementCodeuiVertex3fvSUN)getProc("glReplacementCodeuiVertex3fvSUN");
	glReplacementCodeuiColor4ubVertex3fSUN = cast(pfglReplacementCodeuiColor4ubVertex3fSUN)getProc("glReplacementCodeuiColor4ubVertex3fSUN");
	glReplacementCodeuiColor4ubVertex3fvSUN = cast(pfglReplacementCodeuiColor4ubVertex3fvSUN)getProc("glReplacementCodeuiColor4ubVertex3fvSUN");
	glReplacementCodeuiColor3fVertex3fSUN = cast(pfglReplacementCodeuiColor3fVertex3fSUN)getProc("glReplacementCodeuiColor3fVertex3fSUN");
	glReplacementCodeuiColor3fVertex3fvSUN = cast(pfglReplacementCodeuiColor3fVertex3fvSUN)getProc("glReplacementCodeuiColor3fVertex3fvSUN");
	glReplacementCodeuiNormal3fVertex3fSUN = cast(pfglReplacementCodeuiNormal3fVertex3fSUN)getProc("glReplacementCodeuiNormal3fVertex3fSUN");
	glReplacementCodeuiNormal3fVertex3fvSUN = cast(pfglReplacementCodeuiNormal3fVertex3fvSUN)getProc("glReplacementCodeuiNormal3fVertex3fvSUN");
	glReplacementCodeuiColor4fNormal3fVertex3fSUN = cast(pfglReplacementCodeuiColor4fNormal3fVertex3fSUN)getProc("glReplacementCodeuiColor4fNormal3fVertex3fSUN");
	glReplacementCodeuiColor4fNormal3fVertex3fvSUN = cast(pfglReplacementCodeuiColor4fNormal3fVertex3fvSUN)getProc("glReplacementCodeuiColor4fNormal3fVertex3fvSUN");
	glReplacementCodeuiTexCoord2fVertex3fSUN = cast(pfglReplacementCodeuiTexCoord2fVertex3fSUN)getProc("glReplacementCodeuiTexCoord2fVertex3fSUN");
	glReplacementCodeuiTexCoord2fVertex3fvSUN = cast(pfglReplacementCodeuiTexCoord2fVertex3fvSUN)getProc("glReplacementCodeuiTexCoord2fVertex3fvSUN");
	glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN = cast(pfglReplacementCodeuiTexCoord2fNormal3fVertex3fSUN)getProc("glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN");
	glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN = cast(pfglReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN)getProc("glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN");
	glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN = cast(pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN)getProc("glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN");
	glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN = cast(pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN)getProc("glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN");

	glBlendFuncSeparateEXT = cast(pfglBlendFuncSeparateEXT)getProc("glBlendFuncSeparateEXT");

	glBlendFuncSeparateINGR = cast(pfglBlendFuncSeparateINGR)getProc("glBlendFuncSeparateINGR");

	glVertexWeightfEXT = cast(pfglVertexWeightfEXT)getProc("glVertexWeightfEXT");
	glVertexWeightfvEXT = cast(pfglVertexWeightfvEXT)getProc("glVertexWeightfvEXT");
	glVertexWeightPointerEXT = cast(pfglVertexWeightPointerEXT)getProc("glVertexWeightPointerEXT");

	glFlushVertexArrayRangeNV = cast(pfglFlushVertexArrayRangeNV)getProc("glFlushVertexArrayRangeNV");
	glVertexArrayRangeNV = cast(pfglVertexArrayRangeNV)getProc("glVertexArrayRangeNV");

	glCombinerParameterfvNV = cast(pfglCombinerParameterfvNV)getProc("glCombinerParameterfvNV");
	glCombinerParameterfNV = cast(pfglCombinerParameterfNV)getProc("glCombinerParameterfNV");
	glCombinerParameterivNV = cast(pfglCombinerParameterivNV)getProc("glCombinerParameterivNV");
	glCombinerParameteriNV = cast(pfglCombinerParameteriNV)getProc("glCombinerParameteriNV");
	glCombinerInputNV = cast(pfglCombinerInputNV)getProc("glCombinerInputNV");
	glCombinerOutputNV = cast(pfglCombinerOutputNV)getProc("glCombinerOutputNV");
	glFinalCombinerInputNV = cast(pfglFinalCombinerInputNV)getProc("glFinalCombinerInputNV");
	glGetCombinerInputParameterfvNV = cast(pfglGetCombinerInputParameterfvNV)getProc("glGetCombinerInputParameterfvNV");
	glGetCombinerInputParameterivNV = cast(pfglGetCombinerInputParameterivNV)getProc("glGetCombinerInputParameterivNV");
	glGetCombinerOutputParameterfvNV = cast(pfglGetCombinerOutputParameterfvNV)getProc("glGetCombinerOutputParameterfvNV");
	glGetCombinerOutputParameterivNV = cast(pfglGetCombinerOutputParameterivNV)getProc("glGetCombinerOutputParameterivNV");
	glGetFinalCombinerInputParameterfvNV = cast(pfglGetFinalCombinerInputParameterfvNV)getProc("glGetFinalCombinerInputParameterfvNV");
	glGetFinalCombinerInputParameterivNV = cast(pfglGetFinalCombinerInputParameterivNV)getProc("glGetFinalCombinerInputParameterivNV");

	glResizeBuffersMESA = cast(pfglResizeBuffersMESA)getProc("glResizeBuffersMESA");

	glWindowPos2dMESA = cast(pfglWindowPos2dMESA)getProc("glWindowPos2dMESA");
	glWindowPos2dvMESA = cast(pfglWindowPos2dvMESA)getProc("glWindowPos2dvMESA");
	glWindowPos2fMESA = cast(pfglWindowPos2fMESA)getProc("glWindowPos2fMESA");
	glWindowPos2fvMESA = cast(pfglWindowPos2fvMESA)getProc("glWindowPos2fvMESA");
	glWindowPos2iMESA = cast(pfglWindowPos2iMESA)getProc("glWindowPos2iMESA");
	glWindowPos2ivMESA = cast(pfglWindowPos2ivMESA)getProc("glWindowPos2ivMESA");
	glWindowPos2sMESA = cast(pfglWindowPos2sMESA)getProc("glWindowPos2sMESA");
	glWindowPos2svMESA = cast(pfglWindowPos2svMESA)getProc("glWindowPos2svMESA");
	glWindowPos3dMESA = cast(pfglWindowPos3dMESA)getProc("glWindowPos3dMESA");
	glWindowPos3dvMESA = cast(pfglWindowPos3dvMESA)getProc("glWindowPos3dvMESA");
	glWindowPos3fMESA = cast(pfglWindowPos3fMESA)getProc("glWindowPos3fMESA");
	glWindowPos3fvMESA = cast(pfglWindowPos3fvMESA)getProc("glWindowPos3fvMESA");
	glWindowPos3iMESA = cast(pfglWindowPos3iMESA)getProc("glWindowPos3iMESA");
	glWindowPos3ivMESA = cast(pfglWindowPos3ivMESA)getProc("glWindowPos3ivMESA");
	glWindowPos3sMESA = cast(pfglWindowPos3sMESA)getProc("glWindowPos3sMESA");
	glWindowPos3svMESA = cast(pfglWindowPos3svMESA)getProc("glWindowPos3svMESA");
	glWindowPos4dMESA = cast(pfglWindowPos4dMESA)getProc("glWindowPos4dMESA");
	glWindowPos4dvMESA = cast(pfglWindowPos4dvMESA)getProc("glWindowPos4dvMESA");
	glWindowPos4fMESA = cast(pfglWindowPos4fMESA)getProc("glWindowPos4fMESA");
	glWindowPos4fvMESA = cast(pfglWindowPos4fvMESA)getProc("glWindowPos4fvMESA");
	glWindowPos4iMESA = cast(pfglWindowPos4iMESA)getProc("glWindowPos4iMESA");
	glWindowPos4ivMESA = cast(pfglWindowPos4ivMESA)getProc("glWindowPos4ivMESA");
	glWindowPos4sMESA = cast(pfglWindowPos4sMESA)getProc("glWindowPos4sMESA");
	glWindowPos4svMESA = cast(pfglWindowPos4svMESA)getProc("glWindowPos4svMESA");

	glMultiModeDrawArraysIBM = cast(pfglMultiModeDrawArraysIBM)getProc("glMultiModeDrawArraysIBM");
	glMultiModeDrawElementsIBM = cast(pfglMultiModeDrawElementsIBM)getProc("glMultiModeDrawElementsIBM");

	glColorPointerListIBM = cast(pfglColorPointerListIBM)getProc("glColorPointerListIBM");
	glSecondaryColorPointerListIBM = cast(pfglSecondaryColorPointerListIBM)getProc("glSecondaryColorPointerListIBM");
	glEdgeFlagPointerListIBM = cast(pfglEdgeFlagPointerListIBM)getProc("glEdgeFlagPointerListIBM");
	glFogCoordPointerListIBM = cast(pfglFogCoordPointerListIBM)getProc("glFogCoordPointerListIBM");
	glIndexPointerListIBM = cast(pfglIndexPointerListIBM)getProc("glIndexPointerListIBM");
	glNormalPointerListIBM = cast(pfglNormalPointerListIBM)getProc("glNormalPointerListIBM");
	glTexCoordPointerListIBM = cast(pfglTexCoordPointerListIBM)getProc("glTexCoordPointerListIBM");
	glVertexPointerListIBM = cast(pfglVertexPointerListIBM)getProc("glVertexPointerListIBM");

	glTbufferMask3DFX = cast(pfglTbufferMask3DFX)getProc("glTbufferMask3DFX");

	glSampleMaskEXT = cast(pfglSampleMaskEXT)getProc("glSampleMaskEXT");
	glSamplePatternEXT = cast(pfglSamplePatternEXT)getProc("glSamplePatternEXT");

	glTextureColorMaskSGIS = cast(pfglTextureColorMaskSGIS)getProc("glTextureColorMaskSGIS");

	glIglooInterfaceSGIX = cast(pfglIglooInterfaceSGIX)getProc("glIglooInterfaceSGIX");

	glDeleteFencesNV = cast(pfglDeleteFencesNV)getProc("glDeleteFencesNV");
	glGenFencesNV = cast(pfglGenFencesNV)getProc("glGenFencesNV");
	glIsFenceNV = cast(pfglIsFenceNV)getProc("glIsFenceNV");
	glTestFenceNV = cast(pfglTestFenceNV)getProc("glTestFenceNV");
	glGetFenceivNV = cast(pfglGetFenceivNV)getProc("glGetFenceivNV");
	glFinishFenceNV = cast(pfglFinishFenceNV)getProc("glFinishFenceNV");
	glSetFenceNV = cast(pfglSetFenceNV)getProc("glSetFenceNV");

	glMapControlPointsNV = cast(pfglMapControlPointsNV)getProc("glMapControlPointsNV");
	glMapParameterivNV = cast(pfglMapParameterivNV)getProc("glMapParameterivNV");
	glMapParameterfvNV = cast(pfglMapParameterfvNV)getProc("glMapParameterfvNV");
	glGetMapControlPointsNV = cast(pfglGetMapControlPointsNV)getProc("glGetMapControlPointsNV");
	glGetMapParameterivNV = cast(pfglGetMapParameterivNV)getProc("glGetMapParameterivNV");
	glGetMapParameterfvNV = cast(pfglGetMapParameterfvNV)getProc("glGetMapParameterfvNV");
	glGetMapAttribParameterivNV = cast(pfglGetMapAttribParameterivNV)getProc("glGetMapAttribParameterivNV");
	glGetMapAttribParameterfvNV = cast(pfglGetMapAttribParameterfvNV)getProc("glGetMapAttribParameterfvNV");
	glEvalMapsNV = cast(pfglEvalMapsNV)getProc("glEvalMapsNV");

	glCombinerStageParameterfvNV = cast(pfglCombinerStageParameterfvNV)getProc("glCombinerStageParameterfvNV");
	glGetCombinerStageParameterfvNV = cast(pfglGetCombinerStageParameterfvNV)getProc("glGetCombinerStageParameterfvNV");

	glAreProgramsResidentNV = cast(pfglAreProgramsResidentNV)getProc("glAreProgramsResidentNV");
	glBindProgramNV = cast(pfglBindProgramNV)getProc("glBindProgramNV");
	glDeleteProgramsNV = cast(pfglDeleteProgramsNV)getProc("glDeleteProgramsNV");
	glExecuteProgramNV = cast(pfglExecuteProgramNV)getProc("glExecuteProgramNV");
	glGenProgramsNV = cast(pfglGenProgramsNV)getProc("glGenProgramsNV");
	glGetProgramParameterdvNV = cast(pfglGetProgramParameterdvNV)getProc("glGetProgramParameterdvNV");
	glGetProgramParameterfvNV = cast(pfglGetProgramParameterfvNV)getProc("glGetProgramParameterfvNV");
	glGetProgramivNV = cast(pfglGetProgramivNV)getProc("glGetProgramivNV");
	glGetProgramStringNV = cast(pfglGetProgramStringNV)getProc("glGetProgramStringNV");
	glGetTrackMatrixivNV = cast(pfglGetTrackMatrixivNV)getProc("glGetTrackMatrixivNV");
	glGetVertexAttribdvNV = cast(pfglGetVertexAttribdvNV)getProc("glGetVertexAttribdvNV");
	glGetVertexAttribfvNV = cast(pfglGetVertexAttribfvNV)getProc("glGetVertexAttribfvNV");
	glGetVertexAttribivNV = cast(pfglGetVertexAttribivNV)getProc("glGetVertexAttribivNV");
	glGetVertexAttribPointervNV = cast(pfglGetVertexAttribPointervNV)getProc("glGetVertexAttribPointervNV");
	glIsProgramNV = cast(pfglIsProgramNV)getProc("glIsProgramNV");
	glLoadProgramNV = cast(pfglLoadProgramNV)getProc("glLoadProgramNV");
	glProgramParameter4dNV = cast(pfglProgramParameter4dNV)getProc("glProgramParameter4dNV");
	glProgramParameter4dvNV = cast(pfglProgramParameter4dvNV)getProc("glProgramParameter4dvNV");
	glProgramParameter4fNV = cast(pfglProgramParameter4fNV)getProc("glProgramParameter4fNV");
	glProgramParameter4fvNV = cast(pfglProgramParameter4fvNV)getProc("glProgramParameter4fvNV");
	glProgramParameters4dvNV = cast(pfglProgramParameters4dvNV)getProc("glProgramParameters4dvNV");
	glProgramParameters4fvNV = cast(pfglProgramParameters4fvNV)getProc("glProgramParameters4fvNV");
	glRequestResidentProgramsNV = cast(pfglRequestResidentProgramsNV)getProc("glRequestResidentProgramsNV");
	glTrackMatrixNV = cast(pfglTrackMatrixNV)getProc("glTrackMatrixNV");
	glVertexAttribPointerNV = cast(pfglVertexAttribPointerNV)getProc("glVertexAttribPointerNV");
	glVertexAttrib1dNV = cast(pfglVertexAttrib1dNV)getProc("glVertexAttrib1dNV");
	glVertexAttrib1dvNV = cast(pfglVertexAttrib1dvNV)getProc("glVertexAttrib1dvNV");
	glVertexAttrib1fNV = cast(pfglVertexAttrib1fNV)getProc("glVertexAttrib1fNV");
	glVertexAttrib1fvNV = cast(pfglVertexAttrib1fvNV)getProc("glVertexAttrib1fvNV");
	glVertexAttrib1sNV = cast(pfglVertexAttrib1sNV)getProc("glVertexAttrib1sNV");
	glVertexAttrib1svNV = cast(pfglVertexAttrib1svNV)getProc("glVertexAttrib1svNV");
	glVertexAttrib2dNV = cast(pfglVertexAttrib2dNV)getProc("glVertexAttrib2dNV");
	glVertexAttrib2dvNV = cast(pfglVertexAttrib2dvNV)getProc("glVertexAttrib2dvNV");
	glVertexAttrib2fNV = cast(pfglVertexAttrib2fNV)getProc("glVertexAttrib2fNV");
	glVertexAttrib2fvNV = cast(pfglVertexAttrib2fvNV)getProc("glVertexAttrib2fvNV");
	glVertexAttrib2sNV = cast(pfglVertexAttrib2sNV)getProc("glVertexAttrib2sNV");
	glVertexAttrib2svNV = cast(pfglVertexAttrib2svNV)getProc("glVertexAttrib2svNV");
	glVertexAttrib3dNV = cast(pfglVertexAttrib3dNV)getProc("glVertexAttrib3dNV");
	glVertexAttrib3dvNV = cast(pfglVertexAttrib3dvNV)getProc("glVertexAttrib3dvNV");
	glVertexAttrib3fNV = cast(pfglVertexAttrib3fNV)getProc("glVertexAttrib3fNV");
	glVertexAttrib3fvNV = cast(pfglVertexAttrib3fvNV)getProc("glVertexAttrib3fvNV");
	glVertexAttrib3sNV = cast(pfglVertexAttrib3sNV)getProc("glVertexAttrib3sNV");
	glVertexAttrib3svNV = cast(pfglVertexAttrib3svNV)getProc("glVertexAttrib3svNV");
	glVertexAttrib4dNV = cast(pfglVertexAttrib4dNV)getProc("glVertexAttrib4dNV");
	glVertexAttrib4dvNV = cast(pfglVertexAttrib4dvNV)getProc("glVertexAttrib4dvNV");
	glVertexAttrib4fNV = cast(pfglVertexAttrib4fNV)getProc("glVertexAttrib4fNV");
	glVertexAttrib4fvNV = cast(pfglVertexAttrib4fvNV)getProc("glVertexAttrib4fvNV");
	glVertexAttrib4sNV = cast(pfglVertexAttrib4sNV)getProc("glVertexAttrib4sNV");
	glVertexAttrib4svNV = cast(pfglVertexAttrib4svNV)getProc("glVertexAttrib4svNV");
	glVertexAttrib4ubNV = cast(pfglVertexAttrib4ubNV)getProc("glVertexAttrib4ubNV");
	glVertexAttrib4ubvNV = cast(pfglVertexAttrib4ubvNV)getProc("glVertexAttrib4ubvNV");
	glVertexAttribs1dvNV = cast(pfglVertexAttribs1dvNV)getProc("glVertexAttribs1dvNV");
	glVertexAttribs1fvNV = cast(pfglVertexAttribs1fvNV)getProc("glVertexAttribs1fvNV");
	glVertexAttribs1svNV = cast(pfglVertexAttribs1svNV)getProc("glVertexAttribs1svNV");
	glVertexAttribs2dvNV = cast(pfglVertexAttribs2dvNV)getProc("glVertexAttribs2dvNV");
	glVertexAttribs2fvNV = cast(pfglVertexAttribs2fvNV)getProc("glVertexAttribs2fvNV");
	glVertexAttribs2svNV = cast(pfglVertexAttribs2svNV)getProc("glVertexAttribs2svNV");
	glVertexAttribs3dvNV = cast(pfglVertexAttribs3dvNV)getProc("glVertexAttribs3dvNV");
	glVertexAttribs3fvNV = cast(pfglVertexAttribs3fvNV)getProc("glVertexAttribs3fvNV");
	glVertexAttribs3svNV = cast(pfglVertexAttribs3svNV)getProc("glVertexAttribs3svNV");
	glVertexAttribs4dvNV = cast(pfglVertexAttribs4dvNV)getProc("glVertexAttribs4dvNV");
	glVertexAttribs4fvNV = cast(pfglVertexAttribs4fvNV)getProc("glVertexAttribs4fvNV");
	glVertexAttribs4svNV = cast(pfglVertexAttribs4svNV)getProc("glVertexAttribs4svNV");
	glVertexAttribs4ubvNV = cast(pfglVertexAttribs4ubvNV)getProc("glVertexAttribs4ubvNV");

	glTexBumpParameterivATI = cast(pfglTexBumpParameterivATI)getProc("glTexBumpParameterivATI");
	glTexBumpParameterfvATI = cast(pfglTexBumpParameterfvATI)getProc("glTexBumpParameterfvATI");
	glGetTexBumpParameterivATI = cast(pfglGetTexBumpParameterivATI)getProc("glGetTexBumpParameterivATI");
	glGetTexBumpParameterfvATI = cast(pfglGetTexBumpParameterfvATI)getProc("glGetTexBumpParameterfvATI");

	glGenFragmentShadersATI = cast(pfglGenFragmentShadersATI)getProc("glGenFragmentShadersATI");
	glBindFragmentShaderATI = cast(pfglBindFragmentShaderATI)getProc("glBindFragmentShaderATI");
	glDeleteFragmentShaderATI = cast(pfglDeleteFragmentShaderATI)getProc("glDeleteFragmentShaderATI");
	glBeginFragmentShaderATI = cast(pfglBeginFragmentShaderATI)getProc("glBeginFragmentShaderATI");
	glEndFragmentShaderATI = cast(pfglEndFragmentShaderATI)getProc("glEndFragmentShaderATI");
	glPassTexCoordATI = cast(pfglPassTexCoordATI)getProc("glPassTexCoordATI");
	glSampleMapATI = cast(pfglSampleMapATI)getProc("glSampleMapATI");
	glColorFragmentOp1ATI = cast(pfglColorFragmentOp1ATI)getProc("glColorFragmentOp1ATI");
	glColorFragmentOp2ATI = cast(pfglColorFragmentOp2ATI)getProc("glColorFragmentOp2ATI");
	glColorFragmentOp3ATI = cast(pfglColorFragmentOp3ATI)getProc("glColorFragmentOp3ATI");
	glAlphaFragmentOp1ATI = cast(pfglAlphaFragmentOp1ATI)getProc("glAlphaFragmentOp1ATI");
	glAlphaFragmentOp2ATI = cast(pfglAlphaFragmentOp2ATI)getProc("glAlphaFragmentOp2ATI");
	glAlphaFragmentOp3ATI = cast(pfglAlphaFragmentOp3ATI)getProc("glAlphaFragmentOp3ATI");
	glSetFragmentShaderConstantATI = cast(pfglSetFragmentShaderConstantATI)getProc("glSetFragmentShaderConstantATI");

	glPNTrianglesiATI = cast(pfglPNTrianglesiATI)getProc("glPNTrianglesiATI");
	glPNTrianglesfATI = cast(pfglPNTrianglesfATI)getProc("glPNTrianglesfATI");

	glNewObjectBufferATI = cast(pfglNewObjectBufferATI)getProc("glNewObjectBufferATI");
	glIsObjectBufferATI = cast(pfglIsObjectBufferATI)getProc("glIsObjectBufferATI");
	glUpdateObjectBufferATI = cast(pfglUpdateObjectBufferATI)getProc("glUpdateObjectBufferATI");
	glGetObjectBufferfvATI = cast(pfglGetObjectBufferfvATI)getProc("glGetObjectBufferfvATI");
	glGetObjectBufferivATI = cast(pfglGetObjectBufferivATI)getProc("glGetObjectBufferivATI");
	glFreeObjectBufferATI = cast(pfglFreeObjectBufferATI)getProc("glFreeObjectBufferATI");
	glArrayObjectATI = cast(pfglArrayObjectATI)getProc("glArrayObjectATI");
	glGetArrayObjectfvATI = cast(pfglGetArrayObjectfvATI)getProc("glGetArrayObjectfvATI");
	glGetArrayObjectivATI = cast(pfglGetArrayObjectivATI)getProc("glGetArrayObjectivATI");
	glVariantArrayObjectATI = cast(pfglVariantArrayObjectATI)getProc("glVariantArrayObjectATI");
	glGetVariantArrayObjectfvATI = cast(pfglGetVariantArrayObjectfvATI)getProc("glGetVariantArrayObjectfvATI");
	glGetVariantArrayObjectivATI = cast(pfglGetVariantArrayObjectivATI)getProc("glGetVariantArrayObjectivATI");

	glBeginVertexShaderEXT = cast(pfglBeginVertexShaderEXT)getProc("glBeginVertexShaderEXT");
	glEndVertexShaderEXT = cast(pfglEndVertexShaderEXT)getProc("glEndVertexShaderEXT");
	glBindVertexShaderEXT = cast(pfglBindVertexShaderEXT)getProc("glBindVertexShaderEXT");
	glGenVertexShadersEXT = cast(pfglGenVertexShadersEXT)getProc("glGenVertexShadersEXT");
	glDeleteVertexShaderEXT = cast(pfglDeleteVertexShaderEXT)getProc("glDeleteVertexShaderEXT");
	glShaderOp1EXT = cast(pfglShaderOp1EXT)getProc("glShaderOp1EXT");
	glShaderOp2EXT = cast(pfglShaderOp2EXT)getProc("glShaderOp2EXT");
	glShaderOp3EXT = cast(pfglShaderOp3EXT)getProc("glShaderOp3EXT");
	glSwizzleEXT = cast(pfglSwizzleEXT)getProc("glSwizzleEXT");
	glWriteMaskEXT = cast(pfglWriteMaskEXT)getProc("glWriteMaskEXT");
	glInsertComponentEXT = cast(pfglInsertComponentEXT)getProc("glInsertComponentEXT");
	glExtractComponentEXT = cast(pfglExtractComponentEXT)getProc("glExtractComponentEXT");
	glGenSymbolsEXT = cast(pfglGenSymbolsEXT)getProc("glGenSymbolsEXT");
	glSetInvariantEXT = cast(pfglSetInvariantEXT)getProc("glSetInvariantEXT");
	glSetLocalConstantEXT = cast(pfglSetLocalConstantEXT)getProc("glSetLocalConstantEXT");
	glVariantbvEXT = cast(pfglVariantbvEXT)getProc("glVariantbvEXT");
	glVariantsvEXT = cast(pfglVariantsvEXT)getProc("glVariantsvEXT");
	glVariantivEXT = cast(pfglVariantivEXT)getProc("glVariantivEXT");
	glVariantfvEXT = cast(pfglVariantfvEXT)getProc("glVariantfvEXT");
	glVariantdvEXT = cast(pfglVariantdvEXT)getProc("glVariantdvEXT");
	glVariantubvEXT = cast(pfglVariantubvEXT)getProc("glVariantubvEXT");
	glVariantusvEXT = cast(pfglVariantusvEXT)getProc("glVariantusvEXT");
	glVariantuivEXT = cast(pfglVariantuivEXT)getProc("glVariantuivEXT");
	glVariantPointerEXT = cast(pfglVariantPointerEXT)getProc("glVariantPointerEXT");
	glEnableVariantClientStateEXT = cast(pfglEnableVariantClientStateEXT)getProc("glEnableVariantClientStateEXT");
	glDisableVariantClientStateEXT = cast(pfglDisableVariantClientStateEXT)getProc("glDisableVariantClientStateEXT");
	glBindLightParameterEXT = cast(pfglBindLightParameterEXT)getProc("glBindLightParameterEXT");
	glBindMaterialParameterEXT = cast(pfglBindMaterialParameterEXT)getProc("glBindMaterialParameterEXT");
	glBindTexGenParameterEXT = cast(pfglBindTexGenParameterEXT)getProc("glBindTexGenParameterEXT");
	glBindTextureUnitParameterEXT = cast(pfglBindTextureUnitParameterEXT)getProc("glBindTextureUnitParameterEXT");
	glBindParameterEXT = cast(pfglBindParameterEXT)getProc("glBindParameterEXT");
	glIsVariantEnabledEXT = cast(pfglIsVariantEnabledEXT)getProc("glIsVariantEnabledEXT");
	glGetVariantBooleanvEXT = cast(pfglGetVariantBooleanvEXT)getProc("glGetVariantBooleanvEXT");
	glGetVariantIntegervEXT = cast(pfglGetVariantIntegervEXT)getProc("glGetVariantIntegervEXT");
	glGetVariantFloatvEXT = cast(pfglGetVariantFloatvEXT)getProc("glGetVariantFloatvEXT");
	glGetVariantPointervEXT = cast(pfglGetVariantPointervEXT)getProc("glGetVariantPointervEXT");
	glGetInvariantBooleanvEXT = cast(pfglGetInvariantBooleanvEXT)getProc("glGetInvariantBooleanvEXT");
	glGetInvariantIntegervEXT = cast(pfglGetInvariantIntegervEXT)getProc("glGetInvariantIntegervEXT");
	glGetInvariantFloatvEXT = cast(pfglGetInvariantFloatvEXT)getProc("glGetInvariantFloatvEXT");
	glGetLocalConstantBooleanvEXT = cast(pfglGetLocalConstantBooleanvEXT)getProc("glGetLocalConstantBooleanvEXT");
	glGetLocalConstantIntegervEXT = cast(pfglGetLocalConstantIntegervEXT)getProc("glGetLocalConstantIntegervEXT");
	glGetLocalConstantFloatvEXT = cast(pfglGetLocalConstantFloatvEXT)getProc("glGetLocalConstantFloatvEXT");

	glVertexStream1sATI = cast(pfglVertexStream1sATI)getProc("glVertexStream1sATI");
	glVertexStream1svATI = cast(pfglVertexStream1svATI)getProc("glVertexStream1svATI");
	glVertexStream1iATI = cast(pfglVertexStream1iATI)getProc("glVertexStream1iATI");
	glVertexStream1ivATI = cast(pfglVertexStream1ivATI)getProc("glVertexStream1ivATI");
	glVertexStream1fATI = cast(pfglVertexStream1fATI)getProc("glVertexStream1fATI");
	glVertexStream1fvATI = cast(pfglVertexStream1fvATI)getProc("glVertexStream1fvATI");
	glVertexStream1dATI = cast(pfglVertexStream1dATI)getProc("glVertexStream1dATI");
	glVertexStream1dvATI = cast(pfglVertexStream1dvATI)getProc("glVertexStream1dvATI");
	glVertexStream2sATI = cast(pfglVertexStream2sATI)getProc("glVertexStream2sATI");
	glVertexStream2svATI = cast(pfglVertexStream2svATI)getProc("glVertexStream2svATI");
	glVertexStream2iATI = cast(pfglVertexStream2iATI)getProc("glVertexStream2iATI");
	glVertexStream2ivATI = cast(pfglVertexStream2ivATI)getProc("glVertexStream2ivATI");
	glVertexStream2fATI = cast(pfglVertexStream2fATI)getProc("glVertexStream2fATI");
	glVertexStream2fvATI = cast(pfglVertexStream2fvATI)getProc("glVertexStream2fvATI");
	glVertexStream2dATI = cast(pfglVertexStream2dATI)getProc("glVertexStream2dATI");
	glVertexStream2dvATI = cast(pfglVertexStream2dvATI)getProc("glVertexStream2dvATI");
	glVertexStream3sATI = cast(pfglVertexStream3sATI)getProc("glVertexStream3sATI");
	glVertexStream3svATI = cast(pfglVertexStream3svATI)getProc("glVertexStream3svATI");
	glVertexStream3iATI = cast(pfglVertexStream3iATI)getProc("glVertexStream3iATI");
	glVertexStream3ivATI = cast(pfglVertexStream3ivATI)getProc("glVertexStream3ivATI");
	glVertexStream3fATI = cast(pfglVertexStream3fATI)getProc("glVertexStream3fATI");
	glVertexStream3fvATI = cast(pfglVertexStream3fvATI)getProc("glVertexStream3fvATI");
	glVertexStream3dATI = cast(pfglVertexStream3dATI)getProc("glVertexStream3dATI");
	glVertexStream3dvATI = cast(pfglVertexStream3dvATI)getProc("glVertexStream3dvATI");
	glVertexStream4sATI = cast(pfglVertexStream4sATI)getProc("glVertexStream4sATI");
	glVertexStream4svATI = cast(pfglVertexStream4svATI)getProc("glVertexStream4svATI");
	glVertexStream4iATI = cast(pfglVertexStream4iATI)getProc("glVertexStream4iATI");
	glVertexStream4ivATI = cast(pfglVertexStream4ivATI)getProc("glVertexStream4ivATI");
	glVertexStream4fATI = cast(pfglVertexStream4fATI)getProc("glVertexStream4fATI");
	glVertexStream4fvATI = cast(pfglVertexStream4fvATI)getProc("glVertexStream4fvATI");
	glVertexStream4dATI = cast(pfglVertexStream4dATI)getProc("glVertexStream4dATI");
	glVertexStream4dvATI = cast(pfglVertexStream4dvATI)getProc("glVertexStream4dvATI");
	glNormalStream3bATI = cast(pfglNormalStream3bATI)getProc("glNormalStream3bATI");
	glNormalStream3bvATI = cast(pfglNormalStream3bvATI)getProc("glNormalStream3bvATI");
	glNormalStream3sATI = cast(pfglNormalStream3sATI)getProc("glNormalStream3sATI");
	glNormalStream3svATI = cast(pfglNormalStream3svATI)getProc("glNormalStream3svATI");
	glNormalStream3iATI = cast(pfglNormalStream3iATI)getProc("glNormalStream3iATI");
	glNormalStream3ivATI = cast(pfglNormalStream3ivATI)getProc("glNormalStream3ivATI");
	glNormalStream3fATI = cast(pfglNormalStream3fATI)getProc("glNormalStream3fATI");
	glNormalStream3fvATI = cast(pfglNormalStream3fvATI)getProc("glNormalStream3fvATI");
	glNormalStream3dATI = cast(pfglNormalStream3dATI)getProc("glNormalStream3dATI");
	glNormalStream3dvATI = cast(pfglNormalStream3dvATI)getProc("glNormalStream3dvATI");
	glClientActiveVertexStreamATI = cast(pfglClientActiveVertexStreamATI)getProc("glClientActiveVertexStreamATI");
	glVertexBlendEnviATI = cast(pfglVertexBlendEnviATI)getProc("glVertexBlendEnviATI");
	glVertexBlendEnvfATI = cast(pfglVertexBlendEnvfATI)getProc("glVertexBlendEnvfATI");

	glElementPointerATI = cast(pfglElementPointerATI)getProc("glElementPointerATI");
	glDrawElementArrayATI = cast(pfglDrawElementArrayATI)getProc("glDrawElementArrayATI");
	glDrawRangeElementArrayATI = cast(pfglDrawRangeElementArrayATI)getProc("glDrawRangeElementArrayATI");

	glDrawMeshArraysSUN = cast(pfglDrawMeshArraysSUN)getProc("glDrawMeshArraysSUN");

	glGenOcclusionQueriesNV = cast(pfglGenOcclusionQueriesNV)getProc("glGenOcclusionQueriesNV");
	glDeleteOcclusionQueriesNV = cast(pfglDeleteOcclusionQueriesNV)getProc("glDeleteOcclusionQueriesNV");
	glIsOcclusionQueryNV = cast(pfglIsOcclusionQueryNV)getProc("glIsOcclusionQueryNV");
	glBeginOcclusionQueryNV = cast(pfglBeginOcclusionQueryNV)getProc("glBeginOcclusionQueryNV");
	glEndOcclusionQueryNV = cast(pfglEndOcclusionQueryNV)getProc("glEndOcclusionQueryNV");
	glGetOcclusionQueryivNV = cast(pfglGetOcclusionQueryivNV)getProc("glGetOcclusionQueryivNV");
	glGetOcclusionQueryuivNV = cast(pfglGetOcclusionQueryuivNV)getProc("glGetOcclusionQueryuivNV");

	glPointParameteriNV = cast(pfglPointParameteriNV)getProc("glPointParameteriNV");
	glPointParameterivNV = cast(pfglPointParameterivNV)getProc("glPointParameterivNV");

	glActiveStencilFaceEXT = cast(pfglActiveStencilFaceEXT)getProc("glActiveStencilFaceEXT");

	glElementPointerAPPLE = cast(pfglElementPointerAPPLE)getProc("glElementPointerAPPLE");
	glDrawElementArrayAPPLE = cast(pfglDrawElementArrayAPPLE)getProc("glDrawElementArrayAPPLE");
	glDrawRangeElementArrayAPPLE = cast(pfglDrawRangeElementArrayAPPLE)getProc("glDrawRangeElementArrayAPPLE");
	glMultiDrawElementArrayAPPLE = cast(pfglMultiDrawElementArrayAPPLE)getProc("glMultiDrawElementArrayAPPLE");
	glMultiDrawRangeElementArrayAPPLE = cast(pfglMultiDrawRangeElementArrayAPPLE)getProc("glMultiDrawRangeElementArrayAPPLE");

	glGenFencesAPPLE = cast(pfglGenFencesAPPLE)getProc("glGenFencesAPPLE");
	glDeleteFencesAPPLE = cast(pfglDeleteFencesAPPLE)getProc("glDeleteFencesAPPLE");
	glSetFenceAPPLE = cast(pfglSetFenceAPPLE)getProc("glSetFenceAPPLE");
	glIsFenceAPPLE = cast(pfglIsFenceAPPLE)getProc("glIsFenceAPPLE");
	glTestFenceAPPLE = cast(pfglTestFenceAPPLE)getProc("glTestFenceAPPLE");
	glFinishFenceAPPLE = cast(pfglFinishFenceAPPLE)getProc("glFinishFenceAPPLE");
	glTestObjectAPPLE = cast(pfglTestObjectAPPLE)getProc("glTestObjectAPPLE");
	glFinishObjectAPPLE = cast(pfglFinishObjectAPPLE)getProc("glFinishObjectAPPLE");

	glBindVertexArrayAPPLE = cast(pfglBindVertexArrayAPPLE)getProc("glBindVertexArrayAPPLE");
	glDeleteVertexArraysAPPLE = cast(pfglDeleteVertexArraysAPPLE)getProc("glDeleteVertexArraysAPPLE");
	glGenVertexArraysAPPLE = cast(pfglGenVertexArraysAPPLE)getProc("glGenVertexArraysAPPLE");
	glIsVertexArrayAPPLE = cast(pfglIsVertexArrayAPPLE)getProc("glIsVertexArrayAPPLE");

	glVertexArrayRangeAPPLE = cast(pfglVertexArrayRangeAPPLE)getProc("glVertexArrayRangeAPPLE");
	glFlushVertexArrayRangeAPPLE = cast(pfglFlushVertexArrayRangeAPPLE)getProc("glFlushVertexArrayRangeAPPLE");
	glVertexArrayParameteriAPPLE = cast(pfglVertexArrayParameteriAPPLE)getProc("glVertexArrayParameteriAPPLE");

	glDrawBuffersATI = cast(pfglDrawBuffersATI)getProc("glDrawBuffersATI");

	glProgramNamedParameter4fNV = cast(pfglProgramNamedParameter4fNV)getProc("glProgramNamedParameter4fNV");
	glProgramNamedParameter4dNV = cast(pfglProgramNamedParameter4dNV)getProc("glProgramNamedParameter4dNV");
	glProgramNamedParameter4fvNV = cast(pfglProgramNamedParameter4fvNV)getProc("glProgramNamedParameter4fvNV");
	glProgramNamedParameter4dvNV = cast(pfglProgramNamedParameter4dvNV)getProc("glProgramNamedParameter4dvNV");
	glGetProgramNamedParameterfvNV = cast(pfglGetProgramNamedParameterfvNV)getProc("glGetProgramNamedParameterfvNV");
	glGetProgramNamedParameterdvNV = cast(pfglGetProgramNamedParameterdvNV)getProc("glGetProgramNamedParameterdvNV");

	glVertex2hNV = cast(pfglVertex2hNV)getProc("glVertex2hNV");
	glVertex2hvNV = cast(pfglVertex2hvNV)getProc("glVertex2hvNV");
	glVertex3hNV = cast(pfglVertex3hNV)getProc("glVertex3hNV");
	glVertex3hvNV = cast(pfglVertex3hvNV)getProc("glVertex3hvNV");
	glVertex4hNV = cast(pfglVertex4hNV)getProc("glVertex4hNV");
	glVertex4hvNV = cast(pfglVertex4hvNV)getProc("glVertex4hvNV");
	glNormal3hNV = cast(pfglNormal3hNV)getProc("glNormal3hNV");
	glNormal3hvNV = cast(pfglNormal3hvNV)getProc("glNormal3hvNV");
	glColor3hNV = cast(pfglColor3hNV)getProc("glColor3hNV");
	glColor3hvNV = cast(pfglColor3hvNV)getProc("glColor3hvNV");
	glColor4hNV = cast(pfglColor4hNV)getProc("glColor4hNV");
	glColor4hvNV = cast(pfglColor4hvNV)getProc("glColor4hvNV");
	glTexCoord1hNV = cast(pfglTexCoord1hNV)getProc("glTexCoord1hNV");
	glTexCoord1hvNV = cast(pfglTexCoord1hvNV)getProc("glTexCoord1hvNV");
	glTexCoord2hNV = cast(pfglTexCoord2hNV)getProc("glTexCoord2hNV");
	glTexCoord2hvNV = cast(pfglTexCoord2hvNV)getProc("glTexCoord2hvNV");
	glTexCoord3hNV = cast(pfglTexCoord3hNV)getProc("glTexCoord3hNV");
	glTexCoord3hvNV = cast(pfglTexCoord3hvNV)getProc("glTexCoord3hvNV");
	glTexCoord4hNV = cast(pfglTexCoord4hNV)getProc("glTexCoord4hNV");
	glTexCoord4hvNV = cast(pfglTexCoord4hvNV)getProc("glTexCoord4hvNV");
	glMultiTexCoord1hNV = cast(pfglMultiTexCoord1hNV)getProc("glMultiTexCoord1hNV");
	glMultiTexCoord1hvNV = cast(pfglMultiTexCoord1hvNV)getProc("glMultiTexCoord1hvNV");
	glMultiTexCoord2hNV = cast(pfglMultiTexCoord2hNV)getProc("glMultiTexCoord2hNV");
	glMultiTexCoord2hvNV = cast(pfglMultiTexCoord2hvNV)getProc("glMultiTexCoord2hvNV");
	glMultiTexCoord3hNV = cast(pfglMultiTexCoord3hNV)getProc("glMultiTexCoord3hNV");
	glMultiTexCoord3hvNV = cast(pfglMultiTexCoord3hvNV)getProc("glMultiTexCoord3hvNV");
	glMultiTexCoord4hNV = cast(pfglMultiTexCoord4hNV)getProc("glMultiTexCoord4hNV");
	glMultiTexCoord4hvNV = cast(pfglMultiTexCoord4hvNV)getProc("glMultiTexCoord4hvNV");
	glFogCoordhNV = cast(pfglFogCoordhNV)getProc("glFogCoordhNV");
	glFogCoordhvNV = cast(pfglFogCoordhvNV)getProc("glFogCoordhvNV");
	glSecondaryColor3hNV = cast(pfglSecondaryColor3hNV)getProc("glSecondaryColor3hNV");
	glSecondaryColor3hvNV = cast(pfglSecondaryColor3hvNV)getProc("glSecondaryColor3hvNV");
	glVertexWeighthNV = cast(pfglVertexWeighthNV)getProc("glVertexWeighthNV");
	glVertexWeighthvNV = cast(pfglVertexWeighthvNV)getProc("glVertexWeighthvNV");
	glVertexAttrib2hNV = cast(pfglVertexAttrib2hNV)getProc("glVertexAttrib2hNV");
	glVertexAttrib2hvNV = cast(pfglVertexAttrib2hvNV)getProc("glVertexAttrib2hvNV");
	glVertexAttrib1hNV = cast(pfglVertexAttrib1hNV)getProc("glVertexAttrib1hNV");
	glVertexAttrib1hvNV = cast(pfglVertexAttrib1hvNV)getProc("glVertexAttrib1hvNV");
	glVertexAttrib3hNV = cast(pfglVertexAttrib3hNV)getProc("glVertexAttrib3hNV");
	glVertexAttrib3hvNV = cast(pfglVertexAttrib3hvNV)getProc("glVertexAttrib3hvNV");
	glVertexAttrib4hNV = cast(pfglVertexAttrib4hNV)getProc("glVertexAttrib4hNV");
	glVertexAttrib4hvNV = cast(pfglVertexAttrib4hvNV)getProc("glVertexAttrib4hvNV");
	glVertexAttribs1hvNV = cast(pfglVertexAttribs1hvNV)getProc("glVertexAttribs1hvNV");
	glVertexAttribs2hvNV = cast(pfglVertexAttribs2hvNV)getProc("glVertexAttribs2hvNV");
	glVertexAttribs3hvNV = cast(pfglVertexAttribs3hvNV)getProc("glVertexAttribs3hvNV");
	glVertexAttribs4hvNV = cast(pfglVertexAttribs4hvNV)getProc("glVertexAttribs4hvNV");

	glPixelDataRangeNV = cast(pfglPixelDataRangeNV)getProc("glPixelDataRangeNV");
	glFlushPixelDataRangeNV = cast(pfglFlushPixelDataRangeNV)getProc("glFlushPixelDataRangeNV");

	glPrimitiveRestartNV = cast(pfglPrimitiveRestartNV)getProc("glPrimitiveRestartNV");
	glPrimitiveRestartIndexNV = cast(pfglPrimitiveRestartIndexNV)getProc("glPrimitiveRestartIndexNV");

	glMapObjectBufferATI = cast(pfglMapObjectBufferATI)getProc("glMapObjectBufferATI");
	glUnmapObjectBufferATI = cast(pfglUnmapObjectBufferATI)getProc("glUnmapObjectBufferATI");

	glStencilOpSeparateATI = cast(pfglStencilOpSeparateATI)getProc("glStencilOpSeparateATI");
	glStencilFuncSeparateATI = cast(pfglStencilFuncSeparateATI)getProc("glStencilFuncSeparateATI");

	glVertexAttribArrayObjectATI = cast(pfglVertexAttribArrayObjectATI)getProc("glVertexAttribArrayObjectATI");
	glGetVertexAttribArrayObjectfvATI = cast(pfglGetVertexAttribArrayObjectfvATI)getProc("glGetVertexAttribArrayObjectfvATI");
	glGetVertexAttribArrayObjectivATI = cast(pfglGetVertexAttribArrayObjectivATI)getProc("glGetVertexAttribArrayObjectivATI");

	glDepthBoundsEXT = cast(pfglDepthBoundsEXT)getProc("glDepthBoundsEXT");

	glBlendEquationSeparateEXT = cast(pfglBlendEquationSeparateEXT)getProc("glBlendEquationSeparateEXT");

	glIsRenderbufferEXT = cast(pfglIsRenderbufferEXT)getProc("glIsRenderbufferEXT");
	glBindRenderbufferEXT = cast(pfglBindRenderbufferEXT)getProc("glBindRenderbufferEXT");
	glDeleteRenderbuffersEXT = cast(pfglDeleteRenderbuffersEXT)getProc("glDeleteRenderbuffersEXT");
	glGenRenderbuffersEXT = cast(pfglGenRenderbuffersEXT)getProc("glGenRenderbuffersEXT");
	glRenderbufferStorageEXT = cast(pfglRenderbufferStorageEXT)getProc("glRenderbufferStorageEXT");
	glGetRenderbufferParameterivEXT = cast(pfglGetRenderbufferParameterivEXT)getProc("glGetRenderbufferParameterivEXT");
	glIsFramebufferEXT = cast(pfglIsFramebufferEXT)getProc("glIsFramebufferEXT");
	glBindFramebufferEXT = cast(pfglBindFramebufferEXT)getProc("glBindFramebufferEXT");
	glDeleteFramebuffersEXT = cast(pfglDeleteFramebuffersEXT)getProc("glDeleteFramebuffersEXT");
	glGenFramebuffersEXT = cast(pfglGenFramebuffersEXT)getProc("glGenFramebuffersEXT");
	glCheckFramebufferStatusEXT = cast(pfglCheckFramebufferStatusEXT)getProc("glCheckFramebufferStatusEXT");
	glFramebufferTexture1DEXT = cast(pfglFramebufferTexture1DEXT)getProc("glFramebufferTexture1DEXT");
	glFramebufferTexture2DEXT = cast(pfglFramebufferTexture2DEXT)getProc("glFramebufferTexture2DEXT");
	glFramebufferTexture3DEXT = cast(pfglFramebufferTexture3DEXT)getProc("glFramebufferTexture3DEXT");
	glFramebufferRenderbufferEXT = cast(pfglFramebufferRenderbufferEXT)getProc("glFramebufferRenderbufferEXT");
	glGetFramebufferAttachmentParameterivEXT = cast(pfglGetFramebufferAttachmentParameterivEXT)getProc("glGetFramebufferAttachmentParameterivEXT");
	glGenerateMipmapEXT = cast(pfglGenerateMipmapEXT)getProc("glGenerateMipmapEXT");

	glStringMarkerGREMEDY = cast(pfglStringMarkerGREMEDY)getProc("glStringMarkerGREMEDY");

	glStencilClearTagEXT = cast(pfglStencilClearTagEXT)getProc("glStencilClearTagEXT");

	glBlitFramebufferEXT = cast(pfglBlitFramebufferEXT)getProc("glBlitFramebufferEXT");

	glRenderbufferStorageMultisampleEXT = cast(pfglRenderbufferStorageMultisampleEXT)getProc("glRenderbufferStorageMultisampleEXT");



	glGetQueryObjecti64vEXT = cast(pfglGetQueryObjecti64vEXT)getProc("glGetQueryObjecti64vEXT");
	glGetQueryObjectui64vEXT = cast(pfglGetQueryObjectui64vEXT)getProc("GetQueryObjectui64vEXT");

	glProgramEnvParameters4fvEXT = cast(pfglProgramEnvParameters4fvEXT)getProc("glProgramEnvParameters4fvEXT");
	glProgramLocalParameters4fvEXT = cast(pfglProgramLocalParameters4fvEXT)getProc("glProgramLocalParameters4fvEXT");

	glBufferParameteriAPPLE = cast(pfglBufferParameteriAPPLE)getProc("glBufferParameteriAPPLE");
	glFlushMappedBufferRangeAPPLE = cast(pfglFlushMappedBufferRangeAPPLE)getProc("glFlushMappedBufferRangeAPPLE");
	
	std.file.write("glext.log",failed);
}

static ~this () {
	ExeModule_Release(glextdrv);
}


	extern (C):

/*
 * ARB Extensions
 */
// 1 - GL_ARB_multitexture
typedef void function(GLenum) pfglActiveTextureARB;
typedef void function(GLenum) pfglClientActiveTextureARB;
typedef void function(GLenum, GLdouble) pfglMultiTexCoord1dARB;
typedef void function(GLenum, GLdouble*) pfglMultiTexCoord1dvARB;
typedef void function(GLenum, GLfloat) pfglMultiTexCoord1fARB;
typedef void function(GLenum, GLfloat*) pfglMultiTexCoord1fvARB;
typedef void function(GLenum, GLint) pfglMultiTexCoord1iARB;
typedef void function(GLenum, GLint*) pfglMultiTexCoord1ivARB;
typedef void function(GLenum, GLshort) pfglMultiTexCoord1sARB;
typedef void function(GLenum, GLshort*) pfglMultiTexCoord1svARB;
typedef void function(GLenum, GLdouble, GLdouble) pfglMultiTexCoord2dARB;
typedef void function(GLenum, GLdouble*) pfglMultiTexCoord2dvARB;
typedef void function(GLenum, GLfloat, GLfloat) pfglMultiTexCoord2fARB;
typedef void function(GLenum, GLfloat*) pfglMultiTexCoord2fvARB;
typedef void function(GLenum, GLint, GLint) pfglMultiTexCoord2iARB;
typedef void function(GLenum, GLint*) pfglMultiTexCoord2ivARB;
typedef void function(GLenum, GLshort, GLshort) pfglMultiTexCoord2sARB;
typedef void function(GLenum, GLshort*) pfglMultiTexCoord2svARB;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble) pfglMultiTexCoord3dARB;
typedef void function(GLenum, GLdouble*) pfglMultiTexCoord3dvARB;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat) pfglMultiTexCoord3fARB;
typedef void function(GLenum, GLfloat*) pfglMultiTexCoord3fvARB;
typedef void function(GLenum, GLint, GLint, GLint) pfglMultiTexCoord3iARB;
typedef void function(GLenum, GLint*) pfglMultiTexCoord3ivARB;
typedef void function(GLenum, GLshort, GLshort, GLshort) pfglMultiTexCoord3sARB;
typedef void function(GLenum, GLshort*) pfglMultiTexCoord3svARB;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble, GLdouble) pfglMultiTexCoord4dARB;
typedef void function(GLenum, GLdouble*) pfglMultiTexCoord4dvARB;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat, GLfloat) pfglMultiTexCoord4fARB;
typedef void function(GLenum, GLfloat*) pfglMultiTexCoord4fvARB;
typedef void function(GLenum, GLint, GLint, GLint, GLint) pfglMultiTexCoord4iARB;
typedef void function(GLenum, GLint*) pfglMultiTexCoord4ivARB;
typedef void function(GLenum, GLshort, GLshort, GLshort, GLshort) pfglMultiTexCoord4sARB;
typedef void function(GLenum, GLshort*) pfglMultiTexCoord4svARB;

pfglActiveTextureARB			glActiveTextureARB;
pfglClientActiveTextureARB		glClientActiveTextureARB;
pfglMultiTexCoord1dARB			glMultiTexCoord1dARB;
pfglMultiTexCoord1dvARB			glMultiTexCoord1dvARB;
pfglMultiTexCoord1fARB			glMultiTexCoord1fARB;
pfglMultiTexCoord1fvARB			glMultiTexCoord1fvARB;
pfglMultiTexCoord1iARB			glMultiTexCoord1iARB;
pfglMultiTexCoord1ivARB			glMultiTexCoord1ivARB;
pfglMultiTexCoord1sARB			glMultiTexCoord1sARB;
pfglMultiTexCoord1svARB			glMultiTexCoord1svARB;
pfglMultiTexCoord2dARB			glMultiTexCoord2dARB;
pfglMultiTexCoord2dvARB			glMultiTexCoord2dvARB;
pfglMultiTexCoord2fARB			glMultiTexCoord2fARB;
pfglMultiTexCoord2fvARB			glMultiTexCoord2fvARB;
pfglMultiTexCoord2iARB			glMultiTexCoord2iARB;
pfglMultiTexCoord2ivARB			glMultiTexCoord2ivARB;
pfglMultiTexCoord2sARB			glMultiTexCoord2sARB;
pfglMultiTexCoord2svARB			glMultiTexCoord2svARB;
pfglMultiTexCoord3dARB			glMultiTexCoord3dARB;
pfglMultiTexCoord3dvARB			glMultiTexCoord3dvARB;
pfglMultiTexCoord3fARB			glMultiTexCoord3fARB;
pfglMultiTexCoord3fvARB			glMultiTexCoord3fvARB;
pfglMultiTexCoord3iARB			glMultiTexCoord3iARB;
pfglMultiTexCoord3ivARB			glMultiTexCoord3ivARB;
pfglMultiTexCoord3sARB			glMultiTexCoord3sARB;
pfglMultiTexCoord3svARB			glMultiTexCoord3svARB;
pfglMultiTexCoord4dARB			glMultiTexCoord4dARB;
pfglMultiTexCoord4dvARB			glMultiTexCoord4dvARB;
pfglMultiTexCoord4fARB			glMultiTexCoord4fARB;
pfglMultiTexCoord4fvARB			glMultiTexCoord4fvARB;
pfglMultiTexCoord4iARB			glMultiTexCoord4iARB;
pfglMultiTexCoord4ivARB			glMultiTexCoord4ivARB;
pfglMultiTexCoord4sARB			glMultiTexCoord4sARB;
pfglMultiTexCoord4svARB			glMultiTexCoord4svARB;

// 3 - GL_ARB_transpose_matrix
typedef void function(GLfloat*) pfglLoadTransposeMatrixfARB;
typedef void function(GLdouble*) pfglLoadTransposeMatrixdARB;
typedef void function(GLfloat*) pfglMultTransposeMatrixfARB;
typedef void function(GLdouble*) pfglMultTransposeMatrixdARB;

pfglLoadTransposeMatrixfARB		glLoadTransposeMatrixfARB;
pfglLoadTransposeMatrixdARB		glLoadTransposeMatrixdARB;
pfglMultTransposeMatrixfARB		glMultTransposeMatrixfARB;
pfglMultTransposeMatrixdARB		glMultTransposeMatrixdARB;

// 5 - GL_ARB_multisample
typedef void function(GLclampf, GLboolean) pfglSampleCoverageARB;

pfglSampleCoverageARB			glSampleCoverageARB;

// 12 - GL_ARB_texture_compression
typedef void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, void*) pfglCompressedTexImage3DARB;
typedef void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, void*) pfglCompressedTexImage2DARB;
typedef void function(GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, void*) pfglCompressedTexImage1DARB;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, void*) pfglCompressedTexSubImage3DARB;
typedef void function(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, void*) pfglCompressedTexSubImage2DARB;
typedef void function(GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, void*) pfglCompressedTexSubImage1DARB;
typedef void function(GLenum, GLint, void*) pfglGetCompressedTexImageARB;

pfglCompressedTexImage3DARB		glCompressedTexImage3DARB;
pfglCompressedTexImage2DARB		glCompressedTexImage2DARB;
pfglCompressedTexImage1DARB		glCompressedTexImage1DARB;
pfglCompressedTexSubImage3DARB		glCompressedTexSubImage3DARB;
pfglCompressedTexSubImage2DARB		glCompressedTexSubImage2DARB;
pfglCompressedTexSubImage1DARB		glCompressedTexSubImage1DARB;
pfglGetCompressedTexImageARB		glGetCompressedTexImageARB;

// 14 - GL_ARB_point_parameters
typedef void function(GLenum, GLfloat) pfglPointParameterfARB;
typedef void function(GLenum, GLfloat*) pfglPointParameterfvARB;

pfglPointParameterfARB			glPointParameterfARB;
pfglPointParameterfvARB			glPointParameterfvARB;

// 15 - GL_ARB_vertex_blend
typedef void function(GLint, GLbyte*) pfglWeightbvARB;
typedef void function(GLint, GLshort*) pfglWeightsvARB;
typedef void function(GLint, GLint*) pfglWeightivARB;
typedef void function(GLint, GLfloat*) pfglWeightfvARB;
typedef void function(GLint, GLdouble*) pfglWeightdvARB;
typedef void function(GLint, GLubyte*) pfglWeightubvARB;
typedef void function(GLint, GLushort*) pfglWeightusvARB;
typedef void function(GLint, uint*) pfglWeightuivARB;
typedef void function(GLint, GLenum, GLsizei, void*) pfglWeightPointerARB;
typedef void function(GLint) pfglVertexBlendARB;

pfglWeightbvARB				glWeightbvARB;
pfglWeightsvARB				glWeightsvARB;
pfglWeightivARB				glWeightivARB;
pfglWeightfvARB				glWeightfvARB;
pfglWeightdvARB				glWeightdvARB;
pfglWeightubvARB			glWeightubvARB;
pfglWeightusvARB			glWeightusvARB;
pfglWeightuivARB			glWeightuivARB;
pfglWeightPointerARB			glWeightPointerARB;
pfglVertexBlendARB			glVertexBlendARB;

// 16 - GL_ARB_matrix_palette
typedef void function(GLint) pfglCurrentPaletteMatrixARB;
typedef void function(GLint, GLubyte*) pfglMatrixIndexubvARB;
typedef void function(GLint, GLushort*) pfglMatrixIndexusvARB;
typedef void function(GLint, uint*) pfglMatrixIndexuivARB;
typedef void function(GLint, GLenum, GLsizei, void*) pfglMatrixIndexPointerARB;

pfglCurrentPaletteMatrixARB		glCurrentPaletteMatrixARB;
pfglMatrixIndexubvARB			glMatrixIndexubvARB;
pfglMatrixIndexusvARB			glMatrixIndexusvARB;
pfglMatrixIndexuivARB			glMatrixIndexuivARB;
pfglMatrixIndexPointerARB		glMatrixIndexPointerARB;

// 25 - GL_ARB_window_pos
typedef void function(GLdouble, GLdouble) pfglWindowPos2dARB;
typedef void function(GLdouble*) pfglWindowPos2dvARB;
typedef void function(GLfloat, GLfloat) pfglWindowPos2fARB;
typedef void function(GLfloat*) pfglWindowPos2fvARB;
typedef void function(GLint, GLint) pfglWindowPos2iARB;
typedef void function(GLint*) pfglWindowPos2ivARB;
typedef void function(GLshort, GLshort) pfglWindowPos2sARB;
typedef void function(GLshort*) pfglWindowPos2svARB;
typedef void function(GLdouble, GLdouble, GLdouble) pfglWindowPos3dARB;
typedef void function(GLdouble*) pfglWindowPos3dvARB;
typedef void function(GLfloat, GLfloat, GLfloat) pfglWindowPos3fARB;
typedef void function(GLfloat*) pfglWindowPos3fvARB;
typedef void function(GLint, GLint, GLint) pfglWindowPos3iARB;
typedef void function(GLint*) pfglWindowPos3ivARB;
typedef void function(GLshort, GLshort, GLshort) pfglWindowPos3sARB;
typedef void function(GLshort*) pfglWindowPos3svARB;

pfglWindowPos2dARB			glWindowPos2dARB;
pfglWindowPos2dvARB			glWindowPos2dvARB;
pfglWindowPos2fARB			glWindowPos2fARB;
pfglWindowPos2fvARB			glWindowPos2fvARB;
pfglWindowPos2iARB			glWindowPos2iARB;
pfglWindowPos2ivARB			glWindowPos2ivARB;
pfglWindowPos2sARB			glWindowPos2sARB;
pfglWindowPos2svARB			glWindowPos2svARB;
pfglWindowPos3dARB			glWindowPos3dARB;
pfglWindowPos3dvARB			glWindowPos3dvARB;
pfglWindowPos3fARB			glWindowPos3fARB;
pfglWindowPos3fvARB			glWindowPos3fvARB;
pfglWindowPos3iARB			glWindowPos3iARB;
pfglWindowPos3ivARB			glWindowPos3ivARB;
pfglWindowPos3sARB			glWindowPos3sARB;
pfglWindowPos3svARB			glWindowPos3svARB;

// 26 - GL_ARB_vertex_program
typedef void function(uint, GLdouble) pfglVertexAttrib1dARB;
typedef void function(uint, GLdouble*) pfglVertexAttrib1dvARB;
typedef void function(uint, GLfloat) pfglVertexAttrib1fARB;
typedef void function(uint, GLfloat*) pfglVertexAttrib1fvARB;
typedef void function(uint, GLshort) pfglVertexAttrib1sARB;
typedef void function(uint, GLshort*) pfglVertexAttrib1svARB;
typedef void function(uint, GLdouble, GLdouble) pfglVertexAttrib2dARB;
typedef void function(uint, GLdouble*) pfglVertexAttrib2dvARB;
typedef void function(uint, GLfloat, GLfloat) pfglVertexAttrib2fARB;
typedef void function(uint, GLfloat*) pfglVertexAttrib2fvARB;
typedef void function(uint, GLshort, GLshort) pfglVertexAttrib2sARB;
typedef void function(uint, GLshort*) pfglVertexAttrib2svARB;
typedef void function(uint, GLdouble, GLdouble, GLdouble) pfglVertexAttrib3dARB;
typedef void function(uint, GLdouble*) pfglVertexAttrib3dvARB;
typedef void function(uint, GLfloat, GLfloat, GLfloat) pfglVertexAttrib3fARB;
typedef void function(uint, GLfloat*) pfglVertexAttrib3fvARB;
typedef void function(uint, GLshort, GLshort, GLshort) pfglVertexAttrib3sARB;
typedef void function(uint, GLshort*) pfglVertexAttrib3svARB;
typedef void function(uint, GLbyte*) pfglVertexAttrib4NbvARB;
typedef void function(uint, GLint*) pfglVertexAttrib4NivARB;
typedef void function(uint, GLshort*) pfglVertexAttrib4NsvARB;
typedef void function(uint, GLubyte, GLubyte, GLubyte, GLubyte) pfglVertexAttrib4NubARB;
typedef void function(uint, GLubyte*) pfglVertexAttrib4NubvARB;
typedef void function(uint, uint*) pfglVertexAttrib4NuivARB;
typedef void function(uint, GLushort*) pfglVertexAttrib4NusvARB;
typedef void function(uint, GLbyte*) pfglVertexAttrib4bvARB;
typedef void function(uint, GLdouble, GLdouble, GLdouble, GLdouble) pfglVertexAttrib4dARB;
typedef void function(uint, GLdouble*) pfglVertexAttrib4dvARB;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat) pfglVertexAttrib4fARB;
typedef void function(uint, GLfloat*) pfglVertexAttrib4fvARB;
typedef void function(uint, GLint*) pfglVertexAttrib4ivARB;
typedef void function(uint, GLshort, GLshort, GLshort, GLshort) pfglVertexAttrib4sARB;
typedef void function(uint, GLshort*) pfglVertexAttrib4svARB;
typedef void function(uint, GLubyte*) pfglVertexAttrib4ubvARB;
typedef void function(uint, uint*) pfglVertexAttrib4uivARB;
typedef void function(uint, GLushort*) pfglVertexAttrib4usvARB;
typedef void function(uint, GLint, GLenum, GLboolean, GLsizei, void*) pfglVertexAttribPointerARB;
typedef void function(uint) pfglEnableVertexAttribArrayARB;
typedef void function(uint) pfglDisableVertexAttribArrayARB;
typedef void function(GLenum, GLenum, GLsizei, void*) pfglProgramStringARB;
typedef void function(GLenum, uint) pfglBindProgramARB;
typedef void function(GLsizei, uint*) pfglDeleteProgramsARB;
typedef void function(GLsizei, uint*) pfglGenProgramsARB;
typedef void function(GLenum, uint, GLdouble, GLdouble, GLdouble, GLdouble) pfglProgramEnvParameter4dARB;
typedef void function(GLenum, uint, GLdouble*) pfglProgramEnvParameter4dvARB;
typedef void function(GLenum, uint, GLfloat, GLfloat, GLfloat, GLfloat) pfglProgramEnvParameter4fARB;
typedef void function(GLenum, uint, GLfloat*) pfglProgramEnvParameter4fvARB;
typedef void function(GLenum, uint, GLdouble, GLdouble, GLdouble, GLdouble) pfglProgramLocalParameter4dARB;
typedef void function(GLenum, uint, GLdouble*) pfglProgramLocalParameter4dvARB;
typedef void function(GLenum, uint, GLfloat, GLfloat, GLfloat, GLfloat) pfglProgramLocalParameter4fARB;
typedef void function(GLenum, uint, GLfloat*) pfglProgramLocalParameter4fvARB;
typedef void function(GLenum, uint, GLdouble*) pfglGetProgramEnvParameterdvARB;
typedef void function(GLenum, uint, GLfloat*) pfglGetProgramEnvParameterfvARB;
typedef void function(GLenum, uint, GLdouble*) pfglGetProgramLocalParameterdvARB;
typedef void function(GLenum, uint, GLfloat*) pfglGetProgramLocalParameterfvARB;
typedef void function(GLenum, GLenum, GLint*) pfglGetProgramivARB;
typedef void function(GLenum, GLenum, void*) pfglGetProgramStringARB;
typedef void function(uint, GLenum, GLdouble*) pfglGetVertexAttribdvARB;
typedef void function(uint, GLenum, GLfloat*) pfglGetVertexAttribfvARB;
typedef void function(uint, GLenum, GLint*) pfglGetVertexAttribivARB;
typedef void function(uint, GLenum, void**) pfglGetVertexAttribPointervARB;
typedef GLboolean function(uint) pfglIsProgramARB;

pfglVertexAttrib1dARB			glVertexAttrib1dARB;
pfglVertexAttrib1dvARB			glVertexAttrib1dvARB;
pfglVertexAttrib1fARB			glVertexAttrib1fARB;
pfglVertexAttrib1fvARB			glVertexAttrib1fvARB;
pfglVertexAttrib1sARB			glVertexAttrib1sARB;
pfglVertexAttrib1svARB			glVertexAttrib1svARB;
pfglVertexAttrib2dARB			glVertexAttrib2dARB;
pfglVertexAttrib2dvARB			glVertexAttrib2dvARB;
pfglVertexAttrib2fARB			glVertexAttrib2fARB;
pfglVertexAttrib2fvARB			glVertexAttrib2fvARB;
pfglVertexAttrib2sARB			glVertexAttrib2sARB;
pfglVertexAttrib2svARB			glVertexAttrib2svARB;
pfglVertexAttrib3dARB			glVertexAttrib3dARB;
pfglVertexAttrib3dvARB			glVertexAttrib3dvARB;
pfglVertexAttrib3fARB			glVertexAttrib3fARB;
pfglVertexAttrib3fvARB			glVertexAttrib3fvARB;
pfglVertexAttrib3sARB			glVertexAttrib3sARB;
pfglVertexAttrib3svARB			glVertexAttrib3svARB;
pfglVertexAttrib4NbvARB			glVertexAttrib4NbvARB;
pfglVertexAttrib4NivARB			glVertexAttrib4NivARB;
pfglVertexAttrib4NsvARB			glVertexAttrib4NsvARB;
pfglVertexAttrib4NubARB			glVertexAttrib4NubARB;
pfglVertexAttrib4NubvARB		glVertexAttrib4NubvARB;
pfglVertexAttrib4NuivARB		glVertexAttrib4NuivARB;
pfglVertexAttrib4NusvARB		glVertexAttrib4NusvARB;
pfglVertexAttrib4bvARB			glVertexAttrib4bvARB;
pfglVertexAttrib4dARB			glVertexAttrib4dARB;
pfglVertexAttrib4dvARB			glVertexAttrib4dvARB;
pfglVertexAttrib4fARB			glVertexAttrib4fARB;
pfglVertexAttrib4fvARB			glVertexAttrib4fvARB;
pfglVertexAttrib4ivARB			glVertexAttrib4ivARB;
pfglVertexAttrib4sARB			glVertexAttrib4sARB;
pfglVertexAttrib4svARB			glVertexAttrib4svARB;
pfglVertexAttrib4ubvARB			glVertexAttrib4ubvARB;
pfglVertexAttrib4uivARB			glVertexAttrib4uivARB;
pfglVertexAttrib4usvARB			glVertexAttrib4usvARB;
pfglVertexAttribPointerARB		glVertexAttribPointerARB;
pfglEnableVertexAttribArrayARB		glEnableVertexAttribArrayARB;
pfglDisableVertexAttribArrayARB		glDisableVertexAttribArrayARB;
pfglProgramStringARB			glProgramStringARB;
pfglBindProgramARB			glBindProgramARB;
pfglDeleteProgramsARB			glDeleteProgramsARB;
pfglGenProgramsARB			glGenProgramsARB;
pfglProgramEnvParameter4dARB		glProgramEnvParameter4dARB;
pfglProgramEnvParameter4dvARB		glProgramEnvParameter4dvARB;
pfglProgramEnvParameter4fARB		glProgramEnvParameter4fARB;
pfglProgramEnvParameter4fvARB		glProgramEnvParameter4fvARB;
pfglProgramLocalParameter4dARB		glProgramLocalParameter4dARB;
pfglProgramLocalParameter4dvARB		glProgramLocalParameter4dvARB;
pfglProgramLocalParameter4fARB		glProgramLocalParameter4fARB;
pfglProgramLocalParameter4fvARB		glProgramLocalParameter4fvARB;
pfglGetProgramEnvParameterdvARB		glGetProgramEnvParameterdvARB;
pfglGetProgramEnvParameterfvARB		glGetProgramEnvParameterfvARB;
pfglGetProgramLocalParameterdvARB	glGetProgramLocalParameterdvARB;
pfglGetProgramLocalParameterfvARB	glGetProgramLocalParameterfvARB;
pfglGetProgramivARB			glGetProgramivARB;
pfglGetProgramStringARB			glGetProgramStringARB;
pfglGetVertexAttribdvARB		glGetVertexAttribdvARB;
pfglGetVertexAttribfvARB		glGetVertexAttribfvARB;
pfglGetVertexAttribivARB		glGetVertexAttribivARB;
pfglGetVertexAttribPointervARB		glGetVertexAttribPointervARB;
pfglIsProgramARB			glIsProgramARB;

// 28 - GL_ARB_vertex_buffer_object
typedef void function(GLenum, uint) pfglBindBufferARB;
typedef void function(GLsizei, uint*) pfglDeleteBuffersARB;
typedef void function(GLsizei, uint*) pfglGenBuffersARB;
typedef GLboolean function(uint) pfglIsBufferARB;
typedef void function(GLenum, GLsizeiptrARB, void*, GLenum) pfglBufferDataARB;
typedef void function(GLenum, GLintptrARB, GLsizeiptrARB, void*) pfglBufferSubDataARB;
typedef void function(GLenum, GLintptrARB, GLsizeiptrARB, void*) pfglGetBufferSubDataARB;
typedef void* function(GLenum, GLenum) pfglMapBufferARB;
typedef GLboolean function(GLenum) pfglUnmapBufferARB;
typedef void function(GLenum, GLenum, GLint*) pfglGetBufferParameterivARB;
typedef void function(GLenum, GLenum, void**) pfglGetBufferPointervARB;

pfglBindBufferARB			glBindBufferARB;
pfglDeleteBuffersARB			glDeleteBuffersARB;
pfglGenBuffersARB			glGenBuffersARB;
pfglIsBufferARB				glIsBufferARB;
pfglBufferDataARB			glBufferDataARB;
pfglBufferSubDataARB			glBufferSubDataARB;
pfglGetBufferSubDataARB			glGetBufferSubDataARB;
pfglMapBufferARB			glMapBufferARB;
pfglUnmapBufferARB			glUnmapBufferARB;
pfglGetBufferParameterivARB		glGetBufferParameterivARB;
pfglGetBufferPointervARB		glGetBufferPointervARB;

// 29 - GL_ARB_occlusion_query
typedef void function(GLsizei, uint*) pfglGenQueriesARB;
typedef void function(GLsizei, uint*) pfglDeleteQueriesARB;
typedef GLboolean function(uint) pfglIsQueryARB;
typedef void function(GLenum, uint) pfglBeginQueryARB;
typedef void function(GLenum) pfglEndQueryARB;
typedef void function(GLenum, GLenum, GLint*) pfglGetQueryivARB;
typedef void function(uint, GLenum, GLint*) pfglGetQueryObjectivARB;
typedef void function(uint, GLenum, uint*) pfglGetQueryObjectuivARB;

pfglGenQueriesARB			glGenQueriesARB;
pfglDeleteQueriesARB			glDeleteQueriesARB;
pfglIsQueryARB				glIsQueryARB;
pfglBeginQueryARB			glBeginQueryARB;
pfglEndQueryARB				glEndQueryARB;
pfglGetQueryivARB			glGetQueryivARB;
pfglGetQueryObjectivARB			glGetQueryObjectivARB;
pfglGetQueryObjectuivARB		glGetQueryObjectuivARB;

// 30 - GL_ARB_shader_objects
typedef void function(GLhandleARB) pfglDeleteObjectARB;
typedef GLhandleARB function(GLenum) pfglGetHandleARB;
typedef void function(GLhandleARB, GLhandleARB) pfglDetachObjectARB;
typedef GLhandleARB function(GLenum) pfglCreateShaderObjectARB;
typedef void function(GLhandleARB, GLsizei, GLcharARB**, GLint*) pfglShaderSourceARB;
typedef void function(GLhandleARB) pfglCompileShaderARB;
typedef GLhandleARB function() pfglCreateProgramObjectARB;
typedef void function(GLhandleARB, GLhandleARB) pfglAttachObjectARB;
typedef void function(GLhandleARB) pfglLinkProgramARB;
typedef void function(GLhandleARB) pfglUseProgramObjectARB;
typedef void function(GLhandleARB) pfglValidateProgramARB;
typedef void function(GLint, GLfloat) pfglUniform1fARB;
typedef void function(GLint, GLfloat, GLfloat) pfglUniform2fARB;
typedef void function(GLint, GLfloat, GLfloat, GLfloat) pfglUniform3fARB;
typedef void function(GLint, GLfloat, GLfloat, GLfloat, GLfloat) pfglUniform4fARB;
typedef void function(GLint, GLint) pfglUniform1iARB;
typedef void function(GLint, GLint, GLint) pfglUniform2iARB;
typedef void function(GLint, GLint, GLint, GLint) pfglUniform3iARB;
typedef void function(GLint, GLint, GLint, GLint, GLint) pfglUniform4iARB;
typedef void function(GLint, GLsizei, GLfloat*) pfglUniform1fvARB;
typedef void function(GLint, GLsizei, GLfloat*) pfglUniform2fvARB;
typedef void function(GLint, GLsizei, GLfloat*) pfglUniform3fvARB;
typedef void function(GLint, GLsizei, GLfloat*) pfglUniform4fvARB;
typedef void function(GLint, GLsizei, GLint*) pfglUniform1ivARB;
typedef void function(GLint, GLsizei, GLint*) pfglUniform2ivARB;
typedef void function(GLint, GLsizei, GLint*) pfglUniform3ivARB;
typedef void function(GLint, GLsizei, GLint*) pfglUniform4ivARB;
typedef void function(GLint, GLsizei, GLboolean, GLfloat*) pfglUniformMatrix2fvARB;
typedef void function(GLint, GLsizei, GLboolean, GLfloat*) pfglUniformMatrix3fvARB;
typedef void function(GLint, GLsizei, GLboolean, GLfloat*) pfglUniformMatrix4fvARB;
typedef void function(GLhandleARB, GLenum, GLfloat*) pfglGetObjectParameterfvARB;
typedef void function(GLhandleARB, GLenum, GLint*) pfglGetObjectParameterivARB;
typedef void function(GLhandleARB, GLsizei, GLsizei*, GLcharARB*) pfglGetInfoLogARB;
typedef void function(GLhandleARB, GLsizei, GLsizei*, GLhandleARB*) pfglGetAttachedObjectsARB;
typedef GLint function(GLhandleARB, GLcharARB*) pfglGetUniformLocationARB;
typedef void function(GLhandleARB, uint, GLsizei, GLsizei*, GLint*, GLenum*, GLcharARB*) pfglGetActiveUniformARB;
typedef void function(GLhandleARB, GLint, GLfloat*) pfglGetUniformfvARB;
typedef void function(GLhandleARB, GLint, GLint*) pfglGetUniformivARB;
typedef void function(GLhandleARB, GLsizei, GLsizei*, GLcharARB*) pfglGetShaderSourceARB;

pfglDeleteObjectARB			glDeleteObjectARB;
pfglGetHandleARB			glGetHandleARB;
pfglDetachObjectARB			glDetachObjectARB;
pfglCreateShaderObjectARB		glCreateShaderObjectARB;
pfglShaderSourceARB			glShaderSourceARB;
pfglCompileShaderARB			glCompileShaderARB;
pfglCreateProgramObjectARB		glCreateProgramObjectARB;
pfglAttachObjectARB			glAttachObjectARB;
pfglLinkProgramARB			glLinkProgramARB;
pfglUseProgramObjectARB			glUseProgramObjectARB;
pfglValidateProgramARB			glValidateProgramARB;
pfglUniform1fARB			glUniform1fARB;
pfglUniform2fARB			glUniform2fARB;
pfglUniform3fARB			glUniform3fARB;
pfglUniform4fARB			glUniform4fARB;
pfglUniform1iARB			glUniform1iARB;
pfglUniform2iARB			glUniform2iARB;
pfglUniform3iARB			glUniform3iARB;
pfglUniform4iARB			glUniform4iARB;
pfglUniform1fvARB			glUniform1fvARB;
pfglUniform2fvARB			glUniform2fvARB;
pfglUniform3fvARB			glUniform3fvARB;
pfglUniform4fvARB			glUniform4fvARB;
pfglUniform1ivARB			glUniform1ivARB;
pfglUniform2ivARB			glUniform2ivARB;
pfglUniform3ivARB			glUniform3ivARB;
pfglUniform4ivARB			glUniform4ivARB;
pfglUniformMatrix2fvARB			glUniformMatrix2fvARB;
pfglUniformMatrix3fvARB			glUniformMatrix3fvARB;
pfglUniformMatrix4fvARB			glUniformMatrix4fvARB;
pfglGetObjectParameterfvARB		glGetObjectParameterfvARB;
pfglGetObjectParameterivARB		glGetObjectParameterivARB;
pfglGetInfoLogARB			glGetInfoLogARB;
pfglGetAttachedObjectsARB		glGetAttachedObjectsARB;
pfglGetUniformLocationARB		glGetUniformLocationARB;
pfglGetActiveUniformARB			glGetActiveUniformARB;
pfglGetUniformfvARB			glGetUniformfvARB;
pfglGetUniformivARB			glGetUniformivARB;
pfglGetShaderSourceARB			glGetShaderSourceARB;

// 31 - GL_ARB_vertex_shader
typedef void function(GLhandleARB, uint, GLcharARB*) pfglBindAttribLocationARB;
typedef void function(GLhandleARB, uint, GLsizei, GLsizei*, GLint*, GLenum*, GLcharARB*) pfglGetActiveAttribARB;
typedef GLint function(GLhandleARB, GLcharARB*) pfglGetAttribLocationARB;

pfglBindAttribLocationARB		glBindAttribLocationARB;
pfglGetActiveAttribARB			glGetActiveAttribARB;
pfglGetAttribLocationARB		glGetAttribLocationARB;

// 37 - GL_ARB_draw_buffers
typedef void function(GLsizei, GLenum*) pfglDrawBuffersARB;

pfglDrawBuffersARB			glDrawBuffersARB;

// 39 - GL_ARB_color_buffer_float
typedef void function(GLenum, GLenum) pfglClampColorARB;

pfglClampColorARB			glClampColorARB;

/*
 * Non-ARB Extensions
 */
// 2 - GL_EXT_blend_color
typedef void function(GLclampf, GLclampf, GLclampf, GLclampf) pfglBlendColorEXT;

pfglBlendColorEXT			glBlendColorEXT;

// 3 - GL_EXT_polygon_offset
typedef void function(GLfloat, GLfloat) pfglPolygonOffsetEXT;

pfglPolygonOffsetEXT			glPolygonOffsetEXT;

// 6 - GL_EXT_texture3D
typedef void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, void*) pfglTexImage3DEXT;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, void*) pfglTexSubImage3DEXT;

pfglTexImage3DEXT			glTexImage3DEXT;
pfglTexSubImage3DEXT			glTexSubImage3DEXT;

// 7 - GL_SGIS_texture_filter4
typedef void function(GLenum, GLenum, GLfloat*) pfglGetTexFilterFuncSGIS;
typedef void function(GLenum, GLenum, GLsizei, GLfloat*) pfglTexFilterFuncSGIS;

pfglGetTexFilterFuncSGIS		glGetTexFilterFuncSGIS;
pfglTexFilterFuncSGIS			glTexFilterFuncSGIS;

// 9 - GL_EXT_subtexture
typedef void function(GLenum, GLint, GLint, GLsizei, GLenum, GLenum, void*) pfglTexSubImage1DEXT;
typedef void function(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, void*) pfglTexSubImage2DEXT;

pfglTexSubImage1DEXT			glTexSubImage1DEXT;
pfglTexSubImage2DEXT			glTexSubImage2DEXT;

// 10 - GL_EXT_copy_texture
typedef void function(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint) pfglCopyTexImage1DEXT;
typedef void function(GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint) pfglCopyTexImage2DEXT;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLsizei) pfglCopyTexSubImage1DEXT;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) pfglCopyTexSubImage2DEXT;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) pfglCopyTexSubImage3DEXT;

pfglCopyTexImage1DEXT			glCopyTexImage1DEXT;
pfglCopyTexImage2DEXT			glCopyTexImage2DEXT;
pfglCopyTexSubImage1DEXT		glCopyTexSubImage1DEXT;
pfglCopyTexSubImage2DEXT		glCopyTexSubImage2DEXT;
pfglCopyTexSubImage3DEXT		glCopyTexSubImage3DEXT;

// 11 - GL_EXT_histogram
typedef void function(GLenum, GLboolean, GLenum, GLenum, void*) pfglGetHistogramEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetHistogramParameterfvEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetHistogramParameterivEXT;
typedef void function(GLenum, GLboolean, GLenum, GLenum, void*) pfglGetMinmaxEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetMinmaxParameterfvEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetMinmaxParameterivEXT;
typedef void function(GLenum, GLsizei, GLenum, GLboolean) pfglHistogramEXT;
typedef void function(GLenum, GLenum, GLboolean) pfglMinmaxEXT;
typedef void function(GLenum) pfglResetHistogramEXT;
typedef void function(GLenum) pfglResetMinmaxEXT;

pfglGetHistogramEXT			glGetHistogramEXT;
pfglGetHistogramParameterfvEXT		glGetHistogramParameterfvEXT;
pfglGetHistogramParameterivEXT		glGetHistogramParameterivEXT;
pfglGetMinmaxEXT			glGetMinmaxEXT;
pfglGetMinmaxParameterfvEXT		glGetMinmaxParameterfvEXT;
pfglGetMinmaxParameterivEXT		glGetMinmaxParameterivEXT;
pfglHistogramEXT			glHistogramEXT;
pfglMinmaxEXT				glMinmaxEXT;
pfglResetHistogramEXT			glResetHistogramEXT;
pfglResetMinmaxEXT			glResetMinmaxEXT;

// 12 - GL_EXT_convolution
typedef void function(GLenum, GLenum, GLsizei, GLenum, GLenum, void*) pfglConvolutionFilter1DEXT;
typedef void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, void*) pfglConvolutionFilter2DEXT;
typedef void function(GLenum, GLenum, GLfloat) pfglConvolutionParameterfEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglConvolutionParameterfvEXT;
typedef void function(GLenum, GLenum, GLint) pfglConvolutionParameteriEXT;
typedef void function(GLenum, GLenum, GLint*) pfglConvolutionParameterivEXT;
typedef void function(GLenum, GLenum, GLint, GLint, GLsizei) pfglCopyConvolutionFilter1DEXT;
typedef void function(GLenum, GLenum, GLint, GLint, GLsizei, GLsizei) pfglCopyConvolutionFilter2DEXT;
typedef void function(GLenum, GLenum, GLenum, void*) pfglGetConvolutionFilterEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetConvolutionParameterfvEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetConvolutionParameterivEXT;
typedef void function(GLenum, GLenum, GLenum, void*, void*, void*) pfglGetSeparableFilterEXT;
typedef void function(GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, void*, void*) pfglSeparableFilter2DEXT;

pfglConvolutionFilter1DEXT		glConvolutionFilter1DEXT;
pfglConvolutionFilter2DEXT		glConvolutionFilter2DEXT;
pfglConvolutionParameterfEXT		glConvolutionParameterfEXT;
pfglConvolutionParameterfvEXT		glConvolutionParameterfvEXT;
pfglConvolutionParameteriEXT		glConvolutionParameteriEXT;
pfglConvolutionParameterivEXT		glConvolutionParameterivEXT;
pfglCopyConvolutionFilter1DEXT		glCopyConvolutionFilter1DEXT;
pfglCopyConvolutionFilter2DEXT		glCopyConvolutionFilter2DEXT;
pfglGetConvolutionFilterEXT		glGetConvolutionFilterEXT;
pfglGetConvolutionParameterfvEXT	glGetConvolutionParameterfvEXT;
pfglGetConvolutionParameterivEXT	glGetConvolutionParameterivEXT;
pfglGetSeparableFilterEXT		glGetSeparableFilterEXT;
pfglSeparableFilter2DEXT		glSeparableFilter2DEXT;

// 14 - GL_SGI_color_table
typedef void function(GLenum, GLenum, GLsizei, GLenum, GLenum, void*) pfglColorTableSGI;
typedef void function(GLenum, GLenum, GLfloat*) pfglColorTableParameterfvSGI;
typedef void function(GLenum, GLenum, GLint*) pfglColorTableParameterivSGI;
typedef void function(GLenum, GLenum, GLint, GLint, GLsizei) pfglCopyColorTableSGI;
typedef void function(GLenum, GLenum, GLenum, void*) pfglGetColorTableSGI;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetColorTableParameterfvSGI;
typedef void function(GLenum, GLenum, GLint*) pfglGetColorTableParameterivSGI;

pfglColorTableSGI			glColorTableSGI;
pfglColorTableParameterfvSGI		glColorTableParameterfvSGI;
pfglColorTableParameterivSGI		glColorTableParameterivSGI;
pfglCopyColorTableSGI			glCopyColorTableSGI;
pfglGetColorTableSGI			glGetColorTableSGI;
pfglGetColorTableParameterfvSGI		glGetColorTableParameterfvSGI;
pfglGetColorTableParameterivSGI		glGetColorTableParameterivSGI;

// 15 - GL_SGIS_pixel_texture
typedef void function(GLenum, GLint) pfglPixelTexGenParameteriSGIS;
typedef void function(GLenum, GLint*) pfglPixelTexGenParameterivSGIS;
typedef void function(GLenum, GLfloat) pfglPixelTexGenParameterfSGIS;
typedef void function(GLenum, GLfloat*) pfglPixelTexGenParameterfvSGIS;
typedef void function(GLenum, GLint*) pfglGetPixelTexGenParameterivSGIS;
typedef void function(GLenum, GLfloat*) pfglGetPixelTexGenParameterfvSGIS;

pfglPixelTexGenParameteriSGIS		glPixelTexGenParameteriSGIS;
pfglPixelTexGenParameterivSGIS		glPixelTexGenParameterivSGIS;
pfglPixelTexGenParameterfSGIS		glPixelTexGenParameterfSGIS;
pfglPixelTexGenParameterfvSGIS		glPixelTexGenParameterfvSGIS;
pfglGetPixelTexGenParameterivSGIS	glGetPixelTexGenParameterivSGIS;
pfglGetPixelTexGenParameterfvSGIS	glGetPixelTexGenParameterfvSGIS;

// 15a - GL_SGIX_pixel_texture
typedef void function(GLenum) pfglPixelTexGenSGIX;

pfglPixelTexGenSGIX			glPixelTexGenSGIX;

// 16 - GL_SGIS_texture4D
typedef void function(GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, void*) pfglTexImage4DSGIS;
typedef void function(GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLsizei, GLenum, GLenum, void*) pfglTexSubImage4DSGIS;

pfglTexImage4DSGIS			glTexImage4DSGIS;
pfglTexSubImage4DSGIS			glTexSubImage4DSGIS;

// 20 - GL_EXT_texture_object
typedef GLboolean function(GLsizei, uint*, GLboolean*) pfglAreTexturesResidentEXT;
typedef void function(GLenum, uint) pfglBindTextureEXT;
typedef void function(GLsizei, uint*) pfglDeleteTexturesEXT;
typedef void function(GLsizei, uint*) pfglGenTexturesEXT;
typedef GLboolean function(uint) pfglIsTextureEXT;
typedef void function(GLsizei, uint*, GLclampf*) pfglPrioritizeTexturesEXT;

pfglAreTexturesResidentEXT		glAreTexturesResidentEXT;
pfglBindTextureEXT			glBindTextureEXT;
pfglDeleteTexturesEXT			glDeleteTexturesEXT;
pfglGenTexturesEXT			glGenTexturesEXT;
pfglIsTextureEXT			glIsTextureEXT;
pfglPrioritizeTexturesEXT		glPrioritizeTexturesEXT;

// 21 - GL_SGIS_detail_texture
typedef void function(GLenum, GLsizei, GLfloat*) pfglDetailTexFuncSGIS;
typedef void function(GLenum, GLfloat*) pfglGetDetailTexFuncSGIS;

pfglDetailTexFuncSGIS			glDetailTexFuncSGIS;
pfglGetDetailTexFuncSGIS		glGetDetailTexFuncSGIS;

// 22 - GL_SGIS_sharpen_texture
typedef void function(GLenum, GLsizei, GLfloat*) pfglSharpenTexFuncSGIS;
typedef void function(GLenum, GLfloat*) pfglGetSharpenTexFuncSGIS;

pfglSharpenTexFuncSGIS			glSharpenTexFuncSGIS;
pfglGetSharpenTexFuncSGIS		glGetSharpenTexFuncSGIS;

// 25 - GL_SGIS_multisample
typedef void function(GLclampf, GLboolean) pfglSampleMaskSGIS;
typedef void function(GLenum) pfglSamplePatternSGIS;

pfglSampleMaskSGIS			glSampleMaskSGIS;
pfglSamplePatternSGIS			glSamplePatternSGIS;

// 30 - GL_EXT_vertex_array
typedef void function(GLint) pfglArrayElementEXT;
typedef void function(GLint, GLenum, GLsizei, GLsizei, void*) pfglColorPointerEXT;
typedef void function(GLenum, GLint, GLsizei) pfglDrawArraysEXT;
typedef void function(GLsizei, GLsizei, GLboolean*) pfglEdgeFlagPointerEXT;
typedef void function(GLenum, void**) pfglGetPointervEXT;
typedef void function(GLenum, GLsizei, GLsizei, void*) pfglIndexPointerEXT;
typedef void function(GLenum, GLsizei, GLsizei, void*) pfglNormalPointerEXT;
typedef void function(GLint, GLenum, GLsizei, GLsizei, void*) pfglTexCoordPointerEXT;
typedef void function(GLint, GLenum, GLsizei, GLsizei, void*) pfglVertexPointerEXT;

pfglArrayElementEXT			glArrayElementEXT;
pfglColorPointerEXT			glColorPointerEXT;
pfglDrawArraysEXT			glDrawArraysEXT;
pfglEdgeFlagPointerEXT			glEdgeFlagPointerEXT;
pfglGetPointervEXT			glGetPointervEXT;
pfglIndexPointerEXT			glIndexPointerEXT;
pfglNormalPointerEXT			glNormalPointerEXT;
pfglTexCoordPointerEXT			glTexCoordPointerEXT;
pfglVertexPointerEXT			glVertexPointerEXT;

// 37 - GL_EXT_blend_minmax
typedef void function(GLenum) pfglBlendEquationEXT;

pfglBlendEquationEXT			glBlendEquationEXT;

// 52 - GL_SGIX_sprite
typedef void function(GLenum, GLfloat) pfglSpriteParameterfSGIX;
typedef void function(GLenum, GLfloat*) pfglSpriteParameterfvSGIX;
typedef void function(GLenum, GLint) pfglSpriteParameteriSGIX;
typedef void function(GLenum, GLint*) pfglSpriteParameterivSGIX;

pfglSpriteParameterfSGIX		glSpriteParameterfSGIX;
pfglSpriteParameterfvSGIX		glSpriteParameterfvSGIX;
pfglSpriteParameteriSGIX		glSpriteParameteriSGIX;
pfglSpriteParameterivSGIX		glSpriteParameterivSGIX;

// 54 - GL_EXT_point_parameters
typedef void function(GLenum, GLfloat) pfglPointParameterfEXT;
typedef void function(GLenum, GLfloat*) pfglPointParameterfvEXT;

pfglPointParameterfEXT			glPointParameterfEXT;
pfglPointParameterfvEXT			glPointParameterfvEXT;

// ? - GL_SGIS_point_parameters
typedef void function(GLenum, GLfloat) pfglPointParameterfSGIS;
typedef void function(GLenum, GLfloat*) pfglPointParameterfvSGIS;

pfglPointParameterfSGIS			glPointParameterfSGIS;
pfglPointParameterfvSGIS		glPointParameterfvSGIS;

// 55 - GL_SGIX_instruments
typedef GLint function() pfglGetInstrumentsSGIX;
typedef void function(GLsizei, GLint*) pfglInstrumentsBufferSGIX;
typedef GLint function(GLint*) pfglPollInstrumentsSGIX;
typedef void function(GLint) pfglReadInstrumentsSGIX;
typedef void function() pfglStartInstrumentsSGIX;
typedef void function(GLint) pfglStopInstrumentsSGIX;

pfglGetInstrumentsSGIX			glGetInstrumentsSGIX;
pfglInstrumentsBufferSGIX		glInstrumentsBufferSGIX;
pfglPollInstrumentsSGIX			glPollInstrumentsSGIX;
pfglReadInstrumentsSGIX			glReadInstrumentsSGIX;
pfglStartInstrumentsSGIX		glStartInstrumentsSGIX;
pfglStopInstrumentsSGIX			glStopInstrumentsSGIX;

// 57 - GL_SGIX_framezoom
typedef void function(GLint) pfglFrameZoomSGIX;

pfglFrameZoomSGIX			glFrameZoomSGIX;

// 58 - GL_SGIX_tag_sample_buffer
typedef void function() pfglTagSampleBufferSGIX;

pfglTagSampleBufferSGIX			glTagSampleBufferSGIX;

// ? - GL_SGIX_polynomial_ffd
typedef void function(GLenum, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble, GLint, GLint, GLdouble*) pfglDeformationMap3dSGIX;
typedef void function(GLenum, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, GLfloat, GLfloat, GLint, GLint, GLfloat*) pfglDeformationMap3fSGIX;
typedef void function(GLbitfield) pfglDeformSGIX;
typedef void function(GLbitfield) pfglLoadIdentityDeformationMapSGIX;

pfglDeformationMap3dSGIX		glDeformationMap3dSGIX;
pfglDeformationMap3fSGIX		glDeformationMap3fSGIX;
pfglDeformSGIX				glDeformSGIX;
pfglLoadIdentityDeformationMapSGIX	glLoadIdentityDeformationMapSGIX;

// 60 - GL_SGIX_reference_plane
typedef void function(GLdouble*) pfglReferencePlaneSGIX;

pfglReferencePlaneSGIX			glReferencePlaneSGIX;

// 61 - GL_SGIX_flush_raster
typedef void function() pfglFlushRasterSGIX;

pfglFlushRasterSGIX			glFlushRasterSGIX;

// 64 - GL_SGIS_fog_function
typedef void function(GLsizei, GLfloat*) pfglFogFuncSGIS;
typedef void function(GLfloat*) pfglGetFogFuncSGIS;

pfglFogFuncSGIS				glFogFuncSGIS;
pfglGetFogFuncSGIS			glGetFogFuncSGIS;

// 66 - GL_HP_image_transform
typedef void function(GLenum, GLenum, GLint) pfglImageTransformParameteriHP;
typedef void function(GLenum, GLenum, GLfloat) pfglImageTransformParameterfHP;
typedef void function(GLenum, GLenum, GLint*) pfglImageTransformParameterivHP;
typedef void function(GLenum, GLenum, GLfloat*) pfglImageTransformParameterfvHP;
typedef void function(GLenum, GLenum, GLint*) pfglGetImageTransformParameterivHP;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetImageTransformParameterfvHP;

pfglImageTransformParameteriHP		glImageTransformParameteriHP;
pfglImageTransformParameterfHP		glImageTransformParameterfHP;
pfglImageTransformParameterivHP		glImageTransformParameterivHP;
pfglImageTransformParameterfvHP		glImageTransformParameterfvHP;
pfglGetImageTransformParameterivHP	glGetImageTransformParameterivHP;
pfglGetImageTransformParameterfvHP	glGetImageTransformParameterfvHP;

// 74 - GL_EXT_color_subtable
typedef void function(GLenum, GLsizei, GLsizei, GLenum, GLenum, void*) pfglColorSubTableEXT;
typedef void function(GLenum, GLsizei, GLint, GLint, GLsizei) pfglCopyColorSubTableEXT;

pfglColorSubTableEXT			glColorSubTableEXT;
pfglCopyColorSubTableEXT		glCopyColorSubTableEXT;

// 77 - GL_PGI_misc_hints
typedef void function(GLenum, GLint) pfglHintPGI;

pfglHintPGI				glHintPGI;

// 78 - GL_EXT_paletted_texture
typedef void function(GLenum, GLenum, GLsizei, GLenum, GLenum, void*) pfglColorTableEXT;
typedef void function(GLenum, GLenum, GLenum, void*) pfglGetColorTableEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetColorTableParameterivEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetColorTableParameterfvEXT;

pfglColorTableEXT			glColorTableEXT;
pfglGetColorTableEXT			glGetColorTableEXT;
pfglGetColorTableParameterivEXT		glGetColorTableParameterivEXT;
pfglGetColorTableParameterfvEXT		glGetColorTableParameterfvEXT;

// 80 - GL_SGIX_list_priority
typedef void function(uint, GLenum, GLfloat*) pfglGetListParameterfvSGIX;
typedef void function(uint, GLenum, GLint*) pfglGetListParameterivSGIX;
typedef void function(uint, GLenum, GLfloat) pfglListParameterfSGIX;
typedef void function(uint, GLenum, GLfloat*) pfglListParameterfvSGIX;
typedef void function(uint, GLenum, GLint) pfglListParameteriSGIX;
typedef void function(uint, GLenum, GLint*) pfglListParameterivSGIX;

pfglGetListParameterfvSGIX		glGetListParameterfvSGIX;
pfglGetListParameterivSGIX		glGetListParameterivSGIX;
pfglListParameterfSGIX			glListParameterfSGIX;
pfglListParameterfvSGIX			glListParameterfvSGIX;
pfglListParameteriSGIX			glListParameteriSGIX;
pfglListParameterivSGIX			glListParameterivSGIX;

// 94 - GL_EXT_index_material
typedef void function(GLenum, GLenum) pfglIndexMaterialEXT;

pfglIndexMaterialEXT			glIndexMaterialEXT;

// 95 - GL_EXT_index_func
typedef void function(GLenum, GLclampf) pfglIndexFuncEXT;

pfglIndexFuncEXT			glIndexFuncEXT;

// 97 - GL_EXT_compiled_vertex_array
typedef void function(GLint, GLsizei) pfglLockArraysEXT;
typedef void function() pfglUnlockArraysEXT;

pfglLockArraysEXT			glLockArraysEXT;
pfglUnlockArraysEXT			glUnlockArraysEXT;

// 98 - GL_EXT_cull_vertex
typedef void function(GLenum, GLdouble*) pfglCullParameterdvEXT;
typedef void function(GLenum, GLfloat*) pfglCullParameterfvEXT;

pfglCullParameterdvEXT			glCullParameterdvEXT;
pfglCullParameterfvEXT			glCullParameterfvEXT;

// 102 - GL_SGIX_fragment_lighting
typedef void function(GLenum, GLenum) pfglFragmentColorMaterialSGIX;
typedef void function(GLenum, GLenum, GLfloat) pfglFragmentLightfSGIX;
typedef void function(GLenum, GLenum, GLfloat*) pfglFragmentLightfvSGIX;
typedef void function(GLenum, GLenum, GLint) pfglFragmentLightiSGIX;
typedef void function(GLenum, GLenum, GLint*) pfglFragmentLightivSGIX;
typedef void function(GLenum, GLfloat) pfglFragmentLightModelfSGIX;
typedef void function(GLenum, GLfloat*) pfglFragmentLightModelfvSGIX;
typedef void function(GLenum, GLint) pfglFragmentLightModeliSGIX;
typedef void function(GLenum, GLint*) pfglFragmentLightModelivSGIX;
typedef void function(GLenum, GLenum, GLfloat) pfglFragmentMaterialfSGIX;
typedef void function(GLenum, GLenum, GLfloat*) pfglFragmentMaterialfvSGIX;
typedef void function(GLenum, GLenum, GLint) pfglFragmentMaterialiSGIX;
typedef void function(GLenum, GLenum, GLint*) pfglFragmentMaterialivSGIX;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetFragmentLightfvSGIX;
typedef void function(GLenum, GLenum, GLint*) pfglGetFragmentLightivSGIX;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetFragmentMaterialfvSGIX;
typedef void function(GLenum, GLenum, GLint*) pfglGetFragmentMaterialivSGIX;
typedef void function(GLenum, GLint) pfglLightEnviSGIX;

pfglFragmentColorMaterialSGIX		glFragmentColorMaterialSGIX;
pfglFragmentLightfSGIX			glFragmentLightfSGIX;
pfglFragmentLightfvSGIX			glFragmentLightfvSGIX;
pfglFragmentLightiSGIX			glFragmentLightiSGIX;
pfglFragmentLightivSGIX			glFragmentLightivSGIX;
pfglFragmentLightModelfSGIX		glFragmentLightModelfSGIX;
pfglFragmentLightModelfvSGIX		glFragmentLightModelfvSGIX;
pfglFragmentLightModeliSGIX		glFragmentLightModeliSGIX;
pfglFragmentLightModelivSGIX		glFragmentLightModelivSGIX;
pfglFragmentMaterialfSGIX		glFragmentMaterialfSGIX;
pfglFragmentMaterialfvSGIX		glFragmentMaterialfvSGIX;
pfglFragmentMaterialiSGIX		glFragmentMaterialiSGIX;
pfglFragmentMaterialivSGIX		glFragmentMaterialivSGIX;
pfglGetFragmentLightfvSGIX		glGetFragmentLightfvSGIX;
pfglGetFragmentLightivSGIX		glGetFragmentLightivSGIX;
pfglGetFragmentMaterialfvSGIX		glGetFragmentMaterialfvSGIX;
pfglGetFragmentMaterialivSGIX		glGetFragmentMaterialivSGIX;
pfglLightEnviSGIX			glLightEnviSGIX;

// 112 - GL_EXT_draw_range_elements
typedef void function(GLenum, uint, uint, GLsizei, GLenum, void*) pfglDrawRangeElementsEXT;

pfglDrawRangeElementsEXT		glDrawRangeElementsEXT;

// 117 - GL_EXT_light_texture
typedef void function(GLenum) pfglApplyTextureEXT;
typedef void function(GLenum) pfglTextureLightEXT;
typedef void function(GLenum, GLenum) pfglTextureMaterialEXT;

pfglApplyTextureEXT			glApplyTextureEXT;
pfglTextureLightEXT			glTextureLightEXT;
pfglTextureMaterialEXT			glTextureMaterialEXT;

// 132 - GL_SGIX_async
typedef void function(uint) pfglAsyncMarkerSGIX;
typedef GLint function(uint*) pfglFinishAsyncSGIX;
typedef GLint function(uint*) pfglPollAsyncSGIX;
typedef uint function(GLsizei) pfglGenAsyncMarkersSGIX;
typedef void function(uint, GLsizei) pfglDeleteAsyncMarkersSGIX;
typedef GLboolean function(uint) pfglIsAsyncMarkerSGIX;

pfglAsyncMarkerSGIX			glAsyncMarkerSGIX;
pfglFinishAsyncSGIX			glFinishAsyncSGIX;
pfglPollAsyncSGIX			glPollAsyncSGIX;
pfglGenAsyncMarkersSGIX			glGenAsyncMarkersSGIX;
pfglDeleteAsyncMarkersSGIX		glDeleteAsyncMarkersSGIX;
pfglIsAsyncMarkerSGIX			glIsAsyncMarkerSGIX;

// 136 - GL_INTEL_parallel_arrays
typedef void function(GLint, GLenum, void**) pfglVertexPointervINTEL;
typedef void function(GLenum, void**) pfglNormalPointervINTEL;
typedef void function(GLint, GLenum, void**) pfglColorPointervINTEL;
typedef void function(GLint, GLenum, void**) pfglTexCoordPointervINTEL;

pfglVertexPointervINTEL			glVertexPointervINTEL;
pfglNormalPointervINTEL			glNormalPointervINTEL;
pfglColorPointervINTEL			glColorPointervINTEL;
pfglTexCoordPointervINTEL		glTexCoordPointervINTEL;

// 138 - GL_EXT_pixel_transform
typedef void function(GLenum, GLenum, GLint) pfglPixelTransformParameteriEXT;
typedef void function(GLenum, GLenum, GLfloat) pfglPixelTransformParameterfEXT;
typedef void function(GLenum, GLenum, GLint*) pfglPixelTransformParameterivEXT;
typedef void function(GLenum, GLenum, GLfloat*) pfglPixelTransformParameterfvEXT;

pfglPixelTransformParameteriEXT		glPixelTransformParameteriEXT;
pfglPixelTransformParameterfEXT		glPixelTransformParameterfEXT;
pfglPixelTransformParameterivEXT	glPixelTransformParameterivEXT;
pfglPixelTransformParameterfvEXT	glPixelTransformParameterfvEXT;

// 145 - GL_EXT_secondary_color
typedef void function(GLbyte, GLbyte, GLbyte) pfglSecondaryColor3bEXT;
typedef void function(GLbyte*) pfglSecondaryColor3bvEXT;
typedef void function(GLdouble, GLdouble, GLdouble) pfglSecondaryColor3dEXT;
typedef void function(GLdouble*) pfglSecondaryColor3dvEXT;
typedef void function(GLfloat, GLfloat, GLfloat) pfglSecondaryColor3fEXT;
typedef void function(GLfloat*) pfglSecondaryColor3fvEXT;
typedef void function(GLint, GLint, GLint) pfglSecondaryColor3iEXT;
typedef void function(GLint*) pfglSecondaryColor3ivEXT;
typedef void function(GLshort, GLshort, GLshort) pfglSecondaryColor3sEXT;
typedef void function(GLshort*) pfglSecondaryColor3svEXT;
typedef void function(GLubyte, GLubyte, GLubyte) pfglSecondaryColor3ubEXT;
typedef void function(GLubyte*) pfglSecondaryColor3ubvEXT;
typedef void function(uint, uint, uint) pfglSecondaryColor3uiEXT;
typedef void function(uint*) pfglSecondaryColor3uivEXT;
typedef void function(GLushort, GLushort, GLushort) pfglSecondaryColor3usEXT;
typedef void function(GLushort*) pfglSecondaryColor3usvEXT;
typedef void function(GLint, GLenum, GLsizei, void*) pfglSecondaryColorPointerEXT;

pfglSecondaryColor3bEXT			glSecondaryColor3bEXT;
pfglSecondaryColor3bvEXT		glSecondaryColor3bvEXT;
pfglSecondaryColor3dEXT			glSecondaryColor3dEXT;
pfglSecondaryColor3dvEXT		glSecondaryColor3dvEXT;
pfglSecondaryColor3fEXT			glSecondaryColor3fEXT;
pfglSecondaryColor3fvEXT		glSecondaryColor3fvEXT;
pfglSecondaryColor3iEXT			glSecondaryColor3iEXT;
pfglSecondaryColor3ivEXT		glSecondaryColor3ivEXT;
pfglSecondaryColor3sEXT			glSecondaryColor3sEXT;
pfglSecondaryColor3svEXT		glSecondaryColor3svEXT;
pfglSecondaryColor3ubEXT		glSecondaryColor3ubEXT;
pfglSecondaryColor3ubvEXT		glSecondaryColor3ubvEXT;
pfglSecondaryColor3uiEXT		glSecondaryColor3uiEXT;
pfglSecondaryColor3uivEXT		glSecondaryColor3uivEXT;
pfglSecondaryColor3usEXT		glSecondaryColor3usEXT;
pfglSecondaryColor3usvEXT		glSecondaryColor3usvEXT;
pfglSecondaryColorPointerEXT		glSecondaryColorPointerEXT;

// 147 - GL_EXT_texture_perturb_normal
typedef void function(GLenum) pfglTextureNormalEXT;

pfglTextureNormalEXT			glTextureNormalEXT;

// 148 - GL_EXT_multi_draw_arrays
typedef void function(GLenum, GLint*, GLsizei*, GLsizei) pfglMultiDrawArraysEXT;
typedef void function(GLenum, GLsizei*, GLenum, void**, GLsizei) pfglMultiDrawElementsEXT;

pfglMultiDrawArraysEXT			glMultiDrawArraysEXT;
pfglMultiDrawElementsEXT		glMultiDrawElementsEXT;

// 149 - GL_EXT_fog_coord
typedef void function(GLfloat) pfglFogCoordfEXT;
typedef void function(GLfloat*) pfglFogCoordfvEXT;
typedef void function(GLdouble) pfglFogCoorddEXT;
typedef void function(GLdouble*) pfglFogCoorddvEXT;
typedef void function(GLenum, GLsizei, void*) pfglFogCoordPointerEXT;

pfglFogCoordfEXT			glFogCoordfEXT;
pfglFogCoordfvEXT			glFogCoordfvEXT;
pfglFogCoorddEXT			glFogCoorddEXT;
pfglFogCoorddvEXT			glFogCoorddvEXT;
pfglFogCoordPointerEXT			glFogCoordPointerEXT;

// 156 - GL_EXT_coordinate_frame
typedef void function(GLbyte, GLbyte, GLbyte) pfglTangent3bEXT;
typedef void function(GLbyte*) pfglTangent3bvEXT;
typedef void function(GLdouble, GLdouble, GLdouble) pfglTangent3dEXT;
typedef void function(GLdouble*) pfglTangent3dvEXT;
typedef void function(GLfloat, GLfloat, GLfloat) pfglTangent3fEXT;
typedef void function(GLfloat*) pfglTangent3fvEXT;
typedef void function(GLint, GLint, GLint) pfglTangent3iEXT;
typedef void function(GLint*) pfglTangent3ivEXT;
typedef void function(GLshort, GLshort, GLshort) pfglTangent3sEXT;
typedef void function(GLshort*) pfglTangent3svEXT;
typedef void function(GLbyte, GLbyte, GLbyte) pfglBinormal3bEXT;
typedef void function(GLbyte*) pfglBinormal3bvEXT;
typedef void function(GLdouble, GLdouble, GLdouble) pfglBinormal3dEXT;
typedef void function(GLdouble*) pfglBinormal3dvEXT;
typedef void function(GLfloat, GLfloat, GLfloat) pfglBinormal3fEXT;
typedef void function(GLfloat*) pfglBinormal3fvEXT;
typedef void function(GLint, GLint, GLint) pfglBinormal3iEXT;
typedef void function(GLint*) pfglBinormal3ivEXT;
typedef void function(GLshort, GLshort, GLshort) pfglBinormal3sEXT;
typedef void function(GLshort*) pfglBinormal3svEXT;
typedef void function(GLenum, GLsizei, void*) pfglTangentPointerEXT;
typedef void function(GLenum, GLsizei, void*) pfglBinormalPointerEXT;

pfglTangent3bEXT			glTangent3bEXT;
pfglTangent3bvEXT			glTangent3bvEXT;
pfglTangent3dEXT			glTangent3dEXT;
pfglTangent3dvEXT			glTangent3dvEXT;
pfglTangent3fEXT			glTangent3fEXT;
pfglTangent3fvEXT			glTangent3fvEXT;
pfglTangent3iEXT			glTangent3iEXT;
pfglTangent3ivEXT			glTangent3ivEXT;
pfglTangent3sEXT			glTangent3sEXT;
pfglTangent3svEXT			glTangent3svEXT;
pfglBinormal3bEXT			glBinormal3bEXT;
pfglBinormal3bvEXT			glBinormal3bvEXT;
pfglBinormal3dEXT			glBinormal3dEXT;
pfglBinormal3dvEXT			glBinormal3dvEXT;
pfglBinormal3fEXT			glBinormal3fEXT;
pfglBinormal3fvEXT			glBinormal3fvEXT;
pfglBinormal3iEXT			glBinormal3iEXT;
pfglBinormal3ivEXT			glBinormal3ivEXT;
pfglBinormal3sEXT			glBinormal3sEXT;
pfglBinormal3svEXT			glBinormal3svEXT;
pfglTangentPointerEXT			glTangentPointerEXT;
pfglBinormalPointerEXT			glBinormalPointerEXT;

// 163 - GL_SUNX_constant_data
typedef void function() pfglFinishTextureSUNX;

pfglFinishTextureSUNX			glFinishTextureSUNX;

// 164 - GL_SUN_global_alpha
typedef void function(GLbyte) pfglGlobalAlphaFactorbSUN;
typedef void function(GLshort) pfglGlobalAlphaFactorsSUN;
typedef void function(GLint) pfglGlobalAlphaFactoriSUN;
typedef void function(GLfloat) pfglGlobalAlphaFactorfSUN;
typedef void function(GLdouble) pfglGlobalAlphaFactordSUN;
typedef void function(GLubyte) pfglGlobalAlphaFactorubSUN;
typedef void function(GLushort) pfglGlobalAlphaFactorusSUN;
typedef void function(uint) pfglGlobalAlphaFactoruiSUN;

pfglGlobalAlphaFactorbSUN		glGlobalAlphaFactorbSUN;
pfglGlobalAlphaFactorsSUN		glGlobalAlphaFactorsSUN;
pfglGlobalAlphaFactoriSUN		glGlobalAlphaFactoriSUN;
pfglGlobalAlphaFactorfSUN		glGlobalAlphaFactorfSUN;
pfglGlobalAlphaFactordSUN		glGlobalAlphaFactordSUN;
pfglGlobalAlphaFactorubSUN		glGlobalAlphaFactorubSUN;
pfglGlobalAlphaFactorusSUN		glGlobalAlphaFactorusSUN;
pfglGlobalAlphaFactoruiSUN		glGlobalAlphaFactoruiSUN;

// 165 - GL_SUN_triangle_list
typedef void function(uint) pfglReplacementCodeuiSUN;
typedef void function(GLushort) pfglReplacementCodeusSUN;
typedef void function(GLubyte) pfglReplacementCodeubSUN;
typedef void function(uint*) pfglReplacementCodeuivSUN;
typedef void function(GLushort*) pfglReplacementCodeusvSUN;
typedef void function(GLubyte*) pfglReplacementCodeubvSUN;
typedef void function(GLenum, GLsizei, void**) pfglReplacementCodePointerSUN;

pfglReplacementCodeuiSUN		glReplacementCodeuiSUN;
pfglReplacementCodeusSUN		glReplacementCodeusSUN;
pfglReplacementCodeubSUN		glReplacementCodeubSUN;
pfglReplacementCodeuivSUN		glReplacementCodeuivSUN;
pfglReplacementCodeusvSUN		glReplacementCodeusvSUN;
pfglReplacementCodeubvSUN		glReplacementCodeubvSUN;
pfglReplacementCodePointerSUN		glReplacementCodePointerSUN;

// 166 - GL_SUN_vertex
typedef void function(GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat) pfglColor4ubVertex2fSUN;
typedef void function(GLubyte*, GLfloat*) pfglColor4ubVertex2fvSUN;
typedef void function(GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat) pfglColor4ubVertex3fSUN;
typedef void function(GLubyte*, GLfloat*) pfglColor4ubVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglColor3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*) pfglColor3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglNormal3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*) pfglNormal3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglColor4fNormal3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*, GLfloat*) pfglColor4fNormal3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord2fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*) pfglTexCoord2fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord4fVertex4fSUN;
typedef void function(GLfloat*, GLfloat*) pfglTexCoord4fVertex4fvSUN;
typedef void function(GLfloat, GLfloat, GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat) pfglTexCoord2fColor4ubVertex3fSUN;
typedef void function(GLfloat*, GLubyte*, GLfloat*) pfglTexCoord2fColor4ubVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord2fColor3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*, GLfloat*) pfglTexCoord2fColor3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord2fNormal3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*, GLfloat*) pfglTexCoord2fNormal3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord2fColor4fNormal3fVertex3fSUN;
typedef void function(GLfloat*, GLfloat*, GLfloat*, GLfloat*) pfglTexCoord2fColor4fNormal3fVertex3fvSUN;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglTexCoord4fColor4fNormal3fVertex4fSUN;
typedef void function(GLfloat*, GLfloat*, GLfloat*, GLfloat*) pfglTexCoord4fColor4fNormal3fVertex4fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiVertex3fSUN;
typedef void function(uint*, GLfloat*) pfglReplacementCodeuiVertex3fvSUN;
typedef void function(uint, GLubyte, GLubyte, GLubyte, GLubyte, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiColor4ubVertex3fSUN;
typedef void function(uint*, GLubyte*, GLfloat*) pfglReplacementCodeuiColor4ubVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiColor3fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*) pfglReplacementCodeuiColor3fVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiNormal3fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*) pfglReplacementCodeuiNormal3fVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiColor4fNormal3fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*, GLfloat*) pfglReplacementCodeuiColor4fNormal3fVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiTexCoord2fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*) pfglReplacementCodeuiTexCoord2fVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiTexCoord2fNormal3fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*, GLfloat*) pfglReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN;
typedef void function(uint*, GLfloat*, GLfloat*, GLfloat*, GLfloat*) pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN;

pfglColor4ubVertex2fSUN			glColor4ubVertex2fSUN;
pfglColor4ubVertex2fvSUN		glColor4ubVertex2fvSUN;
pfglColor4ubVertex3fSUN			glColor4ubVertex3fSUN;
pfglColor4ubVertex3fvSUN		glColor4ubVertex3fvSUN;
pfglColor3fVertex3fSUN			glColor3fVertex3fSUN;
pfglColor3fVertex3fvSUN			glColor3fVertex3fvSUN;
pfglNormal3fVertex3fSUN			glNormal3fVertex3fSUN;
pfglNormal3fVertex3fvSUN		glNormal3fVertex3fvSUN;
pfglColor4fNormal3fVertex3fSUN		glColor4fNormal3fVertex3fSUN;
pfglColor4fNormal3fVertex3fvSUN		glColor4fNormal3fVertex3fvSUN;
pfglTexCoord2fVertex3fSUN		glTexCoord2fVertex3fSUN;
pfglTexCoord2fVertex3fvSUN		glTexCoord2fVertex3fvSUN;
pfglTexCoord4fVertex4fSUN		glTexCoord4fVertex4fSUN;
pfglTexCoord4fVertex4fvSUN		glTexCoord4fVertex4fvSUN;
pfglTexCoord2fColor4ubVertex3fSUN	glTexCoord2fColor4ubVertex3fSUN;
pfglTexCoord2fColor4ubVertex3fvSUN	glTexCoord2fColor4ubVertex3fvSUN;
pfglTexCoord2fColor3fVertex3fSUN	glTexCoord2fColor3fVertex3fSUN;
pfglTexCoord2fColor3fVertex3fvSUN	glTexCoord2fColor3fVertex3fvSUN;
pfglTexCoord2fNormal3fVertex3fSUN	glTexCoord2fNormal3fVertex3fSUN;
pfglTexCoord2fNormal3fVertex3fvSUN	glTexCoord2fNormal3fVertex3fvSUN;
pfglTexCoord2fColor4fNormal3fVertex3fSUN glTexCoord2fColor4fNormal3fVertex3fSUN;
pfglTexCoord2fColor4fNormal3fVertex3fvSUN glTexCoord2fColor4fNormal3fVertex3fvSUN;
pfglTexCoord4fColor4fNormal3fVertex4fSUN glTexCoord4fColor4fNormal3fVertex4fSUN;
pfglTexCoord4fColor4fNormal3fVertex4fvSUN glTexCoord4fColor4fNormal3fVertex4fvSUN;
pfglReplacementCodeuiVertex3fSUN	glReplacementCodeuiVertex3fSUN;
pfglReplacementCodeuiVertex3fvSUN	glReplacementCodeuiVertex3fvSUN;
pfglReplacementCodeuiColor4ubVertex3fSUN glReplacementCodeuiColor4ubVertex3fSUN;
pfglReplacementCodeuiColor4ubVertex3fvSUN glReplacementCodeuiColor4ubVertex3fvSUN;
pfglReplacementCodeuiColor3fVertex3fSUN	glReplacementCodeuiColor3fVertex3fSUN;
pfglReplacementCodeuiColor3fVertex3fvSUN glReplacementCodeuiColor3fVertex3fvSUN;
pfglReplacementCodeuiNormal3fVertex3fSUN glReplacementCodeuiNormal3fVertex3fSUN;
pfglReplacementCodeuiNormal3fVertex3fvSUN glReplacementCodeuiNormal3fVertex3fvSUN;
pfglReplacementCodeuiColor4fNormal3fVertex3fSUN glReplacementCodeuiColor4fNormal3fVertex3fSUN;
pfglReplacementCodeuiColor4fNormal3fVertex3fvSUN glReplacementCodeuiColor4fNormal3fVertex3fvSUN;
pfglReplacementCodeuiTexCoord2fVertex3fSUN glReplacementCodeuiTexCoord2fVertex3fSUN;
pfglReplacementCodeuiTexCoord2fVertex3fvSUN glReplacementCodeuiTexCoord2fVertex3fvSUN;
pfglReplacementCodeuiTexCoord2fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN;
pfglReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN;
pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN;
pfglReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN;

// 173 - GL_EXT_blend_func_separate
typedef void function(GLenum, GLenum, GLenum, GLenum) pfglBlendFuncSeparateEXT;

pfglBlendFuncSeparateEXT		glBlendFuncSeparateEXT;

// ? - GL_INGR_blend_func_separate
typedef void function(GLenum, GLenum, GLenum, GLenum) pfglBlendFuncSeparateINGR;

pfglBlendFuncSeparateINGR		glBlendFuncSeparateINGR;

// 188 - GL_EXT_vertex_weighting
typedef void function(GLfloat) pfglVertexWeightfEXT;
typedef void function(GLfloat*) pfglVertexWeightfvEXT;
typedef void function(GLsizei, GLenum, GLsizei, void*) pfglVertexWeightPointerEXT;

pfglVertexWeightfEXT			glVertexWeightfEXT;
pfglVertexWeightfvEXT			glVertexWeightfvEXT;
pfglVertexWeightPointerEXT		glVertexWeightPointerEXT;

// 190 - GL_NV_vertex_array_range
typedef void function() pfglFlushVertexArrayRangeNV;
typedef void function(GLsizei, void*) pfglVertexArrayRangeNV;

pfglFlushVertexArrayRangeNV		glFlushVertexArrayRangeNV;
pfglVertexArrayRangeNV			glVertexArrayRangeNV;

// 191 - GL_NV_register_combiners
typedef void function(GLenum, GLfloat*) pfglCombinerParameterfvNV;
typedef void function(GLenum, GLfloat) pfglCombinerParameterfNV;
typedef void function(GLenum, GLint*) pfglCombinerParameterivNV;
typedef void function(GLenum, GLint) pfglCombinerParameteriNV;
typedef void function(GLenum, GLenum, GLenum, GLenum, GLenum, GLenum) pfglCombinerInputNV;
typedef void function(GLenum, GLenum, GLenum, GLenum, GLenum, GLenum, GLenum, GLboolean, GLboolean, GLboolean) pfglCombinerOutputNV;
typedef void function(GLenum, GLenum, GLenum, GLenum) pfglFinalCombinerInputNV;
typedef void function(GLenum, GLenum, GLenum, GLenum, GLfloat*) pfglGetCombinerInputParameterfvNV;
typedef void function(GLenum, GLenum, GLenum, GLenum, GLint*) pfglGetCombinerInputParameterivNV;
typedef void function(GLenum, GLenum, GLenum, GLfloat*) pfglGetCombinerOutputParameterfvNV;
typedef void function(GLenum, GLenum, GLenum, GLint*) pfglGetCombinerOutputParameterivNV;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetFinalCombinerInputParameterfvNV;
typedef void function(GLenum, GLenum, GLint*) pfglGetFinalCombinerInputParameterivNV;

pfglCombinerParameterfvNV		glCombinerParameterfvNV;
pfglCombinerParameterfNV		glCombinerParameterfNV;
pfglCombinerParameterivNV		glCombinerParameterivNV;
pfglCombinerParameteriNV		glCombinerParameteriNV;
pfglCombinerInputNV			glCombinerInputNV;
pfglCombinerOutputNV			glCombinerOutputNV;
pfglFinalCombinerInputNV		glFinalCombinerInputNV;
pfglGetCombinerInputParameterfvNV	glGetCombinerInputParameterfvNV;
pfglGetCombinerInputParameterivNV	glGetCombinerInputParameterivNV;
pfglGetCombinerOutputParameterfvNV	glGetCombinerOutputParameterfvNV;
pfglGetCombinerOutputParameterivNV	glGetCombinerOutputParameterivNV;
pfglGetFinalCombinerInputParameterfvNV	glGetFinalCombinerInputParameterfvNV;
pfglGetFinalCombinerInputParameterivNV	glGetFinalCombinerInputParameterivNV;

// 196 - GL_MESA_resize_buffers
typedef void function() pfglResizeBuffersMESA;

pfglResizeBuffersMESA		glResizeBuffersMESA;

// 197 - GL_MESA_window_pos
typedef void function(GLdouble, GLdouble) pfglWindowPos2dMESA;
typedef void function(GLdouble*) pfglWindowPos2dvMESA;
typedef void function(GLfloat, GLfloat) pfglWindowPos2fMESA;
typedef void function(GLfloat*) pfglWindowPos2fvMESA;
typedef void function(GLint, GLint) pfglWindowPos2iMESA;
typedef void function(GLint*) pfglWindowPos2ivMESA;
typedef void function(GLshort, GLshort) pfglWindowPos2sMESA;
typedef void function(GLshort*) pfglWindowPos2svMESA;
typedef void function(GLdouble, GLdouble, GLdouble) pfglWindowPos3dMESA;
typedef void function(GLdouble*) pfglWindowPos3dvMESA;
typedef void function(GLfloat, GLfloat, GLfloat) pfglWindowPos3fMESA;
typedef void function(GLfloat*) pfglWindowPos3fvMESA;
typedef void function(GLint, GLint, GLint) pfglWindowPos3iMESA;
typedef void function(GLint*) pfglWindowPos3ivMESA;
typedef void function(GLshort, GLshort, GLshort) pfglWindowPos3sMESA;
typedef void function(GLshort*) pfglWindowPos3svMESA;
typedef void function(GLdouble, GLdouble, GLdouble, GLdouble) pfglWindowPos4dMESA;
typedef void function(GLdouble*) pfglWindowPos4dvMESA;
typedef void function(GLfloat, GLfloat, GLfloat, GLfloat) pfglWindowPos4fMESA;
typedef void function(GLfloat*) pfglWindowPos4fvMESA;
typedef void function(GLint, GLint, GLint, GLint) pfglWindowPos4iMESA;
typedef void function(GLint*) pfglWindowPos4ivMESA;
typedef void function(GLshort, GLshort, GLshort, GLshort) pfglWindowPos4sMESA;
typedef void function(GLshort*) pfglWindowPos4svMESA;

pfglWindowPos2dMESA			glWindowPos2dMESA;
pfglWindowPos2dvMESA			glWindowPos2dvMESA;
pfglWindowPos2fMESA			glWindowPos2fMESA;
pfglWindowPos2fvMESA			glWindowPos2fvMESA;
pfglWindowPos2iMESA			glWindowPos2iMESA;
pfglWindowPos2ivMESA			glWindowPos2ivMESA;
pfglWindowPos2sMESA			glWindowPos2sMESA;
pfglWindowPos2svMESA			glWindowPos2svMESA;
pfglWindowPos3dMESA			glWindowPos3dMESA;
pfglWindowPos3dvMESA			glWindowPos3dvMESA;
pfglWindowPos3fMESA			glWindowPos3fMESA;
pfglWindowPos3fvMESA			glWindowPos3fvMESA;
pfglWindowPos3iMESA			glWindowPos3iMESA;
pfglWindowPos3ivMESA			glWindowPos3ivMESA;
pfglWindowPos3sMESA			glWindowPos3sMESA;
pfglWindowPos3svMESA			glWindowPos3svMESA;
pfglWindowPos4dMESA			glWindowPos4dMESA;
pfglWindowPos4dvMESA			glWindowPos4dvMESA;
pfglWindowPos4fMESA			glWindowPos4fMESA;
pfglWindowPos4fvMESA			glWindowPos4fvMESA;
pfglWindowPos4iMESA			glWindowPos4iMESA;
pfglWindowPos4ivMESA			glWindowPos4ivMESA;
pfglWindowPos4sMESA			glWindowPos4sMESA;
pfglWindowPos4svMESA			glWindowPos4svMESA;

// 200 - GL_IBM_multimode_draw_arrays
typedef void function(GLenum*, GLint*, GLsizei*, GLsizei, GLint) pfglMultiModeDrawArraysIBM;
typedef void function(GLenum*, GLsizei*, GLenum, void**, GLsizei, GLint) pfglMultiModeDrawElementsIBM;

pfglMultiModeDrawArraysIBM		glMultiModeDrawArraysIBM;
pfglMultiModeDrawElementsIBM		glMultiModeDrawElementsIBM;

// 201 - GL_IBM_vertex_array_lists
typedef void function(GLint, GLenum, GLint, void**, GLint) pfglColorPointerListIBM;
typedef void function(GLint, GLenum, GLint, void**, GLint) pfglSecondaryColorPointerListIBM;
typedef void function(GLint, GLboolean**, GLint) pfglEdgeFlagPointerListIBM;
typedef void function(GLenum, GLint, void**, GLint) pfglFogCoordPointerListIBM;
typedef void function(GLenum, GLint, void**, GLint) pfglIndexPointerListIBM;
typedef void function(GLenum, GLint, void**, GLint) pfglNormalPointerListIBM;
typedef void function(GLint, GLenum, GLint, void**, GLint) pfglTexCoordPointerListIBM;
typedef void function(GLint, GLenum, GLint, void**, GLint) pfglVertexPointerListIBM;

pfglColorPointerListIBM			glColorPointerListIBM;
pfglSecondaryColorPointerListIBM	glSecondaryColorPointerListIBM;
pfglEdgeFlagPointerListIBM		glEdgeFlagPointerListIBM;
pfglFogCoordPointerListIBM		glFogCoordPointerListIBM;
pfglIndexPointerListIBM			glIndexPointerListIBM;
pfglNormalPointerListIBM		glNormalPointerListIBM;
pfglTexCoordPointerListIBM		glTexCoordPointerListIBM;
pfglVertexPointerListIBM		glVertexPointerListIBM;

// 208 - GL_3DFX_tbuffer
typedef void function(uint) pfglTbufferMask3DFX;

pfglTbufferMask3DFX			glTbufferMask3DFX;

// 209 - GL_EXT_multisample
typedef void function(GLclampf, GLboolean) pfglSampleMaskEXT;
typedef void function(GLenum) pfglSamplePatternEXT;

pfglSampleMaskEXT			glSampleMaskEXT;
pfglSamplePatternEXT			glSamplePatternEXT;

// 214 - GL_SGIS_texture_color_mask
typedef void function(GLboolean, GLboolean, GLboolean, GLboolean) pfglTextureColorMaskSGIS;

pfglTextureColorMaskSGIS		glTextureColorMaskSGIS;

// ? - GL_SGIX_igloo_interface
typedef void function(GLenum, void*) pfglIglooInterfaceSGIX;

pfglIglooInterfaceSGIX			glIglooInterfaceSGIX;

// 222 - GL_NV_fence
typedef void function(GLsizei, uint*) pfglDeleteFencesNV;
typedef void function(GLsizei, uint*) pfglGenFencesNV;
typedef GLboolean function(uint) pfglIsFenceNV;
typedef GLboolean function(uint) pfglTestFenceNV;
typedef void function(uint, GLenum, GLint*) pfglGetFenceivNV;
typedef void function(uint) pfglFinishFenceNV;
typedef void function(uint, GLenum) pfglSetFenceNV;

pfglDeleteFencesNV			glDeleteFencesNV;
pfglGenFencesNV				glGenFencesNV;
pfglIsFenceNV				glIsFenceNV;
pfglTestFenceNV				glTestFenceNV;
pfglGetFenceivNV			glGetFenceivNV;
pfglFinishFenceNV			glFinishFenceNV;
pfglSetFenceNV				glSetFenceNV;

// 225 - GL_NV_evaluators
typedef void function(GLenum, uint, GLenum, GLsizei, GLsizei, GLint, GLint, GLboolean, void*) pfglMapControlPointsNV;
typedef void function(GLenum, GLenum, GLint*) pfglMapParameterivNV;
typedef void function(GLenum, GLenum, GLfloat*) pfglMapParameterfvNV;
typedef void function(GLenum, uint, GLenum, GLsizei, GLsizei, GLboolean, void*) pfglGetMapControlPointsNV;
typedef void function(GLenum, GLenum, GLint*) pfglGetMapParameterivNV;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetMapParameterfvNV;
typedef void function(GLenum, uint, GLenum, GLint*) pfglGetMapAttribParameterivNV;
typedef void function(GLenum, uint, GLenum, GLfloat*) pfglGetMapAttribParameterfvNV;
typedef void function(GLenum, GLenum) pfglEvalMapsNV;

pfglMapControlPointsNV			glMapControlPointsNV;
pfglMapParameterivNV			glMapParameterivNV;
pfglMapParameterfvNV			glMapParameterfvNV;
pfglGetMapControlPointsNV		glGetMapControlPointsNV;
pfglGetMapParameterivNV			glGetMapParameterivNV;
pfglGetMapParameterfvNV			glGetMapParameterfvNV;
pfglGetMapAttribParameterivNV		glGetMapAttribParameterivNV;
pfglGetMapAttribParameterfvNV		glGetMapAttribParameterfvNV;
pfglEvalMapsNV				glEvalMapsNV;

// 227 - GL_NV_register_combiners2
typedef void function(GLenum, GLenum, GLfloat*) pfglCombinerStageParameterfvNV;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetCombinerStageParameterfvNV;

pfglCombinerStageParameterfvNV		glCombinerStageParameterfvNV;
pfglGetCombinerStageParameterfvNV	glGetCombinerStageParameterfvNV;

// 233 - GL_NV_vertex_program
typedef GLboolean function(GLsizei, uint*, GLboolean*) pfglAreProgramsResidentNV;
typedef void function(GLenum, uint) pfglBindProgramNV;
typedef void function(GLsizei, uint*) pfglDeleteProgramsNV;
typedef void function(GLenum, uint, GLfloat*) pfglExecuteProgramNV;
typedef void function(GLsizei, uint*) pfglGenProgramsNV;
typedef void function(GLenum, uint, GLenum, GLdouble*) pfglGetProgramParameterdvNV;
typedef void function(GLenum, uint, GLenum, GLfloat*) pfglGetProgramParameterfvNV;
typedef void function(uint, GLenum, GLint*) pfglGetProgramivNV;
typedef void function(uint, GLenum, GLubyte*) pfglGetProgramStringNV;
typedef void function(GLenum, uint, GLenum, GLint*) pfglGetTrackMatrixivNV;
typedef void function(uint, GLenum, GLdouble*) pfglGetVertexAttribdvNV;
typedef void function(uint, GLenum, GLfloat*) pfglGetVertexAttribfvNV;
typedef void function(uint, GLenum, GLint*) pfglGetVertexAttribivNV;
typedef void function(uint, GLenum, void**) pfglGetVertexAttribPointervNV;
typedef GLboolean function(uint) pfglIsProgramNV;
typedef void function(GLenum, uint, GLsizei, GLubyte*) pfglLoadProgramNV;
typedef void function(GLenum, uint, GLdouble, GLdouble, GLdouble, GLdouble) pfglProgramParameter4dNV;
typedef void function(GLenum, uint, GLdouble*) pfglProgramParameter4dvNV;
typedef void function(GLenum, uint, GLfloat, GLfloat, GLfloat, GLfloat) pfglProgramParameter4fNV;
typedef void function(GLenum, uint, GLfloat*) pfglProgramParameter4fvNV;
typedef void function(GLenum, uint, uint, GLdouble*) pfglProgramParameters4dvNV;
typedef void function(GLenum, uint, uint, GLfloat*) pfglProgramParameters4fvNV;
typedef void function(GLsizei, uint*) pfglRequestResidentProgramsNV;
typedef void function(GLenum, uint, GLenum, GLenum) pfglTrackMatrixNV;
typedef void function(uint, GLint, GLenum, GLsizei, void*) pfglVertexAttribPointerNV;
typedef void function(uint, GLdouble) pfglVertexAttrib1dNV;
typedef void function(uint, GLdouble*) pfglVertexAttrib1dvNV;
typedef void function(uint, GLfloat) pfglVertexAttrib1fNV;
typedef void function(uint, GLfloat*) pfglVertexAttrib1fvNV;
typedef void function(uint, GLshort) pfglVertexAttrib1sNV;
typedef void function(uint, GLshort*) pfglVertexAttrib1svNV;
typedef void function(uint, GLdouble, GLdouble) pfglVertexAttrib2dNV;
typedef void function(uint, GLdouble*) pfglVertexAttrib2dvNV;
typedef void function(uint, GLfloat, GLfloat) pfglVertexAttrib2fNV;
typedef void function(uint, GLfloat*) pfglVertexAttrib2fvNV;
typedef void function(uint, GLshort, GLshort) pfglVertexAttrib2sNV;
typedef void function(uint, GLshort*) pfglVertexAttrib2svNV;
typedef void function(uint, GLdouble, GLdouble, GLdouble) pfglVertexAttrib3dNV;
typedef void function(uint, GLdouble*) pfglVertexAttrib3dvNV;
typedef void function(uint, GLfloat, GLfloat, GLfloat) pfglVertexAttrib3fNV;
typedef void function(uint, GLfloat*) pfglVertexAttrib3fvNV;
typedef void function(uint, GLshort, GLshort, GLshort) pfglVertexAttrib3sNV;
typedef void function(uint, GLshort*) pfglVertexAttrib3svNV;
typedef void function(uint, GLdouble, GLdouble, GLdouble, GLdouble) pfglVertexAttrib4dNV;
typedef void function(uint, GLdouble*) pfglVertexAttrib4dvNV;
typedef void function(uint, GLfloat, GLfloat, GLfloat, GLfloat) pfglVertexAttrib4fNV;
typedef void function(uint, GLfloat*) pfglVertexAttrib4fvNV;
typedef void function(uint, GLshort, GLshort, GLshort, GLshort) pfglVertexAttrib4sNV;
typedef void function(uint, GLshort*) pfglVertexAttrib4svNV;
typedef void function(uint, GLubyte, GLubyte, GLubyte, GLubyte) pfglVertexAttrib4ubNV;
typedef void function(uint, GLubyte*) pfglVertexAttrib4ubvNV;
typedef void function(uint, GLsizei, GLdouble*) pfglVertexAttribs1dvNV;
typedef void function(uint, GLsizei, GLfloat*) pfglVertexAttribs1fvNV;
typedef void function(uint, GLsizei, GLshort*) pfglVertexAttribs1svNV;
typedef void function(uint, GLsizei, GLdouble*) pfglVertexAttribs2dvNV;
typedef void function(uint, GLsizei, GLfloat*) pfglVertexAttribs2fvNV;
typedef void function(uint, GLsizei, GLshort*) pfglVertexAttribs2svNV;
typedef void function(uint, GLsizei, GLdouble*) pfglVertexAttribs3dvNV;
typedef void function(uint, GLsizei, GLfloat*) pfglVertexAttribs3fvNV;
typedef void function(uint, GLsizei, GLshort*) pfglVertexAttribs3svNV;
typedef void function(uint, GLsizei, GLdouble*) pfglVertexAttribs4dvNV;
typedef void function(uint, GLsizei, GLfloat*) pfglVertexAttribs4fvNV;
typedef void function(uint, GLsizei, GLshort*) pfglVertexAttribs4svNV;
typedef void function(uint, GLsizei, GLubyte*) pfglVertexAttribs4ubvNV;

pfglAreProgramsResidentNV		glAreProgramsResidentNV;
pfglBindProgramNV			glBindProgramNV;
pfglDeleteProgramsNV			glDeleteProgramsNV;
pfglExecuteProgramNV			glExecuteProgramNV;
pfglGenProgramsNV			glGenProgramsNV;
pfglGetProgramParameterdvNV		glGetProgramParameterdvNV;
pfglGetProgramParameterfvNV		glGetProgramParameterfvNV;
pfglGetProgramivNV			glGetProgramivNV;
pfglGetProgramStringNV			glGetProgramStringNV;
pfglGetTrackMatrixivNV			glGetTrackMatrixivNV;
pfglGetVertexAttribdvNV			glGetVertexAttribdvNV;
pfglGetVertexAttribfvNV			glGetVertexAttribfvNV;
pfglGetVertexAttribivNV			glGetVertexAttribivNV;
pfglGetVertexAttribPointervNV		glGetVertexAttribPointervNV;
pfglIsProgramNV				glIsProgramNV;
pfglLoadProgramNV			glLoadProgramNV;
pfglProgramParameter4dNV		glProgramParameter4dNV;
pfglProgramParameter4dvNV		glProgramParameter4dvNV;
pfglProgramParameter4fNV		glProgramParameter4fNV;
pfglProgramParameter4fvNV		glProgramParameter4fvNV;
pfglProgramParameters4dvNV		glProgramParameters4dvNV;
pfglProgramParameters4fvNV		glProgramParameters4fvNV;
pfglRequestResidentProgramsNV		glRequestResidentProgramsNV;
pfglTrackMatrixNV			glTrackMatrixNV;
pfglVertexAttribPointerNV		glVertexAttribPointerNV;
pfglVertexAttrib1dNV			glVertexAttrib1dNV;
pfglVertexAttrib1dvNV			glVertexAttrib1dvNV;
pfglVertexAttrib1fNV			glVertexAttrib1fNV;
pfglVertexAttrib1fvNV			glVertexAttrib1fvNV;
pfglVertexAttrib1sNV			glVertexAttrib1sNV;
pfglVertexAttrib1svNV			glVertexAttrib1svNV;
pfglVertexAttrib2dNV			glVertexAttrib2dNV;
pfglVertexAttrib2dvNV			glVertexAttrib2dvNV;
pfglVertexAttrib2fNV			glVertexAttrib2fNV;
pfglVertexAttrib2fvNV			glVertexAttrib2fvNV;
pfglVertexAttrib2sNV			glVertexAttrib2sNV;
pfglVertexAttrib2svNV			glVertexAttrib2svNV;
pfglVertexAttrib3dNV			glVertexAttrib3dNV;
pfglVertexAttrib3dvNV			glVertexAttrib3dvNV;
pfglVertexAttrib3fNV			glVertexAttrib3fNV;
pfglVertexAttrib3fvNV			glVertexAttrib3fvNV;
pfglVertexAttrib3sNV			glVertexAttrib3sNV;
pfglVertexAttrib3svNV			glVertexAttrib3svNV;
pfglVertexAttrib4dNV			glVertexAttrib4dNV;
pfglVertexAttrib4dvNV			glVertexAttrib4dvNV;
pfglVertexAttrib4fNV			glVertexAttrib4fNV;
pfglVertexAttrib4fvNV			glVertexAttrib4fvNV;
pfglVertexAttrib4sNV			glVertexAttrib4sNV;
pfglVertexAttrib4svNV			glVertexAttrib4svNV;
pfglVertexAttrib4ubNV			glVertexAttrib4ubNV;
pfglVertexAttrib4ubvNV			glVertexAttrib4ubvNV;
pfglVertexAttribs1dvNV			glVertexAttribs1dvNV;
pfglVertexAttribs1fvNV			glVertexAttribs1fvNV;
pfglVertexAttribs1svNV			glVertexAttribs1svNV;
pfglVertexAttribs2dvNV			glVertexAttribs2dvNV;
pfglVertexAttribs2fvNV			glVertexAttribs2fvNV;
pfglVertexAttribs2svNV			glVertexAttribs2svNV;
pfglVertexAttribs3dvNV			glVertexAttribs3dvNV;
pfglVertexAttribs3fvNV			glVertexAttribs3fvNV;
pfglVertexAttribs3svNV			glVertexAttribs3svNV;
pfglVertexAttribs4dvNV			glVertexAttribs4dvNV;
pfglVertexAttribs4fvNV			glVertexAttribs4fvNV;
pfglVertexAttribs4svNV			glVertexAttribs4svNV;
pfglVertexAttribs4ubvNV			glVertexAttribs4ubvNV;

// 244 - GL_ATI_envmap_bumpmap
typedef void function(GLenum, GLint*) pfglTexBumpParameterivATI;
typedef void function(GLenum, GLfloat*) pfglTexBumpParameterfvATI;
typedef void function(GLenum, GLint*) pfglGetTexBumpParameterivATI;
typedef void function(GLenum, GLfloat*) pfglGetTexBumpParameterfvATI;

pfglTexBumpParameterivATI		glTexBumpParameterivATI;
pfglTexBumpParameterfvATI		glTexBumpParameterfvATI;
pfglGetTexBumpParameterivATI		glGetTexBumpParameterivATI;
pfglGetTexBumpParameterfvATI		glGetTexBumpParameterfvATI;

// 245 - GL_ATI_fragment_shader
typedef uint function(uint) pfglGenFragmentShadersATI;
typedef void function(uint) pfglBindFragmentShaderATI;
typedef void function(uint) pfglDeleteFragmentShaderATI;
typedef void function() pfglBeginFragmentShaderATI;
typedef void function() pfglEndFragmentShaderATI;
typedef void function(uint, uint, GLenum) pfglPassTexCoordATI;
typedef void function(uint, uint, GLenum) pfglSampleMapATI;
typedef void function(GLenum, uint, uint, uint, uint, uint, uint) pfglColorFragmentOp1ATI;
typedef void function(GLenum, uint, uint, uint, uint, uint, uint, uint, uint, uint) pfglColorFragmentOp2ATI;
typedef void function(GLenum, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) pfglColorFragmentOp3ATI;
typedef void function(GLenum, uint, uint, uint, uint, uint) pfglAlphaFragmentOp1ATI;
typedef void function(GLenum, uint, uint, uint, uint, uint, uint, uint, uint) pfglAlphaFragmentOp2ATI;
typedef void function(GLenum, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) pfglAlphaFragmentOp3ATI;
typedef void function(uint, GLfloat*) pfglSetFragmentShaderConstantATI;

pfglGenFragmentShadersATI		glGenFragmentShadersATI;
pfglBindFragmentShaderATI		glBindFragmentShaderATI;
pfglDeleteFragmentShaderATI		glDeleteFragmentShaderATI;
pfglBeginFragmentShaderATI		glBeginFragmentShaderATI;
pfglEndFragmentShaderATI		glEndFragmentShaderATI;
pfglPassTexCoordATI			glPassTexCoordATI;
pfglSampleMapATI			glSampleMapATI;
pfglColorFragmentOp1ATI			glColorFragmentOp1ATI;
pfglColorFragmentOp2ATI			glColorFragmentOp2ATI;
pfglColorFragmentOp3ATI			glColorFragmentOp3ATI;
pfglAlphaFragmentOp1ATI			glAlphaFragmentOp1ATI;
pfglAlphaFragmentOp2ATI			glAlphaFragmentOp2ATI;
pfglAlphaFragmentOp3ATI			glAlphaFragmentOp3ATI;
pfglSetFragmentShaderConstantATI	glSetFragmentShaderConstantATI;

// 246 - GL_ATI_pn_triangles
typedef void function(GLenum, GLint) pfglPNTrianglesiATI;
typedef void function(GLenum, GLfloat) pfglPNTrianglesfATI;

pfglPNTrianglesiATI			glPNTrianglesiATI;
pfglPNTrianglesfATI			glPNTrianglesfATI;

// 247 - GL_ATI_vertex_array_object
typedef uint function(GLsizei, void*, GLenum) pfglNewObjectBufferATI;
typedef GLboolean function(uint) pfglIsObjectBufferATI;
typedef void function(uint, uint, GLsizei, void*, GLenum) pfglUpdateObjectBufferATI;
typedef void function(uint, GLenum, GLfloat*) pfglGetObjectBufferfvATI;
typedef void function(uint, GLenum, GLint*) pfglGetObjectBufferivATI;
typedef void function(uint) pfglFreeObjectBufferATI;
typedef void function(GLenum, GLint, GLenum, GLsizei, uint, uint) pfglArrayObjectATI;
typedef void function(GLenum, GLenum, GLfloat*) pfglGetArrayObjectfvATI;
typedef void function(GLenum, GLenum, GLint*) pfglGetArrayObjectivATI;
typedef void function(uint, GLenum, GLsizei, uint, uint) pfglVariantArrayObjectATI;
typedef void function(uint, GLenum, GLfloat*) pfglGetVariantArrayObjectfvATI;
typedef void function(uint, GLenum, GLint*) pfglGetVariantArrayObjectivATI;

pfglNewObjectBufferATI			glNewObjectBufferATI;
pfglIsObjectBufferATI			glIsObjectBufferATI;
pfglUpdateObjectBufferATI		glUpdateObjectBufferATI;
pfglGetObjectBufferfvATI		glGetObjectBufferfvATI;
pfglGetObjectBufferivATI		glGetObjectBufferivATI;
pfglFreeObjectBufferATI			glFreeObjectBufferATI;
pfglArrayObjectATI			glArrayObjectATI;
pfglGetArrayObjectfvATI			glGetArrayObjectfvATI;
pfglGetArrayObjectivATI			glGetArrayObjectivATI;
pfglVariantArrayObjectATI		glVariantArrayObjectATI;
pfglGetVariantArrayObjectfvATI		glGetVariantArrayObjectfvATI;
pfglGetVariantArrayObjectivATI		glGetVariantArrayObjectivATI;

// 248 - GL_EXT_vertex_shader
typedef void function() pfglBeginVertexShaderEXT;
typedef void function() pfglEndVertexShaderEXT;
typedef void function(uint) pfglBindVertexShaderEXT;
typedef uint function(uint) pfglGenVertexShadersEXT;
typedef void function(uint) pfglDeleteVertexShaderEXT;
typedef void function(GLenum, uint, uint) pfglShaderOp1EXT;
typedef void function(GLenum, uint, uint, uint) pfglShaderOp2EXT;
typedef void function(GLenum, uint, uint, uint, uint) pfglShaderOp3EXT;
typedef void function(uint, uint, GLenum, GLenum, GLenum, GLenum) pfglSwizzleEXT;
typedef void function(uint, uint, GLenum, GLenum, GLenum, GLenum) pfglWriteMaskEXT;
typedef void function(uint, uint, uint) pfglInsertComponentEXT;
typedef void function(uint, uint, uint) pfglExtractComponentEXT;
typedef uint function(GLenum, GLenum, GLenum, uint) pfglGenSymbolsEXT;
typedef void function(uint, GLenum, void*) pfglSetInvariantEXT;
typedef void function(uint, GLenum, void*) pfglSetLocalConstantEXT;
typedef void function(uint, GLbyte*) pfglVariantbvEXT;
typedef void function(uint, GLshort*) pfglVariantsvEXT;
typedef void function(uint, GLint*) pfglVariantivEXT;
typedef void function(uint, GLfloat*) pfglVariantfvEXT;
typedef void function(uint, GLdouble*) pfglVariantdvEXT;
typedef void function(uint, GLubyte*) pfglVariantubvEXT;
typedef void function(uint, GLushort*) pfglVariantusvEXT;
typedef void function(uint, uint*) pfglVariantuivEXT;
typedef void function(uint, GLenum, uint, void*) pfglVariantPointerEXT;
typedef void function(uint) pfglEnableVariantClientStateEXT;
typedef void function(uint) pfglDisableVariantClientStateEXT;
typedef uint function(GLenum, GLenum) pfglBindLightParameterEXT;
typedef uint function(GLenum, GLenum) pfglBindMaterialParameterEXT;
typedef uint function(GLenum, GLenum, GLenum) pfglBindTexGenParameterEXT;
typedef uint function(GLenum, GLenum) pfglBindTextureUnitParameterEXT;
typedef uint function(GLenum) pfglBindParameterEXT;
typedef GLboolean function(uint, GLenum) pfglIsVariantEnabledEXT;
typedef void function(uint, GLenum, GLboolean*) pfglGetVariantBooleanvEXT;
typedef void function(uint, GLenum, GLint*) pfglGetVariantIntegervEXT;
typedef void function(uint, GLenum, GLfloat*) pfglGetVariantFloatvEXT;
typedef void function(uint, GLenum, void**) pfglGetVariantPointervEXT;
typedef void function(uint, GLenum, GLboolean*) pfglGetInvariantBooleanvEXT;
typedef void function(uint, GLenum, GLint*) pfglGetInvariantIntegervEXT;
typedef void function(uint, GLenum, GLfloat*) pfglGetInvariantFloatvEXT;
typedef void function(uint, GLenum, GLboolean*) pfglGetLocalConstantBooleanvEXT;
typedef void function(uint, GLenum, GLint*) pfglGetLocalConstantIntegervEXT;
typedef void function(uint, GLenum, GLfloat*) pfglGetLocalConstantFloatvEXT;

pfglBeginVertexShaderEXT		glBeginVertexShaderEXT;
pfglEndVertexShaderEXT			glEndVertexShaderEXT;
pfglBindVertexShaderEXT			glBindVertexShaderEXT;
pfglGenVertexShadersEXT			glGenVertexShadersEXT;
pfglDeleteVertexShaderEXT		glDeleteVertexShaderEXT;
pfglShaderOp1EXT			glShaderOp1EXT;
pfglShaderOp2EXT			glShaderOp2EXT;
pfglShaderOp3EXT			glShaderOp3EXT;
pfglSwizzleEXT				glSwizzleEXT;
pfglWriteMaskEXT			glWriteMaskEXT;
pfglInsertComponentEXT			glInsertComponentEXT;
pfglExtractComponentEXT			glExtractComponentEXT;
pfglGenSymbolsEXT			glGenSymbolsEXT;
pfglSetInvariantEXT			glSetInvariantEXT;
pfglSetLocalConstantEXT			glSetLocalConstantEXT;
pfglVariantbvEXT			glVariantbvEXT;
pfglVariantsvEXT			glVariantsvEXT;
pfglVariantivEXT			glVariantivEXT;
pfglVariantfvEXT			glVariantfvEXT;
pfglVariantdvEXT			glVariantdvEXT;
pfglVariantubvEXT			glVariantubvEXT;
pfglVariantusvEXT			glVariantusvEXT;
pfglVariantuivEXT			glVariantuivEXT;
pfglVariantPointerEXT			glVariantPointerEXT;
pfglEnableVariantClientStateEXT		glEnableVariantClientStateEXT;
pfglDisableVariantClientStateEXT	glDisableVariantClientStateEXT;
pfglBindLightParameterEXT		glBindLightParameterEXT;
pfglBindMaterialParameterEXT		glBindMaterialParameterEXT;
pfglBindTexGenParameterEXT		glBindTexGenParameterEXT;
pfglBindTextureUnitParameterEXT		glBindTextureUnitParameterEXT;
pfglBindParameterEXT			glBindParameterEXT;
pfglIsVariantEnabledEXT			glIsVariantEnabledEXT;
pfglGetVariantBooleanvEXT		glGetVariantBooleanvEXT;
pfglGetVariantIntegervEXT		glGetVariantIntegervEXT;
pfglGetVariantFloatvEXT			glGetVariantFloatvEXT;
pfglGetVariantPointervEXT		glGetVariantPointervEXT;
pfglGetInvariantBooleanvEXT		glGetInvariantBooleanvEXT;
pfglGetInvariantIntegervEXT		glGetInvariantIntegervEXT;
pfglGetInvariantFloatvEXT		glGetInvariantFloatvEXT;
pfglGetLocalConstantBooleanvEXT		glGetLocalConstantBooleanvEXT;
pfglGetLocalConstantIntegervEXT		glGetLocalConstantIntegervEXT;
pfglGetLocalConstantFloatvEXT		glGetLocalConstantFloatvEXT;

// 249 - GL_ATI_vertex_streams
typedef void function(GLenum, GLshort) pfglVertexStream1sATI;
typedef void function(GLenum, GLshort*) pfglVertexStream1svATI;
typedef void function(GLenum, GLint) pfglVertexStream1iATI;
typedef void function(GLenum, GLint*) pfglVertexStream1ivATI;
typedef void function(GLenum, GLfloat) pfglVertexStream1fATI;
typedef void function(GLenum, GLfloat*) pfglVertexStream1fvATI;
typedef void function(GLenum, GLdouble) pfglVertexStream1dATI;
typedef void function(GLenum, GLdouble*) pfglVertexStream1dvATI;
typedef void function(GLenum, GLshort, GLshort) pfglVertexStream2sATI;
typedef void function(GLenum, GLshort*) pfglVertexStream2svATI;
typedef void function(GLenum, GLint, GLint) pfglVertexStream2iATI;
typedef void function(GLenum, GLint*) pfglVertexStream2ivATI;
typedef void function(GLenum, GLfloat, GLfloat) pfglVertexStream2fATI;
typedef void function(GLenum, GLfloat*) pfglVertexStream2fvATI;
typedef void function(GLenum, GLdouble, GLdouble) pfglVertexStream2dATI;
typedef void function(GLenum, GLdouble*) pfglVertexStream2dvATI;
typedef void function(GLenum, GLshort, GLshort, GLshort) pfglVertexStream3sATI;
typedef void function(GLenum, GLshort*) pfglVertexStream3svATI;
typedef void function(GLenum, GLint, GLint, GLint) pfglVertexStream3iATI;
typedef void function(GLenum, GLint*) pfglVertexStream3ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat) pfglVertexStream3fATI;
typedef void function(GLenum, GLfloat*) pfglVertexStream3fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble) pfglVertexStream3dATI;
typedef void function(GLenum, GLdouble*) pfglVertexStream3dvATI;
typedef void function(GLenum, GLshort, GLshort, GLshort, GLshort) pfglVertexStream4sATI;
typedef void function(GLenum, GLshort*) pfglVertexStream4svATI;
typedef void function(GLenum, GLint, GLint, GLint, GLint) pfglVertexStream4iATI;
typedef void function(GLenum, GLint*) pfglVertexStream4ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat, GLfloat) pfglVertexStream4fATI;
typedef void function(GLenum, GLfloat*) pfglVertexStream4fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble, GLdouble) pfglVertexStream4dATI;
typedef void function(GLenum, GLdouble*) pfglVertexStream4dvATI;
typedef void function(GLenum, GLbyte, GLbyte, GLbyte) pfglNormalStream3bATI;
typedef void function(GLenum, GLbyte*) pfglNormalStream3bvATI;
typedef void function(GLenum, GLshort, GLshort, GLshort) pfglNormalStream3sATI;
typedef void function(GLenum, GLshort*) pfglNormalStream3svATI;
typedef void function(GLenum, GLint, GLint, GLint) pfglNormalStream3iATI;
typedef void function(GLenum, GLint*) pfglNormalStream3ivATI;
typedef void function(GLenum, GLfloat, GLfloat, GLfloat) pfglNormalStream3fATI;
typedef void function(GLenum, GLfloat*) pfglNormalStream3fvATI;
typedef void function(GLenum, GLdouble, GLdouble, GLdouble) pfglNormalStream3dATI;
typedef void function(GLenum, GLdouble*) pfglNormalStream3dvATI;
typedef void function(GLenum) pfglClientActiveVertexStreamATI;
typedef void function(GLenum, GLint) pfglVertexBlendEnviATI;
typedef void function(GLenum, GLfloat) pfglVertexBlendEnvfATI;

pfglVertexStream1sATI			glVertexStream1sATI;
pfglVertexStream1svATI			glVertexStream1svATI;
pfglVertexStream1iATI			glVertexStream1iATI;
pfglVertexStream1ivATI			glVertexStream1ivATI;
pfglVertexStream1fATI			glVertexStream1fATI;
pfglVertexStream1fvATI			glVertexStream1fvATI;
pfglVertexStream1dATI			glVertexStream1dATI;
pfglVertexStream1dvATI			glVertexStream1dvATI;
pfglVertexStream2sATI			glVertexStream2sATI;
pfglVertexStream2svATI			glVertexStream2svATI;
pfglVertexStream2iATI			glVertexStream2iATI;
pfglVertexStream2ivATI			glVertexStream2ivATI;
pfglVertexStream2fATI			glVertexStream2fATI;
pfglVertexStream2fvATI			glVertexStream2fvATI;
pfglVertexStream2dATI			glVertexStream2dATI;
pfglVertexStream2dvATI			glVertexStream2dvATI;
pfglVertexStream3sATI			glVertexStream3sATI;
pfglVertexStream3svATI			glVertexStream3svATI;
pfglVertexStream3iATI			glVertexStream3iATI;
pfglVertexStream3ivATI			glVertexStream3ivATI;
pfglVertexStream3fATI			glVertexStream3fATI;
pfglVertexStream3fvATI			glVertexStream3fvATI;
pfglVertexStream3dATI			glVertexStream3dATI;
pfglVertexStream3dvATI			glVertexStream3dvATI;
pfglVertexStream4sATI			glVertexStream4sATI;
pfglVertexStream4svATI			glVertexStream4svATI;
pfglVertexStream4iATI			glVertexStream4iATI;
pfglVertexStream4ivATI			glVertexStream4ivATI;
pfglVertexStream4fATI			glVertexStream4fATI;
pfglVertexStream4fvATI			glVertexStream4fvATI;
pfglVertexStream4dATI			glVertexStream4dATI;
pfglVertexStream4dvATI			glVertexStream4dvATI;
pfglNormalStream3bATI			glNormalStream3bATI;
pfglNormalStream3bvATI			glNormalStream3bvATI;
pfglNormalStream3sATI			glNormalStream3sATI;
pfglNormalStream3svATI			glNormalStream3svATI;
pfglNormalStream3iATI			glNormalStream3iATI;
pfglNormalStream3ivATI			glNormalStream3ivATI;
pfglNormalStream3fATI			glNormalStream3fATI;
pfglNormalStream3fvATI			glNormalStream3fvATI;
pfglNormalStream3dATI			glNormalStream3dATI;
pfglNormalStream3dvATI			glNormalStream3dvATI;
pfglClientActiveVertexStreamATI		glClientActiveVertexStreamATI;
pfglVertexBlendEnviATI			glVertexBlendEnviATI;
pfglVertexBlendEnvfATI			glVertexBlendEnvfATI;

// 256 - GL_ATI_element_array
typedef void function(GLenum, void*) pfglElementPointerATI;
typedef void function(GLenum, GLsizei) pfglDrawElementArrayATI;
typedef void function(GLenum, uint, uint, GLsizei) pfglDrawRangeElementArrayATI;

pfglElementPointerATI			glElementPointerATI;
pfglDrawElementArrayATI			glDrawElementArrayATI;
pfglDrawRangeElementArrayATI		glDrawRangeElementArrayATI;

// 257 - GL_SUN_mesh_array
typedef void function(GLenum, GLint, GLsizei, GLsizei) pfglDrawMeshArraysSUN;

pfglDrawMeshArraysSUN			glDrawMeshArraysSUN;

// 261 - GL_NV_occlusion_query
typedef void function(GLsizei, uint*) pfglGenOcclusionQueriesNV;
typedef void function(GLsizei, uint*) pfglDeleteOcclusionQueriesNV;
typedef GLboolean function(uint) pfglIsOcclusionQueryNV;
typedef void function(uint) pfglBeginOcclusionQueryNV;
typedef void function() pfglEndOcclusionQueryNV;
typedef void function(uint, GLenum, GLint*) pfglGetOcclusionQueryivNV;
typedef void function(uint, GLenum, uint*) pfglGetOcclusionQueryuivNV;

pfglGenOcclusionQueriesNV		glGenOcclusionQueriesNV;
pfglDeleteOcclusionQueriesNV		glDeleteOcclusionQueriesNV;
pfglIsOcclusionQueryNV			glIsOcclusionQueryNV;
pfglBeginOcclusionQueryNV		glBeginOcclusionQueryNV;
pfglEndOcclusionQueryNV			glEndOcclusionQueryNV;
pfglGetOcclusionQueryivNV		glGetOcclusionQueryivNV;
pfglGetOcclusionQueryuivNV		glGetOcclusionQueryuivNV;

// 262 - GL_NV_point_sprite
typedef void function(GLenum, GLint) pfglPointParameteriNV;
typedef void function(GLenum, GLint*) pfglPointParameterivNV;

pfglPointParameteriNV			glPointParameteriNV;
pfglPointParameterivNV			glPointParameterivNV;

// 268 - GL_EXT_stencil_two_side
typedef void function(GLenum) pfglActiveStencilFaceEXT;

pfglActiveStencilFaceEXT		glActiveStencilFaceEXT;

// 271 - GL_APPLE_element_array
typedef void function(GLenum, void*) pfglElementPointerAPPLE;
typedef void function(GLenum, GLint, GLsizei) pfglDrawElementArrayAPPLE;
typedef void function(GLenum, uint, uint, GLint, GLsizei) pfglDrawRangeElementArrayAPPLE;
typedef void function(GLenum, GLint*, GLsizei*, GLsizei) pfglMultiDrawElementArrayAPPLE;
typedef void function(GLenum, uint, uint, GLint*, GLsizei*, GLsizei) pfglMultiDrawRangeElementArrayAPPLE;

pfglElementPointerAPPLE			glElementPointerAPPLE;
pfglDrawElementArrayAPPLE		glDrawElementArrayAPPLE;
pfglDrawRangeElementArrayAPPLE		glDrawRangeElementArrayAPPLE;
pfglMultiDrawElementArrayAPPLE		glMultiDrawElementArrayAPPLE;
pfglMultiDrawRangeElementArrayAPPLE	glMultiDrawRangeElementArrayAPPLE;

// 272 - GL_APPLE_fence
typedef void function(GLsizei, uint*) pfglGenFencesAPPLE;
typedef void function(GLsizei, uint*) pfglDeleteFencesAPPLE;
typedef void function(uint) pfglSetFenceAPPLE;
typedef GLboolean function(uint) pfglIsFenceAPPLE;
typedef GLboolean function(uint) pfglTestFenceAPPLE;
typedef void function(uint) pfglFinishFenceAPPLE;
typedef GLboolean function(GLenum, uint) pfglTestObjectAPPLE;
typedef void function(GLenum, GLint) pfglFinishObjectAPPLE;

pfglGenFencesAPPLE			glGenFencesAPPLE;
pfglDeleteFencesAPPLE			glDeleteFencesAPPLE;
pfglSetFenceAPPLE			glSetFenceAPPLE;
pfglIsFenceAPPLE			glIsFenceAPPLE;
pfglTestFenceAPPLE			glTestFenceAPPLE;
pfglFinishFenceAPPLE			glFinishFenceAPPLE;
pfglTestObjectAPPLE			glTestObjectAPPLE;
pfglFinishObjectAPPLE			glFinishObjectAPPLE;

// 273 - GL_APPLE_vertex_array_object
typedef void function(uint) pfglBindVertexArrayAPPLE;
typedef void function(GLsizei, uint*) pfglDeleteVertexArraysAPPLE;
typedef void function(GLsizei, uint*) pfglGenVertexArraysAPPLE;
typedef GLboolean function(uint) pfglIsVertexArrayAPPLE;

pfglBindVertexArrayAPPLE		glBindVertexArrayAPPLE;
pfglDeleteVertexArraysAPPLE		glDeleteVertexArraysAPPLE;
pfglGenVertexArraysAPPLE		glGenVertexArraysAPPLE;
pfglIsVertexArrayAPPLE			glIsVertexArrayAPPLE;

// 274 - GL_APPLE_vertex_array_range
typedef void function(GLsizei, void*) pfglVertexArrayRangeAPPLE;
typedef void function(GLsizei, void*) pfglFlushVertexArrayRangeAPPLE;
typedef void function(GLenum, GLint) pfglVertexArrayParameteriAPPLE;

pfglVertexArrayRangeAPPLE		glVertexArrayRangeAPPLE;
pfglFlushVertexArrayRangeAPPLE		glFlushVertexArrayRangeAPPLE;
pfglVertexArrayParameteriAPPLE		glVertexArrayParameteriAPPLE;

// 277 - GL_ATI_draw_buffers
typedef void function(GLsizei, GLenum*) pfglDrawBuffersATI;

pfglDrawBuffersATI			glDrawBuffersATI;

// 282 - GL_NV_fragment_program
typedef void function(uint, GLsizei, GLubyte*, GLfloat, GLfloat, GLfloat, GLfloat) pfglProgramNamedParameter4fNV;
typedef void function(uint, GLsizei, GLubyte*, GLdouble, GLdouble, GLdouble, GLdouble) pfglProgramNamedParameter4dNV;
typedef void function(uint, GLsizei, GLubyte*, GLfloat*) pfglProgramNamedParameter4fvNV;
typedef void function(uint, GLsizei, GLubyte*, GLdouble*) pfglProgramNamedParameter4dvNV;
typedef void function(uint, GLsizei, GLubyte*, GLfloat*) pfglGetProgramNamedParameterfvNV;
typedef void function(uint, GLsizei, GLubyte*, GLdouble*) pfglGetProgramNamedParameterdvNV;

pfglProgramNamedParameter4fNV		glProgramNamedParameter4fNV;
pfglProgramNamedParameter4dNV		glProgramNamedParameter4dNV;
pfglProgramNamedParameter4fvNV		glProgramNamedParameter4fvNV;
pfglProgramNamedParameter4dvNV		glProgramNamedParameter4dvNV;
pfglGetProgramNamedParameterfvNV	glGetProgramNamedParameterfvNV;
pfglGetProgramNamedParameterdvNV	glGetProgramNamedParameterdvNV;

// 283 - GL_NV_half_float
typedef void function(GLhalfNV, GLhalfNV) pfglVertex2hNV;
typedef void function(GLhalfNV*) pfglVertex2hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglVertex3hNV;
typedef void function(GLhalfNV*) pfglVertex3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertex4hNV;
typedef void function(GLhalfNV*) pfglVertex4hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglNormal3hNV;
typedef void function(GLhalfNV*) pfglNormal3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglColor3hNV;
typedef void function(GLhalfNV*) pfglColor3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglColor4hNV;
typedef void function(GLhalfNV*) pfglColor4hvNV;
typedef void function(GLhalfNV) pfglTexCoord1hNV;
typedef void function(GLhalfNV*) pfglTexCoord1hvNV;
typedef void function(GLhalfNV, GLhalfNV) pfglTexCoord2hNV;
typedef void function(GLhalfNV*) pfglTexCoord2hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglTexCoord3hNV;
typedef void function(GLhalfNV*) pfglTexCoord3hvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglTexCoord4hNV;
typedef void function(GLhalfNV*) pfglTexCoord4hvNV;
typedef void function(GLenum, GLhalfNV) pfglMultiTexCoord1hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord1hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV) pfglMultiTexCoord2hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord2hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV, GLhalfNV) pfglMultiTexCoord3hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord3hvNV;
typedef void function(GLenum, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglMultiTexCoord4hNV;
typedef void function(GLenum, GLhalfNV*) pfglMultiTexCoord4hvNV;
typedef void function(GLhalfNV) pfglFogCoordhNV;
typedef void function(GLhalfNV*) pfglFogCoordhvNV;
typedef void function(GLhalfNV, GLhalfNV, GLhalfNV) pfglSecondaryColor3hNV;
typedef void function(GLhalfNV*) pfglSecondaryColor3hvNV;
typedef void function(GLhalfNV) pfglVertexWeighthNV;
typedef void function(GLhalfNV*) pfglVertexWeighthvNV;
typedef void function(uint, GLhalfNV) pfglVertexAttrib1hNV;
typedef void function(uint, GLhalfNV*) pfglVertexAttrib1hvNV;
typedef void function(uint, GLhalfNV, GLhalfNV) pfglVertexAttrib2hNV;
typedef void function(uint, GLhalfNV*) pfglVertexAttrib2hvNV;
typedef void function(uint, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertexAttrib3hNV;
typedef void function(uint, GLhalfNV*) pfglVertexAttrib3hvNV;
typedef void function(uint, GLhalfNV, GLhalfNV, GLhalfNV, GLhalfNV) pfglVertexAttrib4hNV;
typedef void function(uint, GLhalfNV*) pfglVertexAttrib4hvNV;
typedef void function(uint, GLsizei, GLhalfNV*) pfglVertexAttribs1hvNV;
typedef void function(uint, GLsizei, GLhalfNV*) pfglVertexAttribs2hvNV;
typedef void function(uint, GLsizei, GLhalfNV*) pfglVertexAttribs3hvNV;
typedef void function(uint, GLsizei, GLhalfNV*) pfglVertexAttribs4hvNV;

pfglVertex2hNV				glVertex2hNV;
pfglVertex2hvNV				glVertex2hvNV;
pfglVertex3hNV				glVertex3hNV;
pfglVertex3hvNV				glVertex3hvNV;
pfglVertex4hNV				glVertex4hNV;
pfglVertex4hvNV				glVertex4hvNV;
pfglNormal3hNV				glNormal3hNV;
pfglNormal3hvNV				glNormal3hvNV;
pfglColor3hNV				glColor3hNV;
pfglColor3hvNV				glColor3hvNV;
pfglColor4hNV				glColor4hNV;
pfglColor4hvNV				glColor4hvNV;
pfglTexCoord1hNV			glTexCoord1hNV;
pfglTexCoord1hvNV			glTexCoord1hvNV;
pfglTexCoord2hNV			glTexCoord2hNV;
pfglTexCoord2hvNV			glTexCoord2hvNV;
pfglTexCoord3hNV			glTexCoord3hNV;
pfglTexCoord3hvNV			glTexCoord3hvNV;
pfglTexCoord4hNV			glTexCoord4hNV;
pfglTexCoord4hvNV			glTexCoord4hvNV;
pfglMultiTexCoord1hNV			glMultiTexCoord1hNV;
pfglMultiTexCoord1hvNV			glMultiTexCoord1hvNV;
pfglMultiTexCoord2hNV			glMultiTexCoord2hNV;
pfglMultiTexCoord2hvNV			glMultiTexCoord2hvNV;
pfglMultiTexCoord3hNV			glMultiTexCoord3hNV;
pfglMultiTexCoord3hvNV			glMultiTexCoord3hvNV;
pfglMultiTexCoord4hNV			glMultiTexCoord4hNV;
pfglMultiTexCoord4hvNV			glMultiTexCoord4hvNV;
pfglFogCoordhNV				glFogCoordhNV;
pfglFogCoordhvNV			glFogCoordhvNV;
pfglSecondaryColor3hNV			glSecondaryColor3hNV;
pfglSecondaryColor3hvNV			glSecondaryColor3hvNV;
pfglVertexWeighthNV			glVertexWeighthNV;
pfglVertexWeighthvNV			glVertexWeighthvNV;
pfglVertexAttrib2hNV			glVertexAttrib2hNV;
pfglVertexAttrib2hvNV			glVertexAttrib2hvNV;
pfglVertexAttrib1hNV			glVertexAttrib1hNV;
pfglVertexAttrib1hvNV			glVertexAttrib1hvNV;
pfglVertexAttrib3hNV			glVertexAttrib3hNV;
pfglVertexAttrib3hvNV			glVertexAttrib3hvNV;
pfglVertexAttrib4hNV			glVertexAttrib4hNV;
pfglVertexAttrib4hvNV			glVertexAttrib4hvNV;
pfglVertexAttribs1hvNV			glVertexAttribs1hvNV;
pfglVertexAttribs2hvNV			glVertexAttribs2hvNV;
pfglVertexAttribs3hvNV			glVertexAttribs3hvNV;
pfglVertexAttribs4hvNV			glVertexAttribs4hvNV;

// 184 - GL_NV_pixel_data_range
typedef void function(GLenum, GLsizei, void*) pfglPixelDataRangeNV;
typedef void function(GLenum) pfglFlushPixelDataRangeNV;

pfglPixelDataRangeNV			glPixelDataRangeNV;
pfglFlushPixelDataRangeNV		glFlushPixelDataRangeNV;

// 285 - GL_NV_primitive_restart
typedef void function() pfglPrimitiveRestartNV;
typedef void function(uint) pfglPrimitiveRestartIndexNV;

pfglPrimitiveRestartNV			glPrimitiveRestartNV;
pfglPrimitiveRestartIndexNV		glPrimitiveRestartIndexNV;

// 288 - GL_ATI_map_object_buffer
typedef void* function(uint) pfglMapObjectBufferATI;
typedef void function(uint) pfglUnmapObjectBufferATI;

pfglMapObjectBufferATI			glMapObjectBufferATI;
pfglUnmapObjectBufferATI		glUnmapObjectBufferATI;

// 289 - GL_ATI_separate_stencil
typedef void function(GLenum, GLenum, GLenum, GLenum) pfglStencilOpSeparateATI;
typedef void function(GLenum, GLenum, GLint, uint) pfglStencilFuncSeparateATI;

pfglStencilOpSeparateATI		glStencilOpSeparateATI;
pfglStencilFuncSeparateATI		glStencilFuncSeparateATI;

// 290 - GL_ATI_vertex_attrib_array_object
typedef void function(uint, GLint, GLenum, GLboolean, GLsizei, uint, uint) pfglVertexAttribArrayObjectATI;
typedef void function(uint, GLenum, GLfloat*) pfglGetVertexAttribArrayObjectfvATI;
typedef void function(uint, GLenum, GLint*) pfglGetVertexAttribArrayObjectivATI;

pfglVertexAttribArrayObjectATI		glVertexAttribArrayObjectATI;
pfglGetVertexAttribArrayObjectfvATI	glGetVertexAttribArrayObjectfvATI;
pfglGetVertexAttribArrayObjectivATI	glGetVertexAttribArrayObjectivATI;

// 297 - GL_EXT_depth_bounds_test
typedef void function(GLclampd, GLclampd) pfglDepthBoundsEXT;

pfglDepthBoundsEXT			glDepthBoundsEXT;

// 299 - GL_EXT_blend_equation_separate
typedef void function(GLenum, GLenum) pfglBlendEquationSeparateEXT;

pfglBlendEquationSeparateEXT		glBlendEquationSeparateEXT;

// 310 - GL_EXT_framebuffer_object
typedef GLboolean function(uint) pfglIsRenderbufferEXT;
typedef void function(GLenum, uint) pfglBindRenderbufferEXT;
typedef void function(GLsizei, uint*) pfglDeleteRenderbuffersEXT;
typedef void function(GLsizei, uint*) pfglGenRenderbuffersEXT;
typedef void function(GLenum, GLenum, GLsizei, GLsizei) pfglRenderbufferStorageEXT;
typedef void function(GLenum, GLenum, GLint*) pfglGetRenderbufferParameterivEXT;
typedef GLboolean function(uint) pfglIsFramebufferEXT;
typedef void function(GLenum, uint) pfglBindFramebufferEXT;
typedef void function(GLsizei, uint*) pfglDeleteFramebuffersEXT;
typedef void function(GLsizei, uint*) pfglGenFramebuffersEXT;
typedef GLenum function(GLenum) pfglCheckFramebufferStatusEXT;
typedef void function(GLenum, GLenum, GLenum, uint, GLint) pfglFramebufferTexture1DEXT;
typedef void function(GLenum, GLenum, GLenum, uint, GLint) pfglFramebufferTexture2DEXT;
typedef void function(GLenum, GLenum, GLenum, uint, GLint, GLint) pfglFramebufferTexture3DEXT;
typedef void function(GLenum, GLenum, GLenum, uint) pfglFramebufferRenderbufferEXT;
typedef void function(GLenum, GLenum, GLenum, GLint*) pfglGetFramebufferAttachmentParameterivEXT;
typedef void function(GLenum) pfglGenerateMipmapEXT;

pfglIsRenderbufferEXT			glIsRenderbufferEXT;
pfglBindRenderbufferEXT			glBindRenderbufferEXT;
pfglDeleteRenderbuffersEXT		glDeleteRenderbuffersEXT;
pfglGenRenderbuffersEXT			glGenRenderbuffersEXT;
pfglRenderbufferStorageEXT		glRenderbufferStorageEXT;
pfglGetRenderbufferParameterivEXT	glGetRenderbufferParameterivEXT;
pfglIsFramebufferEXT			glIsFramebufferEXT;
pfglBindFramebufferEXT			glBindFramebufferEXT;
pfglDeleteFramebuffersEXT		glDeleteFramebuffersEXT;
pfglGenFramebuffersEXT			glGenFramebuffersEXT;
pfglCheckFramebufferStatusEXT		glCheckFramebufferStatusEXT;
pfglFramebufferTexture1DEXT		glFramebufferTexture1DEXT;
pfglFramebufferTexture2DEXT		glFramebufferTexture2DEXT;
pfglFramebufferTexture3DEXT		glFramebufferTexture3DEXT;
pfglFramebufferRenderbufferEXT		glFramebufferRenderbufferEXT;
pfglGetFramebufferAttachmentParameterivEXT glGetFramebufferAttachmentParameterivEXT;
pfglGenerateMipmapEXT			glGenerateMipmapEXT;

// 311 - GL_GREMEDY_string_marker
typedef void function(GLsizei, void*) pfglStringMarkerGREMEDY;

pfglStringMarkerGREMEDY			glStringMarkerGREMEDY;

// 314 - GL_EXT_stencil_clear_tag
typedef void function(GLsizei, uint) pfglStencilClearTagEXT;

pfglStencilClearTagEXT			glStencilClearTagEXT;

// 316 - GL_EXT_framebuffer_blit
typedef void function(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) pfglBlitFramebufferEXT;

pfglBlitFramebufferEXT			glBlitFramebufferEXT;

// 317 - GL_EXT_framebuffer_multisample
typedef void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei) pfglRenderbufferStorageMultisampleEXT;

pfglRenderbufferStorageMultisampleEXT	glRenderbufferStorageMultisampleEXT;

// 319 - GL_EXT_timer_query
typedef void function(uint id, GLenum pname, long* params) pfglGetQueryObjecti64vEXT;
typedef void function(uint id, GLenum pname, ulong* params) pfglGetQueryObjectui64vEXT;

pfglGetQueryObjecti64vEXT		glGetQueryObjecti64vEXT;
pfglGetQueryObjectui64vEXT		glGetQueryObjectui64vEXT;

// 320 - GL_EXT_gpu_program_parameters
typedef void function(GLenum target, uint index, GLsizei count, GLfloat* params) pfglProgramEnvParameters4fvEXT;
typedef void function(GLenum target, uint index, GLsizei count, GLfloat* params) pfglProgramLocalParameters4fvEXT;

pfglProgramEnvParameters4fvEXT		glProgramEnvParameters4fvEXT;
pfglProgramLocalParameters4fvEXT	glProgramLocalParameters4fvEXT;

// 321 - GL_APPLE_flush_buffer_range
typedef void function(GLenum target, GLenum pname, GLint param) pfglBufferParameteriAPPLE;
typedef void function(GLenum target, GLintptr offset, GLsizeiptr size) pfglFlushMappedBufferRangeAPPLE;

pfglBufferParameteriAPPLE		glBufferParameteriAPPLE;
pfglFlushMappedBufferRangeAPPLE		glFlushMappedBufferRangeAPPLE;
