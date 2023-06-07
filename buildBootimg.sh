#!/bin/bash
cd arch/arm/boot
git clone https://github.com/JonasCardoso/AnyKernel3.git

cp zImage AnyKernel3/zImage

zipdirout="AnyKernel3"
maintainer="jcg"
name="Mi4";
variant="Lite-Prime-Pro"; 
name1="Mi 4";
name2="MI4"; 
name3="Cancro"; 
name4="cancro";
release=$(date +%d""%m""%Y)
releasewithbar=$(date +%d"/"%m"/"%Y)
ToolchainName="GCC"
romversion="MK"
androidversion="NINE"
customkernel="nfsCifsKernel"
zipfile="${customkernel}-${name}-${variant}-${release}-${ToolchainName}-${androidversion}-${romversion}.zip"

echo "maintainer=${maintainer}" >> ${zipdirout}/device.prop
echo "customkernel=${customkernel}" >> ${zipdirout}/device.prop
echo "name=${name}" >> ${zipdirout}/device.prop
echo "variant=${variant}" >> ${zipdirout}/device.prop
echo "release=${release}" >> ${zipdirout}/device.prop
echo "releasewithbar=${releasewithbar}" >> ${zipdirout}/device.prop
echo "ToolchainName=${ToolchainName}" >> ${zipdirout}/device.prop
echo "romversion=${romversion}" >> ${zipdirout}/device.prop
echo "androidversion=${androidversion}" >> ${zipdirout}/device.prop
sed -i "/supported.versions=/i device.name1=${name}\ndevice.name2=${name1}\ndevice.name3=${name2}\ndevice.name4=${name3}\ndevice.name5=${name4}" ${zipdirout}/anykernel.sh

cd ${zipdirout}
rm -rf modules
rm README.md
rm LICENSE
zip -r ${zipfile} * -x .gitignore &> /dev/null
