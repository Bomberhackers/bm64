#ifndef _ZEROJMP_TABLE_DEFINES_AL_H_
#define _ZEROJMP_TABLE_DEFINES_AL_H_

// TABLE 19 (AL)
#define alUnlink_xx(area) alUnlink__ ## area ## __secure_call
#define alUnlink_x(area) alUnlink_xx(area)
#define alUnlink alUnlink_x(ZEROJMP_AREA)

#define alLink_xx(area) alLink__ ## area ## __secure_call
#define alLink_x(area) alLink_xx(area)
#define alLink alLink_x(ZEROJMP_AREA)

#define alCopy_xx(area) alCopy__ ## area ## __secure_call
#define alCopy_x(area) alCopy_xx(area)
#define alCopy alCopy_x(ZEROJMP_AREA)

#define alHeapInit_xx(area) alHeapInit__ ## area ## __secure_call
#define alHeapInit_x(area) alHeapInit_xx(area)
#define alHeapInit alHeapInit_x(ZEROJMP_AREA)

#define alHeapDBAlloc_xx(area) alHeapDBAlloc__ ## area ## __secure_call
#define alHeapDBAlloc_x(area) alHeapDBAlloc_xx(area)
#define alHeapDBAlloc alHeapDBAlloc_x(ZEROJMP_AREA)

#define alHeapCheck_xx(area) alHeapCheck__ ## area ## __secure_call
#define alHeapCheck_x(area) alHeapCheck_xx(area)
#define alHeapCheck alHeapCheck_x(ZEROJMP_AREA)

#define alBnkfNew_xx(area) alBnkfNew__ ## area ## __secure_call
#define alBnkfNew_x(area) alBnkfNew_xx(area)
#define alBnkfNew alBnkfNew_x(ZEROJMP_AREA)

#define alSeqFileNew_xx(area) alSeqFileNew__ ## area ## __secure_call
#define alSeqFileNew_x(area) alSeqFileNew_xx(area)
#define alSeqFileNew alSeqFileNew_x(ZEROJMP_AREA)

#define alSynNew_xx(area) alSynNew__ ## area ## __secure_call
#define alSynNew_x(area) alSynNew_xx(area)
#define alSynNew alSynNew_x(ZEROJMP_AREA)

#define alSynDelete_xx(area) alSynDelete__ ## area ## __secure_call
#define alSynDelete_x(area) alSynDelete_xx(area)
#define alSynDelete alSynDelete_x(ZEROJMP_AREA)

#define alSynAddPlayer_xx(area) alSynAddPlayer__ ## area ## __secure_call
#define alSynAddPlayer_x(area) alSynAddPlayer_xx(area)
#define alSynAddPlayer alSynAddPlayer_x(ZEROJMP_AREA)

#define alSynRemovePlayer_xx(area) alSynRemovePlayer__ ## area ## __secure_call
#define alSynRemovePlayer_x(area) alSynRemovePlayer_xx(area)
#define alSynRemovePlayer alSynRemovePlayer_x(ZEROJMP_AREA)

#define alSynAllocVoice_xx(area) alSynAllocVoice__ ## area ## __secure_call
#define alSynAllocVoice_x(area) alSynAllocVoice_xx(area)
#define alSynAllocVoice alSynAllocVoice_x(ZEROJMP_AREA)

#define alSynFreeVoice_xx(area) alSynFreeVoice__ ## area ## __secure_call
#define alSynFreeVoice_x(area) alSynFreeVoice_xx(area)
#define alSynFreeVoice alSynFreeVoice_x(ZEROJMP_AREA)

#define alSynStartVoice_xx(area) alSynStartVoice__ ## area ## __secure_call
#define alSynStartVoice_x(area) alSynStartVoice_xx(area)
#define alSynStartVoice alSynStartVoice_x(ZEROJMP_AREA)

#define alSynStartVoiceParams_xx(area) alSynStartVoiceParams__ ## area ## __secure_call
#define alSynStartVoiceParams_x(area) alSynStartVoiceParams_xx(area)
#define alSynStartVoiceParams alSynStartVoiceParams_x(ZEROJMP_AREA)

#define alSynStopVoice_xx(area) alSynStopVoice__ ## area ## __secure_call
#define alSynStopVoice_x(area) alSynStopVoice_xx(area)
#define alSynStopVoice alSynStopVoice_x(ZEROJMP_AREA)

