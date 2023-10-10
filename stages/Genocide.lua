function onCreate()
    makeLuaSprite('BGMain', '', 0, 0)
    setScrollFactor('BGMain', 0.1, 0.1)
    makeGraphic('BGMain', 3840, 2160, 'FFFFFF')
    addLuaSprite('BGMain', false)
    screenCenter('BGMain', 'xy')

    makeLuaSprite('gradent', 'backgrounds/gradent', -450, -150)
    scaleObject('gradent',1.8,1.8)
    addLuaSprite('gradent', false)

    makeLuaSprite('pops1', 'backgrounds/pocBackground', 1800, -100)
    scaleObject('pops1',1.6,1.6)
    addLuaSprite('pops1', false)

    makeLuaSprite('pops2', 'backgrounds/pocBackground', 600, 150)
    scaleObject('pops2',1.6,1.6)
    addLuaSprite('pops2', false)

    doTweenX('pops1XMinus','pops1',-2400,10,'linear')
    doTweenX('pops2XMinus','pops2',-3600,0.5,'linear')

    makeLuaSprite('BGSquares', 'backgrounds/p2', -300, 150)
    scaleObject('BGSquares',1.3,1.3)
    addLuaSprite('BGSquares', false)

end

function onTweenCompleted(tag)
    if tag == 'pops1XMinus' then
        setProperty('pops1.x',1800)
        doTweenX('pops1XMinus','pops1',-2400,20,'linear')
    end

    if tag == 'pops2XMinus' then
        setProperty('pops2.x',1800)
        doTweenX('pops2XMinus','pops2',-2400,20,'linear')
    end
end

function onUpdate(elapsed)

end

