echo -e "Cloning msm8998 HALs for 4.19 Kernel"
git clone https://github.com/OdSazib/hardware_qcom-caf_media_msm8998 hardware/qcom-caf/sdm660/media
git clone https://github.com/OdSazib/hardware_qcom-caf_display_msm8998 hardware/qcom-caf/sdm660/display
git clone https://github.com/AOSP-11/hardware_qcom-caf_audio_msm8998 hardware/qcom-caf/sdm660/audio

echo -e "Adapting vendor/qcom/opensource/power"
cd vendor/qcom/opensource/power
git fetch https://github.com/OdSazib/android_vendor_qcom_opensource_power afb6880fe2b6003188715b52a735c7646ec453f7
git cherry-pick FETCH_HEAD

