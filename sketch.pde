static float bpm = 150;
static float beatInc = 1;
static int threshold = 100;
static int offset = -25;
static int binCount = 144;
static float defaultMass = 10;
static float defaultVMult = 0.5;
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
SpringValue backFill = new SpringValue(0);
/*
15 lyrics start
79 start, "when..."
141 cuz one day...
145
157 daggers in my spine...
161
173 one day ...
177
191 well im over this love

209 first bass sound, drop
217, 225,233, 241,249,257,265,
274 quiet bridge starts
287 "barely..."
*/
int backFlash = 125;
void render() {
	backFill.update();
	stroke(backFill.x);
	cam.ang.P.add(0.01,-0.02,0);
	if (timer.beat) println(song.position() + "," + (int)(currBeat+1));
	if (timer.beat) {
		if (currBeat % 2 == 0) {
			for (int i = 0 ; i < ar.length ; i ++) {
				ar[i].r.v.z += 100;
			}
		}

		switch(currBeat) {
			case 209:
			backFill.x = backFlash;
			bladeSpray(0,0,0, PI/2,0,0, de*0.2,de*0.8, 0.5, 0,150);
			bladeSpray(0,0,0, -PI/2,0,0, de*0.2,de*1.3, 0.5, 150,150);
			break;
			case 217:
			backFill.x = backFlash;
			bladeRing(0,0,0, -PI/2,0,0, de*0.15,de*0.3, 0,150);
			bladeRing(0,0,0, -PI/2,0,0, de*0.3,de*0.6, 150,150);
			break;
			case 225:
			backFill.x = backFlash;
			bladeSpray(0,0,0, 2*PI/3,0,0, de*0.2,de*1.3, 0.5, 0,100);
			bladeSpray(0,0,0, 4*PI/3,0,0, de*0.2,de*1.3, 0.5, 100,100);
			bladeSpray(0,0,0, 2*PI,0,0, de*0.2,de*1.3, 0.5, 200,100);
			break;
			case 233:
			backFill.x = backFlash;
			bladeRing(0,-de*0.25,0, 0,0,0, de*0.1,de*0.2, 0,100);
			bladeRing(0,0,0, 0,0,0, de*0.25,de*0.4, 100,100);
			bladeRing(0,de*0.25,0, 0,0,0, de*0.4,de*0.6, 200,100);
			break;
			case 241:
			backFill.x = backFlash;
			bladeSpray(0,0,0, PI/2,0,0, de*0.2,de*1.3, 0.5, 0,150);
			bladeSpray(0,0,0, -PI/2,0,0, de*0.2,de*1.3, 0.5, 150,150);
			break;
		}
	}
}

void setSketch() {
	front = new PVector(de*2,de,de*0.2);
	back = new PVector(-de*2,-de,-de*2);

	float tick;
	for (int i = 0 ; i < ar.length ; i ++) {
		tick = (float)i/ar.length;
		ar[i] = new Blade(de*0.3);
		ar[i].r.reset(0,0,de*0.3);
		ar[i].rang.reset(0,tick*2*PI,0);
		ar[i].setM(0.3,i%binCount);
		ar[i].fillStyle.reset(170,170*(tick*0.5+0.5),170*(1-tick*0.5),255, 0.2,tick*0.2+0.1,0.2-tick*0.1,0,i);
		mobs.add(ar[i]);
	}
	setTime(76045,191);
}