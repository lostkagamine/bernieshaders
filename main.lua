bernie = love.graphics.newImage('bernie.jpg')

vert = love.graphics.newShader('shader.vert')
frag = love.graphics.newShader('shader.frag')

ts = love.timer.getTime()
t = 0
usingFrag = false
function love.update()
    t = love.timer.getTime() - ts
    if vert:hasUniform('time') then
        vert:send('time', t)
    end
    if frag:hasUniform('time') then
        frag:send('time', t)
    end
end

function i(a, b, c)
    if a then return b else return c end
end

function love.draw()
    if usingFrag then
        love.graphics.setShader(frag)
    else
        love.graphics.setShader(vert)
    end
    love.graphics.draw(bernie, (800/2)-(bernie:getWidth()/2), (600/2)-(bernie:getHeight()/2))
    love.graphics.setShader()
    love.graphics.print(i(usingFrag, 'frag', 'vert'), 0, 0)
end

function love.keypressed(k, sc, r)
    if k == 'space' then
        usingFrag = not usingFrag
    end
end