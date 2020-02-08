uniform float time;

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    vec4 texturecolor = Texel(tex, texture_coords);
    vec4 newcol = texturecolor;
    float avg = (newcol.x+newcol.y+newcol.z)/3;
    newcol.x += sin(time*5.0f)*2.0f;
    return newcol * color;
}