#define alSynSetVol_xx(area) alSynSetVol__ ## area ## __secure_call
#define alSynSetVol_x(area) alSynSetVol_xx(area)
#define alSynSetVol alSynSetVol_x(ZEROJMP_AREA)

#define alSynSetPitch_xx(area) alSynSetPitch__ ## area ## __secure_call
#define alSynSetPitch_x(area) alSynSetPitch_xx(area)
#define alSynSetPitch alSynSetPitch_x(ZEROJMP_AREA)

#define alSynSetPan_xx(area) alSynSetPan__ ## area ## __secure_call
#define alSynSetPan_x(area) alSynSetPan_xx(area)
#define alSynSetPan alSynSetPan_x(ZEROJMP_AREA)

#define alSynSetFXMix_xx(area) alSynSetFXMix__ ## area ## __secure_call
#define alSynSetFXMix_x(area) alSynSetFXMix_xx(area)
#define alSynSetFXMix alSynSetFXMix_x(ZEROJMP_AREA)

#define alSynSetPriority_xx(area) alSynSetPriority__ ## area ## __secure_call
#define alSynSetPriority_x(area) alSynSetPriority_xx(area)
#define alSynSetPriority alSynSetPriority_x(ZEROJMP_AREA)

#define alSynGetPriority_xx(area) alSynGetPriority__ ## area ## __secure_call
#define alSynGetPriority_x(area) alSynGetPriority_xx(area)
#define alSynGetPriority alSynGetPriority_x(ZEROJMP_AREA)

#define alSynAllocFX_xx(area) alSynAllocFX__ ## area ## __secure_call
#define alSynAllocFX_x(area) alSynAllocFX_xx(area)
#define alSynAllocFX alSynAllocFX_x(ZEROJMP_AREA)

#define alSynGetFXRef_xx(area) alSynGetFXRef__ ## area ## __secure_call
#define alSynGetFXRef_x(area) alSynGetFXRef_xx(area)
#define alSynGetFXRef alSynGetFXRef_x(ZEROJMP_AREA)

#define alSynFreeFX_xx(area) alSynFreeFX__ ## area ## __secure_call
#define alSynFreeFX_x(area) alSynFreeFX_xx(area)
#define alSynFreeFX alSynFreeFX_x(ZEROJMP_AREA)

#define alSynSetFXParam_xx(area) alSynSetFXParam__ ## area ## __secure_call
#define alSynSetFXParam_x(area) alSynSetFXParam_xx(area)
#define alSynSetFXParam alSynSetFXParam_x(ZEROJMP_AREA)

#define alInit_xx(area) alInit__ ## area ## __secure_call
#define alInit_x(area) alInit_xx(area)
#define alInit alInit_x(ZEROJMP_AREA)

#define alClose_xx(area) alClose__ ## area ## __secure_call
#define alClose_x(area) alClose_xx(area)
#define alClose alClose_x(ZEROJMP_AREA)

#define alAudioFrame_xx(area) alAudioFrame__ ## area ## __secure_call
#define alAudioFrame_x(area) alAudioFrame_xx(area)
#define alAudioFrame alAudioFrame_x(ZEROJMP_AREA)

#define alEvtqNew_xx(area) alEvtqNew__ ## area ## __secure_call
#define alEvtqNew_x(area) alEvtqNew_xx(area)
#define alEvtqNew alEvtqNew_x(ZEROJMP_AREA)

#define alEvtqNextEvent_xx(area) alEvtqNextEvent__ ## area ## __secure_call
#define alEvtqNextEvent_x(area) alEvtqNextEvent_xx(area)
#define alEvtqNextEvent alEvtqNextEvent_x(ZEROJMP_AREA)

#define alEvtqPostEvent_xx(area) alEvtqPostEvent__ ## area ## __secure_call
#define alEvtqPostEvent_x(area) alEvtqPostEvent_xx(area)
#define alEvtqPostEvent alEvtqPostEvent_x(ZEROJMP_AREA)

#define alEvtqFlush_xx(area) alEvtqFlush__ ## area ## __secure_call
#define alEvtqFlush_x(area) alEvtqFlush_xx(area)
#define alEvtqFlush alEvtqFlush_x(ZEROJMP_AREA)

