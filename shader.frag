uniform float time;

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    vec4 texturecolor = Texel(tex, texture_coords);
    vec4 newcolor = texturecolor;
    bool evenpixel = mod(screen_coords.y+0.5f, 2.0f) == 0.0f;
    if (evenpixel) {
        newcolor.x += sin(time*5.0f)*2.0f;
    } else {
        newcolor.y += sin(time*5.0f)*2.0f;
    };
    return (newcolor * color);
}