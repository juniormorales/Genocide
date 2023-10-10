local xx = 580;
local yy = 550;

local xx2 = 580;
local yy2 = 550;

local xx3 = 580;
local yy3 = 550;

local ofs = 30;
local ofs2 = 30;
local ofs3 = 30;

local dadzoom = 0.6;
local bfzoom = 0.6;
local gfzoom = 0.6;
local shake = false;

local cameraZoom = 0.02
local enableZoom = true


function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep >= 127 then
        if curStep % 8 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'0.01')
        end
    end

    if curStep == 1408 then
        cameraZoom = 0.023
        shake = true
    end

    if curStep >= 1408 and curStep <= 1536 then
        if curStep % 2 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'0.01')
        end
    end

    if curStep == 1536 then
        cameraZoom = 0.02
        shake = false
    end

    if curStep == 1696 then
        dadzoom = 1;
        bfzoom = 1;
        xx = 300;
        yy = 550;

        xx2 = 300;
        yy2 = 550;
        ofs = 0;
        ofs2 = 0
        setProperty('cameraSpeed', 40) 
    end

    if curStep == 1704 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1712 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1720 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1728 then -- enter HUD
    end

    if curStep == 1744 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1752 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1760 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1769 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1777 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1785 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1793 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1800 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1808 then
        xx = 300;
        xx2 = 300;
    end

    if curStep == 1816 then
        xx = 900;
        xx2 = 900;
    end

    if curStep == 1824 then
        setProperty('cameraSpeed', 1) 
        cameraZoom = 0.023
        shake = true
        dadzoom = 0.6;
        bfzoom = 0.6;
        xx = 580;
        yy = 600;

        xx2 = 580;
        yy2 = 600;
        ofs = 60;
        ofs2 = 60
    end

    if curStep >= 1824 and curStep <= 1952 then
        if curStep % 2 == 0 then
            triggerEvent('Add Camera Zoom',cameraZoom,'0.01')
        end
    end

    if curStep == 1952 then
        cameraZoom = 0.02
        shake = false
    end
    --triggerEvent('Screen Shake','0, 0','0.1, 0.0025');

end

function follow()

    if gfSection == true then
        if enableZoom then
            setProperty('defaultCamZoom',gfzoom)
        end

        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
    elseif mustHitSection == false then
            if enableZoom then
                setProperty('defaultCamZoom',dadzoom)
            end

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'still' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
    else
            if enableZoom then
                setProperty('defaultCamZoom',bfzoom)
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.03, 0.02','0.1, 0.0015');
    end
end