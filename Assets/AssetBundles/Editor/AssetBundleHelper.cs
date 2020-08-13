using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

public class AssetBundleHelper : Editor
{
    
    [MenuItem("Tools/AssetBundles/SetAssetBundleNames")]
    public static void SetAssetBundleNames()
    {
        Object[] selectAssets = Selection.GetFiltered(typeof(Object), SelectionMode.Assets | SelectionMode.ExcludePrefab);
        string[] fileSuffixName = new string[] {".prefab",".mat",".shader",".lua"};
        if (selectAssets.Length != 1) return;
        string fullPath = AssetBundleConfig.PROJECT_PATH + AssetDatabase.GetAssetPath(selectAssets[0]);
        AssetImporter assetImporter = null;
        if(Directory.Exists(fullPath))
        {
            DirectoryInfo dirInfos = new DirectoryInfo(fullPath);
            FileInfo[] fileInfos = dirInfos.GetFiles("*", SearchOption.AllDirectories);
            for (int i = 0; i < fileInfos.Length; i++)
            {
                var _fileInfo = fileInfos[i];
                for (int j = 0; j < fileSuffixName.Length; j++)
                {
                    string _suffixName = fileSuffixName[j];
                   
                    if (_fileInfo.Name.EndsWith(fileSuffixName[j]))
                    {
                        Debug.Log(_fileInfo.Name);
                        string _path = _fileInfo.FullName.Replace("\\", "/").Substring(AssetBundleConfig.PROJECT_PATH.Length);
                        assetImporter = AssetImporter.GetAtPath(_path);
                        if (assetImporter != null)
                        {
                            string _assetbundName = "lua_asset"; //_path.Substring(fullPath.Substring(AssetBundleConfig.PROJECT_PATH.Length).Length + 1);
                            assetImporter.assetBundleName = "lua_asset";// _assetbundName.Substring(0, _assetbundName.LastIndexOf('.')) + AssetBundleConfig.SUFFIX;
                        }
                    }
                }
            }
        }
    }
}
