#Syncing KernelSU to latest source and avoid a conflict
echo "Syncing KernelSU to latest source [1/2]"
cd kernel/realme/RMX1901 && git submodule sync && git submodule update --init --recursive && cd KernelSU && git checkout main && git pull && touch Android.mk && cd ../../../..

echo 'Patching Realme In-Screen Proximity [2/2]'
# Realme In-Screen Proximity Patch
cd frameworks/base && git fetch https://github.com/Shravan55555/proximity_patch.git && git cherry-pick afb38a0f9f9a612b13b12b901ab9b7f0fffae3de && cd ../..
