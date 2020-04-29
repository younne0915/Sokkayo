using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.UI;

namespace Sokkayo
{
    public class MotionBlurEffect : EffectSystemBase
    {
        public MotionBlurEffect(Camera camera) : base(camera)
        {
            
        }

        public void SetColor(RawImage image, Material mat)
        {
            RenderTexture renderTexture = new RenderTexture(_targetCamera.pixelWidth, _targetCamera.pixelHeight, 16,
               RenderTextureFormat.ARGB32, RenderTextureReadWrite.Linear);
            renderTexture.name = "GrabCamera Texture";
            renderTexture.antiAliasing = 1;
            renderTexture.Create();

            _cmdBuffer.Blit(BuiltinRenderTextureType.CurrentActive, renderTexture, mat);
            image.texture = renderTexture;

        }
    }
}
