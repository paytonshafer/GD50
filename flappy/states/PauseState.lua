PauseState = Class{__includes = BaseState}

local pause_icon = love.graphics.newImage('imgs/pause_icon.png')

--[[
    When we enter the Pause state, we expect to receive the Pause
    from the play state so we know what to render to the State.
]]
function PauseState:enter(params)
    sounds['music']:stop()
end

function PauseState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('p') then
        sounds['music']:play()
        gStateMachine:change('countdown', {})
    end
end

function PauseState:render()
    -- simply render the Pause to the middle of the screen
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press P to resume!', 0, 64, VIRTUAL_WIDTH, 'center')
    love.graphics.draw(pause_icon, VIRTUAL_WIDTH/2 - 55, 90, 0, 100/pause_icon:getWidth(), 100/pause_icon:getHeight())
end