PauseState = Class{__includes = BaseState}

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused', 0, 150, VIRTUAL_WIDTH, 'center')
end