using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;
using FileUtility;

public class AssetBundleHelper : Editor
{
    
    [MenuItem("Tools/AssetBundles/SetAssetBundleNames")]
    public static void SetAssetBundleNames()
    {
        Object[] selectAssets = Selection.GetFiltered(typeof(Object), SelectionMode.Assets | SelectionMode.ExcludePrefab);
        string[] fileSuffixName = new string[] {".prefab",".mat",".shader",".bytes",".jpg",".png"};
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

    [MenuItem("Tools/AssetBundles/BuildAssetBundles")]
    public static void BuildAllAssetBundles()
    {
        string assetBundleDirectory = "Assets/AssetsPackage/AssetBundles";
        if (!Directory.Exists(assetBundleDirectory))
        {
            Directory.CreateDirectory(assetBundleDirectory);
        }
        BuildPipeline.BuildAssetBundles(assetBundleDirectory,BuildAssetBundleOptions.None,BuildTarget.Android);
    }

    [MenuItem("Tools/xLua/CopyAndChangeLuaFileName")]
    public static void CopyAndChangeLuaFileName()
    {
        string desPath =Application.dataPath+"/AssetsPackage/Lua";
        if (Directory.Exists(desPath))
        {
            Directory.Delete(desPath,true);
        }
        string selectPath = Application.dataPath + "/_JustJump/jump_lua_scripts";
        
        Debug.Log(desPath+","+selectPath);
        FileUtil.CopyFileOrDirectoryFollowSymlinks(selectPath, desPath);
        string[] luaFiles = FileManager.GetSpecifyFilesInFolder(desPath, new string[] { ".lua"}, false);
        //Debug.Log(luaFiles.Length);
        for (int i = 0; i < luaFiles.Length; i++)
        {
            string old = luaFiles[i];
            string _new = old + ".bytes";
            File.Move(old, _new);
        }
    }

}
