#Add your own (set of) activation bytes here
#You need to know these or obtain them via rainbow tables for this to work!
#Appropriate searching will find a way to discover/extract the activation bytes associated with your account(s)
abytes_list=("abcdef01" "23456789")


#Loop through activation bytes (if you have several to try):
for abytes in "${abytes_list[@]}"; do
    ##Create mp3 files (wider player support, but no chapter markers, must reencode and takes longer):
    #output="${1%.aax}.mp3"
    #ffmpeg -activation_bytes "$abytes" -i "$1" -c:v copy -vsync 2 $output

    #Create m4a files (mp4 audio, still widely supported, with chapter markers):
    output="${1%.aax}.m4a"
    ffmpeg -activation_bytes "$abytes" -i "$1" -c copy -map 0 -f mp4 $output
    
    if [ $? -eq 0 ]; then
        exit 0
    fi
done
