#!/bin/bash
# ==============================================================================
# Script Name: run.sh
# Description: Startup script for the Minecraft server. It sets Java Virtual
#              Machine (JVM) flags for optimization and restarts the server
#              automatically upon stop/crash until manually terminated.
#
# Usage:
#   ./run.sh
#
# ==============================================================================

while true; do

# These startup flags are based on the meowice-flags project:
# [meowice-flags](https://github.com/MeowIce/meowice-flags)

java -Xms4G -XX:MaxRAMPercentage=95.0 --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=28 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 -XX:G1MixedGCCountTarget=3 -XX:InitiatingHeapOccupancyPercent=20 -XX:G1MixedGCLiveThresholdPercent=90 -XX:SurvivorRatio=32 -XX:G1HeapWastePercent=5 -XX:MaxTenuringThreshold=1 -XX:+PerfDisableSharedMem -XX:G1SATBBufferEnqueueingThresholdPercent=30 -XX:G1ConcMarkStepDurationMillis=5 -XX:G1RSetUpdatingPauseTimePercent=0 -XX:+UseNUMA -XX:-DontCompileHugeMethods -XX:MaxNodeLimit=240000 -XX:NodeLimitFudgeFactor=8000 -XX:ReservedCodeCacheSize=400M -XX:NonNMethodCodeHeapSize=12M -XX:ProfiledCodeHeapSize=194M -XX:NonProfiledCodeHeapSize=194M -XX:NmethodSweepActivity=1 -XX:+UseFastUnorderedTimeStamps -XX:+UseCriticalJavaThreadPriority -XX:AllocatePrefetchStyle=3 -XX:+AlwaysActAsServerClassMachine -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+EagerJVMCI -XX:+UseStringDeduplication -XX:+UseAES -XX:+UseAESIntrinsics -XX:+UseFMA -XX:+UseLoopPredicate -XX:+RangeCheckElimination -XX:+OptimizeStringConcat -XX:+UseCompressedOops -XX:+UseThreadPriorities -XX:+OmitStackTraceInFastThrow -XX:+RewriteBytecodes -XX:+RewriteFrequentPairs -XX:+UseFPUForSpilling -XX:+UseFastStosb -XX:+UseNewLongLShift -XX:+UseVectorCmov -XX:+UseXMMForArrayCopy -XX:+UseXmmI2D -XX:+UseXmmI2F -XX:+UseXmmLoadAndClearUpper -XX:+UseXmmRegToRegMoveAll -XX:+EliminateLocks -XX:+DoEscapeAnalysis -XX:+AlignVector -XX:+OptimizeFill -XX:+EnableVectorSupport -XX:+UseCharacterCompareIntrinsics -XX:+UseCopySignIntrinsic -XX:+UseVectorStubs -XX:UseAVX=2 -XX:UseSSE=4 -XX:+UseFastJNIAccessors -XX:+UseInlineCaches -XX:+SegmentedCodeCache -Duser.timezone="Asia/Ho_Chi_Minh" -Dpaper.explicit-flush=true -jar server.jar

# -XX:+UseTransparentHugePages
# -Djdk.nio.maxCachedBufferSize=262144 -Djdk.graal.UsePriorityInlining=true -Djdk.graal.Vectorization=true -Djdk.graal.OptDuplication=true -Djdk.graal.DetectInvertedLoopsAsCounted=true -Djdk.graal.LoopInversion=true -Djdk.graal.VectorizeHashes=true -Djdk.graal.EnterprisePartialUnroll=true -Djdk.graal.VectorizeSIMD=true -Djdk.graal.StripMineNonCountedLoops=true -Djdk.graal.SpeculativeGuardMovement=true -Djdk.graal.TuneInlinerExploration=1 -Djdk.graal.LoopRotation=true -Djdk.graal.CompilerConfiguration=enterprise

echo Restarting in 5 seconds...
echo Press CTRL + C to cancel.
sleep 5
done