#define alEvtqFlushType_xx(area) alEvtqFlushType__ ## area ## __secure_call
#define alEvtqFlushType_x(area) alEvtqFlushType_xx(area)
#define alEvtqFlushType alEvtqFlushType_x(ZEROJMP_AREA)

#define alSeqNew_xx(area) alSeqNew__ ## area ## __secure_call
#define alSeqNew_x(area) alSeqNew_xx(area)
#define alSeqNew alSeqNew_x(ZEROJMP_AREA)

#define alSeqNextEvent_xx(area) alSeqNextEvent__ ## area ## __secure_call
#define alSeqNextEvent_x(area) alSeqNextEvent_xx(area)
#define alSeqNextEvent alSeqNextEvent_x(ZEROJMP_AREA)

#define alSeqGetTicks_xx(area) alSeqGetTicks__ ## area ## __secure_call
#define alSeqGetTicks_x(area) alSeqGetTicks_xx(area)
#define alSeqGetTicks alSeqGetTicks_x(ZEROJMP_AREA)

#define alSeqTicksToSec_xx(area) alSeqTicksToSec__ ## area ## __secure_call
#define alSeqTicksToSec_x(area) alSeqTicksToSec_xx(area)
#define alSeqTicksToSec alSeqTicksToSec_x(ZEROJMP_AREA)

#define alSeqSecToTicks_xx(area) alSeqSecToTicks__ ## area ## __secure_call
#define alSeqSecToTicks_x(area) alSeqSecToTicks_xx(area)
#define alSeqSecToTicks alSeqSecToTicks_x(ZEROJMP_AREA)

#define alSeqNewMarker_xx(area) alSeqNewMarker__ ## area ## __secure_call
#define alSeqNewMarker_x(area) alSeqNewMarker_xx(area)
#define alSeqNewMarker alSeqNewMarker_x(ZEROJMP_AREA)

#define alSeqSetLoc_xx(area) alSeqSetLoc__ ## area ## __secure_call
#define alSeqSetLoc_x(area) alSeqSetLoc_xx(area)
#define alSeqSetLoc alSeqSetLoc_x(ZEROJMP_AREA)

#define alSeqGetLoc_xx(area) alSeqGetLoc__ ## area ## __secure_call
#define alSeqGetLoc_x(area) alSeqGetLoc_xx(area)
#define alSeqGetLoc alSeqGetLoc_x(ZEROJMP_AREA)

#define alCSeqNew_xx(area) alCSeqNew__ ## area ## __secure_call
#define alCSeqNew_x(area) alCSeqNew_xx(area)
#define alCSeqNew alCSeqNew_x(ZEROJMP_AREA)

#define alCSeqNextEvent_xx(area) alCSeqNextEvent__ ## area ## __secure_call
#define alCSeqNextEvent_x(area) alCSeqNextEvent_xx(area)
#define alCSeqNextEvent alCSeqNextEvent_x(ZEROJMP_AREA)

#define alCSeqGetTicks_xx(area) alCSeqGetTicks__ ## area ## __secure_call
#define alCSeqGetTicks_x(area) alCSeqGetTicks_xx(area)
#define alCSeqGetTicks alCSeqGetTicks_x(ZEROJMP_AREA)

#define alCSeqTicksToSec_xx(area) alCSeqTicksToSec__ ## area ## __secure_call
#define alCSeqTicksToSec_x(area) alCSeqTicksToSec_xx(area)
#define alCSeqTicksToSec alCSeqTicksToSec_x(ZEROJMP_AREA)

#define alCSeqSecToTicks_xx(area) alCSeqSecToTicks__ ## area ## __secure_call
#define alCSeqSecToTicks_x(area) alCSeqSecToTicks_xx(area)
#define alCSeqSecToTicks alCSeqSecToTicks_x(ZEROJMP_AREA)

#define alCSeqNewMarker_xx(area) alCSeqNewMarker__ ## area ## __secure_call
#define alCSeqNewMarker_x(area) alCSeqNewMarker_xx(area)
#define alCSeqNewMarker alCSeqNewMarker_x(ZEROJMP_AREA)

