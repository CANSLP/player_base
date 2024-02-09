shader_type spatial;

vec3 transform(vec3 i,mat4 m){
	vec4 o = m * vec4(i.x,i.y,i.z,0);
	return vec3(o.x,o.y,o.z);
}

void vertex() {
	
}

void fragment() {
	vec3 frag = transform(VERTEX,INV_VIEW_MATRIX) + CAMERA_POSITION_WORLD;
	ALBEDO = vec3(1.0,1.0,1.0);
	if(abs(mod(frag.x,1.0)-0.5)<0.025){
		ALBEDO = vec3(0.0,0.0,0.0);
	}
	if(abs(mod(frag.y,1.0)-0.5)<0.025){
		ALBEDO = vec3(0.0,0.0,0.0);
	}
	if(abs(mod(frag.z,1.0)-0.5)<0.025){
		ALBEDO = vec3(0.0,0.0,0.0);
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
