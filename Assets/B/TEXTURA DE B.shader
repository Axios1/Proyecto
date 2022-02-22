Shader "Custom/TEXTURA DE B"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        _MainTex("Main Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            sampler2D _MainTex;
            half4 _Albedo;

            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
                o.Albedo = texColor * _Albedo;
            }
        ENDCG
    }
}
[3:13, 22/2/2022] Caro Villa: b
[3:45, 22/2/2022] Caro Villa: Shader "Custom/SurfaceDiffuseTexture"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            sampler2D _MainTex;

            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                half4 texColor = tex2D(_MainTex, IN.uv_MainTex);
                o.Albedo = texColor.rgb;
            }
        ENDCG
    }
}