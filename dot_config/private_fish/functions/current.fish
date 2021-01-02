# Defined in - @ line 2
function current
	if test (spotifycli --playbackstatus) = "▶"
        echo ""
        echo "  ▶  Currently playing:" (spotifycli --status)
    end
end
