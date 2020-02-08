uniform float time;
uniform vec2 size;

vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    // The order of operations matters when doing matrix multiplication.
    vec4 newpos = vertex_position;
    newpos.x += sin((time*5.0f)+((size.y*vertex_position.y)*2.0f))*100.0f;
    return transform_projection * newpos;
}