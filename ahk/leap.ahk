; Swap Esc and capslock
Capslock::Esc
Esc::Capslock


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


