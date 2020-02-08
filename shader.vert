uniform float time;

vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    // The order of operations matters when doing matrix multiplication.
    vec4 newpos = vertex_position;
    newpos.x += sin((time*5.0f)+(vertex_position.y*60.0f))*25.0f;
    return transform_projection * newpos;
}