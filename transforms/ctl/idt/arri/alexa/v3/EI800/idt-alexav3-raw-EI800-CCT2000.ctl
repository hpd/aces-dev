
// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 800
//  and CCT of adopted white set to 2000K
// Written by v3_IDT_maker.py v0.07 on Saturday 10 March 2012 by josephgoldstone

const float EI = 800.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 0.795933 + g_lin * 0.042336 + b_lin * 0.161731;
	gOut = r_lin * -0.019505 + g_lin * 1.075681 + b_lin * -0.056176;
	bOut = r_lin * 0.013338 + g_lin * -0.387268 + b_lin * 1.373929;
	aOut = 1.0;

}
