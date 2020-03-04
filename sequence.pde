/*
TODO:
-Fillstyle gradient function?
-More blade shapes
-Blast effect

14 lyrics start
78 start, "when..."
piano chords 80,88,96,112,120,128,

-140 flute
140 cuz one day...
144time
156 daggers in my spine...
160spine
172 one day ...
176time
190 well im over this love
200-buildup

208drop, bass 216, 224,232, 
piano note stabs 238,239
bass240,248,256,264,

272 quiet bridge starts
286 "barely..."
288,296,pinao,304,320,328,336,
?-? 315-320, 331-336 guitar plucks

time352,368spine,384time,
400-buildup

416drop,bass424,432,440,448,
446,447 pinao note stabs
bass456,464,
480time,488bass,496,504,512,520,528,536,

544 quiet
564 low note
578 last beat
*/

// Temp computation variables
int backFlash = 125;
float t,num;

void addEvents() {
	//events.add(new Spray(208,210, ar, 0,0,0, 0,0,0, 1,0.7, 0,1));
	events.add(new Shake(209,211, ar, 0.2, 0,1));
	events.add(new Shake(217,219, ar, 0.2, 0,1));
	events.add(new Shake(225,227, ar, 0.2, 0,1));
	events.add(new Shake(233,235, ar, 0.2, 0,1));
	events.add(new Shake(241,243, ar, 0.2, 0,1));
	events.add(new Shake(249,251, ar, 0.2, 0,1));
	events.add(new Shake(257,259, ar, 0.2, 0,1));
}

