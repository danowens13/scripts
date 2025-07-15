#stored in /usr/local/bin
headphones="alsa_output.usb-SteelSeries_Arctis_7P_-00.analog-stereo"
speakers="alsa_output.pci-0000_0d_00.1.hdmi-stereo"
if [ $(pactl get-default-sink) = $speakers ]; then
	$(pactl set-default-sink $headphones)
else
	$(pactl set-default-sink $speakers)
fi
