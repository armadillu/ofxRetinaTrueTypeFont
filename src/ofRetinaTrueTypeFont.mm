//
//  ofRetinaTrueTypeFont.cpp
//  fontsExample
//
//  Created by Oriol Ferrer Mesià on 01/02/13.
//
//

#include "ofMain.h"
#include "ofRetinaTrueTypeFont.h"

ofRetinaTrueTypeFont::ofRetinaTrueTypeFont():ofTrueTypeFont(){

	retina = false;
	scale = 1.0f;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		if ([[UIScreen mainScreen] scale] > 1){
			retina = true;
			scale = 0.5;
		}
	}
}

void ofRetinaTrueTypeFont::forceScale(float s){
	scale = 1 / s;
	retina = true;
};

bool ofRetinaTrueTypeFont::loadFont(string filename, int fontsize, bool _bAntiAliased, bool _bFullCharacterSet, bool makeContours, float simplifyAmt, int dpi){
	ofTrueTypeFont::loadFont(filename, fontsize / scale, _bAntiAliased, _bFullCharacterSet, makeContours, simplifyAmt, dpi);
	//ofTrueTypeFont::setLineHeight( ofTrueTypeFont::getLineHeight() / scale );
	//ofTrueTypeFont::setSpaceSize( ofTrueTypeFont::getSpaceSize() / scale);
	//ofTrueTypeFont::setLetterSpacing( ofTrueTypeFont::getLetterSpacing() / scale );
}


//void ofRetinaTrueTypeFont::setLetterSpacing(float spacing){
//	ofTrueTypeFont::setLineHeight( spacing / scale);
//}
//
//
//void ofRetinaTrueTypeFont::setSpaceSize(float size){
//	ofTrueTypeFont::setSpaceSize( size / scale);
//}
//
//
void ofRetinaTrueTypeFont::setLineHeight(float height){
	ofTrueTypeFont::setLineHeight( height / scale);
}
//
//
//float ofRetinaTrueTypeFont::getSpaceSize(){
//	return  ofTrueTypeFont::getSpaceSize() * scale;
//}
//
//
//float ofRetinaTrueTypeFont::getLineHeight(){
//	return  ofTrueTypeFont::getLineHeight() * scale;
//}
//
//
//float ofRetinaTrueTypeFont::getLetterSpacing(){
//	return  ofTrueTypeFont::getLetterSpacing() * scale;
//}


ofRectangle ofRetinaTrueTypeFont::getStringBoundingBox(string s, float x, float y){
	ofRectangle r =  ofTrueTypeFont::getStringBoundingBox(s, x, y);
	r.width *= scale;
	r.height *= scale;
	return r;
}


void ofRetinaTrueTypeFont::drawString(string s, float x, float y){

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

