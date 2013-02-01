//
//  ofRetinaTrueTypeFont.h
//  fontsExample
//
//  Created by Oriol Ferrer Mesià on 01/02/13.
//
//

#ifndef fontsExample_ofRetinaTrueTypeFont_h
#define fontsExample_ofRetinaTrueTypeFont_h


#include "ofTrueTypeFont.h"

class ofRetinaTrueTypeFont: public ofTrueTypeFont{

public:

	ofRetinaTrueTypeFont();

	void drawString(string s, float x, float y);
	bool loadFont(string filename, int fontsize, bool _bAntiAliased=true, bool _bFullCharacterSet=false, bool makeContours=false, float simplifyAmt=0.3, int dpi=0);
	void forceScale(float s);

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
