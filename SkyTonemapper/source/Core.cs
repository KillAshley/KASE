using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Reflection;
using KSP;
using KSP.IO;
using UnityEngine;
using KSPPluginFramework;
using System.IO;

namespace SkyTonemapper
{
	
	
	[KSPAddon(KSPAddon.Startup.EveryScene, false)]
	public class Core:MonoBehaviourWindow
	{
		string path;
		Material TonemapMaterial;
		public float exposure = 250;
		Camera scaledSpaceCamera;
		bool initiated=false;
		bool isActive = false;
		
		internal override void Awake()
		{
			WindowCaption = "Sky Tonemapper: alt+f10/f11 toggle";
			WindowRect = new Rect(0, 0, 300, 50);
			Visible = false;
			
			if (HighLogic.LoadedSceneIsFlight || HighLogic.LoadedScene == GameScenes.SPACECENTER)	
			{
				isActive = true;
			}
		}
		
		internal override void Update()
		{	
			//toggle whether GUI is visible or not
			if ((Input.GetKey(KeyCode.LeftAlt) || Input.GetKey(KeyCode.RightAlt))
			    && (Input.GetKeyDown(KeyCode.F11)||(Input.GetKeyDown(KeyCode.F10))))
				Visible = !Visible;
			
			if (isActive)
			{
				if (!initiated) { 
					//gets the cameras
					Camera[] cams = Camera.allCameras;
					for (int i=0; i<cams.Length; i++) 
					{
						if (cams [i].name == "Camera ScaledSpace")
							//if (cams [i].name == "Camera 01")
							scaledSpaceCamera = cams [i];
					}
					initiated=true;
				}
				
				if (scaledSpaceCamera)
				{
					//				if (scaledSpaceCamera.gameObject.GetComponent<cameraHDR> () != null)
					if (scaledSpaceCamera.gameObject.GetComponent<cameraHDR> ())
					{
						scaledSpaceCamera.gameObject.GetComponent<cameraHDR> ().settings (exposure);										
					}
					
					
					else
						//if (scaledSpaceCamera.gameObject.GetComponent<cameraHDR> () == null)
					{
						string codeBase = Assembly.GetExecutingAssembly().CodeBase;
						UriBuilder uri = new UriBuilder (codeBase);
						path = Uri.UnescapeDataString(uri.Path);
						path=Path.GetDirectoryName (path);
						
						TonemapMaterial=GetMatFromShader("CompiledToneMapper.shader",path+"/SkyTonemapper");
						
						scaledSpaceCamera.gameObject.AddComponent(typeof(cameraHDR));
						scaledSpaceCamera.gameObject.GetComponent<cameraHDR> ().settings (exposure,TonemapMaterial);										
					}
				}
			}
		}
		
		internal override void DrawWindow(int id)
		{
			DragEnabled = true;
			
			GUILayout.BeginHorizontal ();
			if (GUILayout.Button ("Hide"))
				Visible = !Visible;
			GUILayout.EndHorizontal ();
			
			GUILayout.BeginHorizontal ();
			GUILayout.Label ("Exposure (/100)");
			exposure = (float)(Convert.ToDouble (GUILayout.TextField (exposure.ToString ())));
			GUILayout.EndHorizontal ();
			
		}
		
		public static Material GetMatFromShader(String resource, string path)
		{
			StreamReader shaderStream = new StreamReader(new System.IO.FileStream(Path.GetDirectoryName(path) + "/" + resource, System.IO.FileMode.Open, System.IO.FileAccess.Read));
			string shaderContent = shaderStream.ReadToEnd();
			Material Mat= new Material(shaderContent);
			return Mat;
		}
		
		internal override void OnDestroy()
		{
			if (isActive){
				Destroy (TonemapMaterial);
				Component.Destroy(scaledSpaceCamera.gameObject.GetComponent<cameraHDR> ());
				scaledSpaceCamera.hdr = false;
			}
		}
	}
}