void instantEvents() {
	switch(currBeat) {
		case 0:
		num = 1;
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			helix(ar,0,0,0, -PI/2,0,0, 0.05,0.7,10, t,1/num);
		}
		break;
		case 14: // Lyrics start
		cam.av.P.set(0,0.001,0);
		break;
		case 78: // "when..."
		break;


		case 80: // Piano chords
		//Camera
		cam.reset();
		cam.av.P.set(0.003,0.006,0);
		//Primary structure
		num = 3;
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			ring(ar,0,0,0, -PI/2-t*2,3,t*2, 0.3+t*0.2, t,1/num);
		}
		// Modifications
		setFillStyle(ar, 125,125,125,255, 175,175,175,0, 0.2,0.2,0.2,0, 0,0,0,0);
		setAv(ar,0,0,0.01, 0,1);
		setRv(ar, 0,0,0.01, 0,1);
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].rv.pm.set(0,0,0.0003*wx);
			ar[i].r.pm.set(0,0,0.001*wx);
		}
		break;

		case 88:
		scatter(ar,1, 0,1);
		break;

		case 96: //"..blame all the others"
		num = 8;
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			ring(ar,0,0,0, -PI/2+t*PI,0,t*PI, t, t,1/num);
		}
		setAv(ar,0,0,-0.01, 0,1);
		setRv(ar, 0,0,-0.01, 0,1);
		for (int i = 0 ; i < ar.length ; i ++) ar[i].rv.pm.set(0,0,0);
		break;

		case 112:
		num = 6;
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			setR(ar, 0,0,(1-t)*0.9, t,1/num);
			setRangV(ar, t*0.011-(i%2)*0.01,(i%2)*0.02-0.01,t*0.01, t,1/num);
		}
		setFillStyle(ar, 55,55,155,255, -55,55,25,0, 0.8,0.2,0.2,0, 0,0,0,0);
		setRv(ar, 0,0,0, 0,1);
		break;

		case 120: //"blood on your hands"
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			setR(ar, 0,0,t*0.8+0.1, t,1/num);
			setRangV(ar, t*0.015-(i%2)*0.03,-(i%2)*0.02+0.01,-t*0.01, t,1/num);
		}
		setFillStyle(ar, 255,55,55,255, 0,25,25,0, 0.8,0.2,0.2,0, 0,0,0,0);
		break;

		case 128:
		for (float i = 0 ; i < num ; i ++) {
			t = i/num;
			setR(ar, 0,0,(1-t)*0.8+0.1, t,1/num);
			setRangV(ar, t*0.015-(i%2)*0.03,-(i%2)*0.02+0.01,-t*0.01, t,1/num);
		}
		setFillStyle(ar, 200,100,100,255, -55,100,100,0, 0.8,0.2,0.2,0, 0,0,0,0);
		break;

		case 144: // "time"
		cam.reset();
		
		helix(ar, 0,0,0, -PI/2,0,0, 1,2, 7.5, 0,1);

		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].r.pm.set(0,0,-0.0005*wx);
			ar[i].rv.pm.set(0,0,0);
		}

		setAng(ar, PI,0,0, 0,1);
		setPv(ar, 0,0,0.01, 0,1);
		setRangV(ar, 0,0.01,0, 0,1);
		setFillStyle(ar, 65,65,65,255, 100,-100,100,0, 0.5,0.5,0.5,0, 0,0,0,0);
		break;

		case 160: // "spine"
		break;

		case 176: // "time"
		break;

		case 208: // Drop and bass effects
		cam.reset();
		setMass(ar, 2, 0,1);
		setVMult(ar, 0.1, 0,1);
		setW(ar, 0.15, 0,1);
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].rv.pm.set(0,0,0.1);
			ar[i].rv.P.set(0,0,3);
		}

		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;

		ring(ar, 0,0,0, -PI/2,0,0, 0.3, 0,1);

		setRangV(ar, 0,0.04,0, 0,1);
		setFillStyle(ar, 65,65,65,255, 65,65,65,0, 0.5,0.5,0.5,0, 0,0,0,0);
		break;
		case 210:
		helix(ar, 0,0,0,-PI/2,0,0, 0.1,1,5, 0,1);

		setRangV(ar, 0,-0.03,0, 0,1);
		break;

		case 216:
		cam.reset();
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		ring(ar, 0,0,0, -PI/2,0,0, 0.15, 0,0.5);
		ring(ar, 0,0,0, -PI/2,0,0, 0.3, 0.5,0.5);

		setRangV(ar, 0.04,0.06,0, 0,0.5);
		setRangV(ar, -0.04,-0.04,0, 0.5,0.5);
		setFillStyle(ar, 125,65,65,255, 100,100,100,0, 0.5,0.5,0.5,0, 0,0,0,0);
		break;
		case 218:
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		num = 3;
		for (int i = 0 ; i < num ; i ++) {
			t = (float)i/num;
			ring(ar, 0,0,0, random(-PI,PI),random(-PI,PI),random(-PI,PI), t*0.5+0.1, t,1/num);
			setRangV(ar, random(-0.03,0.03),random(-0.03,0.03),random(-0.03,0.03), t,1/num);
		}
		break;

		case 224:
		cam.reset();
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		num = 4;
		for (int i = 0 ; i < num ; i ++) {
			t = (float)i/num;
			ring(ar, 0,0,0, random(-PI,PI),random(-PI,PI),random(-PI,PI), t*0.5+0.1, t,1/num);
			setRangV(ar, random(-0.03,0.03),random(-0.03,0.03),random(-0.03,0.03), t,1/num);
		}
		setFillStyle(ar, 65,65,125,255, 100,-100,100,0, 0.5,0.5,0.5,0, 0,0,0,0);
		break;
		case 226:
		ring(ar, 0,0,0, -PI/2,0,0, 0.15, 0,0.5);
		ring(ar, 0,0,0, -PI/2,0,0, 0.3, 0.5,0.5);

		setRangV(ar, 0.04,0.06,0, 0,0.5);
		setRangV(ar, -0.04,-0.04,0, 0.5,0.5);
		break;

		case 232:
		cam.reset();
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		helix(ar, 0,0,0,-PI/2,0,0, 0.1,1,5, 0,1);

		setRangV(ar, 0,-0.03,0, 0,1);
		setFillStyle(ar, 65,125,65,255, 100,-100,100,0, 0.5,0.5,0.5,0, 0,0,0,0);
		break;
		case 234:
		num = 4;
		for (int i = 0 ; i < num ; i ++) {
			t = (float)i/num;
			ring(ar, 0,0,0, random(-PI,PI),random(-PI,PI),random(-PI,PI), t*0.5+0.1, t,1/num);
			setRangV(ar, random(-0.03,0.03),random(-0.03,0.03),random(-0.03,0.03), t,1/num);
		}
		break;

		case 238: // Piano stab
		break;
		case 239: // Piano stab
		break;
		case 240:
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		break;
		case 248:
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		break;
		case 256:
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		break;
		case 264:
		//cam.av.reset(random(-0.01,0.01),random(-0.01,0.01),random(-0.01,0.01));
		cam.ang.p.add(random(-0.7,0.7),random(-0.7,0.7),0);
		backFill.x += 100;
		break;

		case 272: // Quiet bridge starts
		break;

		case 286: // "Barely..."
		break;

		case 288: // Piano chords
		break;
		case 296:
		break;
		case 304:
		break;
		case 320:
		break;
		case 328:
		break;
		case 336:
		break;

		case 352: // "time"
		break;
		case 368: // "spine"
		break;
		case 384: // "time"
		break;

		case 416: // Drop and bass effects
		break;
		case 424:
		break;
		case 432:
		break;
		case 440:
		break;
		case 446: // Piano stab
		break;
		case 447: // Piano stab
		break;
		case 448:
		break;
		case 456:
		break;
		case 464:
		break;

		case 480: // "time"
		break;
		case 488: // "spine"
		break;
		case 504: // "time"?
		break;
		case 512: // Bass effects
		break;
		case 528:
		break;
		case 536:
		break;

		case 544: // Quiet time
		break;
		case 564: // Low note
		break;

		case 578: // Last beat
		break;
	}
}

