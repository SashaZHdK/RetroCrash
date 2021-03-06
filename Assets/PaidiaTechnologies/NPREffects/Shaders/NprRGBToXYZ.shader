﻿Shader "Hidden/NPR/RGBToXYZ" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	CGINCLUDE
	
	#include "UnityCG.cginc"
	#include "NprCommonBasic.cginc"
	#include "NprCommonColorSpaceTransform.cginc"

	float4 frag_rgb2xyz (v2f i) : COLOR
	{
		float4 original = tex2D(_MainTex, i.uv);
		return float4(RGB_to_XYZ(original.xyz),original.a);
	}

	ENDCG

	SubShader {
		Pass {
			Name "NPR_RGB_TO_XYZ"
			ZTest Always Cull Off ZWrite Off
			Fog { Mode off }

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag_rgb2xyz
			#include "UnityCG.cginc"
			ENDCG
		}
	}
	
	FallBack Off
}

