import android.content.SharedPreferences; 
import android.preference.PreferenceManager; 
import android.content.res.AssetFileDescriptor; 
import android.content.Context; 
import android.app.Activity; 
import android.view.MotionEvent; 
import android.media.MediaPlayer; 
import android.media.SoundPool; 
import android.media.AudioManager; 
import ketai.ui.*;
//TODO
//EDIT UI: DIVIDE BOTTON 4 KEYS INTO TWO GROUPS OR SHIFT TO THE RIGHT TO ALLOW BETTER REGISTERING SLIDE BOTTOM HALF OF BUTTONS DOWN
import ketai.sensors.*;
KetaiAudioInput mic;
short[] data;

KetaiGesture gesture;
SoundPool soundPool;
HashMap<Object, Object> soundPoolMap;
AssetFileDescriptor afd1, afd2, afd3, afd4, afd5, afd6, afd7, afd8, afd9, afd10, afd11, afd12, afd13, afd14, afd15, afd16, afd17, afd18, afd19, afd20, afd21, afd22, afd23, afd24, afd25, afd26, afd27, afd28, afd29, afd30, afd31, afd32, afd33;
Activity act;
Context cont;
int streamId;
int lowa, lowas, lowb, lowcs, lowc, lowd, lowds, lowe, lowf, lowfs, lowg, lowgs, mida, midas, midb, midc, midcs, midd, midds, mide, midf, midfs, midg, midgs, higha, highas, highb, highc, highe, highf, highfs, highg, highgs;
keys btn1;
keys btn2;
keys btn3;
keys btn4;
keys btn5;
keys btn6;
keys topkey;
keys sidekey;
keys akey1;
keys akey2;
keys akey3;
keys akey4;
keys bkey1;
keys bkey2;
keys bkey3;
keys ckey1;
keys ckey2;
keys ckey3;
keys ckey4;
keys b1;
keys b2;
keys backkey;
keys octavekey;
String display, display2, display3;
ArrayList <keys> keys = new ArrayList <keys>();
float xlocations [];
float ylocations [];
boolean add = true;
boolean playing = false;
int pastID;
boolean backkey2 = false;
boolean octavekey2 = false;
public void setup() {
  
  orientation(PORTRAIT);
  mic = new KetaiAudioInput(this);
  
  //creates all the keys
  ellipseMode(CENTER);
  btn1 = new keys (displayHeight/12*1.8, displayWidth/2, 1);
  btn2 = new keys (displayHeight/12*3, displayWidth/2, 1);
  btn3 = new keys(displayHeight/12*5, displayWidth/2, 1);
  btn4 = new keys (displayHeight/12*7.1, displayWidth/2, 1);
  btn5 = new keys (displayHeight/12*8.30, displayWidth/2, 1);
  btn6 = new keys (displayHeight/12*9.5, displayWidth/2, 1);
  topkey = new keys (displayHeight/12*.6, displayWidth/2, 2);
  sidekey = new keys (displayHeight/13*1.5f, displayWidth/2*1.4f, 2);
  akey1 = new keys (displayHeight/13*5.25f, displayWidth/2*.5f, 3);
  akey2 = new keys (displayHeight/13*6.15, displayWidth/2*.5f, 3);
  akey3 = new keys (displayHeight/13*7.05f, displayWidth/2*.5f, 3);
  akey4 = new keys (displayHeight/13*7.9, displayWidth/2*.5f, 3);
  bkey1 = new keys (displayHeight/13*5.5, displayWidth/2*1.55f, 2);
  bkey2 = new keys (displayHeight/13*7.0, displayWidth/2*1.4f, 2);
  bkey3 = new keys (displayHeight/13*7.0, displayWidth/2*1.7f, 2);
  ckey1 = new keys (displayHeight/13*11.5f, displayWidth/2*.5f, 5);
  ckey2 = new keys (displayHeight/13*11.5f, displayWidth/2, 5);
  ckey3 = new keys (displayHeight/13*12.5f, displayWidth/2*.5f, 5);
  ckey4 = new keys (displayHeight/13*12.5f, displayWidth/2, 5);
  b1 = new keys (displayHeight/12*4, displayWidth/2, 4);
  b2 = new keys (displayHeight/12*6.05, displayWidth/2, 4);
  octavekey = new keys(displayHeight/12*.6, displayWidth/2*.6f, 2);
  backkey = new keys(displayHeight/12*1.8, displayWidth/2*.6f, 1);
  
  //Adds all the keys in array
  keys.add(btn1); 
  keys.add(btn2); 
  keys.add(btn3); 
  keys.add(btn4); 
  keys.add(btn5); 
  keys.add(btn6); 
  keys.add(topkey); 
  keys.add(sidekey); 
  keys.add(akey1); 
  keys.add(akey2); 
  keys.add(akey3); 
  keys.add(akey4);
  keys.add(bkey1);  
  keys.add(bkey2);  
  keys.add(bkey3);  
  keys.add(ckey1);  
  keys.add(ckey2); 
  keys.add(ckey3); 
  keys.add(ckey4); 
  keys.add(b1); 
  keys.add(b2);
  keys.add(backkey); 
  keys.add(octavekey);
  act = this.getActivity();
  cont = act.getApplicationContext();
  
  //Preps the sound of each note
  try {
    afd1= cont.getAssets().openFd("lowe.wav");
    afd2= cont.getAssets().openFd("lowf.wav");
    afd3= cont.getAssets().openFd("lowfs.wav");
    afd4= cont.getAssets().openFd("lowg.wav");
    afd5= cont.getAssets().openFd("lowgs.wav");
    afd6= cont.getAssets().openFd("lowa.wav");
    afd7= cont.getAssets().openFd("lowas.wav");
    afd8= cont.getAssets().openFd("lowb.wav");
    afd9= cont.getAssets().openFd("lowc.wav");
    afd10= cont.getAssets().openFd("lowcs.wav");
    afd11= cont.getAssets().openFd("lowd.wav");
    afd12= cont.getAssets().openFd("lowds.wav");
    afd13= cont.getAssets().openFd("mide.wav");
    afd14= cont.getAssets().openFd("midf.wav");
    afd15= cont.getAssets().openFd("midfs.wav");
    afd16= cont.getAssets().openFd("midg.wav");
    afd17= cont.getAssets().openFd("midgs.wav");
    afd18= cont.getAssets().openFd("mida.wav");
    afd19= cont.getAssets().openFd("midas.wav");
    afd20= cont.getAssets().openFd("midb.wav");
    afd21= cont.getAssets().openFd("midc.wav");
    afd22= cont.getAssets().openFd("midcs.wav");
    afd23= cont.getAssets().openFd("midd.wav");
    afd24= cont.getAssets().openFd("midds.wav");
    afd25= cont.getAssets().openFd("highe.wav");
    afd26= cont.getAssets().openFd("highf.wav");
    afd27= cont.getAssets().openFd("highfs.wav");
    afd28= cont.getAssets().openFd("highg.wav");
    afd29 =cont.getAssets().openFd("highgs.wav"); 
    afd30= cont.getAssets().openFd("higha.wav");
    afd31= cont.getAssets().openFd("highas.wav");
    afd32= cont.getAssets().openFd("highb.wav");
    afd33= cont.getAssets().openFd("highc.wav");
  }
  catch(IOException e) {
    println("error loading files:" + e);
  }
  soundPool = new SoundPool(12, AudioManager.STREAM_MUSIC, 0);
  soundPoolMap = new HashMap<Object, Object>(2);
  soundPoolMap.put(lowe, soundPool.load(afd1, 1));
  soundPoolMap.put(lowf, soundPool.load(afd2, 1));
  soundPoolMap.put(lowfs, soundPool.load(afd3, 1));
  soundPoolMap.put(lowg, soundPool.load(afd4, 1));
  soundPoolMap.put(lowgs, soundPool.load(afd5, 1));
  soundPoolMap.put(lowa, soundPool.load(afd6, 1));
  soundPoolMap.put(lowas, soundPool.load(afd7, 1));
  soundPoolMap.put(lowb, soundPool.load(afd8, 1));
  soundPoolMap.put(lowc, soundPool.load(afd9, 1));
  soundPoolMap.put(lowcs, soundPool.load(afd10, 1));
  soundPoolMap.put(lowd, soundPool.load(afd11, 1));
  soundPoolMap.put(lowds, soundPool.load(afd12, 1));
  soundPoolMap.put(mide, soundPool.load(afd13, 1));
  soundPoolMap.put(midf, soundPool.load(afd14, 1));
  soundPoolMap.put(midfs, soundPool.load(afd15, 1));
  soundPoolMap.put(midg, soundPool.load(afd16, 1));
  soundPoolMap.put(midgs, soundPool.load(afd17, 1));
  soundPoolMap.put(mida, soundPool.load(afd18, 1));
  soundPoolMap.put(midas, soundPool.load(afd19, 1));
  soundPoolMap.put(midb, soundPool.load(afd20, 1));
  soundPoolMap.put(midc, soundPool.load(afd21, 1));
  soundPoolMap.put(midcs, soundPool.load(afd22, 1));
  soundPoolMap.put(midd, soundPool.load(afd23, 1));
  soundPoolMap.put(midds, soundPool.load(afd24, 1));
  soundPoolMap.put(highe, soundPool.load(afd25, 1));
  soundPoolMap.put(highf, soundPool.load(afd26, 1));
  soundPoolMap.put(highfs, soundPool.load(afd27, 1));
  soundPoolMap.put(highg, soundPool.load(afd28, 1));
  soundPoolMap.put(highgs, soundPool.load(afd29, 1));
  soundPoolMap.put(higha, soundPool.load(afd30, 1));
  soundPoolMap.put(highas, soundPool.load(afd31, 1));
  soundPoolMap.put(highb, soundPool.load(afd32, 1));
  soundPoolMap.put(highc, soundPool.load(afd33, 1));
  xlocations = new float [10];
  ylocations = new float [10];
  display = "None";
  display2 = "None";
  display3 = "None";
  gesture = new KetaiGesture(this);
}

