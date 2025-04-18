options gen2
// note: don't enable optimize on the math runtime tests
// functions bellow optimizes to literally nothing otherwise
options log = false, optimize = false
options no_unused_function_arguments = false

def test_vec2(a : auto(vec2) -const -&; isRange = false) {
    let f2_0  = vec2()
    let f2_x  = vec2(1.0, 2.0)
    let f2_y  = vec2(1, 2)
    let f2_z  = vec2(0x1, 0x2)
    let f2_w  = vec2(1u, 2u)
    let f2_xx = vec2(1.0)
    let f2_yy = vec2(1)
    let f2_zz = vec2(0x1)
    let f2_ww = vec2(1u)
    assert("{f2_0}" == "0{VEC_SEP}0")
    assert("{f2_x}" == "1{VEC_SEP}2")
    assert("{f2_y}" == "1{VEC_SEP}2")
    assert("{f2_z}" == "1{VEC_SEP}2")
    assert("{f2_w}" == "1{VEC_SEP}2")
    if (isRange) {
        assert("{f2_xx}" == "0{VEC_SEP}1")
        assert("{f2_yy}" == "0{VEC_SEP}1")
        assert("{f2_zz}" == "0{VEC_SEP}1")
        assert("{f2_ww}" == "0{VEC_SEP}1")
    } else {
        assert("{f2_xx}" == "1{VEC_SEP}1")
        assert("{f2_yy}" == "1{VEC_SEP}1")
        assert("{f2_zz}" == "1{VEC_SEP}1")
        assert("{f2_ww}" == "1{VEC_SEP}1")
    }
}

def test_vec3(a : auto(vec3) -const -&) {
    let f3_0  = vec3()
    let f3_x  = vec3(1.0, 2.0, 3.0)
    let f3_y  = vec3(1, 2, 3)
    let f3_z  = vec3(0x1, 0x2, 0x3)
    let f3_w  = vec3(1u, 2u, 3u)
    let f3_xx = vec3(1.0)
    let f3_yy = vec3(1)
    let f3_zz = vec3(0x1)
    let f3_ww = vec3(1u)
    assert("{f3_0}" == "0{VEC_SEP}0{VEC_SEP}0")
    assert("{f3_x}" == "1{VEC_SEP}2{VEC_SEP}3")
    assert("{f3_y}" == "1{VEC_SEP}2{VEC_SEP}3")
    assert("{f3_z}" == "1{VEC_SEP}2{VEC_SEP}3")
    assert("{f3_w}" == "1{VEC_SEP}2{VEC_SEP}3")
    assert("{f3_xx}" == "1{VEC_SEP}1{VEC_SEP}1")
    assert("{f3_yy}" == "1{VEC_SEP}1{VEC_SEP}1")
    assert("{f3_zz}" == "1{VEC_SEP}1{VEC_SEP}1")
    assert("{f3_ww}" == "1{VEC_SEP}1{VEC_SEP}1")
}

def test_vec4(a : auto(vec4) -const -&) {
    let f4_0  = vec4()
    let f4_x  = vec4(1.0, 2.0, 3.0, 4.0)
    let f4_y  = vec4(1, 2, 3, 4)
    let f4_z  = vec4(0x1, 0x2, 0x3, 0x4)
    let f4_w  = vec4(1u, 2u, 3u, 4u)
    let f4_xx = vec4(1.0)
    let f4_yy = vec4(1)
    let f4_zz = vec4(0x1)
    let f4_ww = vec4(1u)
    assert("{f4_0}" == "0{VEC_SEP}0{VEC_SEP}0{VEC_SEP}0")
    assert("{f4_x}" == "1{VEC_SEP}2{VEC_SEP}3{VEC_SEP}4")
    assert("{f4_y}" == "1{VEC_SEP}2{VEC_SEP}3{VEC_SEP}4")
    assert("{f4_z}" == "1{VEC_SEP}2{VEC_SEP}3{VEC_SEP}4")
    assert("{f4_w}" == "1{VEC_SEP}2{VEC_SEP}3{VEC_SEP}4")
    assert("{f4_xx}" == "1{VEC_SEP}1{VEC_SEP}1{VEC_SEP}1")
    assert("{f4_yy}" == "1{VEC_SEP}1{VEC_SEP}1{VEC_SEP}1")
    assert("{f4_zz}" == "1{VEC_SEP}1{VEC_SEP}1{VEC_SEP}1")
    assert("{f4_ww}" == "1{VEC_SEP}1{VEC_SEP}1{VEC_SEP}1")
}

[sideeffects]
def test_cvt(a, b, c, d : int) {
    assert(float2(int2(a, b))    == float2(a, b))
    assert(float3(int3(a, b, c))  == float3(a, b, c))
    assert(float4(int4(a, b, c, d)) == float4(a, b, c, d))
    assert(float2(uint2(a, b))    == float2(a, b))
    assert(float3(uint3(a, b, c))  == float3(a, b, c))
    assert(float4(uint4(a, b, c, d)) == float4(a, b, c, d))
    assert(int2(float2(a, b))     == int2(a, b))
    assert(int3(float3(a, b, c))   == int3(a, b, c))
    assert(int4(float4(a, b, c, d)) == int4(a, b, c, d))
    assert(uint2(float2(a, b))    == uint2(a, b))
    assert(uint3(float3(a, b, c))  == uint3(a, b, c))
    assert(uint4(float4(a, b, c, d)) == uint4(a, b, c, d))
}

[export]
def test {
    test_vec2(float2())
    test_vec3(float3())
    test_vec4(float4())
    test_vec2(int2())
    test_vec3(int3())
    test_vec4(int4())
    test_vec2(uint2())
    test_vec3(uint3())
    test_vec4(uint4())
    test_vec2(range(), true)
    test_vec2(urange(), true)
    test_vec2(range64(), true)
    test_vec2(urange64(), true)
    test_cvt(1, 2, 3, 4)
    return true
}