#define alCSeqSetLoc_xx(area) alCSeqSetLoc__ ## area ## __secure_call
#define alCSeqSetLoc_x(area) alCSeqSetLoc_xx(area)
#define alCSeqSetLoc alCSeqSetLoc_x(ZEROJMP_AREA)

#define alCSeqGetLoc_xx(area) alCSeqGetLoc__ ## area ## __secure_call
#define alCSeqGetLoc_x(area) alCSeqGetLoc_xx(area)
#define alCSeqGetLoc alCSeqGetLoc_x(ZEROJMP_AREA)

#define alCents2Ratio_xx(area) alCents2Ratio__ ## area ## __secure_call
#define alCents2Ratio_x(area) alCents2Ratio_xx(area)
#define alCents2Ratio alCents2Ratio_x(ZEROJMP_AREA)

#define alSeqpNew_xx(area) alSeqpNew__ ## area ## __secure_call
#define alSeqpNew_x(area) alSeqpNew_xx(area)
#define alSeqpNew alSeqpNew_x(ZEROJMP_AREA)

#define alSeqpDelete_xx(area) alSeqpDelete__ ## area ## __secure_call
#define alSeqpDelete_x(area) alSeqpDelete_xx(area)
#define alSeqpDelete alSeqpDelete_x(ZEROJMP_AREA)

#define alSeqpSetSeq_xx(area) alSeqpSetSeq__ ## area ## __secure_call
#define alSeqpSetSeq_x(area) alSeqpSetSeq_xx(area)
#define alSeqpSetSeq alSeqpSetSeq_x(ZEROJMP_AREA)

#define alSeqpGetSeq_xx(area) alSeqpGetSeq__ ## area ## __secure_call
#define alSeqpGetSeq_x(area) alSeqpGetSeq_xx(area)
#define alSeqpGetSeq alSeqpGetSeq_x(ZEROJMP_AREA)

#define alSeqpPlay_xx(area) alSeqpPlay__ ## area ## __secure_call
#define alSeqpPlay_x(area) alSeqpPlay_xx(area)
#define alSeqpPlay alSeqpPlay_x(ZEROJMP_AREA)

#define alSeqpStop_xx(area) alSeqpStop__ ## area ## __secure_call
#define alSeqpStop_x(area) alSeqpStop_xx(area)
#define alSeqpStop alSeqpStop_x(ZEROJMP_AREA)

#define alSeqpGetState_xx(area) alSeqpGetState__ ## area ## __secure_call
#define alSeqpGetState_x(area) alSeqpGetState_xx(area)
#define alSeqpGetState alSeqpGetState_x(ZEROJMP_AREA)

#define alSeqpSetBank_xx(area) alSeqpSetBank__ ## area ## __secure_call
#define alSeqpSetBank_x(area) alSeqpSetBank_xx(area)
#define alSeqpSetBank alSeqpSetBank_x(ZEROJMP_AREA)

#define alSeqpSetTempo_xx(area) alSeqpSetTempo__ ## area ## __secure_call
#define alSeqpSetTempo_x(area) alSeqpSetTempo_xx(area)
#define alSeqpSetTempo alSeqpSetTempo_x(ZEROJMP_AREA)

#define alSeqpGetTempo_xx(area) alSeqpGetTempo__ ## area ## __secure_call
#define alSeqpGetTempo_x(area) alSeqpGetTempo_xx(area)
#define alSeqpGetTempo alSeqpGetTempo_x(ZEROJMP_AREA)

#define alSeqpGetVol_xx(area) alSeqpGetVol__ ## area ## __secure_call
#define alSeqpGetVol_x(area) alSeqpGetVol_xx(area)
#define alSeqpGetVol alSeqpGetVol_x(ZEROJMP_AREA)

#define alSeqpSetVol_xx(area) alSeqpSetVol__ ## area ## __secure_call
#define alSeqpSetVol_x(area) alSeqpSetVol_xx(area)
#define alSeqpSetVol alSeqpSetVol_x(ZEROJMP_AREA)

#define alSeqpLoop_xx(area) alSeqpLoop__ ## area ## __secure_call
#define alSeqpLoop_x(area) alSeqpLoop_xx(area)
#define alSeqpLoop alSeqpLoop_x(ZEROJMP_AREA)

