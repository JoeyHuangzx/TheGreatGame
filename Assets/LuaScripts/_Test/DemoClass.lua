DemoClass = {}

ParentClass = BaseClass('ParentClass')
ParentClass.parentName = 'parent'
ParentClass.id = 10000

AClass = BaseClass('AClass', ParentClass)
AClass.base = ParentClass
AClass.aName = 'aClass'
function AClass:constructor()
    self.base.parentName = self.aName .. ' ' .. self.base.parentName
    self.base.id = CS.UnityEngine.Random.value * self.base.id
end

BClass = BaseClass('BClass', ParentClass)
BClass.base = ParentClass
BClass.bName = 'bClass'
function BClass:constructor()
    self.base.parentName = self.bName .. ' ' .. self.base.parentName
    self.base.id = CS.UnityEngine.Random.value * self.base.id
end

function DemoClass:Test()
    print('require democlass teset')
    AClass.New()
    BClass.New()

    print('aName:',AClass.aName,',parent:',AClass.base.parentName,',id:',AClass.base.id)
    print('bName:',BClass.bName,',parent:',BClass.base.parentName,',id:',BClass.base.id)

end

return DemoClass
