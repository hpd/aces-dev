
// <ACEStransformID>IDT.GoPro.ProtuneFlat_ProtuneGamut_8i.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - GoPro Protune Flat</ACESuserName>

//
// IDT for GoPro Cameras capturing Protune Flat footage - 8 bits
//

/*
Usage with 8 bit frames exported from a .mp4 video clip:
ctlrender -ctl IDT.GoPro.ProtuneFlat_ProtuneGamut_8i.a1.v1.ctl -force -global_param1 aIn 1.0 -format exr16 frame.tiff frame.aces.exr
*/


/* ============ CONSTANTS ============ */
const float PROTUNE_TO_ACES_MTX[3][3] = {
  { 0.533448429,  -0.050729924,  0.071419661 },
  { 0.32413911,    1.07572006,  -0.290521962 },
  { 0.142412421,  -0.024990416,  1.219102381 }
};


const float C1 = 113.;
const float C2 = 1.;
const float C3 = 112.;


/* ============ SUBFUNCTIONS ============ */
float Protune_to_lin
(
  float code,
  float c1,
  float c2,
  float c3
)
{
  float lin;
  lin = (pow(c1, code)-c2)/c3;
  return lin;
}

/* ============ Main Algorithm ============ */
void main
(
    input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    input varying float aIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut
)
{
  // Prepare input values based on application bit depth handling
  float Protune[3];
  Protune[0] = rIn;
  Protune[1] = gIn;
  Protune[2] = bIn;

  // 8-bit GoPro Protune Flat to linear Protune Gamut
  float lin[3];
  lin[0] = Protune_to_lin( Protune[0], C1, C2, C3);
  lin[1] = Protune_to_lin( Protune[1], C1, C2, C3);
  lin[2] = Protune_to_lin( Protune[2], C1, C2, C3);

  // Protune Gamut to ACES matrix
  float aces[3] = mult_f3_f33( lin, PROTUNE_TO_ACES_MTX);
  //float aces[3] = lin;

  rOut = aces[0];
  gOut = aces[1];
  bOut = aces[2];
  aOut = aIn;
}