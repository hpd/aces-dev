
// <ACEStransformID>ACESlib.OCIO_shaper_lin_to_dolbypq.a1.0.0</ACEStransformID>

// 
// Generic transform from linear to a Dolby PQ encoding
// 

import "ACESlib.Transform_Common.a1.0.0";

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
  rOut = pq_r( rIn );
  gOut = pq_r( gIn );
  bOut = pq_r( bIn );
  aOut = aIn;  
}