shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
VERTEX.x += 1. * 0.1 * (UV.y-1.0) * sin(TIME* 2.);//sin(TIME* speed * rand(vec2(float(INSTANCE_ID)))) * dis * (UV.y-1.0);

}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
