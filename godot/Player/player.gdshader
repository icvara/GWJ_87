shader_type spatial;
render_mode cull_disabled, depth_draw_opaque, unshaded;

uniform sampler2D grass_texture : filter_nearest, source_color;

uniform sampler2D gradient_texture : filter_linear_mipmap, source_color;
uniform float gradient_blend : hint_range(0, 1) = 0.5;

void vertex() {
	
	//MODELVIEW_MATRIX = VIEW_MATRIX * mat4(vec4(normalize(cross(vec3(0.0, 1.0, 0.0), MAIN_CAM_INV_VIEW_MATRIX[2].xyz)), 0.0),vec4(0.0, 1.0, 0.0, 0.0),vec4(normalize(cross(MAIN_CAM_INV_VIEW_MATRIX[0].xyz, vec3(0.0, 1.0, 0.0))), 0.0),MODEL_MATRIX[3]);
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);
    NORMAL = vec3(0.0, 1., 0.0);
	   
	VERTEX.y += cos(NODE_POSITION_WORLD.x + TIME * 5. + UV.x) * (1.4 - UV.y) * 0.1;
// calculate right, up, forward vectors for billboard

   
}

void fragment() {
    vec4 grass_sample = texture(grass_texture, UV);
    vec3 base_color = grass_sample.rgb;
    float alpha = grass_sample.a;

    vec3 gradient_color = texture(gradient_texture, vec2(UV.y, 0.5)).rgb;

    vec3 final_color = mix(base_color, base_color * gradient_color, gradient_blend);

    ALBEDO = final_color;
    ALPHA = alpha;
}