#define alSeqpSetChlProgram_xx(area) alSeqpSetChlProgram__ ## area ## __secure_call
#define alSeqpSetChlProgram_x(area) alSeqpSetChlProgram_xx(area)
#define alSeqpSetChlProgram alSeqpSetChlProgram_x(ZEROJMP_AREA)

#define alSeqpGetChlProgram_xx(area) alSeqpGetChlProgram__ ## area ## __secure_call
#define alSeqpGetChlProgram_x(area) alSeqpGetChlProgram_xx(area)
#define alSeqpGetChlProgram alSeqpGetChlProgram_x(ZEROJMP_AREA)

#define alSeqpSetChlFXMix_xx(area) alSeqpSetChlFXMix__ ## area ## __secure_call
#define alSeqpSetChlFXMix_x(area) alSeqpSetChlFXMix_xx(area)
#define alSeqpSetChlFXMix alSeqpSetChlFXMix_x(ZEROJMP_AREA)

#define alSeqpGetChlFXMix_xx(area) alSeqpGetChlFXMix__ ## area ## __secure_call
#define alSeqpGetChlFXMix_x(area) alSeqpGetChlFXMix_xx(area)
#define alSeqpGetChlFXMix alSeqpGetChlFXMix_x(ZEROJMP_AREA)

#define alSeqpSetChlVol_xx(area) alSeqpSetChlVol__ ## area ## __secure_call
#define alSeqpSetChlVol_x(area) alSeqpSetChlVol_xx(area)
#define alSeqpSetChlVol alSeqpSetChlVol_x(ZEROJMP_AREA)

#define alSeqpGetChlVol_xx(area) alSeqpGetChlVol__ ## area ## __secure_call
#define alSeqpGetChlVol_x(area) alSeqpGetChlVol_xx(area)
#define alSeqpGetChlVol alSeqpGetChlVol_x(ZEROJMP_AREA)

#define alSeqpSetChlPan_xx(area) alSeqpSetChlPan__ ## area ## __secure_call
#define alSeqpSetChlPan_x(area) alSeqpSetChlPan_xx(area)
#define alSeqpSetChlPan alSeqpSetChlPan_x(ZEROJMP_AREA)

#define alSeqpGetChlPan_xx(area) alSeqpGetChlPan__ ## area ## __secure_call
#define alSeqpGetChlPan_x(area) alSeqpGetChlPan_xx(area)
#define alSeqpGetChlPan alSeqpGetChlPan_x(ZEROJMP_AREA)

#define alSeqpSetChlPriority_xx(area) alSeqpSetChlPriority__ ## area ## __secure_call
#define alSeqpSetChlPriority_x(area) alSeqpSetChlPriority_xx(area)
#define alSeqpSetChlPriority alSeqpSetChlPriority_x(ZEROJMP_AREA)

#define alSeqpGetChlPriority_xx(area) alSeqpGetChlPriority__ ## area ## __secure_call
#define alSeqpGetChlPriority_x(area) alSeqpGetChlPriority_xx(area)
#define alSeqpGetChlPriority alSeqpGetChlPriority_x(ZEROJMP_AREA)

#define alSeqpSendMidi_xx(area) alSeqpSendMidi__ ## area ## __secure_call
#define alSeqpSendMidi_x(area) alSeqpSendMidi_xx(area)
#define alSeqpSendMidi alSeqpSendMidi_x(ZEROJMP_AREA)

#define func_8000B9A0_xx(area) func_8000B9A0__ ## area ## __secure_call
#define func_8000B9A0_x(area) func_8000B9A0_xx(area)
#define func_8000B9A0 func_8000B9A0_x(ZEROJMP_AREA)

#define func_8000BB10_xx(area) func_8000BB10__ ## area ## __secure_call
#define func_8000BB10_x(area) func_8000BB10_xx(area)
#define func_8000BB10 func_8000BB10_x(ZEROJMP_AREA)

#define func_8000BB40_xx(area) func_8000BB40__ ## area ## __secure_call
#define func_8000BB40_x(area) func_8000BB40_xx(area)
#define func_8000BB40 func_8000BB40_x(ZEROJMP_AREA)

#define func_8000BB80_xx(area) func_8000BB80__ ## area ## __secure_call
#define func_8000BB80_x(area) func_8000BB80_xx(area)
#define func_8000BB80 func_8000BB80_x(ZEROJMP_AREA)

