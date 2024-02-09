shader_type spatial;
uniform vec3 color_base;
uniform vec3 color_line;

vec3 transform(vec3 i,mat4 m){
	vec4 o = m * vec4(i.x,i.y,i.z,0);
	return vec3(o.x,o.y,o.z);
}

void vertex() {
	
}

void fragment() {
	vec3 frag = transform(VERTEX,INV_VIEW_MATRIX) + CAMERA_POSITION_WORLD;
	vec3 norm = transform(NORMAL,INV_VIEW_MATRIX);
	//vec3 binorm = transform(BINORMAL,INV_VIEW_MATRIX);
	//vec3 tang = transform(TANGENT,INV_VIEW_MATRIX);
	//vec3 bfrag = basis*frag;
	bool line = false;
	if(abs(norm.x)<0.975&&abs(mod(frag.x,1.0)-0.5)<0.025){
		line = true;
	}
	if(abs(norm.y)<0.975&&abs(mod(frag.y,1.0)-0.5)<0.025){
		line = true;
	}
	if(abs(norm.z)<0.975&&abs(mod(frag.z,1.0)-0.5)<0.025){
		line = true;
	}
	if(abs(norm.x)<0.975&&abs(mod(frag.x+0.125,0.25))<0.05){
		line = false;
	}
	if(abs(norm.y)<0.975&&abs(mod(frag.y+0.125,0.25))<0.05){
		line = false;
	}
	if(abs(norm.z)<0.975&&abs(mod(frag.z+0.125,0.25))<0.05){
		line = false;
	}
	
	if(line){
		ALBEDO = color_line;
	} else {
		ALBEDO = color_base;
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
