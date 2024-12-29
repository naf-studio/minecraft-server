# java -Xms4096M -Xmx8192M -Duser.timezone="Asia/Ho_Chi_Minh" -XX:MaxRAMPercentage=80 \
# -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+EnableDynamicAgentLoading \
# -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=200 -XX:+DisableExplicitGC \
# -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 \
# -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 \
# -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=10 \
# -XX:G1MixedGCLiveThresholdPercent=85 -XX:G1RSetUpdatingPauseTimePercent=1 \
# -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 \
# -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20 -Dusing.aikars.flags=https://mcflags.emc.gs \
# -Daikars.new.flags=true -Dterminal.jline=false -Dterminal.ansi=true \
# -DPaper.IgnoreJavaVersion=true -XX:G1RSetUpdatingPauseTimePercent=5 -XX:MaxTenuringThreshold=15 \
# -jar server.jar --nogui

java -Xms4096M -Xmx8192M -XX:MaxRAMPercentage=80 \
-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:+EnableDynamicAgentLoading \
-XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=200 -XX:+DisableExplicitGC \
-XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 \
-XX:G1HeapRegionSize=8M -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 \
-XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=10 \
-XX:G1MixedGCLiveThresholdPercent=85 -XX:G1RSetUpdatingPauseTimePercent=1 \
-XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 \
-XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20 -Dusing.aikars.flags=https://mcflags.emc.gs \
-Daikars.new.flags=true -Dterminal.jline=false -Dterminal.ansi=true \
-DPaper.IgnoreJavaVersion=true -XX:G1RSetUpdatingPauseTimePercent=5 -XX:MaxTenuringThreshold=15 \
-jar server.jar --nogui
