uniform float time;

vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    // The order of operations matters when doing matrix multiplication.
    vec4 newpos = vertex_position;
    float h = (VertexColor.x+VertexColor.y+VertexColor.z)/3;
    newpos.x += sin((time*5.0f)+(vertex_position.x*60.0f)+(h*20.0f))*100.0f;
    newpos.y += tan((time*5.0f)+(vertex_position.y*25.0f)+(h*20.0f))*100.0f;
    return transform_projection * newpos;
}