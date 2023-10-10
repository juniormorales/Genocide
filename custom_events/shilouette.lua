function onCreatePost()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 3840, 2160, 'FFFFFF')
	addLuaSprite('whitebg', false)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')
end
function onEvent(n, v1, v2)
	if n == 'shilouette' and string.lower(v1) == 'a' then
		doTweenAlpha('fadeInBG', 'whitebg', 1, v2, 'linear')
		doTweenColor('colorInDad', 'dad', '000000', v2, 'linear')
		doTweenColor('colorInBf', 'boyfriend', '000000', v2, 'linear')
		doTweenColor('colorInGf', 'gf', '000000', v2, 'linear')
	end
	if n == 'shilouette' and string.lower(v1) == 'b' then
		doTweenAlpha('fadeOutBG', 'whitebg', 0, v2, 'linear')
		doTweenColor('colorOutDad', 'dad', 'FFFFFF', v2, 'linear')
		doTweenColor('colorOutBf', 'boyfriend', 'FFFFFF', v2, 'linear')
		doTweenColor('colorOutGf', 'gf', 'FFFFFF', v2, 'linear')
	end
end