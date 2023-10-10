local shader1Name  = 'glitch';
local shader2Name = "tvcrt";

function onStartCountdown()
	if not allowCountdown then
		runTimer('start', 0);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start' then
		makeLuaSprite('black', 'black', 0, 0);
		setObjectCamera('black', 'hud');
		addLuaSprite('black', false);
		runTimer('fadeout', 10, 1);

		setProperty('scoreTxt.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
        setProperty('healthBar.alpha',0)

	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'black', 0, 0.8, 'linear');
		doTweenAlpha('p1fade', 'iconP1', 1, 0.5, 'linear');
		doTweenAlpha('p2fade', 'iconP2', 1, 0.5, 'linear');
		doTweenAlpha('healthbarfade', 'healthBar', 1, 0.5, 'linear');
		doTweenAlpha('scorefade', 'scoreTxt', 1, 0.5, 'linear');
	end
end

function onCreate()
	makeLuaSprite('white', 'white', 0, 0);
	setObjectCamera('white', 'hud');
	addLuaSprite('white', false);
	setProperty('white.alpha',0)

	initShaderTVCTR()

end

function onCreatePost()

	initShaderGlitch()

end

function onUpdate(elapsed)

	if curStep == 384 then
		doTweenX('tweenMonika1','dad',getProperty('dad.x') + 1000, 0.5 , 'CircInOut')
		doTweenX('tweenGiffany1','boyfriend',getProperty('boyfriend.x') - 1000, 0.5 , 'CircInOut')
		setProperty('dad.flipX',true)
		setProperty('boyfriend.flipX',false)
	end

	if curStep == 512 then
		doTweenX('tweenMonika2','dad',getProperty('dad.x') - 1000, 0.5 , 'CircInOut')
		doTweenX('tweenGiffany2','boyfriend',getProperty('boyfriend.x') + 1000, 0.5 , 'CircInOut')
		setProperty('dad.flipX',false)
		setProperty('boyfriend.flipX',true)
	end

	if curStep == 896 then
		cameraFlash('camHUD', 'ffb8e3', 0.8)
		setSpriteShader('dad',"glitchy2")
	end

	if curStep == 1678 then
		doTweenAlpha('whiteFadeIn', 'white', 1, 1, 'linear');
	end

	if curStep == 1695 then
		setProperty('white.alpha',0)
		cameraFlash('camHUD', 'ffb8e3', 0.5)
	end

	if curStep == 1704 then
		setSpriteShader('boyfriend',"glitchy2")
	end

	if curStep == 1950 then
		doTweenAlpha('blackfade2','black',1,1,'linear')
		doTweenAlpha('p1fade2', 'iconP1', 0, 1, 'linear');
		doTweenAlpha('p2fade2', 'iconP2', 0, 1, 'linear');
		doTweenAlpha('healthbarfade2', 'healthBar', 0, 1, 'linear');
		doTweenAlpha('scorefade2', 'scoreTxt', 0, 1, 'linear');
	end
end


function onUpdatePost(elapsed)
  setShaderFloat("dad", "iTime", os.clock())
  setShaderFloat("boyfriend", "iTime", os.clock())
  setShaderFloat("glitch", "iTime", os.clock())
  setShaderFloat("tvcrt", "iTime", os.clock())
end

function initShaderGlitch()

  initLuaShader("glitchy2")

end

function initShaderTVCTR()

	makeLuaSprite("glitch")
	makeLuaSprite("tvcrt")

    makeGraphic("shaderImage1", screenWidth, screenHeight)
    makeGraphic("shaderImage2", screenWidth, screenHeight)

   	setSpriteShader("shaderImage1", "glitch")
   	setSpriteShader("shaderImage2", "tvcrt")
	
	runHaxeCode([[

        var shaderNameGlitch = "]] .. shader1Name .. [[";
        var shaderNameTv = "]] .. shader2Name .. [[";
        
        game.initLuaShader(shaderNameTv);
        game.initLuaShader(shaderNameGlitch);
        
        var shader0 = game.createRuntimeShader(shaderNameGlitch);
        var shader1 = game.createRuntimeShader(shaderNameTv);

        game.getLuaObject("glitch").shader = shader0;
        game.getLuaObject("tvcrt").shader = shader1;
        
        game.camGame.setFilters([new ShaderFilter(shader0),
        						new ShaderFilter(shader1)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("glitch").shader),
        						new ShaderFilter(game.getLuaObject("tvcrt").shader)]);
        return;
    ]])
end