public void draw() {
  //Draws the gui, then checks for which key pressed
  background(255);
  if (!mic.isActive()) {
    mic.start();
  }
  displayGUI();
  play();
 
  
  for (int i = 0; i < touches.length; i++) {
    fill(0);
    textSize(30);
    text(touches[i].id, 100+i*25, 600);
    ellipse(touches[i].x, touches[i].y, 100, 100);
  }
}
void displayGUI() {
  int btnx = 775;
  int btny = 1520;
  int btnw = 225;
  int btnh = 100;
  int btn2x = 775;
  int btn2y = 1680;
  //loops through each key, displays each
  for (int i = 0; i < keys.size(); i++) {
    keys keyz = keys.get(i);
    keyz.display();
  }
  //Displays note played
  textSize(80);
  fill(0);
  text("Note: ", 775, 1300);
  text(display, 775, 1400);
    //Displays/functions stop button
  rect(btnx, btny, btnw, btnh);

  textSize(50);
  fill(255);
  text("STOP", btnx+62, btny+61);
  /*
  if (mouseX < btnx+btnw && mouseX > btnx && mouseY < btny+btnh && mouseY > btny) {
    soundPool.stop(streamId);
    for (int i = 0; i < xlocations.length; i++) {
      xlocations[i] = 0;
      ylocations[i] = 0;
    }
  }
  */
  /*fill(0);
   rect(btn2x, btn2y, btnw, btnh);
  textSize(50);
  fill(255);
  text("STOP", btn2x+62, btn2y+61);
  if (mouseX < btn2x+btnw && mouseX > btn2x && mouseY < btn2y+btnh && mouseY > btn2y) {
    soundPool.pause(streamId);
    playSound(pastID);
  }
  */
}

