//
//  ofxRetinaTrueTypeFont.cpp
//  fontsExample
//
//  Created by Oriol Ferrer Mesià on 01/02/13.
//
//

#include "ofMain.h"
#include "ofxRetinaTrueTypeFont.h"

ofxRetinaTrueTypeFont::ofxRetinaTrueTypeFont():ofTrueTypeFont(){

	retina = false;
	scale = 1.0f;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		if ([[UIScreen mainScreen] scale] > 1){
			retina = true;
			scale = 0.5;
		}
	}
}

void ofxRetinaTrueTypeFont::forceScale(float s){
	scale = 1 / s;
	retina = true;
};

bool ofxRetinaTrueTypeFont::loadFont(string filename, int fontsize, bool _bAntiAliased, bool _bFullCharacterSet, bool makeContours, float simplifyAmt, int dpi){
	ofTrueTypeFont::loadFont(filename, fontsize / scale, _bAntiAliased, _bFullCharacterSet, makeContours, simplifyAmt, dpi);
	//ofTrueTypeFont::setLineHeight( ofTrueTypeFont::getLineHeight() / scale );
	//ofTrueTypeFont::setSpaceSize( ofTrueTypeFont::getSpaceSize() / scale);
	//ofTrueTypeFont::setLetterSpacing( ofTrueTypeFont::getLetterSpacing() / scale );
}


//void ofxRetinaTrueTypeFont::setLetterSpacing(float spacing){
//	ofTrueTypeFont::setLineHeight( spacing / scale);
//}
//
//
//void ofxRetinaTrueTypeFont::setSpaceSize(float size){
//	ofTrueTypeFont::setSpaceSize( size / scale);
//}
//
//
void ofxRetinaTrueTypeFont::setLineHeight(float height){
	ofTrueTypeFont::setLineHeight( height / scale);
}
//
//
//float ofxRetinaTrueTypeFont::getSpaceSize(){
//	return  ofTrueTypeFont::getSpaceSize() * scale;
//}
//
//
//float ofxRetinaTrueTypeFont::getLineHeight(){
//	return  ofTrueTypeFont::getLineHeight() * scale;
//}
//
//
//float ofxRetinaTrueTypeFont::getLetterSpacing(){
//	return  ofTrueTypeFont::getLetterSpacing() * scale;
//}


ofRectangle ofxRetinaTrueTypeFont::getStringBoundingBox(string s, float x, float y){
	ofRectangle r =  ofTrueTypeFont::getStringBoundingBox(s, x, y);
	r.width *= scale;
	r.height *= scale;
	return r;
}


void ofxRetinaTrueTypeFont::drawString(string s, float x, float y){

	if (retina){
		ofPushMatrix();
		ofTranslate(x, y);
		ofScale(scale, scale, 1.0f);
		ofTrueTypeFont::drawString(s,0,0);
		ofPopMatrix();
	}else{
		ofTrueTypeFont::drawString(s,x,y);
	}
}

