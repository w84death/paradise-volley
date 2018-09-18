shader_type particles;

uniform float rows = 32;
uniform float spacing = 1.0;

void vertex() {
	// get position
	vec3 pos = vec3(0.0, 0.0, 0.0);
	pos.z = float(INDEX);
	pos.x = mod(pos.z, rows);
	pos.z = (pos.z - pos.x) / rows;
	
	// center this
	pos.x -= rows * .5;
	pos.z -= rows * .5;
	
	// appy spacing
	pos *= spacing;
	
	// apply height
	//pos.y = get_height(pos.xz);
	
	// update
	TRANSFORM[3][0] = pos.x;
	TRANSFORM[3][1] = pos.y;
	TRANSFORM[3][2] = pos.z;
	
	
}