float bladeHiltZ = 0.4;
float bladeHiltW = 0.65;
class Blade extends Mob {
	Point w;
	Point rangV = new Point();
	Point rv = new Point();
	IColor fillStyle = new IColor(125,125,125,255);

	Blade(float x, float y, float z, float w) {
		this.p = new Point(x,y,z);
		this.ang = new Point();
		this.w = new Point(w*0.2,w*0.1,w);
	}

	Blade(float w) {
		this(0,0,0,w);
	}

	Blade() {
		this(0,0,0,0);
	}

	void update() {
		super.update();
		w.update();
		r.P.add(rv.p);
		rang.P.add(rangV.p);
		rv.update();
		rangV.update();
		fillStyle.update();
	}

	void stab(float x, float y, float z, float ang1, float ang2, float d) {
		rang.reset(ang1, ang2, rang.P.z);
		p.reset(x,y,z);
		r.reset(0,0,0, 0,0,d);
		r.v.z += d*0.4;
	}

	void setIndex(float i) {
		fillStyle.index = (int)i;
		w.index = (int)i;
		p.index = (int)i;
		ang.index = (int)i;
		rangV.index = (int)i;
		rv.index = (int)i;
		r.index = (int)i;
	}

	void setM(float amp, float i) {
		setIndex(i);
		setM(amp);
	}

	void setM(float amp) {
		float D = w.P.z*0.008*amp;
		w.pm.set(D,D,D);
		r.pm.set(D,0,0);
		ang.pm.set(0,0,D*0.01);
	}

	void reset(float x, float y, float z, float ax, float ay, float az, float w) {
		p.reset(x,y,z);
		pv.reset(0,0,0);
		ang.reset(ax,ay,az);
		av.reset(0,0,0);
		r.reset(0,0,0);
		rv.reset(0,0,0);
		rang.reset(0,0,0);
		rangV.reset(0,0,0);
		resetW(w);
	}

	void reset(float x, float y, float z, float w) {
		reset(x,y,z,0,0,0,w);
	}

	void setAng(float x, float y, float z, float vx, float vy, float vz) {
		ang.P.set(x,y,z);
		av.P.set(vx,vy,vz);
	}

	void setR(float x, float y, float z, float vx, float vy, float vz) {
		r.P.set(x,y,z);
		rv.P.set(vx,vy,vz);
	}

	void setRang(float x, float y, float z, float vx, float vy, float vz) {
		rang.P.set(x,y,z);
		rangV.P.set(vx,vy,vz);
	}

	void setW(float w) {
		this.w.P.set(w*0.2,w*0.1,w);
	}

	void resetW(float w) {
		this.w.reset(w*0.2,w*0.1,w);
	}

	void render() {
		setDraw();
		fill(255);
		fillStyle.fillStyle();
		beginShape();
		vertex(0,0,0);
		vertex(-w.p.x*bladeHiltW,0,w.p.z*bladeHiltZ);
		vertex(0,w.p.y*bladeHiltW,w.p.z*bladeHiltZ);
		vertex(0,0,0);
		endShape();
		beginShape();
		vertex(0,0,0);
		vertex(w.p.x*bladeHiltW,0,w.p.z*bladeHiltZ);
		vertex(0,w.p.y*bladeHiltW,w.p.z*bladeHiltZ);
		vertex(0,0,0);
		endShape();
		beginShape();
		vertex(0,0,w.p.z);
		vertex(-w.p.x,0,w.p.z*bladeHiltZ);
		vertex(0,w.p.y,w.p.z*bladeHiltZ);
		vertex(0,0,w.p.z);
		endShape();
		beginShape();
		vertex(0,0,w.p.z);
		vertex(w.p.x,0,w.p.z*bladeHiltZ);
		vertex(0,w.p.y,w.p.z*bladeHiltZ);
		vertex(0,0,w.p.z);
		endShape();

		beginShape();
		vertex(0,0,0);
		vertex(-w.p.x*bladeHiltW,0,w.p.z*bladeHiltZ);
		vertex(0,-w.p.y*bladeHiltW,w.p.z*bladeHiltZ);
		vertex(0,0,0);
		endShape();
		beginShape();
		vertex(0,0,0);
		vertex(w.p.x*bladeHiltW,0,w.p.z*bladeHiltZ);
		vertex(0,-w.p.y*bladeHiltW,w.p.z*bladeHiltZ);
		vertex(0,0,0);
		endShape();
		beginShape();
		vertex(0,0,w.p.z);
		vertex(-w.p.x,0,w.p.z*bladeHiltZ);
		vertex(0,-w.p.y,w.p.z*bladeHiltZ);
		vertex(0,0,w.p.z);
		endShape();
		beginShape();
		vertex(0,0,w.p.z);
		vertex(w.p.x,0,w.p.z*bladeHiltZ);
		vertex(0,-w.p.y,w.p.z*bladeHiltZ);
		vertex(0,0,w.p.z);
		endShape();
		pop();
	}
}