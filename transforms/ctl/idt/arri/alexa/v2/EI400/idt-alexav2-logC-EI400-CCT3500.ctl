
// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 400
//  and CCT of adopted white set to 3500K
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

	rOut = r_lin * 0.785505 + g_lin * 0.099743 + b_lin * 0.114753;
	gOut = r_lin * 0.051809 + g_lin * 1.043895 + b_lin * -0.095704;
	bOut = r_lin * 0.037452 + g_lin * -0.319189 + b_lin * 1.281737;
	aOut = 1.0;

}
