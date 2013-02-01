#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	

	ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	ofBackground(22, 22, 22);

	float size = 12;
	string fontName = "verdana.ttf";

	font.loadFont(fontName, size);
	retinaFont.loadFont(fontName, size);

}


void testApp::update(){
	float lineHeight = 15 + 5 * sinf( ofGetElapsedTimef() * 5 );
	float letterSpace = 1.02 + 0.02 * sinf( ofGetElapsedTimef() * 3);

	retinaFont.setLineHeight(lineHeight);
	font.setLineHeight(lineHeight);

	retinaFont.setLetterSpacing(letterSpace);
	font.setLetterSpacing(letterSpace);

}


void testApp::draw(){

	retina.setupScreenOrtho();

	int off = 25;
	ofPushMatrix();
		font.drawString("drawing at x:y", off, 20);

		ofPushMatrix();
		ofTranslate(off, 100);
		font.drawString("drawing after\n translate", 0, 0);
		ofPopMatrix();

		ofPushMatrix();
		ofTranslate(off, 150);
		ofRotate(ofGetElapsedTimef() * 150, 0, 0, 1);
		font.drawString("rotating z\nand new line", 0, 0);
		ofPopMatrix();

		ofRectangle r = font.getStringBoundingBox("bbox\ntwo lines", off, 200);
		ofSetColor(66);
		ofRect(r);
		ofSetColor(255);
		font.drawString("bbox\ntwo lines", off, 200);

	ofPopMatrix();


	ofLine(ofGetWidth()/2, 0, ofGetWidth()/2, ofGetHeight());
	ofTranslate(ofGetWidth()/2, 0); /////////////////////////


	ofPushMatrix();
		retinaFont.drawString("drawing at x:y", off, 20);

		ofPushMatrix();
		ofTranslate(off, 100);
		retinaFont.drawString("drawing after\n translate", 0, 0);
		ofPopMatrix();

		ofPushMatrix();
		ofTranslate(off, 150);
		ofRotate(ofGetElapsedTimef() * 150, 0, 0, 1);
		retinaFont.drawString("rotating z\nand new line", 0, 0);
		ofPopMatrix();

		ofRectangle r2 = font.getStringBoundingBox("bbox\ntwo lines", off, 200);
		ofSetColor(66);
		ofRect(r2);
		ofSetColor(255);
		retinaFont.drawString("bbox\ntwo lines", off, 200);

	ofPopMatrix();

}
