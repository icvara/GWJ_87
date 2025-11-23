shader_type spatial;
render_mode  cull_disabled; //unshaded
uniform float scale  = 1.0;
uniform sampler2D albedo_tex : source_color;
uniform float alpha_scissor_threshold : hint_range(0.0, 1.0) = 1.;

uniform float speed =2.;
uniform float dis =.08;
uniform sampler2D atlas : source_color, filter_nearest; // the spritesheet10.19
uniform vec2 texture_size = vec2(256.0, 256.0); // pixels
uniform vec4 region = vec4(0.0, 0.0, 64.0, 64.0); // x, y, w, h in pixels
uniform float glow_strength = 5.0;
uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}


void vertex() {
	// Called for every vertex the material is visible on.
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(
			vec4(normalize(cross(vec3(0.0, 1.0, 0.0), MAIN_CAM_INV_VIEW_MATRIX[2].xyz)), 0.0),
			vec4(0.0, 1.0, 0.0, 0.0),
			vec4(normalize(cross(MAIN_CAM_INV_VIEW_MATRIX[0].xyz, vec3(0.0, 1.0, 0.0))), 0.0),
			MODEL_MATRIX[3]);
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);

	VERTEX.x += 1. * dis * (UV.y-1.0) * sin(TIME* speed);//sin(TIME* speed * rand(vec2(float(INSTANCE_ID)))) * dis * (UV.y-1.0);
	//VERTEX.x += rand(VERTEX.xy)*0.5;
}

void fragment() {
	// Called for every pixel the material is visible on.
	float zoom = .5; // >1 zooms in, <1 zooms out
	vec2 center = vec2(0.5, 0.5);

	vec2 new_uv = (UV - center) * zoom + center;
	vec2 scaled_uv = (new_uv - 0.5) /scale + 0.5;
	vec4 tex_col = texture(albedo_tex, UV);
	


    // scale UV to atlas grid
    //vec2 uv = (UV * region.zw + region.xy) / texture_size;

    //ALBEDO = texture(atlas, vec3(uv,1.0));
	//tex_col = texture(atlas, uv);

 	if (tex_col.a < alpha_scissor_threshold) {
        discard;
    }
	ALPHA_SCISSOR_THRESHOLD = alpha_scissor_threshold;
	ALBEDO = tex_col.rgb;
    ALPHA = tex_col.a;
	//EMISSION = tex_col.rgb * glow_color.rgb * glow_strength * tex_col.a;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