#define func_8000BB90_xx(area) func_8000BB90__ ## area ## __secure_call
#define func_8000BB90_x(area) func_8000BB90_xx(area)
#define func_8000BB90 func_8000BB90_x(ZEROJMP_AREA)

#define func_8000BBC0_xx(area) func_8000BBC0__ ## area ## __secure_call
#define func_8000BBC0_x(area) func_8000BBC0_xx(area)
#define func_8000BBC0 func_8000BBC0_x(ZEROJMP_AREA)

#define func_8000BBF0_xx(area) func_8000BBF0__ ## area ## __secure_call
#define func_8000BBF0_x(area) func_8000BBF0_xx(area)
#define func_8000BBF0 func_8000BBF0_x(ZEROJMP_AREA)

#define func_8000BC00_xx(area) func_8000BC00__ ## area ## __secure_call
#define func_8000BC00_x(area) func_8000BC00_xx(area)
#define func_8000BC00 func_8000BC00_x(ZEROJMP_AREA)

#define func_8000BC40_xx(area) func_8000BC40__ ## area ## __secure_call
#define func_8000BC40_x(area) func_8000BC40_xx(area)
#define func_8000BC40 func_8000BC40_x(ZEROJMP_AREA)

#define alCSPGetTempo_xx(area) alCSPGetTempo__ ## area ## __secure_call
#define alCSPGetTempo_x(area) alCSPGetTempo_xx(area)
#define alCSPGetTempo alCSPGetTempo_x(ZEROJMP_AREA)

#define func_8000BCF0_xx(area) func_8000BCF0__ ## area ## __secure_call
#define func_8000BCF0_x(area) func_8000BCF0_xx(area)
#define func_8000BCF0 func_8000BCF0_x(ZEROJMP_AREA)

#define func_8000BD00_xx(area) func_8000BD00__ ## area ## __secure_call
#define func_8000BD00_x(area) func_8000BD00_xx(area)
#define func_8000BD00 func_8000BD00_x(ZEROJMP_AREA)

#define func_8000BD40_xx(area) func_8000BD40__ ## area ## __secure_call
#define func_8000BD40_x(area) func_8000BD40_xx(area)
#define func_8000BD40 func_8000BD40_x(ZEROJMP_AREA)

#define func_8000BDA0_xx(area) func_8000BDA0__ ## area ## __secure_call
#define func_8000BDA0_x(area) func_8000BDA0_xx(area)
#define func_8000BDA0 func_8000BDA0_x(ZEROJMP_AREA)

#define func_8000BE30_xx(area) func_8000BE30__ ## area ## __secure_call
#define func_8000BE30_x(area) func_8000BE30_xx(area)
#define func_8000BE30 func_8000BE30_x(ZEROJMP_AREA)

#define func_8000BE90_xx(area) func_8000BE90__ ## area ## __secure_call
#define func_8000BE90_x(area) func_8000BE90_xx(area)
#define func_8000BE90 func_8000BE90_x(ZEROJMP_AREA)

#define func_8000BEB0_xx(area) func_8000BEB0__ ## area ## __secure_call
#define func_8000BEB0_x(area) func_8000BEB0_xx(area)
#define func_8000BEB0 func_8000BEB0_x(ZEROJMP_AREA)

#define func_8000BF10_xx(area) func_8000BF10__ ## area ## __secure_call
#define func_8000BF10_x(area) func_8000BF10_xx(area)
#define func_8000BF10 func_8000BF10_x(ZEROJMP_AREA)

#define func_8000BF30_xx(area) func_8000BF30__ ## area ## __secure_call
#define func_8000BF30_x(area) func_8000BF30_xx(area)
#define func_8000BF30 func_8000BF30_x(ZEROJMP_AREA)

#define func_8000BF90_xx(area) func_8000BF90__ ## area ## __secure_call
#define func_8000BF90_x(area) func_8000BF90_xx(area)
#define func_8000BF90 func_8000BF90_x(ZEROJMP_AREA)

#define func_8000BFB0_xx(area) func_8000BFB0__ ## area ## __secure_call
#define func_8000BFB0_x(area) func_8000BFB0_xx(area)
#define func_8000BFB0 func_8000BFB0_x(ZEROJMP_AREA)

