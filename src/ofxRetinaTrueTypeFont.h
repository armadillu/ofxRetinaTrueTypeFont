//
//  ofxRetinaTrueTypeFont.h
//  fontsExample
//
//  Created by Oriol Ferrer Mesià on 01/02/13.
//
//

#ifndef fontsExample_ofxRetinaTrueTypeFont_h
#define fontsExample_ofxRetinaTrueTypeFont_h


#include "ofTrueTypeFont.h"

class ofxRetinaTrueTypeFont: public ofTrueTypeFont{

public:

	ofxRetinaTrueTypeFont();

	void drawString(string s, float x, float y);
	bool loadFont(string filename, int fontsize, bool _bAntiAliased=true, bool _bFullCharacterSet=false, bool makeContours=false, float simplifyAmt=0.3, int dpi=0);
	void forceScale(float s);

	float getScale(){ return scale; }
	bool isRetina(){ return  retina; }

//	float getLetterSpacing();
//	void setLetterSpacing(float spacing);
//	float getLineHeight();
	void setLineHeight(float height);
//	float getSpaceSize();
//	void setSpaceSize(float size);
//
//	int getSize();
//	float stringWidth(string s);
//	float stringHeight(string s);
	ofRectangle getStringBoundingBox(string s, float x, float y);


private:

	bool retina;
	float scale;
};

#endif
