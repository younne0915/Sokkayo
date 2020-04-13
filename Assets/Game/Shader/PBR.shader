//// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
//// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
//
//Shader "younne/Physically-Based-Lighting" 
//{
//
//	Properties
//	{
//		_Color("Main Color", Color) = (1,1,1,1)                    //diffuse Color
//		_SpecularColor("Specular Color", Color) = (1,1,1,1)        //Specular Color (Not Used)
//		_Glossiness("Smoothness",Range(0,1)) = 1                    //My Smoothness
//		_Metallic("Metalness",Range(0,1)) = 0                    //My Metal Value      
//	}
//
//	SubShader
//	{
//		Tags
//		{
//			"RenderType" = "Opaque"  "Queue" = "Geometry"
//		}
//		Pass 
//		{
//			Name "FORWARD"
//			//Tags 
//			//{
//			//	"LightMode" = "ForwardBase"
//			//}
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			#define UNITY_PASS_FORWARDBASE
//			#include "UnityCG.cginc"
//			#include "AutoLight.cginc"
//			#include "Lighting.cginc"
//			#pragma multi_compile_fwdbase_fullshadows      
//			#pragma target 3.0
//
//			float4 _Color;
//			float4 _SpecularColor;
//			float _Glossiness;
//			float _Metallic;
//
//
//			struct VertexInput {
//				float4 vertex : POSITION;       //local vertex position
//				float3 normal : NORMAL;         //normal direction
//				float4 tangent : TANGENT;       //tangent direction    
//				float2 texcoord0 : TEXCOORD0;   //uv coordinates
//				float2 texcoord1 : TEXCOORD1;   //lightmap uv coordinates
//			};
//
//			struct VertexOutput {
//				float4 pos : SV_POSITION;              //screen clip space position and depth
//				float2 uv0 : TEXCOORD0;                //uv coordinates
//				float2 uv1 : TEXCOORD1;                //lightmap uv coordinates
//
//				//below we create our own variables with the texcoord semantic. 
//				float3 normalDir : TEXCOORD3;          //normal direction   
//				float3 posWorld : TEXCOORD4;          //normal direction   
//				float3 tangentDir : TEXCOORD5;
//				float3 bitangentDir : TEXCOORD6;
//				LIGHTING_COORDS(7, 8)                   //this initializes the unity lighting and shadow
//				UNITY_FOG_COORDS(9)                    //this initializes the unity fog
//			};
//
//			VertexOutput vert(VertexInput v) {
//				VertexOutput o = (VertexOutput)0;
//				o.uv0 = v.texcoord0;
//				o.uv1 = v.texcoord1;
//				o.normalDir = UnityObjectToWorldNormal(v.normal);
//				o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
//				o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
//				o.pos = UnityObjectToClipPos(v.vertex);
//				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
//				UNITY_TRANSFER_FOG(o, o.pos);
//				TRANSFER_VERTEX_TO_FRAGMENT(o)
//					return o;
//			}
//
//			ENDCG
//		}
//	}
//}