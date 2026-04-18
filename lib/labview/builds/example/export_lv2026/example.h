#include "extcode.h"
#ifdef __cplusplus
extern "C" {
#endif

/*!
 * CallWithInput
 */
int32_t __cdecl CallWithInput(char Input[], char MessageOut[], int32_t *len);
/*!
 * HelloWorld
 */
int32_t __cdecl HelloWorld(char Message[], int32_t *len);
/*!
 * Event
 */
int32_t __cdecl Event(char Message[], int32_t *len);
/*!
 * CallWithOutput
 */
int32_t __cdecl CallWithOutput(char MessageOut[], char ResultOut[], 
	int32_t *len, int32_t *lenOfResult);
/*!
 * CallWithInputAndOutput
 */
int32_t __cdecl CallWithInputAndOutput(char Input[], char MessageOut[], 
	char ResultOut[], int32_t *len, int32_t *lenOfResult);

MgErr __cdecl LVDLLStatus(char *errStr, int errStrLen, void *module);

void __cdecl SetExecuteVIsInPrivateExecutionSystem(Bool32 value);

#ifdef __cplusplus
} // extern "C"
#endif

