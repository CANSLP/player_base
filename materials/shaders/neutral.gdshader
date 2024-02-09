shader_type spatial;
uniform vec3 color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = color;
}

void light() {
	DIFFUSE_LIGHT = vec3(1.0,1.0,1.0);
}
