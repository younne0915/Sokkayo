using System;
using UnityEngine;
using UnityEngine.Rendering;

namespace Sokkayo
{
    public class EffectSystemBase : IDisposable
    {
        protected CommandBuffer _cmdBuffer;
        protected Camera _targetCamera;

        public EffectSystemBase(Camera camera)
        {
            _cmdBuffer = new CommandBuffer() { name = "EffectSystem" };

            if(camera == null)
            {
                Debug.LogError("[EffectSystem] Effect Target Is Null, Error");
                return;
            }
            _targetCamera = camera;
        }



        public void ExecuteCmdBuffer(CameraEvent cameraEvent)
        {
            if(_targetCamera != null)
            {
                Debug.LogErrorFormat("ExecuteCmdBuffer : {0}", _cmdBuffer);
                _targetCamera.AddCommandBuffer(cameraEvent, _cmdBuffer);
                //_cmdBuffer.Release();
            }
        }

        public void Dispose()
        {
            _cmdBuffer.Dispose();
        }
    }

}