
// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 400
//  and CCT of adopted white set to 3900K
// Written by v2_IDT_maker.py v0.05 on Saturday 10 March 2012 by josephgoldstone

float
normalizedLogC2ToRelativeExposure(float x) {
	if (x > 0.121428)
		return (pow(10,(x - 0.391007) / 0.256598) - 0.089004) / 5.061087;
	else
		return (x - 0.121428) / 5.656190;
}

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

	float r_lin = normalizedLogC2ToRelativeExposure(rIn);
	float g_lin = normalizedLogC2ToRelativeExposure(gIn);
	float b_lin = normalizedLogC2ToRelativeExposure(bIn);

	rOut = r_lin * 0.788567 + g_lin * 0.110336 + b_lin * 0.101098;
	gOut = r_lin * 0.059527 + g_lin * 1.052200 + b_lin * -0.111727;
	bOut = r_lin * 0.039119 + g_lin * -0.307346 + b_lin * 1.268227;
	aOut = 1.0;

}
