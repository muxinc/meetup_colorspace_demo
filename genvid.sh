#!/bin/bash
ffmpeg -f rawvideo -s 320x240 -pix_fmt yuv420p -t 1 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -color_range pc -y 601.mp4

ffmpeg -f rawvideo -s 320x240 -pix_fmt yuv420p -t 1 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -colorspace smpte170m -color_primaries smpte170m -color_trc smpte170m \
    -color_range pc -y 601vui.mp4

ffmpeg -f rawvideo -s 320x240 -pix_fmt yuv420p -t 2 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -vf "colorspace=irange=pc:range=pc:iall=smpte170m:all=bt709" \
    -color_range pc -y 709.mp4

ffmpeg -f rawvideo -s 320x240 -pix_fmt yuv420p -t 2 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -vf "colorspace=irange=pc:range=pc:iall=smpte170m:all=bt709" \
    -colorspace bt709 -color_primaries bt709 -color_trc bt709 \
    -color_range pc -y 709vui.mp4

ffmpeg -f rawvideo -s 1920x1080 -pix_fmt yuv420p -t 1 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -color_range pc -y hd601.mp4

ffmpeg -f rawvideo -s 1920x1080 -pix_fmt yuv420p -t 1 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -colorspace smpte170m -color_primaries smpte170m -color_trc smpte170m \
    -color_range pc -y hd601vui.mp4

ffmpeg -f rawvideo -s 1920x1080 -pix_fmt yuv420p -t 2 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -vf "colorspace=irange=pc:range=pc:iall=smpte170m:all=bt709" \
    -color_range pc -y hd709.mp4

ffmpeg -f rawvideo -s 1920x1080 -pix_fmt yuv420p -t 2 -i /dev/zero \
    -an -vcodec libx264 -profile:v baseline -crf 18 -preset:v placebo \
    -vf "colorspace=irange=pc:range=pc:iall=smpte170m:all=bt709" \
    -colorspace bt709 -color_primaries bt709 -color_trc bt709 \
    -color_range pc -y hd709vui.mp4
