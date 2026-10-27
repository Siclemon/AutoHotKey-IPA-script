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

E & R:: SendText "ɚ"

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

,:: SendText "ʔ"
?:: SendText "ʔ"

T & S:: SendText "ʦ"
T & H:: SendText "ʧ"
D & Z:: SendText "ʣ"
D & H:: SendText "ʤ"

L:: Send "ɫ"

;=======DIACRITIQUES=======
SC034:: SendText "ː"
':: SendText "ˈ"
' & Down:: SendText "ˌ"
_:: SendText "‿"

J::SendText "ʲ"
H::SendText "ʰ"
W::SendText "ʷ"
R & Right::Send "{U+02DE}"      ;rhotic
é:: Send "{U+0303}"             ;nasal
U & Down::Send  "{U+032F}"      ;non-syllabic
^ & Down::Send  "{U+032F}"      ;non-syllabic
O & Down::Send "{U+0325}"       ;voiceless
SC006 & Down::Send  "{U+032A}"  ;dental
SC00C & Down::Send  "{U+032A}"  ;dental
SC006 & Up::Send  "{U+033A}"    ;apical
SC00C & Up::Send  "{U+033A}"    ;apical
SC006 & SC00C::Send  "{U+033B}" ;laminal

Esc::{
    MsgBox "Script stopped."
    ExitApp
}