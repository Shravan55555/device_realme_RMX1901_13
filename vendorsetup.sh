# Vendor Tree
echo 'Cloning Vendor tree [1/5]'
git clone git@github.com:H1mJT/vendor_realme_RMX1901_13.git vendor/realme/RMX1901


#Kernel tree
echo 'Cloning Kernel tree [2/5]'
git clone --recurse-submodules git@github.com:H1mJT/kernel_realme_RMX1901.git -b ksu kernel/realme/RMX1901

#Syncing KernelSU to latest source
echo "Syncing KernelSU to latest source [3/5]"
cd kernel/realme/RMX1901 && git submodule sync && git submodule update --init --recursive && cd KernelSU && git checkout main && git pull && cd ../../../..

# Use Proton Clang For Compilation
echo ' Using Proton Clang For Compilation [4/5]'
git clone --depth=1 https://github.com/kdrag0n/proton-clang.git prebuilts/clang/host/linux-x86/clang-proton


echo 'Patching Realme In-Screen Proximity [5/5]'
# Realme In-Screen Proximity Patch
cd frameworks/base && git fetch git@github.com:H1mJT/proximity_patch.git && git cherry-pick afb38a0f9f9a612b13b12b901ab9b7f0fffae3de && cd ../..
