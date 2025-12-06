//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: main.cu
//
// GPU Coder version                    : 23.2
// CUDA/C/C++ source code generated on  : 06-Nov-2025 16:20:27
//

/*************************************************************************/
/* This automatically generated example CUDA main file shows how to call */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

// Include Files
#include "main.h"
#include "evaluatePolicy.h"
#include "evaluatePolicy_terminate.h"

// Function Declarations
static void argInit_5x1_real_T(double result[5]);

static double argInit_real_T();

// Function Definitions
//
// Arguments    : double result[5]
// Return Type  : void
//
static void argInit_5x1_real_T(double result[5])
{
  // Loop over the array to initialize each element.
  for (int idx0{0}; idx0 < 5; idx0++) {
    // Set the value of the array element.
    // Change this value to the value that the application requires.
    result[idx0] = argInit_real_T();
  }
}

//
// Arguments    : void
// Return Type  : double
//
static double argInit_real_T()
{
  return 0.0;
}

//
// Arguments    : int argc
//                char **argv
// Return Type  : int
//
int main(int, char **)
{
  // The initialize function is being called automatically from your entry-point
  // function. So, a call to initialize is not included here. Invoke the
  // entry-point functions.
  // You can call entry-point functions multiple times.
  main_evaluatePolicy();
  // Terminate the application.
  // You do not need to do this more than one time.
  evaluatePolicy_terminate();
  return 0;
}

//
// Arguments    : void
// Return Type  : void
//
void main_evaluatePolicy()
{
  double b[5];
  double action1;
  // Initialize function 'evaluatePolicy' input arguments.
  // Initialize function input argument 'observation1'.
  // Call the entry-point 'evaluatePolicy'.
  argInit_5x1_real_T(b);
  action1 = evaluatePolicy(b);
}

//
// File trailer for main.cu
//
// [EOF]
//
