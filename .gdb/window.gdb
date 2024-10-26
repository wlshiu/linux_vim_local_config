# ______________window size control___________
define contextsize-stack
    if $argc != 1
        help contextsize-stack
    else
        set $CONTEXTSIZE_STACK = $arg0
  end
end
document contextsize-stack
Set stack dump window size to NUM lines.
Usage: contextsize-stack NUM
end


define contextsize-data
    if $argc != 1
        help contextsize-data
    else
        set $CONTEXTSIZE_DATA = $arg0
    end
end
document contextsize-data
Set data dump window size to NUM lines.
Usage: contextsize-data NUM
end


define contextsize-code
    if $argc != 1
        help contextsize-code
    else
        set $CONTEXTSIZE_CODE = $arg0
    end
end
document contextsize-code
Set code window size to NUM lines.
Usage: contextsize-code NUM
end


define cls
    shell clear
end
document cls
Clear screen.
end


define z_win_src_high

    if $argc == 1
        winheight src $arg0 5
    else
        if $argc == 2
            winheight src $arg0 $arg1
        else
            help z_win_src_high
        end
    end
    
end
document z_win_src_high
Syntax: z_win_src_high <+/-> [NR_LINES]
| Size the active window high
end


define z_win_cmd_high

    if $argc == 1
        winheight cmd $arg0 5
    else
        if $argc == 2
            winheight cmd $arg0 $arg1
        else
            help z_win_cmd_high
        end
    end
    
end
document z_win_cmd_high
Syntax: z_win_src_high <+/-> [NR_LINES]
| Size the active window high
end

