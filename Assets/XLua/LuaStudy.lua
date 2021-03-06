function max(a,b)
	if(a>b)
	then
		result=a
	else
		result=b
	end
	return result
end

print(max(10,15))

myprint=function(param)
	print("类似委托这类的吗",param)
end

print("----------------完美分割线-----------")

print("lua中可以将函数作为参数传递给函数 ")

function add(a,b,delegate)
	result=a+b
	delegate(result)
end

add(3,4,myprint)

print("寻找数组中最大值返回多参数")
function maximum(a)
	local mi=1
	local m=a[mi]
	for i,val in ipairs(a) do
		if val >m then
			mi=i
			m=val
		end
	end
	return m,mi
end

print(maximum({35,5,10,25}))

print("可变参数")
print("----------------完美分割线-----------")

function average(...)
	result=0
	local arg={...}
	for i,val in ipairs(arg) do
		result=result+val
	end
	print("all send: "..#arg .. " list count")
	return result/#arg
end

print("num average:",average(23,32,4,4,6,7))

print("----------------完美分割线-----------")
print("----------------关于__index元方法-----------")

--这是 metatable 最常用的键
--你通过键来访问 table 的时候，如果这个键没有值，那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键�
--如果__index包含一个表格，Lua会在表格中查找相应的键。

--如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数
--__index 元方法查看表中元素是否存在，如果不存在，返回结果为 nil；如果存在则由 __index 返回结果

mytable=setmetatable({key1="value1"},
	{
		__index=function(mytable,key)
			if key=="key2" then
				return "metatablevalue"
			else
				return nil
			end
		end

	}
)
print(mytable)
print(mytable.key1,mytable.key2,mytable.key)
