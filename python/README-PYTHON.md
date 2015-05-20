Academy / ASC Common LUT Format (CLF)
=====================================


Context
--- 
This bundle contains reference implementations of the Academy / ASC Common LUT Format (CLF) and the ACES Clip Metadata formats. The formats were developed as part of the Academy's ACES project.

The **ACES** project home page is here: http://www.oscars.org/aces

Documentation on the format can be found here: https://github.com/ampas/aces-dev/tree/master/documents

Goals
-----

The Python implementation of CLF:

- Includes reading, writing and querying data structures
	- And processing data where appropriate
- Is meant to be open, accessible, easily understood
- Is NOT meant to be fast
	- A C/C++ implementation is needed

CLF
--- 
### Library
aces/clf/

- Provides simple Python interface to read, write and query CLFs, and process colors with CLFs
- Implements the S-2014-006 specification included in the ACES 1.0 release
- Implements the Autodesk CTF extensions
	- Documented here: http://docs.autodesk.com/flamepremium2015/index.html?url=files/GUID-460BA05D-3AB7-4BE2-AD30-01F9D3440CD8.htm,topicNumber=d30e147706
	- Some extensions have proprietary behavior which is not open.
		- Ex. The Reference ProcessNode
- Implements the Duiker Research extensions
- Does little checking for validity of the ProcessList data
- Includes unit tests demonstrating
	- Creating a ProcessList and various ProcessNodes
	- Reading a CLF
	- Writing a CLF
	- Processing colors with a CLF 

### Tools
clfinfo

- Prints information about a CLF to the terminal

filterImageWithCLF

- Reads an image, applies a CLF to the image, writes a new image 

convertLUTtoCLF

- Converts from the different LUT formats to CLF
- LUT formats currently supported are: spi1d, spi3d and csp

convertCLFtoLUT

- Converts from CLF to different LUT formats
- LUT formats currently supported are: spi1d, spi3d, csp, clf

convertOCIOtoCLF

- Converts from a set of OCIO colorspace definitions to CLF
- Accepts source color spaces and destination color spaces.
- Currently supported OCIO transforms: Group, File, Log and Matrix
	- Missing transforms: Allocation, CDL, Exponent
		- ColorSpace, Display and Look transforms not supported either. These are references to other transforms so should be simple to support eventually.
	- Not all flags are supported.
		- Ex. 'inverse' for Matrix Transforms

Clip Metadata
-------------
### Library
aces/clip

- Provides simple Python interface to read, write and query Clip Metadata.
- Implements the TB-2014-009 specification included in the ACES 1.0 release
- Includes examples of
	- Creating ClipMetadata and various sub-components
	- Reading a Clip Metadata file
	- Writing a Clip Metadata file
- Does little checking for validity of the data
- No support for formatting dates, uuids or other data stored in fields

### Tools
clipinfo.py

- Prints information about a Clip to the terminal


Extensions
---------------------
- Autodesk extensions
	- Gamma ProcessNode
	- Log ProcessNode
	- Reference ProcessNode
		- With some separation of Autodesk-specific functionality like the 'alias' attribute
	- ExposureContrast ProcessNode
	- 'bypass' Attribute
	- DynamicParameter Element
- Duiker Research extensions
	- Group ProcessNode
		- Useful for organizing list of nodes that represent a single filter/transform
	- 'floatEncoding' Array attribute and associated behavior

Would be nice to have
---------------------
### CLF

- An 'inverse' style for ProcessNodes such as LUT1D, Matrix, Range, ASC CDL.

### Clip

- Example integration of Clip support into application
- Questions answered about how file should work in a multi-user scenario


Thanks
------
These scripts and modules were the product of work and conversations with a number of people. Thanks go to:

- Walter Arrighetti
- Scott Dyer
- Alex Forsythe
- Jim Houston
- Thomas Mansencal
- Doug Walker

Author
------
The original author of this CLF implementation is:

- Haarm-Pieter Duiker

Dependencies
------------
The CLF (aces/clf) and Clip Metadata (aces/clip) modules can be used independently. The tools that work with CLF depend on the following libraries:

- **OpenImageIO**: http://openimageio.org
- **OpenColorIO**: http://opencolorio.org/
