local beatLength=0
local stepLength=0

local charName='giffany_broken2'
local charDirectory='characters/giffany_broken2'
local charScale=6
local offsetScalesWithSize=false
local correspondingNoteType='GlitchGIFfany_Note'
local singLength=4

local charPos={1700, 300}
local prefixes={
		[1]='giffany_broken2 LEFT', --[[left]]
		[2]='giffany_broken2 DOWN', --[[down]]
		[3]='giffany_broken2 UP', --[[up]]
		[4]='giffany_broken2 RIGHT', --[[right]]
		[5]='giffany_broken2 IDLE', --[[idle]]
	}
local charOffsets={
		[1]={-12, 0}, --[[left]]
		[2]={0, 0}, --[[down]]
		[3]={0, 0}, --[[up]]
		[4]={6, 0}, --[[right]]
		[5]={0, 0}, --[[idle]]
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

function onCreatePost()


	mathStuffs()
	makeAnimatedLuaSprite(charName, charDirectory, charPos[1], charPos[2])

		addAnimationByPrefix(charName, 'singLEFT', prefixes[1], 12, true)
		addAnimationByPrefix(charName, 'singDOWN', prefixes[2], 12, true)
		addAnimationByPrefix(charName, 'singUP', prefixes[3], 12, true)
		addAnimationByPrefix(charName, 'singRIGHT', prefixes[4], 12, true)
		addAnimationByPrefix(charName, 'idle', prefixes[5], 12, true)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setScrollFactor(charName,0,0);
	setObjectCamera(charName,'hud');
	scaleObject(charName, charScale, charScale)
	setObjectOrder(charName,2)
	addLuaSprite(charName,false)
end

function goodNoteHit(id,dir,note,sus)
	if note == correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	end 
end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onUpdate(elapsed)
	if curStep == 1735 or curStep == 1815 or curStep == 1862 then
		doTweenX(charName .. "moveToX", charName, 1010, 0.15, "linear")
	end

	if curStep == 1764 or curStep == 1841 or curStep == 1889 then
		doTweenX(charName .. "moveToX", charName, 1700, 0.15, "linear")
	end	
end