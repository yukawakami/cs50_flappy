--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

function ScoreState:init()
    self.image1 = love.graphics.newImage('graphics/medal1.png')
    self.image2 = love.graphics.newImage('graphics/medal2.png')
    self.image3 = love.graphics.newImage('graphics/medal3.png')

    self.x = (VIRTUAL_WIDTH / 2) - 16
    self.y = (VIRTUAL_HEIGHT / 2) - 16
end

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 34, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 70, VIRTUAL_WIDTH, 'center')

    if (self.score > 0) then
        love.graphics.printf('You got a medal!', 0, 90, VIRTUAL_WIDTH, 'center')
    end

    if (self.score > 9) then
        love.graphics.draw(self.image3, self.x, self.y)
    elseif (self.score > 4) then
        love.graphics.draw(self.image2, self.x, self.y)
    elseif (self.score > 0) then
        love.graphics.draw(self.image1, self.x, self.y)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end