static float bpm = 150;
static float beatInc = 1;
static int threshold = 100;
static int offset = -25;
static int binCount = 144;
static float defaultMass = 5;
static float defaultVMult = 0.25;
static float fillMass = 10;
static float fillVMult = 0.5;
static float fftThreshold = 1.5;
static float fftPow = 1.8;
static float fftAmp = 10;
static float volumeGain = -10;
static String songName = "../Music/daggers.mp3";

IColor defaultFill = new IColor(222,125,222,255);
IColor defaultStroke = new IColor(255,255,255,255);

Blade[] ar = new Blade[300];
Blade[] ar2 = new Blade[100];
SpringValue backFill = new SpringValue(0);
boolean boundaryLoop = true;
float wx,wy,wz; // Width, height, depth of animation [front-back];
float arm = ar.length;
float borderAmp = 0.5;

void boundaryCheck(Mob mob) {
	if (mob.p.p.x < back.x) {
		mob.p.p.x = front.x;
		mob.p.P.x = front.x;
	} else if (mob.p.p.x > front.x) {
		mob.p.p.x = back.x;
		mob.p.P.x = back.x;
	}
	if (mob.p.p.y < back.y) {
		mob.p.p.y = front.y;
		mob.p.P.y = front.y;
	} else if (mob.p.p.y > front.y) {
		mob.p.p.y = back.y;
		mob.p.P.y = back.y;
	}
	if (mob.p.p.z < back.z) {
		mob.p.p.z = front.z;
		mob.p.P.z = front.z;
	} else if (mob.p.p.z > front.z) {
		mob.p.p.z = back.z;
		mob.p.P.z = back.z;
	}
}

void render() {
	if (boundaryLoop) {
		for (int i = 0 ; i < ar.length ; i ++) {
			boundaryCheck(ar[i]);
		}
	}

	backFill.update();
	stroke(backFill.x);

	if (timer.beat) println(song.position() + "," + (int)(currBeat));
	if (timer.beat) {
		if (currBeat % 2 == 0) {
			for (int i = 0 ; i < ar.length ; i ++) {
				ar[i].r.v.z += 25;
			}
		}
		instantEvents();
	}
}

void setSketch() {
	front = new PVector(de,de,de);
	back = new PVector(-de,-de,-de);
	front.mult(0.5);
	back.mult(0.5);
	wx = front.x - back.x;
	wy = front.y - back.y;
	wz = front.z - back.z;

	float tick;
	for (int i = 0 ; i < ar.length ; i ++) {
		tick = (float)i/ar.length;
		ar[i] = new Blade(de*0.2);
		ar[i].setM(0.1,i%binCount);
		ar[i].p.mass = 10;
		ar[i].r.mass = 35;
		ar[i].rang.mass = 35;
		ar[i].fillStyle.reset(170,170*(tick*0.5+0.5),170*(1-tick*0.5),255, 0.2,tick*0.4+0.2,0.2-tick*0.1,0,i);
		mobs.add(ar[i]);
	}
	for (int i = 0 ; i < ar2.length ; i ++) {
		tick = (float)i/ar2.length;
		ar2[i] = new Blade(de*0.2);
		ar2[i].setM(0.1,i%binCount);
		ar2[i].p.mass = 10;
		ar2[i].r.mass = 35;
		ar2[i].rang.mass = 35;
		ar2[i].fillStyle.reset(170,170*(tick*0.5+0.5),170*(1-tick*0.5),255, 0.2,tick*0.4+0.2,0.2-tick*0.1,0,i);
		mobs.add(ar2[i]);
	}
	//setTime(76045,191);
}