#define func_8000C000_xx(area) func_8000C000__ ## area ## __secure_call
#define func_8000C000_x(area) func_8000C000_xx(area)
#define func_8000C000 func_8000C000_x(ZEROJMP_AREA)

#define func_8000C020_xx(area) func_8000C020__ ## area ## __secure_call
#define func_8000C020_x(area) func_8000C020_xx(area)
#define func_8000C020 func_8000C020_x(ZEROJMP_AREA)

#define alSndpNew_xx(area) alSndpNew__ ## area ## __secure_call
#define alSndpNew_x(area) alSndpNew_xx(area)
#define alSndpNew alSndpNew_x(ZEROJMP_AREA)

#define alSndpDelete_xx(area) alSndpDelete__ ## area ## __secure_call
#define alSndpDelete_x(area) alSndpDelete_xx(area)
#define alSndpDelete alSndpDelete_x(ZEROJMP_AREA)

#define alSndpAllocate_xx(area) alSndpAllocate__ ## area ## __secure_call
#define alSndpAllocate_x(area) alSndpAllocate_xx(area)
#define alSndpAllocate alSndpAllocate_x(ZEROJMP_AREA)

#define alSndpDeallocate_xx(area) alSndpDeallocate__ ## area ## __secure_call
#define alSndpDeallocate_x(area) alSndpDeallocate_xx(area)
#define alSndpDeallocate alSndpDeallocate_x(ZEROJMP_AREA)

#define alSndpSetSound_xx(area) alSndpSetSound__ ## area ## __secure_call
#define alSndpSetSound_x(area) alSndpSetSound_xx(area)
#define alSndpSetSound alSndpSetSound_x(ZEROJMP_AREA)

#define alSndpGetSound_xx(area) alSndpGetSound__ ## area ## __secure_call
#define alSndpGetSound_x(area) alSndpGetSound_xx(area)
#define alSndpGetSound alSndpGetSound_x(ZEROJMP_AREA)

#define alSndpPlay_xx(area) alSndpPlay__ ## area ## __secure_call
#define alSndpPlay_x(area) alSndpPlay_xx(area)
#define alSndpPlay alSndpPlay_x(ZEROJMP_AREA)

#define alSndpPlayAt_xx(area) alSndpPlayAt__ ## area ## __secure_call
#define alSndpPlayAt_x(area) alSndpPlayAt_xx(area)
#define alSndpPlayAt alSndpPlayAt_x(ZEROJMP_AREA)

#define alSndpStop_xx(area) alSndpStop__ ## area ## __secure_call
#define alSndpStop_x(area) alSndpStop_xx(area)
#define alSndpStop alSndpStop_x(ZEROJMP_AREA)

#define alSndpSetVol_xx(area) alSndpSetVol__ ## area ## __secure_call
#define alSndpSetVol_x(area) alSndpSetVol_xx(area)
#define alSndpSetVol alSndpSetVol_x(ZEROJMP_AREA)

#define alSndpSetPitch_xx(area) alSndpSetPitch__ ## area ## __secure_call
#define alSndpSetPitch_x(area) alSndpSetPitch_xx(area)
#define alSndpSetPitch alSndpSetPitch_x(ZEROJMP_AREA)

#define alSndpSetPan_xx(area) alSndpSetPan__ ## area ## __secure_call
#define alSndpSetPan_x(area) alSndpSetPan_xx(area)
#define alSndpSetPan alSndpSetPan_x(ZEROJMP_AREA)

#define alSndpSetPriority_xx(area) alSndpSetPriority__ ## area ## __secure_call
#define alSndpSetPriority_x(area) alSndpSetPriority_xx(area)
#define alSndpSetPriority alSndpSetPriority_x(ZEROJMP_AREA)

#define alSndpSetFXMix_xx(area) alSndpSetFXMix__ ## area ## __secure_call
#define alSndpSetFXMix_x(area) alSndpSetFXMix_xx(area)
#define alSndpSetFXMix alSndpSetFXMix_x(ZEROJMP_AREA)

#define alSndpGetState_xx(area) alSndpGetState__ ## area ## __secure_call
#define alSndpGetState_x(area) alSndpGetState_xx(area)
#define alSndpGetState alSndpGetState_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_AL_H_
