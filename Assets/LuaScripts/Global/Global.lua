--[[
-- 1.加载全局模块，所有全局性的东西都在这里加载，好集中管理    

--]]

require "Framework.Common.BaseClass"
BaseComponent=require "Common.SimpleOOP.BaseComponent"
LuaUpdate=require "Framework.Common.LuaUpdate"

Util=require "Global.Util"
ResourcesManager=require "Framework.Common.ResourcesManager"
UIManager=require "UI.UIManager"

--LuaMonoBehaviour=require "Common.LuaMonoBehaviour"

GameObject = CS.UnityEngine.GameObject
Object=CS.UnityEngine.Object
Vector2=CS.UnityEngine.Vector2
Vector3=CS.UnityEngine.Vector3