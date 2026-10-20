²::{
    ;pour empêcher le "²" de sortir
}

#HotIf GetKeyState("²")

;=======VOYELLES=======

E & Left:: SendText "ɜ"
E & Down:: SendText "ə"
E & Right:: SendText "ɛ"

A & Left:: SendText "ɑ"
A & Right:: SendText "ɒ"
Z & E:: SendText "æ"

O & left:: SendText "ɔ"
O & -:: SendText "ø"
O & E:: SendText "œ"

I:: SendText "ɪ"

U:: SendText "ʊ"

V & Down:: SendText "ʌ"


;=======CONSONNES=======

N & Left:: SendText "ɲ"
N & Right:: SendText "ŋ"

S & Up:: SendText "ʃ"
S & Down:: SendText "ʃ"
Z & Down:: SendText "ʒ"

R & Down:: SendText "ʁ"
R & Left:: SendText "ɹ"
R:: SendText "ɾ"
R & Up:: SendText "ʀ"

0:: SendText "θ"
Numpad0:: SendText "θ"
D:: SendText "ð"

H & Down:: SendText "ɥ"

;=======DIACRITIQUES=======
SC034:: SendText "ː"
é:: Send "{U+0303}"
J::SendText "ʲ"

#HotIf
Esc::{
    MsgBox "Script stopped."
    ExitApp
}