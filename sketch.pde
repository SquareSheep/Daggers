static float bpm = 150;
static float beatInc = 1;
static int threshold = 100;
static int offset = -25;
static int binCount = 144;
static float defaultMass = 5;
static float defaultVMult = 0.25;
static float fillMass = 10;
static float fillVMult = 0.5;
static float fftThreshold = 1.2;
static float fftPow = 2;
static float fftAmp = 1.5;
static float volumeGain = -9;
static String songName = "../Music/daggers.mp3";

IColor defaultFill = new IColor(222,125,222,255);
IColor defaultStroke = new IColor(255,255,255,255);

Blade[] ar = new Blade[300];
Blade[] ar2 = new Blade[100];
SpringValue backFill = new SpringValue(0);
boolean boundaryLoop = true;
boolean boundaryLoopRUpper = true;
boolean boundaryLoopRLower = true;

// Size and boundary variables
float wx,wy,wz; // Spherical size of animation
float bx,by,bz; // Boundary width of animation

void boundaryCheck(Mob mob) {
	if (mob.p.p.x < -bx) {
		mob.p.p.x = bx;
		mob.p.P.x = bx;
		mob.sca.x = 0;
	} else if (mob.p.p.x > bx) {
		mob.p.p.x = -bx;
		mob.p.P.x = -bx;
		mob.sca.x = 0;
	}
	if (mob.p.p.y < -by) {
		mob.p.p.y = by;
		mob.p.P.y = by;
		mob.sca.x = 0;
	} else if (mob.p.p.y > by) {
		mob.p.p.y = -by;
		mob.p.P.y = -by;
		mob.sca.x = 0;
	}
	if (mob.p.p.z < -bz) {
		mob.p.p.z = bz;
		mob.p.P.z = bz;
		mob.sca.x = 0;
	} else if (mob.p.p.z > bz) {
		mob.p.p.z = -bz;
		mob.p.P.z = -bz;
		mob.sca.x = 0;
	}
}

void boundaryCheckRUpper(Mob mob) {
	if (mob.r.p.x > bx) {
		mob.r.P.x = 0;
		mob.r.p.x = 0;
		mob.sca.x = 0;
	}
	if (mob.r.p.y > by) {
		mob.r.P.y = 0;
		mob.r.p.y = 0;
		mob.sca.x = 0;
	}
	if (mob.r.p.z > bz) {
		mob.r.P.z = 0;
		mob.r.p.z = 0;
		mob.sca.x = 0;
	}
}

void boundaryCheckRLower(Mob mob) {
	if (mob.r.p.x < 0) {
		mob.r.P.x = bx;
		mob.r.p.x = by;
		mob.sca.x = 0;
	}
	if (mob.r.p.y < 0) {
		mob.r.P.y = bx;
		mob.r.p.y = by;
		mob.sca.x = 0;
	}
	if (mob.r.p.z < 0) {
		mob.r.P.z = bx;
		mob.r.p.z = by;
		mob.sca.x = 0;
	}
}

void render() {
	if (boundaryLoop) {
		for (int i = 0 ; i < ar.length ; i ++) {
			boundaryCheck(ar[i]);
		}
		for (int i = 0 ; i < ar2.length ; i ++) {
			boundaryCheck(ar2[i]);
		}
	}
	if (boundaryLoopRUpper) {
		for (int i = 0 ; i < ar.length ; i ++) {
			boundaryCheckRUpper(ar[i]);
		}
		for (int i = 0 ; i < ar2.length ; i ++) {
			boundaryCheckRUpper(ar2[i]);
		}
	}
	if (boundaryLoopRLower) {
		for (int i = 0 ; i < ar.length ; i ++) {
			boundaryCheckRLower(ar[i]);
		}
		for (int i = 0 ; i < ar2.length ; i ++) {
			boundaryCheckRLower(ar2[i]);
		}
	}

	backFill.update();
	stroke(backFill.x);

	if (timer.beat) {
		println(song.position() + "," + (int)(currBeat));
		instantEvents();
	}
}

void setWX(float x) {
	wx = x;
}

void setSketch() {
	front = new PVector(de,de,de);
	back = new PVector(-de,-de,-de);

	wx = de*2;
	wy = de*2;
	wz = de*2;
	bx = wx;
	by = wy;
	bz = wz;

	float tick;
	for (int i = 0 ; i < ar.length ; i ++) {
		tick = (float)i/ar.length;
		ar[i] = new Blade(de*0.2);
		ar[i].setIndex(i);
		ar[i].setM(0.05,i%binCount);
		ar[i].p.mass = 10;
		ar[i].r.mass = 15;
		ar[i].rv.mass = 10;
		ar[i].rang.mass = 15;
		ar[i].rangV.mass = 15;
		ar[i].fillStyle.reset(170,170*(tick*0.5+0.5),170*(1-tick*0.5),255, 0.2,tick*0.4+0.2,0.2-tick*0.1,0,i);
		mobs.add(ar[i]);
	}
	for (int i = 0 ; i < ar2.length ; i ++) {
		tick = (float)i/ar2.length;
		ar2[i] = new Blade(de*0.2);
		ar2[i].setM(0.05,i%binCount);
		ar2[i].p.mass = 10;
		ar2[i].r.mass = 15;
		ar2[i].rv.mass = 10;
		ar2[i].rang.mass = 35;
		ar2[i].fillStyle.reset(170,170*(tick*0.5+0.5),170*(1-tick*0.5),255, 0.2,tick*0.4+0.2,0.2-tick*0.1,0,i);
		ar2[i].draw = false;
		mobs.add(ar2[i]);
	}
}