void keyboardInput() {
	switch(key) {
		case '1':
		setTime(0,0);
		break;
		case '2':
		setTime(30464,76);
		break;
		case '3':
		setTime(54427,136);
		break;
		case '4':
		setTime(81600,203);
		break;
		case '5':
		setTime(0,0);
		break;
		case '6':
		setTime(0,0);
		break;
	}
}
/*
case 208:
backFill.x = backFlash;
spray(0,0,0, 0,PI/2,0, de*0.8, 0.5, 0,arm*0.5);
spray(0,0,0, 0,-PI/2,0, de*1.3, 0.5, arm*0.5,arm*0.5);
break;
case 216:
backFill.x = backFlash;
ring(0,0,0, 0,-PI/2,0, de*0.3, 0,arm*0.5);
ring(0,0,0, 0,-PI/2,0, de*0.6, arm*0.5,arm*0.5);
break;
case 224:
backFill.x = backFlash;
spray(0,0,0, 2*PI/3,0,0, de*1.3, 0.5, 0,arm*0.33);
spray(0,0,0, 4*PI/3,0,0, de*1.3, 0.5, arm*0.33,arm*0.33);
spray(0,0,0, 2*PI,0,0, de*1.3, 0.5, arm*0.66,arm*0.34);
break;
case 232:
backFill.x = backFlash;
ring(0,-de*0.25,0, 0,0,0, de*0.2, 0,arm*0.33);
ring(0,0,0, 0,0,0, de*0.4, arm*0.33,arm*0.33);
ring(0,de*0.25,0, 0,0,0, de*0.6, arm*0.66,arm*0.34);
break;
case 240:
backFill.x = backFlash;
spray(0,0,0, PI/2,0,0, de*1.3, 0.5, 0,arm*0.5);
spray(0,0,0, -PI/2,0,0, de*1.3, 0.5, arm*0.5,arm*0.5);
break;
*/