void playSound(int soundID) { 
  //Plays sound if not the same sound (prevent repeats)
    /*
  boolean play = true;
  int counter = 0;
  if (data != null) {
    for (int i = 0; i < data.length; i++) {
      if(i != data.length-1) {
        if (data[i] <= 50) {
          counter++;
        }
      }
           
    }
    System.out.println(counter);
    if (counter > 900) {
      play = false;
    }
    */
  if (data != null) {
    System.out.println(abs(data[0]));
    if (abs(data[0]) >= 1700) {
      if (pastID != soundID) {
        soundPool.stop(streamId);
        streamId = soundPool.play(soundID, 1.0f, 1.0f, 1, -1, 1f);
        pastID = soundID;
      }
    } else {
      soundPool.stop(streamId);
      pastID = -1;
    }
  }
}
/*
public boolean surfaceTouchEvent(MotionEvent me) {
  
  //Checks for all screen touches, stores locations in arrays
  int numTouches = me.getPointerCount();
  for (int i=0; i < numTouches; i++) { 
    int pointerId = me.getPointerId(i);  
    xlocations[i] = me.getX(i);
    ylocations[i] = me.getY(i);
  } 
  //Fills rest of array with 0 (remove any unnecessary locations)
  for (int i = numTouches; i < 10; i++) {
    xlocations[i] = 0;
    ylocations[i] = 0;
  }
  return super.surfaceTouchEvent(me);
  
  super.surfaceTouchEvent(me);
  
  return gesture.surfaceTouchEvent(me);
}
*/
/*void mouseReleased() {
  //Sets mousex/y to 0 when released
  mouseX = 0;
  mouseY = 0;
  xlocations[0] = 0;
  ylocations[0] = 0;
}*/
public void play() {
  //Checks if each key is pressed
  boolean btn12 = false;
  boolean btn22 = false;
  boolean btn32 = false;
  boolean btn42 = false;
  boolean btn52 = false;
  boolean btn62 = false;
  boolean topkey2 = false;
  boolean sidekey2 = false;
  boolean akey12 = false;
  boolean akey22 = false;
  boolean akey32 = false;
  boolean akey42 = false;
  boolean bkey12 = false;
  boolean bkey22 = false;
  boolean bkey32 = false;
  boolean ckey12 = false;
  boolean ckey22 = false;
  boolean ckey32 = false;
  boolean ckey42 = false;
  boolean b12 = false;
  boolean b22 = false;
  boolean b32 = false;
 
  for (int i = 0; i < touches.length; i++) {
    float x = touches[i].x;
    float y = touches[i].y;
    if (btn1.isPressed(x, y)) {
      btn12 = true;
    }
    if (btn2.isPressed(x, y)) {
      btn22 = true;
    }
    if (btn3.isPressed(x, y)) {
      btn32 = true;
    }
    if (btn4.isPressed(x, y)) {
      btn42 = true;
    }
    if (btn5.isPressed(x, y)) {
      btn52 = true;
    }
    if (btn6.isPressed(x, y)) {
      btn62 = true;
    }
    if (topkey.isPressed(x, y)) {
      topkey2 = true;
    }
    if (sidekey.isPressed(x, y)) {
      sidekey2 = true;
    }
    if (akey1.isPressed(x, y)) {
      akey12 = true;
    }
    if (akey2.isPressed(x, y)) {
      akey22 = true;
    }
    if (akey3.isPressed(x, y)) {
      akey32 = true;
    }
    if (akey4.isPressed(x, y)) {
      akey42 = true;
    }
    if (bkey1.isPressed(x, y)) {
      bkey12 = true;
    }
    if (bkey2.isPressed(x, y)) {
      bkey22 = true;
    }
    if (bkey3.isPressed(x, y)) {
      bkey32 = true;
    }
    if (ckey1.isPressed(x, y)) {
      ckey12 = true;
    }
    if (ckey2.isPressed(x, y)) {
      ckey22 = true;
    }
    if (ckey3.isPressed(x, y)) {
      ckey32 = true;
    }
    if (ckey4.isPressed(x, y)) {
      ckey42 = true;
    }
    if (b1.isPressed(x, y)) {
      b12 = true;
    }
    if (b2.isPressed(x, y)) {
      b22 = true;
    }
   
    if (backkey.isPressed(x, y)) {
      backkey2 = !backkey2;
    }  
    if (octavekey.isPressed(x, y)) {
      octavekey2 = !octavekey2;
    }  
  }
  
  //Plays/displays note depending on which keys are pressed
  if (btn12 && btn22 && btn32 && btn42 && btn52 && btn62 && bkey22 && ckey42 && backkey2) {
    if (octavekey2) {
      playSound(20);
      display = "Mid B";
    } else {
      playSound(1);
      display = "low E";
    }
  } else if (btn12 && btn22 && btn32 && btn42 && btn52 && btn62 && bkey32 && ckey42 && backkey2) {
    if (octavekey2) {
      playSound(22);
      display = "Mid C#";
    } else {
      playSound(3);
      display = "low F#";
    }
  } else if (btn12 && btn22 && btn32 && btn42 && btn52 && btn62 && ckey42 && backkey2) {
    if (octavekey2) {
      playSound(21);
      display = "Mid C";
    } else {
      playSound(2);
      display = "Low F";
    }
  } else if (btn12 && btn22 && btn32 && btn42 && btn52 && btn62 && ckey22 && backkey2) {
    if (octavekey2) {
      playSound(24);
      display = "Mid D#";
    } else {
      playSound(5);
      display = "Low G#";
    }
  } else if (btn12 && btn22 && btn32 && btn42 && btn52 && btn62 && backkey2) {
    if (octavekey2) {
      playSound(23);
      display = "Mid D";
    } else {
      playSound(4);
      display = "Low G";
    }
  } else if (btn12 && btn22 && btn32 && btn42 && btn52 && backkey2) {
    if (octavekey2) {
      playSound(25);
      display = "High E";
    } else {
      playSound(6);
      display = "Low A";
    }
  } else if (btn12 && btn22 && btn32 && btn52 && backkey2) {
    if (octavekey2) {
      playSound(24);
      display = "High F#";
    } else {
      playSound(8);
      display = "Low B";
    }
  } else if (btn12 && btn22 && btn32 && b22 && backkey2) {
    if (octavekey2) {
      playSound(29);
      display = "Low G#";
    } else {
      playSound(10);
      display = "High C#";
    }
  } else if (btn12 && btn22 && btn32 && backkey2) {
    if (octavekey2) {
      if (btn42) {
        playSound(26);
        display = "High F";
      } else {
        playSound(28);
        display = "High G";
      }
    } else if (btn42) {
      playSound(7);
      display = "Low A#";
    } else {
      playSound(9);
      display = "Low C";
    }
  } else if (btn12 && btn22 && backkey2 && b12) {
    if (octavekey2) {
      playSound(31);
      display = "High A#";
    } else {
      playSound(12);
      display = "Low D#";
    }
  } else if (btn12 && btn22 && backkey2) {
    if (octavekey2) {
      playSound(30);
      display = "High A";
    } else {
      playSound(11);
      display = "Low D";
    }
  } else if (btn12 && backkey2) {
    if (octavekey2) {
      playSound(32);
      display = "High B";
    } else {
      playSound(13);
      display = "Mid E";
    }
  } else if (backkey2) {
    if (octavekey2) {
      playSound(33);
      display = "High C";
    } else {
      playSound(14);
      display = "Mid F";
    }
  } else if (btn12) {
    playSound(15);
    display = "Mid F#";
  } else if (sidekey2) {
    playSound(17);
    display = "Mid G#";
  } else if (topkey2 && octavekey2) {
    playSound(19);
    display = "Mid A#";
  } else if (topkey2) {
    playSound(18);
    display = "Mid A";
  } else {
    playSound(16);
    display = "Mid G";
  }
}

void onAudioEvent(short[] _data)
{
  data= _data;
}
