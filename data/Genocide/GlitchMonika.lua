local beatLength=0
local stepLength=0

local charName='monika_glitch'
local charDirectory='characters/Monika_Finale_New'
local charScale=6
local offsetScalesWithSize=false
local correspondingNoteType='GlitchMonika_Note'
local correspondingNoteTypeALT='GlitchMonika_Note_ALT'
local singLength=4

local charPos={-280, 350}
local prefixes={
		[1]='Monika_singLEFT0', --[[left]]
		[2]='Monika_singDOWN0', --[[down]]
		[3]='Monika_singUP0', --[[up]]
		[4]='Monika_singRIGHT0', --[[right]]
		[5]='Monika_Idle', --[[idle]]
		[6]='Monika_singLEFTALT', --[[left-alt]]
		[7]='Monika_singDOWNALT', --[[down-alt]]
		[8]='Monika_singUPALT', --[[up-alt]]
		[9]='Monika_singRIGHTALT', --[[right-alt]]
	}
local charOffsets={
		[1]={0, 6}, --[[left]]
		[2]={0, 12}, --[[down]]
		[3]={0, 12}, --[[up]]
		[4]={0, 6}, --[[right]]
		[5]={0, 0}, --[[idle]]
		[6]={0, 6}, --[[left-alt]]
		[7]={0, 12}, --[[down-alt]]
		[8]={0, 12}, --[[up-alt]]
		[9]={0, 6}, --[[right-alt]]
	}

function mathStuffs()
	beatLength=(1/bpm)*60
	stepLength=beatLength*0.25
end

function advAnim(obj,anim,forced,offsetTable)
	playAnim(obj, anim, forced)
	if offsetScalesWithSize then
		setProperty(obj..'.offset.x', offsetTable[1]*charScale)
		setProperty(obj..'.offset.y', offsetTable[2]*charScale)
	else
		setProperty(obj..'.offset.x', offsetTable[1])
		setProperty(obj..'.offset.y', offsetTable[2])		
	end
end

local singAnims={'singLEFT','singDOWN','singUP','singRIGHT'}
local singAnims_alt={'singLEFT-alt','singDOWN-alt','singUP-alt','singRIGHT-alt'}

function onCreate()
	precacheImage('backgrounds/FinaleBG2')
end

function onCreatePost()
	mathStuffs()
	makeAnimatedLuaSprite(charName, charDirectory, charPos[1], charPos[2])

		addAnimationByPrefix(charName, 'singLEFT', prefixes[1], 24, false)
		addAnimationByPrefix(charName, 'singDOWN', prefixes[2], 24, false)
		addAnimationByPrefix(charName, 'singUP', prefixes[3], 24, false)
		addAnimationByPrefix(charName, 'singRIGHT', prefixes[4], 24, false)
		addAnimationByPrefix(charName, 'idle', prefixes[5], 24, false)
		addAnimationByPrefix(charName, 'singLEFT-alt', prefixes[6], 24, false)
		addAnimationByPrefix(charName, 'singDOWN-alt', prefixes[7], 24, false)
		addAnimationByPrefix(charName, 'singUP-alt', prefixes[8], 24, false)
		addAnimationByPrefix(charName, 'singRIGHT-alt', prefixes[9], 24, false)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	setObjectOrder(charName,1)
	scaleObject(charName, charScale, charScale)
	addLuaSprite(charName,false)

	makeLuaSprite('bgMonikaFinale', 'backgrounds/FinaleBG2', -900, -85);
	scaleObject('bgMonikaFinale',1.8,1.8)
	setObjectCamera('bgMonikaFinale','hud');
	setObjectOrder('bgMonikaFinale',getObjectOrder(charName)-1)
	addLuaSprite('bgMonikaFinale',false)
end

function onBeatHit()
	if curBeat%2==0 and getProperty(charName..'.animation.curAnim.name')=='idle' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function opponentNoteHit(id,dir,note,sus)
	if note == correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end

	if note == correspondingNoteTypeALT then
		advAnim(charName, singAnims_alt[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end
end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onUpdate(elapsed)
	if curStep == 894 or curStep == 1406 or curStep == 1598 or curStep == 1727 or curStep == 1807 
		or curStep == 1831 or curStep == 1848 or curStep == 1872 then
		doTweenX(charName.."movetoX", charName, 220, 0.15, "linear")
		doTweenX("bgMonikaFinalemovetoX", 'bgMonikaFinale', -300, 0.15, "linear")
	end
	if curStep == 960 or curStep == 1472 or curStep == 1679 or curStep == 1757 or curStep == 1820 
		or curStep == 1840 or curStep == 1864 or curStep == 1880 then
		doTweenX(charName.."leavetoX", charName, -280, 0.15, "linear")
		doTweenX("bgMonikaFinaleleavetoX", 'bgMonikaFinale', -900, 0.15, "linear")
	end
end