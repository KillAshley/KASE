// Compiled shader for all platforms, uncompressed size: 167.2KB

Shader "Hidden/Tonemapper" {
Properties {
 _MainTex ("", 2D) = "black" {}
 _SmallTex ("", 2D) = "grey" {}
 _Curve ("", 2D) = "black" {}
}
SubShader { 


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 12 math, 2 texture
 //    d3d11_9x : 12 math, 2 texture
 //        d3d9 : 17 math, 2 texture
 //      opengl : 18 math, 2 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp float avgLum_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture2D (_SmallTex, xlv_TEXCOORD0).x;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / _HdrParams.w))) / (1.0 + tmpvar_8)) / cieLum_1));
  gl_FragData[0] = color_2;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp float avgLum_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture2D (_SmallTex, xlv_TEXCOORD0).x;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / _HdrParams.w))) / (1.0 + tmpvar_8)) / cieLum_1));
  gl_FragData[0] = color_2;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp float avgLum_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture (_SmallTex, xlv_TEXCOORD0).x;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / _HdrParams.w))) / (1.0 + tmpvar_8)) / cieLum_1));
  _glesFragData[0] = color_2;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 18 math, 2 textures
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0],
		{ 1.0002404e-006, 0.2199707, 0.70703125, 0.070983887 },
		{ 0.001, 1 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R1.x, fragment.texcoord[0], texture[0], 2D;
ADD R1.z, R1.x, c[2].x;
RCP R1.w, R1.z;
DP3 R1.y, R0, c[1].yzww;
MAX R1.y, R1, c[1].x;
MUL R1.x, R1.y, c[0].z;
MUL R1.x, R1, R1.w;
RCP R1.z, c[0].w;
MAD R1.w, R1.x, R1.z, c[2].y;
ADD R1.z, R1.x, c[2].y;
MUL R1.x, R1, R1.w;
RCP R1.z, R1.z;
RCP R1.y, R1.y;
MUL R1.x, R1, R1.z;
MUL R1.x, R1, R1.y;
MUL result.color.xyz, R0, R1.x;
MOV result.color.w, R0;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 17 math, 2 textures
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.21997070, 0.70703125, 0.07098389, 0.00000100
def c2, 0.00100000, 1.00000000, 0, 0
dcl t0.xy
texld r3, t0, s1
texld r1, t0, s0
add r2.x, r1, c2
rcp r4.x, r2.x
dp3_pp r0.x, r3, c1
max_pp r0.x, r0, c1.w
mul r1.x, r0, c0.z
mul r1.x, r1, r4
rcp r2.x, c0.w
mad r4.x, r1, r2, c2.y
add r2.x, r1, c2.y
mul r1.x, r1, r4
rcp r2.x, r2.x
rcp r0.x, r0.x
mul r1.x, r1, r2
mul r0.x, r1, r0
mov r0.w, r3
mul r0.xyz, r3, r0.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 12 math, 2 textures
SetTexture 0 [_SmallTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_HdrParams]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkppepjdbkpgnafpbjgginbhioocjoghmabaaaaaapeacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdeacaaaa
eaaaaaaainaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaagpbciddkefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaakccaabaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaalndhigdfdiaaaaaiecaabaaa
aaaaaaaabkaabaaaaaaaaaaackiacaaaaaaaaaaaabaaaaaaaoaaaaahbcaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaaiecaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaabaaaaaaaaaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpaoaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaaaoaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 12 math, 2 textures
SetTexture 0 [_SmallTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_HdrParams]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbnbpojbcddeeolbcdedecfoaahgdaconabaaaaaakiaeaaaaaeaaaaaa
daaaaaaaoaabaaaabmaeaaaaheaeaaaaebgpgodjkiabaaaakiabaaaaaaacpppp
haabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkakoehgbdo
pepndedphdgijbdnlndhigdffbaaaaafacaaapkagpbciddkaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkaecaaaaadaaaaapiaaaaaoelaabaioekaecaaaaadabaaapia
aaaaoelaaaaioekaagaaaaacaaaaaciaaaaappkaacaaaaadaaaaabiaaaaaaaia
acaaaakaagaaaaacaaaaabiaaaaaaaiaaiaaaaadaaaaceiaabaaoeiaabaaoeka
alaaaaadacaaaiiaabaappkaaaaakkiaafaaaaadaaaaaeiaacaappiaaaaakkka
agaaaaacaaaaaiiaacaappiaafaaaaadacaaabiaaaaaaaiaaaaakkiaaeaaaaae
aaaaabiaaaaakkiaaaaaaaiaacaaffkaagaaaaacaaaaabiaaaaaaaiaaeaaaaae
aaaaaciaacaaaaiaaaaaffiaacaaffkaafaaaaadaaaaaciaaaaaffiaacaaaaia
afaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaabiaaaaappiaaaaaaaia
afaaaaadabaaahiaaaaaaaiaabaaoeiaabaaaaacaaaiapiaabaaoeiappppaaaa
fdeieefcdeacaaaaeaaaaaaainaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaagpbciddkefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaak
ccaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdn
aaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaalndhigdf
diaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaaaaaaaaaabaaaaaa
aoaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaai
ecaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaabaaaaaaaaaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpaoaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaaaoaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadoaaaaabejfdeheo
faaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"agal_ps
c1 0.219971 0.707031 0.070984 0.000001
c2 0.001 1.0 0.0 0.0
[bc]
ciaaaaaaadaaapacaaaaaaoeaeaaaaaaabaaaaaaafaababb tex r3, v0, s1 <2d wrap linear point>
ciaaaaaaabaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r1, v0, s0 <2d wrap linear point>
abaaaaaaacaaabacabaaaaaaacaaaaaaacaaaaoeabaaaaaa add r2.x, r1.x, c2
afaaaaaaaeaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r4.x, r2.x
bcaaaaaaaaaaabacadaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r0.x, r3.xyzz, c1
ahaaaaaaaaaaabacaaaaaaaaacaaaaaaabaaaappabaaaaaa max r0.x, r0.x, c1.w
adaaaaaaabaaabacaaaaaaaaacaaaaaaaaaaaakkabaaaaaa mul r1.x, r0.x, c0.z
adaaaaaaabaaabacabaaaaaaacaaaaaaaeaaaaaaacaaaaaa mul r1.x, r1.x, r4.x
aaaaaaaaabaaacacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.y, c0
afaaaaaaacaaabacabaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r2.x, r1.y
adaaaaaaaeaaabacabaaaaaaacaaaaaaacaaaaaaacaaaaaa mul r4.x, r1.x, r2.x
abaaaaaaaeaaabacaeaaaaaaacaaaaaaacaaaaffabaaaaaa add r4.x, r4.x, c2.y
abaaaaaaacaaabacabaaaaaaacaaaaaaacaaaaffabaaaaaa add r2.x, r1.x, c2.y
adaaaaaaabaaabacabaaaaaaacaaaaaaaeaaaaaaacaaaaaa mul r1.x, r1.x, r4.x
afaaaaaaacaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r2.x, r2.x
afaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, r0.x
adaaaaaaabaaabacabaaaaaaacaaaaaaacaaaaaaacaaaaaa mul r1.x, r1.x, r2.x
adaaaaaaaaaaabacabaaaaaaacaaaaaaaaaaaaaaacaaaaaa mul r0.x, r1.x, r0.x
aaaaaaaaaaaaaiacadaaaappacaaaaaaaaaaaaaaaaaaaaaa mov r0.w, r3.w
adaaaaaaaaaaahacadaaaakeacaaaaaaaaaaaaaaacaaaaaa mul r0.xyz, r3.xyzz, r0.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 20 math, 4 texture
 //    d3d11_9x : 20 math, 4 texture
 //        d3d9 : 26 math, 4 texture
 //      opengl : 25 math, 4 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 P_1;
  P_1 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  lowp float tmpvar_2;
  tmpvar_2 = log((dot (texture2D (_MainTex, P_1).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  lowp float tmpvar_4;
  tmpvar_4 = log((dot (texture2D (_MainTex, P_3).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_5;
  P_5 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  lowp float tmpvar_6;
  tmpvar_6 = log((dot (texture2D (_MainTex, P_5).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  lowp float tmpvar_8;
  tmpvar_8 = log((dot (texture2D (_MainTex, P_7).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp float tmpvar_9;
  tmpvar_9 = ((((tmpvar_2 + tmpvar_4) + tmpvar_6) + tmpvar_8) / 4.0);
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9;
  tmpvar_10.y = tmpvar_9;
  tmpvar_10.z = tmpvar_9;
  tmpvar_10.w = tmpvar_9;
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 P_1;
  P_1 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  lowp float tmpvar_2;
  tmpvar_2 = log((dot (texture2D (_MainTex, P_1).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  lowp float tmpvar_4;
  tmpvar_4 = log((dot (texture2D (_MainTex, P_3).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_5;
  P_5 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  lowp float tmpvar_6;
  tmpvar_6 = log((dot (texture2D (_MainTex, P_5).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  lowp float tmpvar_8;
  tmpvar_8 = log((dot (texture2D (_MainTex, P_7).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp float tmpvar_9;
  tmpvar_9 = ((((tmpvar_2 + tmpvar_4) + tmpvar_6) + tmpvar_8) / 4.0);
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9;
  tmpvar_10.y = tmpvar_9;
  tmpvar_10.z = tmpvar_9;
  tmpvar_10.w = tmpvar_9;
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 P_1;
  P_1 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  lowp float tmpvar_2;
  tmpvar_2 = log((dot (texture (_MainTex, P_1).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_3;
  P_3 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  lowp float tmpvar_4;
  tmpvar_4 = log((dot (texture (_MainTex, P_3).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_5;
  P_5 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  lowp float tmpvar_6;
  tmpvar_6 = log((dot (texture (_MainTex, P_5).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  lowp float tmpvar_8;
  tmpvar_8 = log((dot (texture (_MainTex, P_7).xyz, vec3(0.22, 0.707, 0.071)) + 0.0001));
  highp float tmpvar_9;
  tmpvar_9 = ((((tmpvar_2 + tmpvar_4) + tmpvar_6) + tmpvar_8) / 4.0);
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9;
  tmpvar_10.y = tmpvar_9;
  tmpvar_10.z = tmpvar_9;
  tmpvar_10.w = tmpvar_9;
  _glesFragData[0] = tmpvar_10;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 25 math, 4 textures
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[4] = { program.local[0],
		{ 0.1732868, 0, 9.9999997e-005 },
		{ 0.2199707, 0.70703125, 0.070983887 },
		{ -1, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xy, c[3];
MAD R1.zw, R1.xyyx, c[0].xyxy, fragment.texcoord[0].xyxy;
MAD R1.xy, R1, c[0], fragment.texcoord[0];
ADD R0.zw, fragment.texcoord[0].xyxy, c[0].xyxy;
ADD R0.xy, fragment.texcoord[0], -c[0];
TEX R3.xyz, R1.zwzw, texture[0], 2D;
TEX R2.xyz, R1, texture[0], 2D;
TEX R1.xyz, R0.zwzw, texture[0], 2D;
TEX R0.xyz, R0, texture[0], 2D;
DP3 R0.x, R0, c[2];
DP3 R0.w, R1, c[2];
ADD R0.y, R0.w, c[1].z;
ADD R0.x, R0, c[1].z;
DP3 R0.z, R3, c[2];
ADD R0.z, R0, c[1];
LG2 R0.y, R0.y;
LG2 R0.x, R0.x;
ADD R0.x, R0, R0.y;
DP3 R0.y, R2, c[2];
ADD R0.y, R0, c[1].z;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R0.z;
MUL result.color, R0.x, c[1].x;
END
# 25 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 26 math, 4 textures
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.21997070, 0.70703125, 0.07098389, 0.00010000
def c2, -1.00000000, 1.00000000, 0.17328680, 0
dcl t0.xy
add r3.xy, t0, -c0
mov r2.xy, c0
mad r2.xy, c2, r2, t0
mov r0.x, c2.y
mov r0.y, c2.x
mov r1.xy, c0
mad r1.xy, r0, r1, t0
add r0.xy, t0, c0
texld r0, r0, s0
texld r1, r1, s0
texld r2, r2, s0
texld r3, r3, s0
dp3_pp r0.x, r0, c1
dp3_pp r3.x, r3, c1
add r0.x, r0, c1.w
add r3.x, r3, c1.w
dp3_pp r2.x, r2, c1
dp3_pp r1.x, r1, c1
add r2.x, r2, c1.w
add r1.x, r1, c1.w
log r0.x, r0.x
log r3.x, r3.x
add r0.x, r3, r0
log r2.x, r2.x
log r1.x, r1.x
add r0.x, r0, r2
add r0.x, r0, r1
mul r0.x, r0, c2.z
mov r0, r0.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 20 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcobaaajoafcoianmpiddgmbhfadaibbiabaaaaaadaaeaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefchaadaaaa
eaaaaaaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaaaaaaaidcaabaaaaaaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaakbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaabhlhnbdicpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaabihcdbdpaaaaaaajgcaabaaaaaaaaaaaagbbbaaaabaaaaaa
agibcaiaebaaaaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaakccaabaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaabhlhnbdicpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaabihcdbdpakaabaaaaaaaaaaadcaaaaanpcaabaaaabaaaaaaegiecaaa
aaaaaaaaadaaaaaaaceaaaaaaaaaialpaaaaiadpaaaaiadpaaaaialpegbebaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaabaaaaaakccaabaaaaaaaaaaaegacbaaaabaaaaaa
aceaaaaakoehgbdopepndedphdgijbdnaaaaaaaaaaaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaabhlhnbdicpaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaabaaaaaakecaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaabhlhnbdicpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaaj
bcaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaabihcdbdpakaabaaaaaaaaaaa
dcaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaabihcdbdpakaabaaa
aaaaaaaadiaaaaakpccabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiado
aaaaiadoaaaaiadoaaaaiadodoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 20 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkafkjplhfodghhbhccbpfapafbajboapabaaaaaagmagaaaaaeaaaaaa
daaaaaaagiacaaaaoaafaaaadiagaaaaebgpgodjdaacaaaadaacaaaaaaacpppp
pmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkakoehgbdopepndedp
hdgijbdnbhlhnbdifbaaaaafacaaapkabihcdbdpaaaaialpaaaaiadpaaaaiado
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkaacaaaaadaaaaadia
aaaaoelaaaaaoekaacaaaaadabaaadiaaaaaoelaaaaaoekbabaaaaacacaaagia
acaaoekaaeaaaaaeadaaadiaaaaaoekaacaamjiaaaaaoelaaeaaaaaeacaaadia
aaaaoekaacaamjibaaaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaaaaioekaecaaaaadadaacpiaadaaoeiaaaaioekaecaaaaad
acaacpiaacaaoeiaaaaioekaaiaaaaadabaaciiaaaaaoeiaabaaoekaacaaaaad
abaaaiiaabaappiaabaappkaapaaaaacabaaaiiaabaappiaafaaaaadabaaaiia
abaappiaacaaaakaaiaaaaadacaaciiaabaaoeiaabaaoekaacaaaaadacaaaiia
acaappiaabaappkaapaaaaacacaaaiiaacaappiaaeaaaaaeacaaaiiaacaappia
acaaaakaabaappiaaiaaaaadaaaacbiaadaaoeiaabaaoekaacaaaaadaaaaabia
aaaaaaiaabaappkaapaaaaacaaaaabiaaaaaaaiaaeaaaaaeacaaaiiaaaaaaaia
acaaaakaacaappiaaiaaaaadaaaacbiaacaaoeiaabaaoekaacaaaaadaaaaabia
aaaaaaiaabaappkaapaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaia
acaaaakaacaappiaafaaaaadaaaaapiaaaaaaaiaacaappkaabaaaaacaaaiapia
aaaaoeiappppaaaafdeieefchaadaaaaeaaaaaaanmaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaaaaaaaaidcaabaaaaaaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaabaaaaaakbcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
koehgbdopepndedphdgijbdnaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaabhlhnbdicpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaabihcdbdpaaaaaaaj
gcaabaaaaaaaaaaaagbbbaaaabaaaaaaagibcaiaebaaaaaaaaaaaaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaabaaaaaakccaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaabhlhnbdicpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaaj
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaabihcdbdpakaabaaaaaaaaaaa
dcaaaaanpcaabaaaabaaaaaaegiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaialp
aaaaiadpaaaaiadpaaaaialpegbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaak
ccaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdn
aaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaabhlhnbdi
cpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaakecaabaaaaaaaaaaa
egacbaaaacaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaaaaaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaabhlhnbdicpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaabihcdbdpakaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaabihcdbdpakaabaaaaaaaaaaadiaaaaakpccabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadodoaaaaab
ejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 0.219971 0.707031 0.070984 0.0001
c2 -1.0 1.0 0.173287 0.0
[bc]
acaaaaaaadaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa sub r3.xy, v0, c0
aaaaaaaaacaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r2.xy, c0
adaaaaaaacaaadacacaaaaoeabaaaaaaacaaaafeacaaaaaa mul r2.xy, c2, r2.xyyy
abaaaaaaacaaadacacaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r2.xy, r2.xyyy, v0
aaaaaaaaaaaaabacacaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r0.x, c2.y
aaaaaaaaaaaaacacacaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r0.y, c2.x
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
adaaaaaaabaaadacaaaaaafeacaaaaaaabaaaafeacaaaaaa mul r1.xy, r0.xyyy, r1.xyyy
abaaaaaaabaaadacabaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r1.xy, r1.xyyy, v0
abaaaaaaaaaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa add r0.xy, v0, c0
ciaaaaaaaaaaapacaaaaaafeacaaaaaaaaaaaaaaafaababb tex r0, r0.xyyy, s0 <2d wrap linear point>
ciaaaaaaabaaapacabaaaafeacaaaaaaaaaaaaaaafaababb tex r1, r1.xyyy, s0 <2d wrap linear point>
ciaaaaaaacaaapacacaaaafeacaaaaaaaaaaaaaaafaababb tex r2, r2.xyyy, s0 <2d wrap linear point>
ciaaaaaaadaaapacadaaaafeacaaaaaaaaaaaaaaafaababb tex r3, r3.xyyy, s0 <2d wrap linear point>
bcaaaaaaaaaaabacaaaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r0.x, r0.xyzz, c1
bcaaaaaaadaaabacadaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r3.x, r3.xyzz, c1
abaaaaaaaaaaabacaaaaaaaaacaaaaaaabaaaappabaaaaaa add r0.x, r0.x, c1.w
abaaaaaaadaaabacadaaaaaaacaaaaaaabaaaappabaaaaaa add r3.x, r3.x, c1.w
bcaaaaaaacaaabacacaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r2.x, r2.xyzz, c1
bcaaaaaaabaaabacabaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r1.x, r1.xyzz, c1
abaaaaaaacaaabacacaaaaaaacaaaaaaabaaaappabaaaaaa add r2.x, r2.x, c1.w
abaaaaaaabaaabacabaaaaaaacaaaaaaabaaaappabaaaaaa add r1.x, r1.x, c1.w
amaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa log r0.x, r0.x
amaaaaaaadaaabacadaaaaaaacaaaaaaaaaaaaaaaaaaaaaa log r3.x, r3.x
abaaaaaaaaaaabacadaaaaaaacaaaaaaaaaaaaaaacaaaaaa add r0.x, r3.x, r0.x
amaaaaaaacaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa log r2.x, r2.x
amaaaaaaabaaabacabaaaaaaacaaaaaaaaaaaaaaaaaaaaaa log r1.x, r1.x
abaaaaaaaaaaabacaaaaaaaaacaaaaaaacaaaaaaacaaaaaa add r0.x, r0.x, r2.x
abaaaaaaaaaaabacaaaaaaaaacaaaaaaabaaaaaaacaaaaaa add r0.x, r0.x, r1.x
adaaaaaaaaaaabacaaaaaaaaacaaaaaaacaaaakkabaaaaaa mul r0.x, r0.x, c2.z
aaaaaaaaaaaaapacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa mov r0, r0.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 9 math, 4 texture
 //    d3d11_9x : 9 math, 4 texture
 //        d3d9 : 23 math, 4 texture
 //      opengl : 17 math, 4 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture2D (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture2D (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture2D (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture2D (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture2D (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture2D (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture2D (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture2D (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  _glesFragData[0] = tmpvar_10;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 17 math, 4 textures
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[4] = { program.local[0..1],
		{ 0.25, 2.718282, 1, -1 },
		{ 0.0125 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xy, c[2].zwzw;
MAD R1.zw, R1.xyyx, c[0].xyxy, fragment.texcoord[0].xyxy;
MAD R1.xy, R1, c[0], fragment.texcoord[0];
ADD R0.xy, fragment.texcoord[0], -c[0];
ADD R0.zw, fragment.texcoord[0].xyxy, c[0].xyxy;
TEX R2.xy, R1, texture[0], 2D;
TEX R1.xy, R0.zwzw, texture[0], 2D;
TEX R0.xy, R0, texture[0], 2D;
TEX R3.xy, R1.zwzw, texture[0], 2D;
ADD R0.xy, R0, R1;
ADD R0.xy, R0, R2;
ADD R0.xy, R0, R3;
MUL R0.zw, R0.xyxy, c[2].x;
MOV R0.x, c[3];
POW result.color.y, c[2].y, R0.w;
POW result.color.xz, c[2].y, R0.z;
MUL_SAT result.color.w, R0.x, c[1].x;
END
# 17 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 23 math, 4 textures
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 1.00000000, -1.00000000, 0.25000000, 2.71828198
def c3, 0.01250000, 0, 0, 0
dcl t0.xy
add r3.xy, t0, -c0
add r2.xy, t0, c0
mov r1.xy, c0
mov r0.x, c2.y
mov r0.y, c2.x
mad r0.xy, r0, r1, t0
mov r1.xy, c0
mad r1.xy, c2, r1, t0
texld r1, r1, s0
texld r0, r0, s0
texld r2, r2, s0
texld r3, r3, s0
add r2.xy, r3, r2
add r1.xy, r2, r1
add r0.xy, r1, r0
mul r1.xy, r0, c2.z
pow r0.x, c2.w, r1.y
mov r1.y, r0.x
pow r0.x, c2.w, r1.x
mov r1.x, c1
mul_sat r1.w, c3.x, r1.x
mov r1.xz, r0.x
mov oC0, r1
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
Float 64 [_AdaptionSpeed]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmhndlolcdendlonkkgklfjemofhiaakiabaaaaaanaacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaacaaaa
eaaaaaaaieaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaaaaaaajdcaabaaaaaaaaaaa
egbabaaaabaaaaaaegiacaiaebaaaaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaai
mcaabaaaaaaaaaaaagbebaaaabaaaaaaagiecaaaaaaaaaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaan
pcaabaaaabaaaaaaegiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaialpaaaaiadpegbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egaabaaaabaaaaaaegacbaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaadlkklidodlkklidodlkklidoaaaaaaaabjaaaaafhccabaaa
aaaaaaaaegacbaaaaaaaaaaadicaaaaiiccabaaaaaaaaaaaakiacaaaaaaaaaaa
aeaaaaaaabeaaaaamnmmemdmdoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
Float 64 [_AdaptionSpeed]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddikmgmogfaedhllcpinmeellmjaikllfabaaaaaaheaeaaaaaeaaaaaa
daaaaaaanaabaaaaoiadaaaaeaaeaaaaebgpgodjjiabaaaajiabaaaaaaacpppp
geabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaacaaaaaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaialp
aaaaiadpdlkklidofbaaaaafadaaapkamnmmemdmaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkaacaaaaadaaaaadia
aaaaoelaaaaaoekbacaaaaadabaaadiaaaaaoelaaaaaoekaabaaaaacacaaadia
aaaaoekaaeaaaaaeadaaadiaacaaoeiaacaaoekaaaaaoelaaeaaaaaeacaaadia
acaaoeiaacaamjkaaaaaoelaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaad
abaaapiaabaaoeiaaaaioekaecaaaaadadaaapiaadaaoeiaaaaioekaecaaaaad
acaaapiaacaaoeiaaaaioekaacaaaaadaaaaadiaaaaaoeiaabaaoeiaacaaaaad
aaaaadiaadaaoeiaaaaaoeiaacaaaaadaaaaadiaacaaoeiaaaaaoeiaafaaaaad
aaaaadiaaaaaoeiaacaappkaaoaaaaacabaaafiaaaaaaaiaaoaaaaacabaaacia
aaaaffiaabaaaaacaaaaabiaabaaaakaafaaaaadabaabiiaaaaaaaiaadaaaaka
abaaaaacaaaiapiaabaaoeiappppaaaafdeieefcbaacaaaaeaaaaaaaieaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegbabaaaabaaaaaa
egiacaiaebaaaaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaimcaabaaaaaaaaaaa
agbebaaaabaaaaaaagiecaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaanpcaabaaaabaaaaaa
egiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaialpaaaaiadp
egbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegaabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegaabaaaabaaaaaa
egacbaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
dlkklidodlkklidodlkklidoaaaaaaaabjaaaaafhccabaaaaaaaaaaaegacbaaa
aaaaaaaadicaaaaiiccabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaabeaaaaa
mnmmemdmdoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c2 1.0 -1.0 0.25 2.718282
c3 0.0125 0.0 0.0 0.0
[bc]
acaaaaaaadaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa sub r3.xy, v0, c0
abaaaaaaacaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa add r2.xy, v0, c0
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
aaaaaaaaaaaaabacacaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r0.x, c2.y
aaaaaaaaaaaaacacacaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r0.y, c2.x
adaaaaaaaaaaadacaaaaaafeacaaaaaaabaaaafeacaaaaaa mul r0.xy, r0.xyyy, r1.xyyy
abaaaaaaaaaaadacaaaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r0.xy, r0.xyyy, v0
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
adaaaaaaabaaadacacaaaaoeabaaaaaaabaaaafeacaaaaaa mul r1.xy, c2, r1.xyyy
abaaaaaaabaaadacabaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r1.xy, r1.xyyy, v0
ciaaaaaaabaaapacabaaaafeacaaaaaaaaaaaaaaafaababb tex r1, r1.xyyy, s0 <2d wrap linear point>
ciaaaaaaaaaaapacaaaaaafeacaaaaaaaaaaaaaaafaababb tex r0, r0.xyyy, s0 <2d wrap linear point>
ciaaaaaaacaaapacacaaaafeacaaaaaaaaaaaaaaafaababb tex r2, r2.xyyy, s0 <2d wrap linear point>
ciaaaaaaadaaapacadaaaafeacaaaaaaaaaaaaaaafaababb tex r3, r3.xyyy, s0 <2d wrap linear point>
abaaaaaaacaaadacadaaaafeacaaaaaaacaaaafeacaaaaaa add r2.xy, r3.xyyy, r2.xyyy
abaaaaaaabaaadacacaaaafeacaaaaaaabaaaafeacaaaaaa add r1.xy, r2.xyyy, r1.xyyy
abaaaaaaaaaaadacabaaaafeacaaaaaaaaaaaafeacaaaaaa add r0.xy, r1.xyyy, r0.xyyy
adaaaaaaabaaadacaaaaaafeacaaaaaaacaaaakkabaaaaaa mul r1.xy, r0.xyyy, c2.z
alaaaaaaaaaaapacacaaaappabaaaaaaabaaaaffacaaaaaa pow r0, c2.w, r1.y
aaaaaaaaabaaacacaaaaaaffacaaaaaaaaaaaaaaaaaaaaaa mov r1.y, r0.y
alaaaaaaaaaaapacacaaaappabaaaaaaabaaaaaaacaaaaaa pow r0, c2.w, r1.x
aaaaaaaaabaaabacabaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.x, c1
adaaaaaaabaaaiacadaaaaaaabaaaaaaabaaaaaaacaaaaaa mul r1.w, c3.x, r1.x
bgaaaaaaabaaaiacabaaaappacaaaaaaaaaaaaaaaaaaaaaa sat r1.w, r1.w
aaaaaaaaabaaafacaaaaaakiacaaaaaaaaaaaaaaaaaaaaaa mov r1.xz, r0.xzzz
aaaaaaaaaaaaapadabaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r1
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 9 math, 4 texture
 //    d3d11_9x : 9 math, 4 texture
 //        d3d9 : 23 math, 4 texture
 //      opengl : 17 math, 4 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture2D (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture2D (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture2D (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture2D (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture2D (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture2D (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture2D (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture2D (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  gl_FragData[0] = tmpvar_10;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _AdaptionSpeed;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 P_2;
  P_2 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, -1.0)));
  tmpvar_1 = texture (_MainTex, P_2);
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  tmpvar_3 = texture (_MainTex, P_4);
  lowp vec4 tmpvar_5;
  highp vec2 P_6;
  P_6 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(1.0, -1.0)));
  tmpvar_5 = texture (_MainTex, P_6);
  lowp vec4 tmpvar_7;
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(-1.0, 1.0)));
  tmpvar_7 = texture (_MainTex, P_8);
  highp vec2 tmpvar_9;
  tmpvar_9 = exp(((((tmpvar_1.xy + tmpvar_3.xy) + tmpvar_5.xy) + tmpvar_7.xy) / 4.0));
  highp vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = tmpvar_9.y;
  tmpvar_10.z = tmpvar_9.x;
  tmpvar_10.w = clamp ((0.0125 * _AdaptionSpeed), 0.0, 1.0);
  _glesFragData[0] = tmpvar_10;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 17 math, 4 textures
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[4] = { program.local[0..1],
		{ 0.25, 2.718282, 1, -1 },
		{ 0.0125 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xy, c[2].zwzw;
MAD R1.zw, R1.xyyx, c[0].xyxy, fragment.texcoord[0].xyxy;
MAD R1.xy, R1, c[0], fragment.texcoord[0];
ADD R0.xy, fragment.texcoord[0], -c[0];
ADD R0.zw, fragment.texcoord[0].xyxy, c[0].xyxy;
TEX R2.xy, R1, texture[0], 2D;
TEX R1.xy, R0.zwzw, texture[0], 2D;
TEX R0.xy, R0, texture[0], 2D;
TEX R3.xy, R1.zwzw, texture[0], 2D;
ADD R0.xy, R0, R1;
ADD R0.xy, R0, R2;
ADD R0.xy, R0, R3;
MUL R0.zw, R0.xyxy, c[2].x;
MOV R0.x, c[3];
POW result.color.y, c[2].y, R0.w;
POW result.color.xz, c[2].y, R0.z;
MUL_SAT result.color.w, R0.x, c[1].x;
END
# 17 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 23 math, 4 textures
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 1.00000000, -1.00000000, 0.25000000, 2.71828198
def c3, 0.01250000, 0, 0, 0
dcl t0.xy
add r3.xy, t0, -c0
add r2.xy, t0, c0
mov r1.xy, c0
mov r0.x, c2.y
mov r0.y, c2.x
mad r0.xy, r0, r1, t0
mov r1.xy, c0
mad r1.xy, c2, r1, t0
texld r1, r1, s0
texld r0, r0, s0
texld r2, r2, s0
texld r3, r3, s0
add r2.xy, r3, r2
add r1.xy, r2, r1
add r0.xy, r1, r0
mul r1.xy, r0, c2.z
pow r0.x, c2.w, r1.y
mov r1.y, r0.x
pow r0.x, c2.w, r1.x
mov r1.x, c1
mul_sat r1.w, c3.x, r1.x
mov r1.xz, r0.x
mov oC0, r1
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
Float 64 [_AdaptionSpeed]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmhndlolcdendlonkkgklfjemofhiaakiabaaaaaanaacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaacaaaa
eaaaaaaaieaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaaaaaaajdcaabaaaaaaaaaaa
egbabaaaabaaaaaaegiacaiaebaaaaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaai
mcaabaaaaaaaaaaaagbebaaaabaaaaaaagiecaaaaaaaaaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaan
pcaabaaaabaaaaaaegiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaialpaaaaiadpegbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egaabaaaabaaaaaaegacbaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaadlkklidodlkklidodlkklidoaaaaaaaabjaaaaafhccabaaa
aaaaaaaaegacbaaaaaaaaaaadicaaaaiiccabaaaaaaaaaaaakiacaaaaaaaaaaa
aeaaaaaaabeaaaaamnmmemdmdoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
Float 64 [_AdaptionSpeed]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddikmgmogfaedhllcpinmeellmjaikllfabaaaaaaheaeaaaaaeaaaaaa
daaaaaaanaabaaaaoiadaaaaeaaeaaaaebgpgodjjiabaaaajiabaaaaaaacpppp
geabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaacaaaaaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaialp
aaaaiadpdlkklidofbaaaaafadaaapkamnmmemdmaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkaacaaaaadaaaaadia
aaaaoelaaaaaoekbacaaaaadabaaadiaaaaaoelaaaaaoekaabaaaaacacaaadia
aaaaoekaaeaaaaaeadaaadiaacaaoeiaacaaoekaaaaaoelaaeaaaaaeacaaadia
acaaoeiaacaamjkaaaaaoelaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaad
abaaapiaabaaoeiaaaaioekaecaaaaadadaaapiaadaaoeiaaaaioekaecaaaaad
acaaapiaacaaoeiaaaaioekaacaaaaadaaaaadiaaaaaoeiaabaaoeiaacaaaaad
aaaaadiaadaaoeiaaaaaoeiaacaaaaadaaaaadiaacaaoeiaaaaaoeiaafaaaaad
aaaaadiaaaaaoeiaacaappkaaoaaaaacabaaafiaaaaaaaiaaoaaaaacabaaacia
aaaaffiaabaaaaacaaaaabiaabaaaakaafaaaaadabaabiiaaaaaaaiaadaaaaka
abaaaaacaaaiapiaabaaoeiappppaaaafdeieefcbaacaaaaeaaaaaaaieaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegbabaaaabaaaaaa
egiacaiaebaaaaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaimcaabaaaaaaaaaaa
agbebaaaabaaaaaaagiecaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaanpcaabaaaabaaaaaa
egiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaialpaaaaiadp
egbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegaabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegaabaaaabaaaaaa
egacbaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
dlkklidodlkklidodlkklidoaaaaaaaabjaaaaafhccabaaaaaaaaaaaegacbaaa
aaaaaaaadicaaaaiiccabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaabeaaaaa
mnmmemdmdoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_MainTex_TexelSize]
Float 1 [_AdaptionSpeed]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c2 1.0 -1.0 0.25 2.718282
c3 0.0125 0.0 0.0 0.0
[bc]
acaaaaaaadaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa sub r3.xy, v0, c0
abaaaaaaacaaadacaaaaaaoeaeaaaaaaaaaaaaoeabaaaaaa add r2.xy, v0, c0
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
aaaaaaaaaaaaabacacaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r0.x, c2.y
aaaaaaaaaaaaacacacaaaaaaabaaaaaaaaaaaaaaaaaaaaaa mov r0.y, c2.x
adaaaaaaaaaaadacaaaaaafeacaaaaaaabaaaafeacaaaaaa mul r0.xy, r0.xyyy, r1.xyyy
abaaaaaaaaaaadacaaaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r0.xy, r0.xyyy, v0
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
adaaaaaaabaaadacacaaaaoeabaaaaaaabaaaafeacaaaaaa mul r1.xy, c2, r1.xyyy
abaaaaaaabaaadacabaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r1.xy, r1.xyyy, v0
ciaaaaaaabaaapacabaaaafeacaaaaaaaaaaaaaaafaababb tex r1, r1.xyyy, s0 <2d wrap linear point>
ciaaaaaaaaaaapacaaaaaafeacaaaaaaaaaaaaaaafaababb tex r0, r0.xyyy, s0 <2d wrap linear point>
ciaaaaaaacaaapacacaaaafeacaaaaaaaaaaaaaaafaababb tex r2, r2.xyyy, s0 <2d wrap linear point>
ciaaaaaaadaaapacadaaaafeacaaaaaaaaaaaaaaafaababb tex r3, r3.xyyy, s0 <2d wrap linear point>
abaaaaaaacaaadacadaaaafeacaaaaaaacaaaafeacaaaaaa add r2.xy, r3.xyyy, r2.xyyy
abaaaaaaabaaadacacaaaafeacaaaaaaabaaaafeacaaaaaa add r1.xy, r2.xyyy, r1.xyyy
abaaaaaaaaaaadacabaaaafeacaaaaaaaaaaaafeacaaaaaa add r0.xy, r1.xyyy, r0.xyyy
adaaaaaaabaaadacaaaaaafeacaaaaaaacaaaakkabaaaaaa mul r1.xy, r0.xyyy, c2.z
alaaaaaaaaaaapacacaaaappabaaaaaaabaaaaffacaaaaaa pow r0, c2.w, r1.y
aaaaaaaaabaaacacaaaaaaffacaaaaaaaaaaaaaaaaaaaaaa mov r1.y, r0.y
alaaaaaaaaaaapacacaaaappabaaaaaaabaaaaaaacaaaaaa pow r0, c2.w, r1.x
aaaaaaaaabaaabacabaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.x, c1
adaaaaaaabaaaiacadaaaaaaabaaaaaaabaaaaaaacaaaaaa mul r1.w, c3.x, r1.x
bgaaaaaaabaaaiacabaaaappacaaaaaaaaaaaaaaaaaaaaaa sat r1.w, r1.w
aaaaaaaaabaaafacaaaaaakiacaaaaaaaaaaaaaaaaaaaaaa mov r1.xz, r0.xzzz
aaaaaaaaaaaaapadabaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r1
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 13 math, 2 texture
 //    d3d11_9x : 13 math, 2 texture
 //        d3d9 : 22 math, 2 texture
 //      opengl : 22 math, 2 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _Curve;
uniform highp float _RangeScale;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float newLum_1;
  highp vec3 cie_2;
  highp vec4 color_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_3 = tmpvar_4;
  highp vec3 Yxy_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = (mat3(0.514136, 0.265068, 0.0241188, 0.323879, 0.670234, 0.122818, 0.160364, 0.0640916, 0.844427) * color_3.xyz);
  Yxy_5.x = tmpvar_6.y;
  Yxy_5.yz = (tmpvar_6.xy / dot (vec3(1.0, 1.0, 1.0), tmpvar_6));
  cie_2.yz = Yxy_5.yz;
  highp vec2 tmpvar_7;
  tmpvar_7.y = 0.5;
  tmpvar_7.x = (tmpvar_6.y * _RangeScale);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_Curve, tmpvar_7).x;
  newLum_1 = tmpvar_8;
  cie_2.x = newLum_1;
  highp vec3 XYZ_9;
  XYZ_9.x = ((newLum_1 * Yxy_5.y) / Yxy_5.z);
  XYZ_9.y = cie_2.x;
  XYZ_9.z = ((newLum_1 * ((1.0 - Yxy_5.y) - Yxy_5.z)) / Yxy_5.z);
  color_3.xyz = (mat3(2.5651, -1.0217, 0.0753, -1.1665, 1.9777, -0.2543, -0.3986, 0.0439, 1.1892) * XYZ_9);
  gl_FragData[0] = color_3;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _Curve;
uniform highp float _RangeScale;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float newLum_1;
  highp vec3 cie_2;
  highp vec4 color_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_3 = tmpvar_4;
  highp vec3 Yxy_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = (mat3(0.514136, 0.265068, 0.0241188, 0.323879, 0.670234, 0.122818, 0.160364, 0.0640916, 0.844427) * color_3.xyz);
  Yxy_5.x = tmpvar_6.y;
  Yxy_5.yz = (tmpvar_6.xy / dot (vec3(1.0, 1.0, 1.0), tmpvar_6));
  cie_2.yz = Yxy_5.yz;
  highp vec2 tmpvar_7;
  tmpvar_7.y = 0.5;
  tmpvar_7.x = (tmpvar_6.y * _RangeScale);
  lowp float tmpvar_8;
  tmpvar_8 = texture2D (_Curve, tmpvar_7).x;
  newLum_1 = tmpvar_8;
  cie_2.x = newLum_1;
  highp vec3 XYZ_9;
  XYZ_9.x = ((newLum_1 * Yxy_5.y) / Yxy_5.z);
  XYZ_9.y = cie_2.x;
  XYZ_9.z = ((newLum_1 * ((1.0 - Yxy_5.y) - Yxy_5.z)) / Yxy_5.z);
  color_3.xyz = (mat3(2.5651, -1.0217, 0.0753, -1.1665, 1.9777, -0.2543, -0.3986, 0.0439, 1.1892) * XYZ_9);
  gl_FragData[0] = color_3;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform sampler2D _Curve;
uniform highp float _RangeScale;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float newLum_1;
  highp vec3 cie_2;
  highp vec4 color_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  color_3 = tmpvar_4;
  highp vec3 Yxy_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = (mat3(0.514136, 0.265068, 0.0241188, 0.323879, 0.670234, 0.122818, 0.160364, 0.0640916, 0.844427) * color_3.xyz);
  Yxy_5.x = tmpvar_6.y;
  Yxy_5.yz = (tmpvar_6.xy / dot (vec3(1.0, 1.0, 1.0), tmpvar_6));
  cie_2.yz = Yxy_5.yz;
  highp vec2 tmpvar_7;
  tmpvar_7.y = 0.5;
  tmpvar_7.x = (tmpvar_6.y * _RangeScale);
  lowp float tmpvar_8;
  tmpvar_8 = texture (_Curve, tmpvar_7).x;
  newLum_1 = tmpvar_8;
  cie_2.x = newLum_1;
  highp vec3 XYZ_9;
  XYZ_9.x = ((newLum_1 * Yxy_5.y) / Yxy_5.z);
  XYZ_9.y = cie_2.x;
  XYZ_9.z = ((newLum_1 * ((1.0 - Yxy_5.y) - Yxy_5.z)) / Yxy_5.z);
  color_3.xyz = (mat3(2.5651, -1.0217, 0.0753, -1.1665, 1.9777, -0.2543, -0.3986, 0.0439, 1.1892) * XYZ_9);
  _glesFragData[0] = color_3;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 22 math, 2 textures
Float 0 [_RangeScale]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Curve] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[7] = { program.local[0],
		{ 0.075300001, -0.2543, 1.1892, 0.5 },
		{ 0.0241188, 0.1228178, 0.84442663, 1 },
		{ 0.26506799, 0.67023426, 0.064091571 },
		{ 0.51413637, 0.32387859, 0.16036376 },
		{ -1.0217, 1.9777, 0.043900002 },
		{ 2.5651, -1.1665, -0.39860001 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R1.z, R0, c[3];
DP3 R1.w, R0, c[2];
MOV R1.y, c[1].w;
MUL R1.x, R1.z, c[0];
MOV result.color.w, R0;
TEX R1.x, R1, texture[1], 2D;
DP3 R1.y, R0, c[4];
DP3 R0.x, R1.yzww, c[2].w;
RCP R0.x, R0.x;
MUL R0.xy, R1.yzzw, R0.x;
ADD R0.z, -R0.x, -R0.y;
ADD R0.z, R0, c[2].w;
RCP R0.y, R0.y;
MUL R0.x, R1, R0;
MUL R0.z, R1.x, R0;
MUL R0.z, R0, R0.y;
MUL R0.x, R0.y, R0;
MOV R0.y, R1.x;
DP3 result.color.z, R0, c[1];
DP3 result.color.y, R0, c[5];
DP3 result.color.x, R0, c[6];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math, 2 textures
Float 0 [_RangeScale]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Curve] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.02411880, 0.12281780, 0.84442663, 0.50000000
def c2, 0.26506799, 0.67023426, 0.06409157, 1.00000000
def c3, 0.51413637, 0.32387859, 0.16036376, 0
def c4, 0.07530000, -0.25430000, 1.18920004, 0
def c5, -1.02170002, 1.97770000, 0.04390000, 0
def c6, 2.56509995, -1.16649997, -0.39860001, 0
dcl t0.xy
texld r2, t0, s0
dp3 r0.x, r2, c2
dp3 r3.x, r2, c3
mov r3.y, r0.x
mul r1.x, r0, c0
dp3 r3.z, r2, c1
dp3 r0.x, r3, c2.w
mov r1.y, c1.w
rcp r0.x, r0.x
mul r0.xy, r3, r0.x
add r2.x, -r0, -r0.y
add r3.x, r2, c2.w
rcp r2.x, r0.y
texld r1, r1, s1
mul r0.x, r1, r0
mul r3.x, r1, r3
mul r0.z, r3.x, r2.x
mul r0.x, r2, r0
mov r0.y, r1.x
dp3 r1.z, r0, c4
dp3 r1.y, r0, c5
mov r1.w, r2
dp3 r1.x, r0, c6
mov oC0, r1
"
}
SubProgram "d3d11 " {
// Stats: 13 math, 2 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Curve] 2D 1
ConstBuffer "$Globals" 80
Float 72 [_RangeScale]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmenldgacjlelheikmefmjpoeckboofhpabaaaaaahaadaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefclaacaaaa
eaaaaaaakmaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaakecaabaaaabaaaaaa
aceaaaaamkjemfdmogihpldnficmfidpaaaaaaaaegacbaaaaaaaaaaabaaaaaak
bcaabaaaabaaaaaaaceaaaaahbjoaddpgkndkfdoggdgcedoaaaaaaaaegacbaaa
aaaaaaaabaaaaaakccaabaaaabaaaaaaaceaaaaapolgihdohjjecldphbeciddn
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
egacbaaaabaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaaabaaaaaaagaabaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaabaaaaaackiacaaaaaaaaaaa
aeaaaaaaaaaaaaaiecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaackaabaaa
aaaaaaaadgaaaaafccaabaaaabaaaaaaabeaaaaaaaaaaadpefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaabghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaah
fcaabaaaaaaaaaaaagacbaaaaaaaaaaafgafbaaaabaaaaaaaoaaaaahfcaabaaa
abaaaaaaagacbaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaakbccabaaaaaaaaaaa
aceaaaaajjckceeanpepjflpenbfmmloaaaaaaaaegacbaaaabaaaaaabaaaaaak
cccabaaaaaaaaaaaaceaaaaabbmhiclpegcfpndphnnadddnaaaaaaaaegacbaaa
abaaaaaabaaaaaakeccabaaaaaaaaaaaaceaaaaaoddgjkdnjmddiclolfdhjidp
aaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 13 math, 2 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Curve] 2D 1
ConstBuffer "$Globals" 80
Float 72 [_RangeScale]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkjeaggjcefmnhkgnoabdpnhlmhmpjjhlabaaaaaameafaaaaaeaaaaaa
daaaaaaaiaacaaaadiafaaaajaafaaaaebgpgodjeiacaaaaeiacaaaaaaacpppp
baacaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkapolgihdo
hjjecldphbeciddnaaaaaadpfbaaaaafacaaapkahbjoaddpgkndkfdoggdgcedo
aaaaiadpfbaaaaafadaaapkamkjemfdmogihpldnficmfidpaaaaaaaafbaaaaaf
aeaaapkajjckceeanpepjflpenbfmmloaaaaaaaafbaaaaafafaaapkabbmhiclp
egcfpndphnnadddnaaaaaaaafbaaaaafagaaapkaoddgjkdnjmddiclolfdhjidp
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaaiaaaaadabaaaeia
adaaoekaaaaaoeiaaiaaaaadabaaaciaabaaoekaaaaaoeiaafaaaaadacaaabia
abaaffiaaaaakkkaaiaaaaadabaaabiaacaaoekaaaaaoeiaaiaaaaadabaaaeia
acaappkaabaaoeiaagaaaaacabaaaeiaabaakkiaaeaaaaaeabaaaiiaabaaaaia
abaakkibacaappkaafaaaaadacaaamiaabaakkiaabaabliaaeaaaaaeabaaabia
abaaffiaabaakkibabaappiaabaaaaacacaaaciaabaappkaecaaaaadadaaapia
acaaoeiaabaioekaafaaaaadabaaabiaabaaaaiaadaaaaiaagaaaaacabaaacia
acaakkiaafaaaaadabaaaeiaacaappiaadaaaaiaabaaaaacacaaaciaadaaaaia
afaaaaadacaaabiaabaaffiaabaakkiaafaaaaadacaaaeiaabaaffiaabaaaaia
aiaaaaadaaaaabiaaeaaoekaacaaoeiaaiaaaaadaaaaaciaafaaoekaacaaoeia
aiaaaaadaaaaaeiaagaaoekaacaaoeiaabaaaaacaaaiapiaaaaaoeiappppaaaa
fdeieefclaacaaaaeaaaaaaakmaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaak
ecaabaaaabaaaaaaaceaaaaamkjemfdmogihpldnficmfidpaaaaaaaaegacbaaa
aaaaaaaabaaaaaakbcaabaaaabaaaaaaaceaaaaahbjoaddpgkndkfdoggdgcedo
aaaaaaaaegacbaaaaaaaaaaabaaaaaakccaabaaaabaaaaaaaceaaaaapolgihdo
hjjecldphbeciddnaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaa
abaaaaaaagaabaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaabaaaaaa
ckiacaaaaaaaaaaaaeaaaaaaaaaaaaaiecaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaackaabaaaaaaaaaaadgaaaaafccaabaaaabaaaaaaabeaaaaaaaaaaadp
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaabghobaaaabaaaaaaaagabaaa
abaaaaaadiaaaaahfcaabaaaaaaaaaaaagacbaaaaaaaaaaafgafbaaaabaaaaaa
aoaaaaahfcaabaaaabaaaaaaagacbaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaak
bccabaaaaaaaaaaaaceaaaaajjckceeanpepjflpenbfmmloaaaaaaaaegacbaaa
abaaaaaabaaaaaakcccabaaaaaaaaaaaaceaaaaabbmhiclpegcfpndphnnadddn
aaaaaaaaegacbaaaabaaaaaabaaaaaakeccabaaaaaaaaaaaaceaaaaaoddgjkdn
jmddiclolfdhjidpaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheofaaaaaaa
acaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
eeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Float 0 [_RangeScale]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Curve] 2D 1
"agal_ps
c1 0.024119 0.122818 0.844427 0.5
c2 0.265068 0.670234 0.064092 1.0
c3 0.514136 0.323879 0.160364 0.0
c4 0.0753 -0.2543 1.1892 0.0
c5 -1.0217 1.9777 0.0439 0.0
c6 2.5651 -1.1665 -0.3986 0.0
[bc]
ciaaaaaaacaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r2, v0, s0 <2d wrap linear point>
bcaaaaaaaaaaabacacaaaakeacaaaaaaacaaaaoeabaaaaaa dp3 r0.x, r2.xyzz, c2
bcaaaaaaadaaabacacaaaakeacaaaaaaadaaaaoeabaaaaaa dp3 r3.x, r2.xyzz, c3
aaaaaaaaadaaacacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa mov r3.y, r0.x
adaaaaaaabaaabacaaaaaaaaacaaaaaaaaaaaaoeabaaaaaa mul r1.x, r0.x, c0
bcaaaaaaadaaaeacacaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r3.z, r2.xyzz, c1
bcaaaaaaaaaaabacadaaaakeacaaaaaaacaaaappabaaaaaa dp3 r0.x, r3.xyzz, c2.w
aaaaaaaaabaaacacabaaaappabaaaaaaaaaaaaaaaaaaaaaa mov r1.y, c1.w
afaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, r0.x
adaaaaaaaaaaadacadaaaafeacaaaaaaaaaaaaaaacaaaaaa mul r0.xy, r3.xyyy, r0.x
bfaaaaaaacaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa neg r2.x, r0.x
acaaaaaaacaaabacacaaaaaaacaaaaaaaaaaaaffacaaaaaa sub r2.x, r2.x, r0.y
abaaaaaaadaaabacacaaaaaaacaaaaaaacaaaappabaaaaaa add r3.x, r2.x, c2.w
afaaaaaaacaaabacaaaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r2.x, r0.y
ciaaaaaaabaaapacabaaaafeacaaaaaaabaaaaaaafaababb tex r1, r1.xyyy, s1 <2d wrap linear point>
adaaaaaaaaaaabacabaaaaaaacaaaaaaaaaaaaaaacaaaaaa mul r0.x, r1.x, r0.x
adaaaaaaadaaabacabaaaaaaacaaaaaaadaaaaaaacaaaaaa mul r3.x, r1.x, r3.x
adaaaaaaaaaaaeacadaaaaaaacaaaaaaacaaaaaaacaaaaaa mul r0.z, r3.x, r2.x
adaaaaaaaaaaabacacaaaaaaacaaaaaaaaaaaaaaacaaaaaa mul r0.x, r2.x, r0.x
aaaaaaaaaaaaacacabaaaaaaacaaaaaaaaaaaaaaaaaaaaaa mov r0.y, r1.x
bcaaaaaaabaaaeacaaaaaakeacaaaaaaaeaaaaoeabaaaaaa dp3 r1.z, r0.xyzz, c4
bcaaaaaaabaaacacaaaaaakeacaaaaaaafaaaaoeabaaaaaa dp3 r1.y, r0.xyzz, c5
aaaaaaaaabaaaiacacaaaappacaaaaaaaaaaaaaaaaaaaaaa mov r1.w, r2.w
bcaaaaaaabaaabacaaaaaakeacaaaaaaagaaaaoeabaaaaaa dp3 r1.x, r0.xyzz, c6
aaaaaaaaaaaaapadabaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r1
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 9 math, 1 texture
 //    d3d11_9x : 9 math, 1 texture
 //        d3d9 : 13 math, 1 texture
 //      opengl : 14 math, 1 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec3 texColor_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  texColor_1 = tmpvar_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (2.0 * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (((((tmpvar_4 * ((0.15 * tmpvar_4) + 0.05)) + 0.004) / ((tmpvar_4 * ((0.15 * tmpvar_4) + 0.5)) + 0.06)) - 0.0666667) * vec3(1.37906, 1.37906, 1.37906));
  gl_FragData[0] = tmpvar_5;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec3 texColor_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
  texColor_1 = tmpvar_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (2.0 * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (((((tmpvar_4 * ((0.15 * tmpvar_4) + 0.05)) + 0.004) / ((tmpvar_4 * ((0.15 * tmpvar_4) + 0.5)) + 0.06)) - 0.0666667) * vec3(1.37906, 1.37906, 1.37906));
  gl_FragData[0] = tmpvar_5;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec3 texColor_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = texture (_MainTex, xlv_TEXCOORD0).xyz;
  texColor_1 = tmpvar_2;
  highp vec3 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = (2.0 * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (((((tmpvar_4 * ((0.15 * tmpvar_4) + 0.05)) + 0.004) / ((tmpvar_4 * ((0.15 * tmpvar_4) + 0.5)) + 0.06)) - 0.0666667) * vec3(1.37906, 1.37906, 1.37906));
  _glesFragData[0] = tmpvar_5;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 14 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[4] = { program.local[0],
		{ 2, 0.15000001, 0.050000001, 0.0040000002 },
		{ 0.5, 0.060000002, 0.066666663, 1.3790643 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, c[0].x;
MUL R1.xyz, R0, c[1].x;
MUL R0.xyz, R1, c[1].y;
ADD R2.xyz, R0, c[2].x;
MAD R0.xyz, R1, c[1].y, c[1].z;
MAD R2.xyz, R1, R2, c[2].y;
MAD R0.xyz, R1, R0, c[1].w;
RCP R1.x, R2.x;
RCP R1.z, R2.z;
RCP R1.y, R2.y;
MAD R0.xyz, R0, R1, -c[2].z;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[3].x;
END
# 14 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 13 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 2.00000000, 0.15000001, 0.05000000, 0.00400000
def c2, 0.15000001, 0.50000000, 0.06000000, -0.06666666
def c3, 1.37906432, 1.00000000, 0, 0
dcl t0.xy
texld r0, t0, s0
mul r0.xyz, r0, c0.x
mul r0.xyz, r0, c1.x
mad r2.xyz, r0, c2.x, c2.y
mad r1.xyz, r0, c1.y, c1.z
mad r2.xyz, r0, r2, c2.z
mad r0.xyz, r0, r1, c1.w
rcp r1.x, r2.x
rcp r1.z, r2.z
rcp r1.y, r2.y
mad r0.xyz, r0, r1, c2.w
mov r0.w, c3.y
mul r0.xyz, r0, c3.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0
eefiecededbdjigaaodkbjfmajdbopfnaojljfffabaaaaaanaacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaacaaaa
eaaaaaaaieaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaadcaaaaaphcaabaaa
abaaaaaaegacbaaaaaaaaaaaaceaaaaajkjjjjdojkjjjjdojkjjjjdoaaaaaaaa
aceaaaaamnmmemdnmnmmemdnmnmmemdnaaaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaphcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaajkjjjjdojkjjjjdojkjjjjdoaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadcaaaaamhcaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaaceaaaaaipmchfdnipmchfdnipmchfdnaaaaaaaadcaaaaam
hcaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaceaaaaagpbciddl
gpbciddlgpbciddlaaaaaaaaaoaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaaaaaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
ijiiiilnijiiiilnijiiiilnaaaaaaaadiaaaaakhccabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaacoifladpcoifladpcoifladpaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedilheljlblebndikbpogmnabgifaphkapabaaaaaaeaaeaaaaaeaaaaaa
daaaaaaajmabaaaaleadaaaaamaeaaaaebgpgodjgeabaaaageabaaaaaaacpppp
daabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkajkjjjjdomnmmemdn
gpbciddlaaaaaadpfbaaaaafacaaapkaipmchfdnijiiiilncoifladpaaaaiadp
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaafaaaaadaaaaahiaaaaaoeiaaaaaffkaaeaaaaaeabaaahia
aaaaoeiaabaaaakaabaaffkaacaaaaadacaaahiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaahiaaaaaoeiaabaaaakaabaappkaaeaaaaaeaaaaahiaacaaoeiaaaaaoeia
acaaaakaaeaaaaaeabaaahiaacaaoeiaabaaoeiaabaakkkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaaeaaaaae
aaaaahiaabaaoeiaacaaoeiaacaaffkaafaaaaadaaaaahiaaaaaoeiaacaakkka
abaaaaacaaaaaiiaacaappkaabaaaaacaaaiapiaaaaaoeiappppaaaafdeieefc
baacaaaaeaaaaaaaieaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaadcaaaaap
hcaabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaajkjjjjdojkjjjjdojkjjjjdo
aaaaaaaaaceaaaaamnmmemdnmnmmemdnmnmmemdnaaaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaphcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaajkjjjjdojkjjjjdojkjjjjdoaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadcaaaaamhcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaaaceaaaaaipmchfdnipmchfdnipmchfdnaaaaaaaa
dcaaaaamhcaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaceaaaaa
gpbciddlgpbciddlgpbciddlaaaaaaaaaoaaaaahhcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaaaaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaijiiiilnijiiiilnijiiiilnaaaaaaaadiaaaaakhccabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaacoifladpcoifladpcoifladpaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 2.0 0.15 0.05 0.004
c2 0.15 0.5 0.06 -0.066667
c3 1.379064 1.0 0.0 0.0
[bc]
ciaaaaaaaaaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r0, v0, s0 <2d wrap linear point>
adaaaaaaaaaaahacaaaaaakeacaaaaaaaaaaaaaaabaaaaaa mul r0.xyz, r0.xyzz, c0.x
adaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaaaaabaaaaaa mul r0.xyz, r0.xyzz, c1.x
adaaaaaaacaaahacaaaaaakeacaaaaaaacaaaaaaabaaaaaa mul r2.xyz, r0.xyzz, c2.x
abaaaaaaacaaahacacaaaakeacaaaaaaacaaaaffabaaaaaa add r2.xyz, r2.xyzz, c2.y
adaaaaaaabaaahacaaaaaakeacaaaaaaabaaaaffabaaaaaa mul r1.xyz, r0.xyzz, c1.y
abaaaaaaabaaahacabaaaakeacaaaaaaabaaaakkabaaaaaa add r1.xyz, r1.xyzz, c1.z
adaaaaaaacaaahacaaaaaakeacaaaaaaacaaaakeacaaaaaa mul r2.xyz, r0.xyzz, r2.xyzz
abaaaaaaacaaahacacaaaakeacaaaaaaacaaaakkabaaaaaa add r2.xyz, r2.xyzz, c2.z
adaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaakeacaaaaaa mul r0.xyz, r0.xyzz, r1.xyzz
abaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaappabaaaaaa add r0.xyz, r0.xyzz, c1.w
afaaaaaaabaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r1.x, r2.x
afaaaaaaabaaaeacacaaaakkacaaaaaaaaaaaaaaaaaaaaaa rcp r1.z, r2.z
afaaaaaaabaaacacacaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r1.y, r2.y
adaaaaaaaaaaahacaaaaaakeacaaaaaaabaaaakeacaaaaaa mul r0.xyz, r0.xyzz, r1.xyzz
abaaaaaaaaaaahacaaaaaakeacaaaaaaacaaaappabaaaaaa add r0.xyz, r0.xyzz, c2.w
aaaaaaaaaaaaaiacadaaaaffabaaaaaaaaaaaaaaaaaaaaaa mov r0.w, c3.y
adaaaaaaaaaaahacaaaaaakeacaaaaaaadaaaaaaabaaaaaa mul r0.xyz, r0.xyzz, c3.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 6 math, 1 texture
 //    d3d11_9x : 6 math, 1 texture
 //        d3d9 : 10 math, 1 texture
 //      opengl : 10 math, 1 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float lum_1;
  highp vec4 texColor_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_2 = tmpvar_3;
  lowp vec3 c_4;
  c_4 = texColor_2.xyz;
  lowp float tmpvar_5;
  tmpvar_5 = dot (c_4, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = (lum_1 * _ExposureAdjustment);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((texColor_2.xyz * (tmpvar_6 / (1.0 + tmpvar_6))) / lum_1);
  tmpvar_7.w = texColor_2.w;
  gl_FragData[0] = tmpvar_7;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float lum_1;
  highp vec4 texColor_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_2 = tmpvar_3;
  lowp vec3 c_4;
  c_4 = texColor_2.xyz;
  lowp float tmpvar_5;
  tmpvar_5 = dot (c_4, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = (lum_1 * _ExposureAdjustment);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((texColor_2.xyz * (tmpvar_6 / (1.0 + tmpvar_6))) / lum_1);
  tmpvar_7.w = texColor_2.w;
  gl_FragData[0] = tmpvar_7;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float lum_1;
  highp vec4 texColor_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (_MainTex, xlv_TEXCOORD0);
  texColor_2 = tmpvar_3;
  lowp vec3 c_4;
  c_4 = texColor_2.xyz;
  lowp float tmpvar_5;
  tmpvar_5 = dot (c_4, vec3(0.22, 0.707, 0.071));
  lum_1 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = (lum_1 * _ExposureAdjustment);
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = ((texColor_2.xyz * (tmpvar_6 / (1.0 + tmpvar_6))) / lum_1);
  tmpvar_7.w = texColor_2.w;
  _glesFragData[0] = tmpvar_7;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 10 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 0.2199707, 0.70703125, 0.070983887, 1 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R1.x, R0, c[1];
MUL R1.y, R1.x, c[0].x;
ADD R1.z, R1.y, c[1].w;
RCP R1.z, R1.z;
MUL R1.y, R1, R1.z;
RCP R1.x, R1.x;
MUL R0.xyz, R0, R1.y;
MUL result.color.xyz, R0, R1.x;
MOV result.color.w, R0;
END
# 10 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 10 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.21997070, 0.70703125, 0.07098389, 1.00000000
dcl t0.xy
texld r3, t0, s0
dp3_pp r0.x, r3, c1
mul r1.x, r0, c0
add r2.x, r1, c1.w
rcp r2.x, r2.x
mul r1.x, r1, r2
mul r1.xyz, r3, r1.x
rcp r0.x, r0.x
mov r0.w, r3
mul r0.xyz, r1, r0.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 6 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgdadabfbipjkkcjodjcdmempaoblkcbeabaaaaaabeacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfeabaaaa
eaaaaaaaffaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaakbcaabaaa
abaaaaaaegacbaaaaaaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
diaaaaaiccaabaaaabaaaaaaakaabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaa
dcaaaaakecaabaaaabaaaaaaakaabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaa
abeaaaaaaaaaiadpaoaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaackaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaafgafbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaaaoaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaagaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 6 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpangiahlcmkmidamjbdobjcnmnpocodpabaaaaaadaadaaaaaeaaaaaa
daaaaaaaeiabaaaakeacaaaapmacaaaaebgpgodjbaabaaaabaabaaaaaaacpppp
nmaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkakoehgbdopepndedp
hdgijbdnaaaaiadpbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaaiaaaaadabaaciiaaaaaoeiaabaaoeka
abaaaaacacaaaiiaabaappkaaeaaaaaeabaaabiaabaappiaaaaaffkaacaappia
agaaaaacabaaabiaabaaaaiaafaaaaadabaaaciaabaappiaaaaaffkaagaaaaac
abaaaeiaabaappiaafaaaaadabaaabiaabaaaaiaabaaffiaafaaaaadacaaahia
aaaaoeiaabaaaaiaafaaaaadaaaaahiaabaakkiaacaaoeiaabaaaaacaaaiapia
aaaaoeiappppaaaafdeieefcfeabaaaaeaaaaaaaffaaaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaabaaaaaakbcaabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaa
koehgbdopepndedphdgijbdnaaaaaaaadiaaaaaiccaabaaaabaaaaaaakaabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaadcaaaaakecaabaaaabaaaaaaakaabaaa
abaaaaaabkiacaaaaaaaaaaaaeaaaaaaabeaaaaaaaaaiadpaoaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaafgafbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaaaoaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaabaaaaaa
doaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 0.219971 0.707031 0.070984 1.0
[bc]
ciaaaaaaadaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r3, v0, s0 <2d wrap linear point>
bcaaaaaaaaaaabacadaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r0.x, r3.xyzz, c1
adaaaaaaabaaabacaaaaaaaaacaaaaaaaaaaaaoeabaaaaaa mul r1.x, r0.x, c0
abaaaaaaacaaabacabaaaaaaacaaaaaaabaaaappabaaaaaa add r2.x, r1.x, c1.w
afaaaaaaacaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r2.x, r2.x
adaaaaaaabaaabacabaaaaaaacaaaaaaacaaaaaaacaaaaaa mul r1.x, r1.x, r2.x
adaaaaaaabaaahacadaaaakeacaaaaaaabaaaaaaacaaaaaa mul r1.xyz, r3.xyzz, r1.x
afaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, r0.x
aaaaaaaaaaaaaiacadaaaappacaaaaaaaaaaaaaaaaaaaaaa mov r0.w, r3.w
adaaaaaaaaaaahacabaaaakeacaaaaaaaaaaaaaaacaaaaaa mul r0.xyz, r1.xyzz, r0.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 8 math, 1 texture
 //    d3d11_9x : 8 math, 1 texture
 //        d3d9 : 14 math, 1 texture
 //      opengl : 15 math, 1 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = max (vec4(0.0, 0.0, 0.0, 0.0), (tmpvar_3 - 0.004));
  highp vec4 tmpvar_5;
  tmpvar_5 = ((tmpvar_4 * ((6.2 * tmpvar_4) + 0.5)) / ((tmpvar_4 * ((6.2 * tmpvar_4) + 1.7)) + 0.06));
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * tmpvar_5);
  gl_FragData[0] = tmpvar_6;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = max (vec4(0.0, 0.0, 0.0, 0.0), (tmpvar_3 - 0.004));
  highp vec4 tmpvar_5;
  tmpvar_5 = ((tmpvar_4 * ((6.2 * tmpvar_4) + 0.5)) / ((tmpvar_4 * ((6.2 * tmpvar_4) + 1.7)) + 0.06));
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * tmpvar_5);
  gl_FragData[0] = tmpvar_6;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (texColor_1 * _ExposureAdjustment);
  texColor_1 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = max (vec4(0.0, 0.0, 0.0, 0.0), (tmpvar_3 - 0.004));
  highp vec4 tmpvar_5;
  tmpvar_5 = ((tmpvar_4 * ((6.2 * tmpvar_4) + 0.5)) / ((tmpvar_4 * ((6.2 * tmpvar_4) + 1.7)) + 0.06));
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * tmpvar_5);
  _glesFragData[0] = tmpvar_6;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 15 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0],
		{ 0.0040000002, 0, 6.1999998, 0.5 },
		{ 1.7, 0.059999999 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, c[0].x;
ADD R0, R0, -c[1].x;
MAX R0, R0, c[1].y;
MUL R1, R0, c[1].z;
ADD R2, R1, c[2].x;
MAD R1, R0, c[1].z, c[1].w;
MAD R2, R0, R2, c[2].y;
MUL R0, R0, R1;
RCP R1.x, R2.x;
RCP R1.y, R2.y;
RCP R1.w, R2.w;
RCP R1.z, R2.z;
MUL R0, R0, R1;
MUL result.color, R0, R0;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 14 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, -0.00400000, 0.00000000, 6.19999981, 0.50000000
def c2, 6.19999981, 1.70000005, 0.06000000, 0
dcl t0.xy
texld r0, t0, s0
mul r0, r0, c0.x
add r0, r0, c1.x
max r0, r0, c1.y
mad r2, r0, c2.x, c2.y
mad r1, r0, c1.z, c1.w
mad r2, r0, r2, c2.z
mul r0, r0, r1
rcp r1.x, r2.x
rcp r1.y, r2.y
rcp r1.w, r2.w
rcp r1.z, r2.z
mul r0, r0, r1
mul r0, r0, r0
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 8 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaackhcdbgbjgdieiikljbooaphmhnihoabaaaaaajeacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcneabaaaa
eaaaaaaahfaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaanpcaabaaa
aaaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaaceaaaaagpbcidll
gpbcidllgpbcidllgpbcidlldeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaaaaaaaaaaceaaaaaggggmgeaggggmgeaggggmgeaggggmgeaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaadpdiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaaaaaaaaa
aceaaaaaggggmgeaggggmgeaggggmgeaggggmgeaaceaaaaajkjjnjdpjkjjnjdp
jkjjnjdpjkjjnjdpdcaaaaampcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaaipmchfdnipmchfdnipmchfdnipmchfdnaoaaaaahpcaabaaa
aaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 8 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcfklajceadjfjmeeecdfeggkgbnlkeafabaaaaaaamaeaaaaaeaaaaaa
daaaaaaakeabaaaaiaadaaaaniadaaaaebgpgodjgmabaaaagmabaaaaaaacpppp
diabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkagpbcidllaaaaaaaa
ggggmgeaaaaaaadpfbaaaaafacaaapkaggggmgeajkjjnjdpipmchfdnaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaabaaaaacabaaaiiaabaaaakaaeaaaaaeaaaaapiaaaaaoeia
aaaaffkaabaappiaalaaaaadabaaapiaaaaaoeiaabaaffkaaeaaaaaeaaaaapia
abaaoeiaabaakkkaabaappkaafaaaaadaaaaapiaaaaaoeiaabaaoeiaaeaaaaae
acaaapiaabaaoeiaacaaaakaacaaffkaaeaaaaaeabaaapiaabaaoeiaacaaoeia
acaakkkaagaaaaacacaaabiaabaaaaiaagaaaaacacaaaciaabaaffiaagaaaaac
acaaaeiaabaakkiaagaaaaacacaaaiiaabaappiaafaaaaadaaaaapiaaaaaoeia
acaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaabaaaaacaaaiapiaaaaaoeia
ppppaaaafdeieefcneabaaaaeaaaaaaahfaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaa
aeaaaaaaaceaaaaagpbcidllgpbcidllgpbcidllgpbcidlldeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaaaaaaaaaaceaaaaaggggmgeaggggmgea
ggggmgeaggggmgeaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaadpdiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaaaaaaaaaaceaaaaaggggmgeaggggmgeaggggmgeaggggmgea
aceaaaaajkjjnjdpjkjjnjdpjkjjnjdpjkjjnjdpdcaaaaampcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaaipmchfdnipmchfdnipmchfdn
ipmchfdnaoaaaaahpcaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaa
diaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadoaaaaab
ejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 -0.004 0.0 6.2 0.5
c2 6.2 1.7 0.06 0.0
[bc]
ciaaaaaaaaaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r0, v0, s0 <2d wrap linear point>
adaaaaaaaaaaapacaaaaaaoeacaaaaaaaaaaaaaaabaaaaaa mul r0, r0, c0.x
abaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaaaabaaaaaa add r0, r0, c1.x
ahaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaffabaaaaaa max r0, r0, c1.y
adaaaaaaacaaapacaaaaaaoeacaaaaaaacaaaaaaabaaaaaa mul r2, r0, c2.x
abaaaaaaacaaapacacaaaaoeacaaaaaaacaaaaffabaaaaaa add r2, r2, c2.y
adaaaaaaabaaapacaaaaaaoeacaaaaaaabaaaakkabaaaaaa mul r1, r0, c1.z
abaaaaaaabaaapacabaaaaoeacaaaaaaabaaaappabaaaaaa add r1, r1, c1.w
adaaaaaaacaaapacaaaaaaoeacaaaaaaacaaaaoeacaaaaaa mul r2, r0, r2
abaaaaaaacaaapacacaaaaoeacaaaaaaacaaaakkabaaaaaa add r2, r2, c2.z
adaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaoeacaaaaaa mul r0, r0, r1
afaaaaaaabaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r1.x, r2.x
afaaaaaaabaaacacacaaaaffacaaaaaaaaaaaaaaaaaaaaaa rcp r1.y, r2.y
afaaaaaaabaaaiacacaaaappacaaaaaaaaaaaaaaaaaaaaaa rcp r1.w, r2.w
afaaaaaaabaaaeacacaaaakkacaaaaaaaaaaaaaaaaaaaaaa rcp r1.z, r2.z
adaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaoeacaaaaaa mul r0, r0, r1
adaaaaaaaaaaapacaaaaaaoeacaaaaaaaaaaaaoeacaaaaaa mul r0, r0, r0
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 3 math, 1 texture
 //    d3d11_9x : 3 math, 1 texture
 //        d3d9 : 7 math, 1 texture
 //      opengl : 7 math, 1 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (1.0 - exp2((-(_ExposureAdjustment) * texColor_1)));
  gl_FragData[0] = tmpvar_3;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (1.0 - exp2((-(_ExposureAdjustment) * texColor_1)));
  gl_FragData[0] = tmpvar_3;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp float _ExposureAdjustment;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 texColor_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (_MainTex, xlv_TEXCOORD0);
  texColor_1 = tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (1.0 - exp2((-(_ExposureAdjustment) * texColor_1)));
  _glesFragData[0] = tmpvar_3;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 7 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 1 } };
TEMP R0;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, -c[0].x;
EX2 R0.x, R0.x;
EX2 R0.y, R0.y;
EX2 R0.w, R0.w;
EX2 R0.z, R0.z;
ADD result.color, -R0, c[1].x;
END
# 7 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 7 math, 1 textures
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 1.00000000, 0, 0, 0
dcl t0.xy
texld r0, t0, s0
mul r0, r0, -c0.x
exp r0.x, r0.x
exp r0.y, r0.y
exp r0.w, r0.w
exp r0.z, r0.z
add r0, -r0, c1.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 3 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaeldalmdjimghlmopgomhonfgiimmebdabaaaaaakaabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoaaaaaaa
eaaaaaaadiaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaajpcaabaaa
aaaaaaaaegaobaaaaaaaaaaafgifcaiaebaaaaaaaaaaaaaaaeaaaaaabjaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaaaaaaalpccabaaaaaaaaaaaegaobaia
ebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 3 math, 1 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Float 68 [_ExposureAdjustment]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedimhjadfiehefnmkfpanocbfadelnfpkjabaaaaaaieacaaaaaeaaaaaa
daaaaaaabaabaaaapiabaaaafaacaaaaebgpgodjniaaaaaaniaaaaaaaaacpppp
keaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaafaaaaadaaaaapiaaaaaoeiaaaaaffkb
aoaaaaacabaaabiaaaaaaaiaaoaaaaacabaaaciaaaaaffiaaoaaaaacabaaaeia
aaaakkiaaoaaaaacabaaaiiaaaaappiaacaaaaadaaaaapiaabaaoeibabaaaaka
abaaaaacaaaiapiaaaaaoeiappppaaaafdeieefcoaaaaaaaeaaaaaaadiaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaajpcaabaaaaaaaaaaaegaobaaa
aaaaaaaafgifcaiaebaaaaaaaaaaaaaaaeaaaaaabjaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaaaaaaalpccabaaaaaaaaaaaegaobaiaebaaaaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdoaaaaabejfdeheofaaaaaaa
acaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
eeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Float 0 [_ExposureAdjustment]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 1.0 0.0 0.0 0.0
[bc]
ciaaaaaaaaaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r0, v0, s0 <2d wrap linear point>
aaaaaaaaabaaapacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1, c0
bfaaaaaaabaaabacabaaaaaaacaaaaaaaaaaaaaaaaaaaaaa neg r1.x, r1.x
adaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaaaacaaaaaa mul r0, r0, r1.x
anaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa exp r0.x, r0.x
anaaaaaaaaaaacacaaaaaaffacaaaaaaaaaaaaaaaaaaaaaa exp r0.y, r0.y
anaaaaaaaaaaaiacaaaaaappacaaaaaaaaaaaaaaaaaaaaaa exp r0.w, r0.w
anaaaaaaaaaaaeacaaaaaakkacaaaaaaaaaaaaaaaaaaaaaa exp r0.z, r0.z
bfaaaaaaaaaaapacaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa neg r0, r0
abaaaaaaaaaaapacaaaaaaoeacaaaaaaabaaaaaaabaaaaaa add r0, r0, c1.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 9 math, 4 texture
 //    d3d11_9x : 9 math, 4 texture
 //        d3d9 : 16 math, 4 texture
 //      opengl : 16 math, 4 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 average_1;
  highp vec4 tapD_2;
  highp vec4 tapC_3;
  highp vec4 tapB_4;
  highp vec4 tapA_5;
  lowp vec4 tmpvar_6;
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize * 0.5).xy);
  tmpvar_6 = texture2D (_MainTex, P_7);
  tapA_5 = tmpvar_6;
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 - (_MainTex_TexelSize * 0.5).xy);
  tmpvar_8 = texture2D (_MainTex, P_9);
  tapB_4 = tmpvar_8;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_10 = texture2D (_MainTex, P_11);
  tapC_3 = tmpvar_10;
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = (xlv_TEXCOORD0 - (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_12 = texture2D (_MainTex, P_13);
  tapD_2 = tmpvar_12;
  average_1.xzw = ((((tapA_5 + tapB_4) + tapC_3) + tapD_2) / 4.0).xzw;
  average_1.y = max (max (tapA_5.y, tapB_4.y), max (tapC_3.y, tapD_2.y));
  gl_FragData[0] = average_1;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 average_1;
  highp vec4 tapD_2;
  highp vec4 tapC_3;
  highp vec4 tapB_4;
  highp vec4 tapA_5;
  lowp vec4 tmpvar_6;
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize * 0.5).xy);
  tmpvar_6 = texture2D (_MainTex, P_7);
  tapA_5 = tmpvar_6;
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 - (_MainTex_TexelSize * 0.5).xy);
  tmpvar_8 = texture2D (_MainTex, P_9);
  tapB_4 = tmpvar_8;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_10 = texture2D (_MainTex, P_11);
  tapC_3 = tmpvar_10;
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = (xlv_TEXCOORD0 - (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_12 = texture2D (_MainTex, P_13);
  tapD_2 = tmpvar_12;
  average_1.xzw = ((((tapA_5 + tapB_4) + tapC_3) + tapD_2) / 4.0).xzw;
  average_1.y = max (max (tapA_5.y, tapB_4.y), max (tapC_3.y, tapD_2.y));
  gl_FragData[0] = average_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_TexelSize;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 average_1;
  highp vec4 tapD_2;
  highp vec4 tapC_3;
  highp vec4 tapB_4;
  highp vec4 tapA_5;
  lowp vec4 tmpvar_6;
  highp vec2 P_7;
  P_7 = (xlv_TEXCOORD0 + (_MainTex_TexelSize * 0.5).xy);
  tmpvar_6 = texture (_MainTex, P_7);
  tapA_5 = tmpvar_6;
  lowp vec4 tmpvar_8;
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 - (_MainTex_TexelSize * 0.5).xy);
  tmpvar_8 = texture (_MainTex, P_9);
  tapB_4 = tmpvar_8;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_10 = texture (_MainTex, P_11);
  tapC_3 = tmpvar_10;
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = (xlv_TEXCOORD0 - (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  tmpvar_12 = texture (_MainTex, P_13);
  tapD_2 = tmpvar_12;
  average_1.xzw = ((((tapA_5 + tapB_4) + tapC_3) + tapD_2) / 4.0).xzw;
  average_1.y = max (max (tapA_5.y, tapB_4.y), max (tapC_3.y, tapD_2.y));
  _glesFragData[0] = average_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 16 math, 4 textures
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 0.25, 0.5, -0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xy, c[1].yzzw;
MAD R1.zw, R1.xyxy, -c[0].xyxy, fragment.texcoord[0].xyxy;
MAD R0.zw, R1.x, -c[0].xyxy, fragment.texcoord[0].xyxy;
MAD R0.xy, R1.x, c[0], fragment.texcoord[0];
MAD R1.xy, R1, c[0], fragment.texcoord[0];
TEX R3, R1.zwzw, texture[0], 2D;
TEX R2, R1, texture[0], 2D;
TEX R1, R0.zwzw, texture[0], 2D;
TEX R0, R0, texture[0], 2D;
ADD R0.xzw, R0, R1;
ADD R0.xzw, R2, R0;
ADD R0.xzw, R3, R0;
MUL result.color.xzw, R0, c[1].x;
MAX R0.z, R2.y, R3.y;
MAX R0.x, R0.y, R1.y;
MAX result.color.y, R0.x, R0.z;
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 16 math, 4 textures
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.50000000, -0.50000000, 0.25000000, 0
dcl t0.xy
mov r1.xy, c0
mad r3.xy, c1.x, r1, t0
mov r0.xy, c0
mad r2.xy, c1.x, -r0, t0
mov r0.xy, c0
mov r1.xy, c0
mad r0.xy, c1, -r0, t0
mad r1.xy, c1, r1, t0
texld r0, r0, s0
texld r1, r1, s0
texld r2, r2, s0
texld r3, r3, s0
add r2.xzw, r3, r2
add r1.xzw, r1, r2
add r0.xzw, r0, r1
mul r1.xzw, r0, c1.z
max r0.x, r1.y, r0.y
max r2.x, r3.y, r2.y
max r1.y, r2.x, r0.x
mov oC0, r1
"
}
SubProgram "d3d11 " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpchokhokebkemnbngoapgmcoikinfbfkabaaaaaaoeacaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcceacaaaa
eaaaaaaaijaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaanpcaabaaaaaaaaaaa
egiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaalp
egbebaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaaopcaabaaaacaaaaaaegiecaia
ebaaaaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaalp
egbebaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaogakbaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahncaabaaaabaaaaaaagaobaaa
abaaaaaaagaobaaaadaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaadaaaaaaaaaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaaagaobaaa
abaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaacaaaaaa
aaaaaaahncaabaaaaaaaaaaaagaobaaaacaaaaaaagaobaaaaaaaaaaadiaaaaak
nccabaaaaaaaaaaaagaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaaaaaaaaaiado
aaaaiadodeaaaaahcccabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 9 math, 4 textures
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_TexelSize]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmppgdmejfjhijbklaabimmpkpckhjogdabaaaaaapeaeaaaaaeaaaaaa
daaaaaaadmacaaaagiaeaaaamaaeaaaaebgpgodjaeacaaaaaeacaaaaaaacpppp
naabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadpaaaaaalp
aaaaiadoaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapka
abaaaaacaaaaadiaabaaoekaaeaaaaaeabaaadiaaaaaoekaaaaaaaiaaaaaoela
aeaaaaaeacaaadiaaaaaoekaaaaaaaibaaaaoelaaeaaaaaeadaaadiaaaaaoeka
aaaaoeiaaaaaoelaaeaaaaaeaaaaadiaaaaaoekaaaaaoeibaaaaoelaecaaaaad
abaaapiaabaaoeiaaaaioekaecaaaaadacaaapiaacaaoeiaaaaioekaecaaaaad
adaaapiaadaaoeiaaaaioekaecaaaaadaaaaapiaaaaaoeiaaaaioekaacaaaaad
aeaaabiaabaaaaiaacaaaaiaacaaaaadaeaaaciaabaakkiaacaakkiaacaaaaad
aeaaaeiaabaappiaacaappiaalaaaaadaeaaaiiaabaaffiaacaaffiaacaaaaad
abaaabiaadaaaaiaaeaaaaiaacaaaaadabaaaciaadaakkiaaeaaffiaacaaaaad
abaaaeiaadaappiaaeaakkiaacaaaaadacaaabiaaaaaaaiaabaaaaiaacaaaaad
acaaaciaaaaakkiaabaaffiaacaaaaadacaaaeiaaaaappiaabaakkiaalaaaaad
acaaaiiaadaaffiaaaaaffiaalaaaaadaaaaaciaaeaappiaacaappiaafaaaaad
aaaaabiaacaaaaiaabaakkkaafaaaaadaaaaaeiaacaaffiaabaakkkaafaaaaad
aaaaaiiaacaakkiaabaakkkaabaaaaacaaaiapiaaaaaoeiappppaaaafdeieefc
ceacaaaaeaaaaaaaijaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaanpcaabaaa
aaaaaaaaegiecaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaalpegbebaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaaopcaabaaaacaaaaaa
egiecaiaebaaaaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaalpegbebaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaogakbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahncaabaaaabaaaaaa
agaobaaaabaaaaaaagaobaaaadaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaadaaaaaaaaaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agaobaaaabaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
acaaaaaaaaaaaaahncaabaaaaaaaaaaaagaobaaaacaaaaaaagaobaaaaaaaaaaa
diaaaaaknccabaaaaaaaaaaaagaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaaaaa
aaaaiadoaaaaiadodeaaaaahcccabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
abaaaaaadoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_MainTex_TexelSize]
SetTexture 0 [_MainTex] 2D 0
"agal_ps
c1 0.5 -0.5 0.25 0.0
[bc]
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
adaaaaaaadaaadacabaaaaaaabaaaaaaabaaaafeacaaaaaa mul r3.xy, c1.x, r1.xyyy
abaaaaaaadaaadacadaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r3.xy, r3.xyyy, v0
aaaaaaaaaaaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r0.xy, c0
bfaaaaaaacaaadacaaaaaafeacaaaaaaaaaaaaaaaaaaaaaa neg r2.xy, r0.xyyy
adaaaaaaacaaadacabaaaaaaabaaaaaaacaaaafeacaaaaaa mul r2.xy, c1.x, r2.xyyy
abaaaaaaacaaadacacaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r2.xy, r2.xyyy, v0
aaaaaaaaaaaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r0.xy, c0
aaaaaaaaabaaadacaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov r1.xy, c0
bfaaaaaaaaaaadacaaaaaafeacaaaaaaaaaaaaaaaaaaaaaa neg r0.xy, r0.xyyy
adaaaaaaaaaaadacabaaaaoeabaaaaaaaaaaaafeacaaaaaa mul r0.xy, c1, r0.xyyy
abaaaaaaaaaaadacaaaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r0.xy, r0.xyyy, v0
adaaaaaaabaaadacabaaaaoeabaaaaaaabaaaafeacaaaaaa mul r1.xy, c1, r1.xyyy
abaaaaaaabaaadacabaaaafeacaaaaaaaaaaaaoeaeaaaaaa add r1.xy, r1.xyyy, v0
ciaaaaaaaaaaapacaaaaaafeacaaaaaaaaaaaaaaafaababb tex r0, r0.xyyy, s0 <2d wrap linear point>
ciaaaaaaabaaapacabaaaafeacaaaaaaaaaaaaaaafaababb tex r1, r1.xyyy, s0 <2d wrap linear point>
ciaaaaaaacaaapacacaaaafeacaaaaaaaaaaaaaaafaababb tex r2, r2.xyyy, s0 <2d wrap linear point>
ciaaaaaaadaaapacadaaaafeacaaaaaaaaaaaaaaafaababb tex r3, r3.xyyy, s0 <2d wrap linear point>
abaaaaaaacaaanacadaaaaomacaaaaaaacaaaaomacaaaaaa add r2.xzw, r3.xwzw, r2.xwzw
abaaaaaaabaaanacabaaaaomacaaaaaaacaaaaomacaaaaaa add r1.xzw, r1.xwzw, r2.xwzw
abaaaaaaaaaaanacaaaaaaomacaaaaaaabaaaaomacaaaaaa add r0.xzw, r0.xwzw, r1.xwzw
adaaaaaaabaaanacaaaaaaomacaaaaaaabaaaakkabaaaaaa mul r1.xzw, r0.xwzw, c1.z
ahaaaaaaaaaaabacabaaaaffacaaaaaaaaaaaaffacaaaaaa max r0.x, r1.y, r0.y
ahaaaaaaacaaabacadaaaaffacaaaaaaacaaaaffacaaaaaa max r2.x, r3.y, r2.y
ahaaaaaaabaaacacacaaaaaaacaaaaaaaaaaaaaaacaaaaaa max r1.y, r2.x, r0.x
aaaaaaaaaaaaapadabaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r1
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 4 math
 //    d3d11_9x : 4 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 13 math, 2 texture
 //    d3d11_9x : 13 math, 2 texture
 //        d3d9 : 18 math, 2 texture
 //      opengl : 19 math, 2 texture
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaffpdldohodkdgpagjklpapmmnbhcfmlabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 4 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmomopcjkglcmfiigcnlfbdoahcohgpeoabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp vec2 avgLum_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = texture2D (_SmallTex, xlv_TEXCOORD0).xy;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3.x));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / (avgLum_3.y * avgLum_3.y)))) / (1.0 + tmpvar_8)) / cieLum_1));
  gl_FragData[0] = color_2;
}



#endif"
}
SubProgram "flash " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"agal_vs
[bc]
aaaaaaaaaaaaadaeadaaaaoeaaaaaaaaaaaaaaaaaaaaaaaa mov v0.xy, a3
bdaaaaaaaaaaaiadaaaaaaoeaaaaaaaaadaaaaoeabaaaaaa dp4 o0.w, a0, c3
bdaaaaaaaaaaaeadaaaaaaoeaaaaaaaaacaaaaoeabaaaaaa dp4 o0.z, a0, c2
bdaaaaaaaaaaacadaaaaaaoeaaaaaaaaabaaaaoeabaaaaaa dp4 o0.y, a0, c1
bdaaaaaaaaaaabadaaaaaaoeaaaaaaaaaaaaaaoeabaaaaaa dp4 o0.x, a0, c0
aaaaaaaaaaaaamaeaaaaaaoeabaaaaaaaaaaaaaaaaaaaaaa mov v0.zw, c0
"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp vec2 avgLum_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = texture2D (_SmallTex, xlv_TEXCOORD0).xy;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3.x));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / (avgLum_3.y * avgLum_3.y)))) / (1.0 + tmpvar_8)) / cieLum_1));
  gl_FragData[0] = color_2;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform sampler2D _SmallTex;
uniform highp vec4 _HdrParams;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp float cieLum_1;
  highp vec4 color_2;
  highp vec2 avgLum_3;
  lowp vec2 tmpvar_4;
  tmpvar_4 = texture (_SmallTex, xlv_TEXCOORD0).xy;
  avgLum_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_MainTex, xlv_TEXCOORD0);
  color_2 = tmpvar_5;
  lowp vec3 c_6;
  c_6 = color_2.xyz;
  lowp float tmpvar_7;
  tmpvar_7 = max (1e-06, dot (c_6, vec3(0.22, 0.707, 0.071)));
  cieLum_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = ((cieLum_1 * _HdrParams.z) / (0.001 + avgLum_3.x));
  color_2.xyz = (color_2.xyz * (((tmpvar_8 * (1.0 + (tmpvar_8 / (avgLum_3.y * avgLum_3.y)))) / (1.0 + tmpvar_8)) / cieLum_1));
  _glesFragData[0] = color_2;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 19 math, 2 textures
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0],
		{ 1.0002404e-006, 0.2199707, 0.70703125, 0.070983887 },
		{ 0.001, 1 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R1.xy, fragment.texcoord[0], texture[0], 2D;
DP3 R1.z, R0, c[1].yzww;
MAX R1.z, R1, c[1].x;
MUL R1.w, R1.z, c[0].z;
ADD R1.x, R1, c[2];
MUL R1.y, R1, R1;
RCP R1.x, R1.x;
MUL R1.x, R1.w, R1;
RCP R1.y, R1.y;
MAD R1.w, R1.x, R1.y, c[2].y;
ADD R1.y, R1.x, c[2];
MUL R1.x, R1, R1.w;
RCP R1.y, R1.y;
RCP R1.z, R1.z;
MUL R1.x, R1, R1.y;
MUL R1.x, R1, R1.z;
MUL result.color.xyz, R0, R1.x;
MOV result.color.w, R0;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 18 math, 2 textures
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.21997070, 0.70703125, 0.07098389, 0.00000100
def c2, 0.00100000, 1.00000000, 0, 0
dcl t0.xy
texld r2, t0, s0
texld r3, t0, s1
mul r0.x, r2.y, r2.y
rcp r1.x, r0.x
add r2.x, r2, c2
dp3_pp r0.x, r3, c1
rcp r4.x, r2.x
max_pp r0.x, r0, c1.w
mul r2.x, r0, c0.z
mul r2.x, r2, r4
mad r4.x, r2, r1, c2.y
add r1.x, r2, c2.y
mul r2.x, r2, r4
rcp r1.x, r1.x
rcp r0.x, r0.x
mul r1.x, r2, r1
mul r0.x, r1, r0
mov r0.w, r3
mul r0.xyz, r3, r0.x
mov oC0, r0
"
}
SubProgram "d3d11 " {
// Stats: 13 math, 2 textures
SetTexture 0 [_SmallTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_HdrParams]
BindCB  "$Globals" 0
"ps_4_0
eefiecedocfepmecapcpdpelllicagclkblbmeamabaaaaaaamadaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemacaaaa
eaaaaaaajdaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaagpbciddkefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaakecaabaaaaaaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadeaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaalndhigdfdiaaaaaiicaabaaaaaaaaaaa
ckaabaaaaaaaaaaackiacaaaaaaaaaaaabaaaaaaaoaaaaahbcaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
aoaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 13 math, 2 textures
SetTexture 0 [_SmallTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_HdrParams]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgpleoljhooeannalpplkgibbaiadcciaabaaaaaanaaeaaaaaeaaaaaa
daaaaaaapaabaaaaeeaeaaaajmaeaaaaebgpgodjliabaaaaliabaaaaaaacpppp
iaabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkakoehgbdo
pepndedphdgijbdnlndhigdffbaaaaafacaaapkagpbciddkaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkaecaaaaadaaaaapiaaaaaoelaabaioekaecaaaaadabaaapia
aaaaoelaaaaioekaafaaaaadaaaaaciaaaaaffiaaaaaffiaacaaaaadaaaaabia
aaaaaaiaacaaaakaagaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaaciaaaaaffia
aiaaaaadaaaaceiaabaaoeiaabaaoekaalaaaaadacaaaiiaabaappkaaaaakkia
afaaaaadaaaaaeiaacaappiaaaaakkkaagaaaaacaaaaaiiaacaappiaafaaaaad
acaaabiaaaaaaaiaaaaakkiaaeaaaaaeaaaaabiaaaaakkiaaaaaaaiaacaaffka
agaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaaciaacaaaaiaaaaaffiaacaaffka
afaaaaadaaaaaciaaaaaffiaacaaaaiaafaaaaadaaaaabiaaaaaaaiaaaaaffia
afaaaaadaaaaabiaaaaappiaaaaaaaiaafaaaaadabaaahiaaaaaaaiaabaaoeia
abaaaaacaaaiapiaabaaoeiappppaaaafdeieefcemacaaaaeaaaaaaajdaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
gpbciddkefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaabaaaaaakecaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaa
koehgbdopepndedphdgijbdnaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaalndhigdfdiaaaaaiicaabaaaaaaaaaaackaabaaaaaaaaaaa
ckiacaaaaaaaaaaaabaaaaaaaoaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaaaoaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaoaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
doaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "flash " {
Vector 0 [_HdrParams]
SetTexture 0 [_SmallTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"agal_ps
c1 0.219971 0.707031 0.070984 0.000001
c2 0.001 1.0 0.0 0.0
[bc]
ciaaaaaaacaaapacaaaaaaoeaeaaaaaaaaaaaaaaafaababb tex r2, v0, s0 <2d wrap linear point>
ciaaaaaaadaaapacaaaaaaoeaeaaaaaaabaaaaaaafaababb tex r3, v0, s1 <2d wrap linear point>
adaaaaaaaaaaabacacaaaaffacaaaaaaacaaaaffacaaaaaa mul r0.x, r2.y, r2.y
afaaaaaaabaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r1.x, r0.x
abaaaaaaacaaabacacaaaaaaacaaaaaaacaaaaoeabaaaaaa add r2.x, r2.x, c2
bcaaaaaaaaaaabacadaaaakeacaaaaaaabaaaaoeabaaaaaa dp3 r0.x, r3.xyzz, c1
afaaaaaaaeaaabacacaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r4.x, r2.x
ahaaaaaaaaaaabacaaaaaaaaacaaaaaaabaaaappabaaaaaa max r0.x, r0.x, c1.w
adaaaaaaacaaabacaaaaaaaaacaaaaaaaaaaaakkabaaaaaa mul r2.x, r0.x, c0.z
adaaaaaaacaaabacacaaaaaaacaaaaaaaeaaaaaaacaaaaaa mul r2.x, r2.x, r4.x
adaaaaaaaeaaabacacaaaaaaacaaaaaaabaaaaaaacaaaaaa mul r4.x, r2.x, r1.x
abaaaaaaaeaaabacaeaaaaaaacaaaaaaacaaaaffabaaaaaa add r4.x, r4.x, c2.y
abaaaaaaabaaabacacaaaaaaacaaaaaaacaaaaffabaaaaaa add r1.x, r2.x, c2.y
adaaaaaaacaaabacacaaaaaaacaaaaaaaeaaaaaaacaaaaaa mul r2.x, r2.x, r4.x
afaaaaaaabaaabacabaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r1.x, r1.x
afaaaaaaaaaaabacaaaaaaaaacaaaaaaaaaaaaaaaaaaaaaa rcp r0.x, r0.x
adaaaaaaabaaabacacaaaaaaacaaaaaaabaaaaaaacaaaaaa mul r1.x, r2.x, r1.x
adaaaaaaaaaaabacabaaaaaaacaaaaaaaaaaaaaaacaaaaaa mul r0.x, r1.x, r0.x
aaaaaaaaaaaaaiacadaaaappacaaaaaaaaaaaaaaaaaaaaaa mov r0.w, r3.w
adaaaaaaaaaaahacadaaaakeacaaaaaaaaaaaaaaacaaaaaa mul r0.xyz, r3.xyzz, r0.x
aaaaaaaaaaaaapadaaaaaaoeacaaaaaaaaaaaaaaaaaaaaaa mov o0, r0
"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }
}
Fallback Off
}