using UnityEngine;

namespace Sokkayo
{
    public class MotionBlurEffect : EffectSystemBase
    {
        public MotionBlurEffect(Camera camera) : base(camera)
        {
            
        }

        public void SetColor()
        {
            _cmdBuffer.Clear();
            _cmdBuffer.BeginSample("EffectSystem");
            _cmdBuffer.ClearRenderTarget(true, true, Color.clear);
            _cmdBuffer.EndSample("EffectSystem");
            Debug.LogErrorFormat("SetColor : {0}", _cmdBuffer);

        }
    }
}
