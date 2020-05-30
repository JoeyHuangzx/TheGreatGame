--[[
-- 1.加载全局模块，所有全局性的东西都在这里加载，好集中管理    

--]]
require 'Framework.Common.BaseClass'

BaseComponent = require 'Framework.UI.BaseComponent'
LuaUpdate = require 'Framework.Common.LuaUpdate'
Singleton = require 'Framework.Common.Singleton'
EventMessager = require 'Framework.Common.EventMessager'

UIConfig=require 'UI.UIConfig'
EntityConfig=require 'GameLogic.EntityConfig'

Util = require 'Framework.Common.ObjectUtil'
ResourcesManager = require 'Framework.Common.ResourcesManager'
EntityManager=require 'GameLogic.EntityManager'
UIManager = require 'UI.UIManager'

--LuaMonoBehaviour=require "Common.LuaMonoBehaviour"

GameObject = CS.UnityEngine.GameObject
Transform = CS.UnityEngine.Transform
Object = CS.UnityEngine.Object
Vector2 = CS.UnityEngine.Vector2
Vector3 = CS.UnityEngine.Vector3
