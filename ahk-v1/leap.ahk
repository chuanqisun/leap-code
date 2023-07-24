; Swap Esc and capslock
;Capslock::Esc
Esc::Capslock

; CapsLock as Esc, and hold for Ctrl
; reference: https://www.autohotkey.com/board/topic/104173-capslock-to-control-and-escape/
CapsLock::
    key=
    Input, key, B C L1 T1, {Esc}
    if (ErrorLevel = "Max")
        Send {Ctrl Down}%key%
    KeyWait, CapsLock
Return
CapsLock up::
If key
    Send {Ctrl Up}
else
    if (A_TimeSincePriorHotkey < 1000)
        Send, {Esc 2}
Return

*CapsLock up::
If ((A_TickCount-cDown)<150) ; Modify press time as needed (milliseconds)
    Send {Blind}{Ctrl Up}{Esc}
Else
    Send {Blind}{Ctrl Up}
Return

; New layer triggered by RAlt
global RAltLayer
RAltLayer = false

EnableRAltLayer()
{
    RAltLayer = true
}

DisableRAltLayer()
{
    RAltLayer = false
}

IsRAltLayer()
{
    return %RAltLayer% = true
}

*RAlt::
    EnableRAltLayer()
return

*RAlt up::
DisableRAltLayer()
return

#If IsRAltLayer()
    ; arrow keys
    i::up
    j::left
    k::down
    l::right

    ; home & end
    u::home
    o::end

    ; page up & page down
    y::PgUp
    h::PgDn

    ; symbols
    e::(
    r::)
    s::$
    d::{
    f::}
    x::[
    c::]
    a::-
    z::_
    g::=
    t::>

#If

