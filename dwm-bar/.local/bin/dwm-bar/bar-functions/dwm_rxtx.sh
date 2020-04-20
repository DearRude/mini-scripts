#!/bin/sh

# A micro-script to print rxtx into dwm_bar
# Ebrahim Nejati (keybase.io/dearrude)
# GNU GPLv3

dwm_rxtx () {
	device_name="wlp3s0"

	start_transmit=`ip -s -j link show dev $device_name | jq '.[0] | .stats64.tx.bytes'`
	start_recieve=`ip -s -j link show dev $device_name | jq '.[0] | .stats64.rx.bytes'`

	sleep 0.5

	end_transmit=`ip -s -j link show dev $device_name  | jq '.[0] | .stats64.tx.bytes'`
	end_recieve=`ip -s -j link show dev $device_name | jq '.[0] | .stats64.rx.bytes'`

	# Coverted to bit

	transmit=`echo $((($end_transmit-$start_transmit)*16)) | numfmt --to=iec-i`
	recieve=`echo $((($end_recieve-$start_recieve)*16)) | numfmt --to=iec-i`

	echo " $recieve  $transmit"
}

dwm_rxtx

