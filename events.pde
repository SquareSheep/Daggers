Blade[] subAr(int start, int num) {
	Blade[] list = new Blade[num];
	for (int i = 0 ; i < num ; i ++) {
		list[i] = ar[i+start];
	}
	return list;
}

void bladeRing(float x, float y, float z, float ax, float ay, float az, float w, float d, int start, int num) {
	float k = 0;
	for (int i = start ; i < start + num ; i ++) {
		ar[i].p.P.set(x,y,z);
		ar[i].r.P.set(0,0,d);
		ar[i].rang.P.set(ax,ay+k/num*2*PI,az);
		ar[i].setWP(w);
		k ++;

		ar[i].rv.P.set(0,0,random(-6,6));
	}
}

void bladeSpray(float x, float y, float z, float ax, float ay, float az, float w, float d, float spread, int start, int num) {
	float k = 0;
	for (int i = start ; i < start + num ; i ++) {
		ar[i].p.P.set(x,y,z);
		ar[i].r.P.set(0,0,random(d));
		ar[i].rang.P.set(ax+PI/2+random(-spread,spread),ay+random(-spread,spread),az+random(-PI,PI));
		ar[i].setWP(w);
		k ++;

		ar[i].rv.P.set(0,0,random(-6,6));
	}
}

class PointResetListI extends PointResetList {
	int start,num;

	PointResetListI(float time, Point[] ar, float x, float y, float z, float X, float Y, float Z, int start, int num) {
		super(time,ar,x,y,z,X,Y,Z);
		this.start = start; this.num = num;
	}

	PointResetListI(float time, Point[] ar, float x, float y, float z, int start, int num) {
		this(time,ar,x,y,z,x,y,z,start,num);
	}

	void spawn() {
		for (int i = start ; i < start + num ; i ++) {

		}
	}
}

class PointResetList extends Event {
	Point[] ar;
	float x,y,z,X,Y,Z;

	PointResetList(float time, Point[] ar, float x, float y, float z, float X, float Y, float Z) {
		super(time,time+1);
		this.ar = ar;
		this.x = x; this.y = y; this.z = z;
		this.X = X; this.Y = Y; this.Z = Z;
	}

	PointResetList(float time, Point[] ar, float x, float y, float z) {
		this(time,ar,x,y,z,x,y,z);
	}

	void spawn() {
		for (Point p : ar) {
			p.reset(x,y,z,X,Y,Z);
		}
	}
}

class PointSetMassList extends Event {
	Point[] ar;
	float mass;

	PointSetMassList(float time, Point[] ar, float mass) {
		super(time,time+1);
		this.ar = ar;
		this.mass = mass;
	}

	void spawn() {
		for (Point p : ar) {
			p.mass = mass;
		}
	}
}

class PointSetVMultList extends Event {
	Point[] ar;
	float vMult;

	PointSetVMultList(float time, Point[] ar, float vMult) {
		super(time,time+1);
		this.ar = ar;
		this.vMult = vMult;
	}

	void spawn() {
		for (Point p : ar) {
			p.vMult = vMult;
		}
	}
}

class PVectorSetList extends Event {
	PVector[] ar;
	float x,y,z;

	PVectorSetList(float time, PVector[] ar, float x, float y, float z) {
		super(time,time+1);
		this.ar = ar;
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		for (PVector p : ar) {
			p.set(x,y,z);
		}
	}
}

class PVectorAddList extends Event {
	PVector[] ar;
	float x,y,z;

	PVectorAddList(float time, PVector[] ar, float x, float y, float z) {
		super(time,time+1);
		this.ar = ar;
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		for (PVector p : ar) {
			p.add(x,y,z);
		}
	}
}

class PointReset extends Event {
	Point p;
	float x,y,z,X,Y,Z;

	PointReset(float time, Point p, float x, float y, float z, float X, float Y, float Z) {
		super(time,time+1);
		this.p = p;
		this.x = x; this.y = y; this.z = z;
		this.X = X; this.Y = Y; this.Z = Z;
	}

	PointReset(float time, Point p, float x, float y, float z) {
		this(time,p,x,y,z,x,y,z);
	}
}

class PointSetMass extends Event {
	Point p;
	float mass;

	PointSetMass(float time, Point p, float mass) {
		super(time,time+1);
		this.p = p;
		this.mass = mass;
	}

	void spawn() {
		p.mass = mass;
	}
}

class PointSetVMult extends Event {
	Point p;
	float vMult;

	PointSetVMult(float time, Point p, float vMult) {
		super(time,time+1);
		this.p = p;
		this.vMult = vMult;
	}

	void spawn() {
		p.vMult = vMult;
	}
}

class SpringValueSetX extends Event {
	SpringValue spr;
	float x;

	SpringValueSetX(float time, SpringValue spr, float x) {
		super(time,time+1);
		this.spr = spr;
		this.x = x;
	}

	void spawn() {
		spr.X = x;
	}
}

class SpringValueSetx extends Event {
	SpringValue spr;
	float x;

	SpringValueSetx(float time, SpringValue spr, float x) {
		super(time,time+1);
		this.spr = spr;
		this.x = x;
	}

	void spawn() {
		spr.x = x;
	}
}

class PVectorSet extends Event {
	PVector p;
	float x,y,z;

	PVectorSet(float time, PVector p, float x, float y, float z) {
		super(time,time+1);
		this.p = p;
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		p.set(x,y,z);
	}
}

class PVectorAdd extends Event {
	PVector p;
	float x,y,z;

	PVectorAdd(float time, PVector p, float x, float y, float z) {
		super(time,time+1);
		this.p = p;
		this.x = x; this.y = y; this.z = z;
	}

	void spawn() {
		p.add(x,y,z);
	}
}

class FillStyleSetC extends Event {
	IColor fillStyle;
	float r,g,b,a;

	FillStyleSetC(float time, IColor fillStyle, float r, float g, float b, float a) {
		super(time, time+1);
		this.fillStyle = fillStyle;
		this.r = r; this.g = g; this.b = b; this.a = a;
	}

	void spawn() {
		fillStyle.setC(r,g,b,a);
	}
}

class FillStyleSetM extends Event {
	IColor fillStyle;
	float r,g,b,a;

	FillStyleSetM(float time, IColor fillStyle, float r, float g, float b, float a) {
		super(time, time+1);
		this.fillStyle = fillStyle;
		this.r = r; this.g = g; this.b = b; this.a = a;
	}

	void spawn() {
		fillStyle.setM(r,g,b,a);
	}
}

class FillStyleSetMass extends Event {
	IColor fillStyle;
	float mass;

	FillStyleSetMass(float time, IColor fillStyle, float mass) {
		super(time, time+1);
		this.fillStyle = fillStyle;
		this.mass = mass;
	}

	void spawn() {
		fillStyle.setMass(mass);
	}
}

class FillStyleSetVMult extends Event {
	IColor fillStyle;
	float vMult;

	FillStyleSetVMult(float time, IColor fillStyle, float vMult) {
		super(time, time+1);
		this.fillStyle = fillStyle;
		this.vMult = vMult;
	}

	void spawn() {
		fillStyle.setMass(vMult);
	}
}