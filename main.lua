--[[
    -= Bernie Shaders =-
    (main.lua)

    Written by Rin, 2020

    This came about because I was messing with GLSL and then thought of Bernie Sanders
    honestly why do I do these things
]]

bernie = love.graphics.newImage('bernie.jpg')
font = love.graphics.newFont(15)

function loadShaders()
    vert = love.graphics.newShader('shader.vert')
    frag = love.graphics.newShader('shader.frag')
    both = love.graphics.newShader('shader.frag', 'shader.vert')
end
loadShaders()

--ts = love.timer.getTime()
t = 0
mode = 0
curshader = vert
function love.update(dt)
    --t = love.timer.getTime() - ts
    t = t + dt
    if mode == 0 then
        curshader = vert
    elseif mode == 1 then
        curshader = frag
    else
        curshader = both
    end
    if curshader:hasUniform('time') then
        curshader:send('time', t)
    end
    local w, h, f = love.window.getMode()
    if curshader:hasUniform('size') then
        curshader:send('size', {bernie:getWidth(), bernie:getHeight()})
    end
    love.window.setTitle('Bernie Shaders - '..love.timer.getFPS()..'FPS')
end

function i(a, b, c)
    if a then return b else return c end
end

function love.draw()
    love.graphics.setShader(curshader)
    love.graphics.draw(bernie, (800/2)-(bernie:getWidth()/2), (600/2)-(bernie:getHeight()/2))
    love.graphics.setShader()
    love.graphics.setFont(font)
    local one = font:getHeight('gl')+2
    love.graphics.print('mode: '..i(mode == 1, 'frag', i(mode == 0, 'vert', 'both'))..' - space to switch mode, R to reload shader files, S to reset time, A for both', 0, 0)
    love.graphics.print('FPS '..love.timer.getFPS()..' / time='..t, 0, one)
end

function love.keypressed(k, sc, r)
    if k == 'space' then
        mode = (mode+1) % 3
    end
    if k == 'r' then loadShaders() end
    if k == 's' then t = 0 end
    if k == 'a' then
        t = 0
        loadShaders()
    end
end