#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxRetinaTrueTypeFont.h"

//include both these files!
#include "ofxEasyRetina.h"
#include "ofxiOSEAGLView+retinaPatch.h"

class testApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();

        ofTrueTypeFont font;
		ofxRetinaTrueTypeFont retinaFont;

		//declare an ofxEasyRetina instance
		ofxEasyRetina retina;

};


