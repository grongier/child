/****************************************************************************\
**   Header file for defining global constants
**   $Id: Definitions.h,v 1.15 1999-04-05 23:59:23 nmgaspar Exp $
\****************************************************************************/

#ifndef DEFINITIONS_H
#define DEFINITIONS_H

/** DEFINITIONS *************************************************************/
#define VERSION "Beta 1.0"
#define TRUE 1
#define FALSE 0
//#define kMaxNameLength 80
//#define kCommentMark '#'
//#define kTimeLineMark ' '
#define kUniformMesh 0     /*method of grid construction*/
#define kPerturbedMesh 1
#define kRandomMesh 2
#define kCornerOutlet 0   /*type of open boundary*/
#define kOpenSide 1
#define kOppositeSidesOpen 2
#define kAllSidesOpen 3
#define kSpecifyOutlet 4
#define kClosedBoundary 1
#define kOpenBoundary 2
#define kNonBoundary 0
#define kFlowAllowed 1
#define kFlowNotAllowed 0
#define kDetachmentLimited      1
#define kDetachLimThreshold     2
#define kTransportLimited       3
#define kTransLimThreshold      4
#define kBedrockAlluvial        5
#define kMeanderNode 1
#define kNonMeanderNode 0
#define RHO 1000.0      /* Density of water (kg/m^3) */
#define RHOSED 2650. /* density of sediment, [kg/m^3] */
#define GRAV 9.81       /* Gravitational acceleration, m/s^2 */
#define POROSITY 0.3        /* porosity of sediment on bed */
#define VISC .00000112      /* viscosity of water [m^2/s] */
#define SECPERYEAR 31557600.00  /*number of seconds in a year*/

// Macros
#define ROUND(x)    (int)(x+0.5)
#define SIGN(x)     ( x>0 ? 1 : 0 )

// Redefine floats to be double precision (8 byte) for compatibility
// with meandering routine
//#define float double

#endif
