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

void addEvents() {

}

void instantEvents() {
	switch(currBeat) {
		case 0:
		for (int i = 0 ; i < 10 ; i ++) {
			ring(0,i*0.1-0.5,0, 0,0,0, 0.5, 0.1*i,0.1);
		}
		break;
		case 14: // Lyrics start
		cam.av.P.set(0,0.001,0);
		break;
		case 78: // "when..."
		break;


		case 80: // Piano chords
		break;
		case 88:
		break;
		case 96:
		break;
		case 112:
		break;
		case 120:
		break;
		case 128:
		break;

		case 144: // "time"
		cam.reset();
		cam.pv.P.set(0,0,2);
		backFill.x += 100;
		for (int i = 0 ; i < 10 ; i ++) {
			ring(0,0,-i*0.1+0.5, -PI/2,0,0, 0.6, 0.1*i,0.1);
			setRangV(0,0.01-(i%2)*0.02,0, 0.1*i,0.1);
		}
		break;
		case 160: // "spine"
		cam.reset();
		cam.pv.P.set(0,0,1);
		cam.av.P.set(0,0.01,0);
		backFill.x += 100;
		for (int i = 0 ; i < 20 ; i ++) {
			ring(0,0,-i*0.05+0.5, -PI/2,0,0, 0.4, 0.05*i,0.05);
			setRangV(0,0.015-(i%2)*0.03,0, 0.1*i,0.1);
		}
		break;
		case 176: // "time"
		cam.reset();
		cam.pv.P.set(0,0,2);
		backFill.x += 100;
		for (int i = 0 ; i < 10 ; i ++) {
			ring(0,i*0.1-0.5,0, 0,0,0, 0.5, 0.1*i,0.1);
			setRangV(0,0.015-(i%2)*0.03,0, 0.1*i,0.1);
		}
		break;

		case 208: // Drop and bass effects
		break;
		case 216:
		break;
		case 224:
		break;
		case 232:
		break;
		case 238: // Piano stab
		break;
		case 239: // Piano stab
		break;
		case 240:
		break;
		case 248:
		break;
		case 256:
		break;
		case 264:
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
		setTime(54427,137);
		break;
		case '3':
		setTime(76045,191);
		break;
		case '4':
		setTime(0,0);
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