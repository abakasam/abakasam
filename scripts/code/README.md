# TODO: Create options (Review)

if [[ $1 == "--version" ]]; then :
cat commentcode.version
fi
if [[ $1 == "--help" ]]; then :
cat commentcode.help
fi
if [[ $1 == "--languages" ]]; then :
cat commentcode.languages
fi

# TODO: Parse files (Review)

language=$1
path=$2
todofile=$3

if [[ $path == "." ]];
then :
path=$(pwd)
fi

types="TODO IMPROVE REDO BUG MEMORY LEGACY"

declare -A streams

streams[js]="console.log(<message>)"
streams[sh]="echo (<message>)"

if [[ ${streams[$language]} == "" ]];
then :
echo "Langauge, ${language}, not supported"
exit
fi

declare -a comments

files=$(ls $path)

for file in ${files[@]}
do
filename=${file%.*}
extension=${file##*.}

if [[ $extension == $language ]];
then :
fi

declare -a lines
while read line
do
lines[${#lines[@]}]="$line"
done < $file

rm $file
touch $file

for (( index=0; index < ${#lines[@]}; index++))
do
line=${lines[$index]}
echo $line
IFS=" "
read -ra segment <<< $line

operator=${segment[0]}
type=${segment[1]//:/}
message=${segment[2]}
comment="${operator} ${type}"
status=${line##*(}
status=${status%%)*}

if [[ "Complete" == $status ]];
then :
# TODO: Mark to be reviewed (Review)
line=${line/"(Complete)"/"(Review)"}
fi
if [[ "Reviewed" == $status ]];
then :
# TODO: Convert into console output (Review)
line=${streams[$language]/"<message>"/$message}
fi

for type in ${types[@]}
do
if [[ $comment == "$operator $type" ]];
then :
comments[${#comments[@]}]="$path/$file $index $line"
fi
done

lines[$index]=$line
done

for (( index=0; index < ${#lines[@]}; index++))
do
echo ${lines[$index]} >> $file
done
done

# TODO: Create TODO (Review)

rm $todofile
touch $todofile

for (( index=0; index < ${#comments[@]}; index++))
do
echo ${comments[$index]} >> $todofile
skjdfalskjdf
skjfdlksajd

skjdfalskjdfskjdf
skjdfalsk

// TODO: message

// REVIEW:
// REVIEW: (Review)

hfbvux
‹ÿí}ÛvÛÆ’hù&³C:$¨‹%'’-o’¢eÚºE’ã8’Ç„HP„E4J–½¹Ö¬uÎœ§ó60ÿ°?eÎœªê+ .¾ÍÙd²d »ºººººªºPhŒİî¹{æÕ¶ÛÍÖîaë»¯ñ[XXX½Ÿå•ÃoiáÁ"ûnyeuaqquuà–VWàßï¾Áo'n¤|AÂ©ÿ›üÛi±m¿ë±W(4ÃñUäŸVê–ÙÒÂâ¯l¯›„ç~ÂºaDşé$	£¸PØ÷¢‘Ç~0?f/òN¯ØYä‰×«°~äy,ì³îÀÎ¼
KBæWlìE14O×üàŒ¹€u|UÈdhâ°Ÿº‘À=æÆqØõ]ÀÇzaw2ò‚ÄM°¿¾?ôbVJ€öâ¡hQ,S'=Ïü€a¬b—~2'	‹¼ĞEæİá¤‡4Èê¡?òEØœ¸é$† 6
{~ÿõhXãÉéĞÖócÎ(Œ±ØYÁqÔÂˆÅŞpX>ĞMcÕÔ’>F†&‚E1–ÂQz$~èO¢ºô¨M/–Qo½n‚%Ş‡Ãğ‡SÖóqDñZ¡€sí†…Or&@*''`¬gUTÅw8d§`ôë,’Ã‰°{XEAâ»C6#êÏ¦ı?m±Ã½'G/ë-Ö>dû{¿·7[›¬X?„ûb…½l=İ{qÄ
·õF{»}ôªRxÒ>ÚEœOöXí×ÚÍÛõ¶ÿâ`ï°İoÚİöî“è¥µÓÚ=r W(c­ßá†>­oocW…ú şécÍ½ıWí­§GìéŞöf
- ¬ŞØnñ®`PÍíz{§Â6ë;õ­µÚ,ãÔ±—O[X„ıÕáÿæQ{o‡ÑÜÛ=:€Û
ŒòàH5}Ù>lUXı }ˆyr°·S) ;¡Å!v»-YÍR3 xÿâ°¥²ÍV}pÁôì¦¦Ï)|7ÿıOø…ıGıUÂWóƒ÷Şy#û¿¸´²ºjÛÿ¥Õ¥¹ıÿ&¿ŸÀ¶1nZ/öÈ8=¯ïŞ~‚9H®JŞ{Ôêq…ıôæï„½ÉĞû©Â>²w8ñÖXM<6-Cû7b“À¿æ_Ä^T?«Íé}7ñ#¯ô“ª­BÏQÕÅúŸ )¶<õúaäÕû‰=Ãs³¯ªºXW@¥lƒ`ÖMØ¿†Üa©‰:	
ÎÉxğn˜*ê$¨;IGá¹äcm5Áj„‹OÁŞ„Ä¾—ÜŸì¹†±WŠÃIÔsï½çv´Ì>óûLÔ°GX0ËĞcF}œ®’“ …cÔE¼Ísï*†b1mçp'•%”¯T2p"Vò|aùì¡ÂzÁY2€âŸæd1l æØ½NH±ƒCÚb¯_è2Û
“0¹{xE¤·ãV~zä=§N¢â"¢Ìb»V8P<fŠ`‚Eÿ;xVèÌ<bÅegÕY(®Ëš7rPPwÄ{˜D°•8»*òîöj_ƒÌ¢VÑJ¢R8æ,.7ÉJuÀµRà]ÚºÊi‚Ïí‘Ô–ÊëF¡ƒ6½¾;&„TşÔ½ÑpM‚8ò_/èC?HœÍÖ“ú‹í£CG€VDËçö@‡®}²H´]“"ãóÏ‚01‰¾¢`¬VcMâ*@†¸¹€­[€?‰A-³0‚œ!—o6pªUSdÅıuNAnJ¸Ú*¬(:)–à´,)y=ß=kãÈ»ğ½KÊñëŠ*ÎK±(±pqXG‚¡É8;=â(nÎ@_“™ÁëÈñN¤ùé ÔÆ^Â’5!`æqQÛ£"JãqOps‘©v_à#Õ~ü(DpÊ~ü˜5|¸²ÕM©<í¼v`ï
.5Âpè¹AÙy3]*²¢ç¸ÀdÏbÚõr¶i@­ÕD®ŸJÉğÙ8Õ<)X½,š‰?ñGŞŸaàÍÆ¯ø ÕKì¶¤zÀ­©“¶ôæ‚¢—¬¾ÄB¤ÖÚø‹+¥¥	î_8:àÍJf7å[a†gZË5'ŞóN'gk¬Tf6Œ•êı0[
[ä`TÈ…ƒw|Y‰µŠ¼(
#H·iHÎ7½ìD“b¡ÂğZN¥Å2k÷a7`!©ÕcªÌh«ªÃ0‹ªB»|¹0`©
èrEøiÈ18…Ø
VßÅ€Ã0Ñ!Š°¢Tî€‚;ÜC`ú«†cŠJ€ş‘O¤CuäÁnÅ‹ì¥´D£@•eÓ‰Q%$]$Uêòß˜A:±±F¼Lˆg°…ãF´ác‚4ÑºøE‰ÃêÃKì>U‡—˜³FÇDïUq»]oœ`xŒ$TJö*ö6÷ÖH5ÛGUĞ–Ì ŞÑ‹÷û<½‚3 å´	R·jFAÆÜø*è
I/éŒ¨ínÉDQALËÒA˜2o|Mw·¤»ã6Vö'v§y€‘®ë(])â×-³Çşş'oJÿïıïò›Úßÿ£²pÎ%(‹’²jêƒÖ"Ñ3ü³¶Zé!pŠõ€L–«A+uX1¸ÆXˆKtOy'3½cÙX{AÒºäpLv^Ê×b†kaªGMè—5¥+æD]zÔqÕu'Q„&Zè	%Ç(û—Şpˆÿúà~˜ä‰ÃÈÛ$w8íâêIn"F—Ü5»ßR„ Ğ8­±;2œ!€OˆÌÔ0«°0òÏ|3ñ‰#Æ«‰N
¬^
EïÊ«‚â,dâûl$ãx­V;ƒ¹œ:İpTŸû4LjÒ#¡=)/sTcQÉç§bIZKÉ•”Am@hÑÜrÕÜrÍä¯˜)váÇ ÃÇÃ	°5–JNæ¢{‚“Õ .¸µÅÕåû+‹–
Ãë&¿iÈÒ#Ş§!^ÂI·Ñ³×r»ƒ¿'c-ˆO¯â¬ WÜÆ•Åp¹6#OeÉï2åYÈ‹ô.CìKp]Û¾gñŞ'àüÆ\¦R:El^Ç]RlªhUïj°şxá5ûÛßä¶XëyTÍ o=Õ/l¤‹r?^4±Âh& pÔJÖ°¥òÀE¨K¦º;Ş<»_‘#µ(*Wœıå/
Î(}œ¢O•¯±Î38ĞeÏâ˜v4­l´9*ˆHA-oºø„ƒèŞ»‡÷X=É€.âT‘D“_Fvû^µMxÑú¯Ş{w4züOg}¿'o%¤Vë¢”Ç%y±a d6ïÕ
†$ŠvP	JrŸ‹¾³xã®§–WP.*±dÌ]ï®w)ôˆ•Ş¸3äfû+Û#L
?®VP‹%MšÜ=éEù½ÕD<¤ŠH¹Æ.Ê©	ÓÄ‰…9-H>ê€‚¸Z/¤YŒT¿¦ˆ˜¨£‡©pÖj?ˆXÆh3?8{q°ıH†Õ‘;.üƒÆÿã¨ûÂÿ7ÄÿAugÿ/İ_y0ÿ‹Ÿ?B1f™©Í×`ÓQÌÖ×ª‘z©&™@½	/w1ØÔ›°™íy¶•ØÉ›­,Ï?ÛFÇîÍfrİKp§†ãF“·.V:ËÆoæF³‘ÂÛDgÄoŒÎŒ~NÜğÄoGL“;µîsƒŠ×³AF«};]7İğÏ<ZÜ¾9ö˜Şöe‘©êëƒ’vR·}Âb&Ó•F”Òôg*?)©÷Ì7G-?;v9»³ló2ÓİÍˆgŞqÌ‰e~fóVqÌ¼h&³ÔH*¨iWŞ6¶yÛ§±@óÂœ¹¡N+^õõBß.ìùUCŸÿ-ÂŸŸ5×ÿQĞ[ÄBgÄDï½1JšµdÓÔÛÔ3´ÒÔÔÜ€êõaÔ¼+@”g÷o]½)ÊjY_åŒ\D_SOÚ§B«Fv½0“;·
Ş2ˆzC0õ+U¿jpõkY¿V°õ‹]o¾Ş&k{¤v,¶ğIËîNKnör›šº7®½KÈ6½®n´½UàVF€ÌĞí§pMËS÷3b¹·ŠèŞ2²kƒß5À{·Pïì o¾aú:1à\‚ÏÖgD‰+¹§¹¥v9c²ÖiÖÍŠ)ËF"®ü‘e[¶£ËŸ_¦³±F®‹0›QfKÜh¾s°yÖ.Ÿ…65Ì-âĞV‡åÌ¤§ãÒ8×Ÿ˜şœøï¥wú_ÿ]}0ÿşCÆó“µ¯ÿæ$jÏÿf3µoÿÍ&mßÿÍÍİ^¿6tî‡{çáŞy¸wî‡{çáŞy¸wî‡{çáŞy¸wî‡{çáŞy¸wî‡{ÿëÃ½2;ñ£š÷é3ù¿¨0âoÿÅğr&ş»BÿÎã¿_ı'Ågº>?ÑçŸşüÿ"ïùKj€›Öÿı{ı//ÌÏÿù¦ëæsù
ùçXÿâ_Xöağ¥û¸áüÏÕÕûöú_YY¯ÿoñC7¹¸#¯¸f¼$ƒ–(òXŸ¶ù´KBˆ¹Øx¼øÜ¾ÂlùÉÓÉéO1;h±¿°-|`ñÛ6n*bF¾M³&5•ŠS2±t§}ÄËèlO(áÏÄŠd—îÕD´xê5<'€ğÇş¹[äÇÑ}ì÷¼V¿›KÄĞw‡1/?÷®.Ã¨g •!"–‡|ä;öåeÜ;——I±‰ê=òÆaìÃ–ı
ÀQ¬™„Å$™ˆO½ ëÓĞøÖ$÷•$@ô¯KÎ}ç¾ì5ó®BÜwVœ_22Èƒ+ÀäåYUzÈ"úZpV2p´ z˜*'ûjG±$æ“ÍxaL"Z@ŞMG.6of
µ†–‹ŠDœrRVTÄë¾Emª§Ø£à¯×^z§7À%q÷Ó=7êUÇçg9ĞÄµZßKºƒê(>p–ê9È[9KKˆ+éÚa8ôŞ‹IÌÔª-Ş‡¶JL¬^5ñbh£–ï¯ŒùX1!f¤)Y5‹Ç°M|euQW@œ8sÎbo„gÃv«‘7ôÜXÿ‹‰Ò©
¦OÆ=7ñªB{T¡DªŞ‡B³3cÄ6Rabé,8KZÅù½Í0èûgZ
ñyTLİ@W7àÛj¬É¼1Ë×ºZ;TÏ'CôœDÀŒ?P ©C7E=°¨ Ì´¬baZøö?K
Æ	¾ı_ZZ^Éœÿ¹¼ü`ÿõmì¿6ÍË2¾Åµ¢–F!ï ĞÇEÇÉÛ%ŒY¡š¾Vmaq%¤v‹3v'Ü)8)®Ÿ€ïÚœ´“CM¯IK;É¯t+3í$c4Óà3“ÓN2;İpF~ÚI7ni½¢|¢ßQ&¸ü·”O‚òÖ8ÀÍ‰k6Næš¹cêZº¡™»–®¹SòZºé§e¯eqä§¯•”-š§v™Â–ÅŸÊaËVË$¶“âIÑîÈ¸ŸÓõY™lÍ¬l¨“¢¹)™-MW6›-]Çt6İøuĞfÕRFÛI8gÊr~R[®Ôİ"«Í˜€ü.Œ¼¶ëû¸]bÛı©m×÷§gS%·äg·åöyçü6«é—Hp³Pæf¸¥™IqKWÛ9néÚ“ÜÒà·Èr38k¥¹YC3óÜRëük%º¥:ùº™néñ|éT·4öÔ\·•Ÿì–V	³²İ,™ÏIwË5¤ jÙòÙ	oYXñvb§¼eL›HÈ°ìµÀ(ù+ŸÖ¥Zïøv“')8FN¾ÓÀqG!•Šs/1gæèË<&Ü=.¯ı-rà²cÈO‚ËÂ¥³àrÙı…Òàrq±<¸|ì_ .ñµ™p'éT¸“™¹p¹¨ïœ—Å’Î†›YŸŸg{¶v>ºş«ñ®+ñšU8M©éT^ªæ6‰qöæê6™qF›;¥Æ¥x‡Ü8cèòFğàšô8{d·ÏËÑB™¹Yj}V†~VŠÜ‰Ê‘;)ævtm–>¸H“Ë±mÙ¢/Ÿ(—OÓãYcûœT¹|ŒÓüb•,7ÛÀ­›ÛĞ™ùr)‘¬İ»'}RÊœl«pÈ¤9UğéYsE-µxfäÍé‘‹Ä¹Œª¸6sÎ†¾eêÜìÈÂ·J³{,geÀHŸSSÿÏÎ Óu©º“c•ø”¢œºX)îÉg„ECûÀXpEÏÀ*E(ƒkc
%"< ëàJÃàR†Ãß†cß´òá‚¯}Ä›EøGEàZà’†àB­C¸6ƒ'E
îÂLÀ…‘ÀFEà¹»‡Ë¦[>q¬3»r(WÀa![Ø,# ìƒ¿ '=i¬¤?ÀÂo±_>ËıF<Ğ5rÚp
ğVMHÚ{@–DîğIæÌA;¨ÊôÜš
Ékÿhé…›7.¢O	,háãÃíó¥ £@xæ%ÈTqıN¿z½¾WÙ©×wê•=¼Üª×·*£F½>h`m³¾_JÒDİJ³^ïB»æÛF³Ò‚öõÊËzı%7›¨úÿx›4*/C»^oóz¼jV «gvŠ`uåA3‚ÂÂ1ô³Cır€mÄèò·zı
kMA/ÿDüï,7·Ôpšb8[(Ï¬¦Cš±§ˆ½¹IØyLÈ‡0ùòC>sèˆï‹ÔÓ»æ©…çA¦'"ldºIŞ¹n^^Êy™˜3ÂÕR}…Ïû²”yu½|ÎÆú‰óäêóõˆ-Gİ´Y¹j (5FQzÎg›Ôoy&pëWMõCÓÂú¸DX_ös—ÂFO0ûâR.„zó7õH-µÖ$À“Cá9MÍ­M,¥á»âå)^Ÿ7|Õô5X[£Q„lj4Ä
BÓš^š'ôYaP…<?X1ä÷’„¼×p	Gî\4¸–î¼"Êÿ€¤I¢q	ê”øhüá|ıMêƒ´_hŸ"ÅKÔì‚t1‡ûÕ äg1~Ôe(&Ërêš¼wùÔ4‘ÉX(ŞDÀ¹ø'²Õğ6®Èç$‹gº©A‹¤ŠËøÛ¦MÒ^¯Ê"%ĞŞüµaêW„ô›†V=Zõ(÷¶1Ô6®M=¨_2<ækş<ƒ¹ê!Õ§Y¸ƒÆ²µÉ{Æë'8üPğpP€WP_ğï‡Få>k¡4ïqñ‘ñÑöWDdÔ˜¹ÆÍm1hmÅÓÔ€#¹h›#Éi‚%ÌVıÉBƒ^ÓõçU»~@2s8nJ‹Ò¶°õÊB;
õ‹‹F`ÏÜï4£›øçƒ¾.NßÎçMßËÙÓ^n‘)Xm%äÄH¿b¯rÖ SKÌA¾4Ó¯é¤)Ì €R–ƒ«µ+2S| õs>;$Â¯°õ‡æ@ê‡\ï¡-¼‡°ñ³1ÅX¼‰Å{9ó1â8Èboq%ŞE¶¼kpkß”ËZ¿4,€@+<£ìªÎ›rY/Ã‚Tå¸ğ}¢‡¼±Ü’Ò:]6¼º¥¦5·Ï°ì%6[nh'ãº—ÁûÈí|OÎRHR,C^ïÔõ "(BÛS’)ÍRsx“wö‘©—ûn…îŞ5ëi¿v¥lGw¿‹Åäv4#"±U:Nº^[È‡VßÂDÜ–¹¸ùÍïæ;dq;Bö=#]¿uÏi`.õ ‹İ¥9Ù[â“¸¯ô©Íg¹+—xã“ÿ¸»iˆN×ÿŒ;˜$¥4mòÛŸ­›7É‰Zûœkà7üKƒl?áª!Oº°†æ·5hÔ9ç`{Š-Ü=ŞKÉL÷ñ2ŸŒĞcñ2-?8ÂË†^eÂRí·p(}î
 9µõıMHİ Ü4Ğ6=¥öä`·9[Øç¾¯à)±èİÓ¨ñvÓôöPN¶P²êÜ% ®ªîªiÀà¨‡¨uÖ‹Óy¾ÿ­Ïûré7äÿ-®®®dòÿ––çùóü¿yşß<ÿoÿ7Ïÿ›çÿÍóÿæùóü¿yşß<ÿoÿ7Ïÿ›çÿÍóÿæùóü¿yşß<ÿoÿ7Ïÿûrùy™[*#ËJÈá³µæNĞ4*ññÏËéçy©<¬–ÊúU<?$é\,şF=´¡GŠM:•“5hògÖúQ±¢G?3®°–0nÚí$e»F?ÊÒWª‰ÑŸjAùW"Á@<ÃÕ9!ú±¥uEµôtO{°I9ê¾Ç)K%_¹¢3ûŠ×­¨:•~¥ê*â4İëï*…ã7ğcSåèI0™I5ˆk4pA‹Å5ÍÎW"=«¥+ˆÒM…îˆóCOCJøVø¾’L¥]>µåsáœ©“D[ƒ'dV% &y¨ÉÂou &€Z])ñ¥t¬Öçu¥Óİgõ7Îïo&_ôZÓ}J6gcğt.«^ËÉuÈß>±‘o‰§ä[yKx§øw¬”.)×+‚yVB—¬^ÎTkjóVyZX3]ëÆTv]ã_›Z	í²âş¾aóÄÒµjf3³qr§Lk)iAÓà†hæe5k¬f´H“šéC³6(aCó˜Ë	ÏI	J`j6ı6İ­exòÖG*Á„P/o^Gº^É3½¡Ù¯~jf@FÓŠZ+B^F×
^kQÂeİ¦ÅhÓh¬»×{Æ²+êÍ-sÚÉh¦Òœ,(¹ˆ#x¹-êTQ-Y™25"åÊİ»ÎçJ3Cv64ôÚKŒxl²LcSªš,€Ğ¢FzX]2&
M‰9áÖ[JÎ*³°*sºi˜.Yø‡êoÛ°M–7–ëæ%ŒµÍÎˆzËn¥”ËÛfjkó’3ÿÆğÅj®KM8©då˜ŠE t“V×i?3‡_”B“«Œˆ©£d÷çõŞ§vúò<`š‰¦LŠßp«7dwÒ¨6(—[Ë»îÉBh¹miÔéñÖZ•w™›Şã¬Åø`¶OÊ{!B„(ußÔâ6S•ğU¦ç4–Ø·MÃâ¥¤£oˆªÎS›mà5´JZËÉYk›zÕRëz"´$«Ä3c*kÍ(K/~«ÛêY³Z¨©ÛšåÆl¨Å¦B/}Y¸i+§¬!ZläÂhæé46™ÿuĞªoî´œQï+ä]ŸÿõàÁbæü·…••ùùïßä÷y…Â»ûé®…Âñ÷Çº‰'¯K2ÖíÎœxà{Ã^ìøa-jµÔá²N|qVÖ.//€zóB&S-ÊØSëd‡‰›LbİÚxFa¿Z»£s¸Çµ# °vêöÎì¾¯iíR8~ünâEW$®Y®#²ŸO#7èànäâÓër¡ğğûj•%a—U«…B•¿ÀÜ¢×¥(Ç¿—eÄEŠ"TGx(«;ö«¢H@JFk@‘(¡á
©Ì(·ZG¬F@ÌGø;­Ñ9ãEş=f(XKŸ^.>9ü6a_ÄÅCÏûŒÅ]&ÛßŸ€4ôÂîÓxæ@Øçib’`™èåğ™±ŒVZjn``ìu#/¹5Ç„&):d¢YéG°X~°.BÓù½üò°Íü4€’á úÛTê8wŸD!;»Wklÿ ı{ı¨e~Â*	a4Ã‰úøØT}ª‹'ì#]¨‰‚Ê³rG•yó¬H„æ¬0á#h%Ê¨Ïí¥t'5†)9h|>&Ëkº"c|ğÛ‚Ié^©>-iÅ?/29Á¤÷5Á†	¸v®ßòà¤jË#ºg#x"2Zmz¹mTz¸û‘3Ç:í¦<B·7ã`™($(GCã0”)Õ‡åÑ7Ò.¶`§ÌwË4v2ã‘Sp¾Ş‰Ÿ|J‹´ğbôÁ”Ïåˆ‘‹üïOü¬Q^j7,5÷OYÓÇ@EN<ô¢/ªP²jÇ"¨Cï1€VˆÂ0a/¶¥–Ãé°'šÌƒ!}VàÂ8	(y-f!ÀnwäUı ‹’Ü~êLJ:–ô›k°ûgºãÀôöv£`¼fR¼»iãö-3ïï4Óõ(r¯ó|Êã›æü0kÿF¼5KK¾""ß“AÎŠômœÑ
ÖK.ÅxàöÂË*ŸC_U¡¯,.¼@dääøÉ½œ+†˜™:HIHÀ~S!¦Ó
ü",¹ªŠ±Si/rû‰üXŒ’ƒWbæã8¡^¸8†§à_UØéş¡H·Ä¡#r°‹”ÇiäâIy^»­@ÏfÎçÉ®`ÙD÷Vª<Ìf—øR€ğ‘p’°RÇ¢À5Ú=ëI1”â²Ãß=Ò®~âmì€÷F+‹ÜIı€Wo(sé]ÒëGe’VÒíô%ñfW	÷>âı®-Ô°S?x°¸ğMˆ¦‘f ïutÊ]œïYK€[zØ?¨·Z2½u´L^»@Où:ÏW0Y <¹s„¯a/¡qDĞ$ÅğE’|×whaÔ£Æ-Ö1ÆhPiR^ß+bù°$`=ÜXXöšÑà5]úçşUÉŞÕ¶É›°ÿ&ùğF6yƒ}¾ÁNã²sÛ5)ÙJ¥>ò"ğ'jÛaü¦œyø5cibÖ6B3–¶îºêi§q¨‘Oğ%YDœR©döâ£10Œ*½¡€u J#?‰¹Ïw¬âUG_œŞÜ½úARBìø$aR©Ÿ_Ašêò-ãÅ˜ZÓÈgqÇcÔ$"œwgÂÈrE“Øj‹Î’3Û]ÈI(‡_Û”®ŒD]Š|KòæøĞü~5Sò4MüÎ•ÎÚ”9Œ*íÇÀ÷ÏÅYe'ïà)İÌ˜cg©%b)‚˜+¢•ô‚‡á¸È,n™¥‹ÓÊßV“@´Æ@WÂò<~‚åÄW:†Wwåd?¥›¨×Ø¢ğJ2#Î'Û|)İca¹E	Í¦ÓODÜºçy$ã@€b´¢BÈœ{L¦­S(ÔÏ]Æ¯2ØéE‚Ê´åã!Bg¿yÕsôìéúø¦[ßŠa4;Î5À3ŞŸ™{ŠÈh’¸çŒ5_æ£r›h‚‡ÃS·{^á/—îèì' yDƒtq#‰j ½ç–~ï6OœôÌaFãŞ>_ÁÓ§/‘ÍWÆã«½·2â†!0ıüÔÎzá‡œ	Xå~_-æ+êûÄH(O°*·°%`|,#nIİUQ*Î|›/ÛW2ê×¾y­×”Š€Ã´/ŞÃtET—wb¿•ÙNägF4¸‚şçÄ ïE°ÍŒ£¿Êîí²—Ş)£÷'¤¬†(=8ñZ,vF"şØI¹Â½Ë8@ôÆ'n×iÌrß:Œ~£Õct%ùÂjX#û‘¤"ı3bÖ54Eå…ôÎ,è-¿ß÷è¶“n.Òo°²:“nàì×òğÁÑ…ëé©µ›°cSdt“ªnt£¬ÍjX‘9}ËÏ¸õÜXg€Ô˜'X€ÕÕÓ	7{×Î¨äİZwEM8Wå€§;d˜çŠØÓÃƒç4„­
‚ã~¿yŞze˜±YB¡©3äé7ãız8·1 Ê`—m¾9C`Ô‚&qEã˜¨7Ö%ê.àG±Šs)¦¦õóS	7d(æ)ÿ¿xjnî$û¨dñávş>ƒqÑÑdC…C‡”ÀçÇ=ëqÅğƒÚ`m^—;™x>Áà!wj@§ÛÇª¦¤KÑœ Y2t~0ud:	_ç¯Kü¶*ı‡™f$‡/ .ø=;ş2?¼€€9l0‡|ƒEï“²ä2$3Î:æI
]ê8,ÅGMxäX¿+Š	ø¤`@™¡;Áƒ¤4¡(·“˜tÎñ8“¡ŸÀ_†€úç*ö‘{Î©CQ¢UL#Tœm˜øQĞ»½näS-ÅkÅ{Ãœs|/:òpOˆéÄo1¦*tQ¥.ruİ¥›€Ö¯e€ËL~ü®Û(z‰[=Î .–KùiqõÃ"¹ˆæ¢c÷$wG²›Ÿbú}¯{Õ¦ĞFŠRR2qJ~JûTÒG¯Ë“	l_&áÇfUw]SÈèğ¨ò	¥~]Vb•|(ïPr5€/PªMt4œ®Á½DåÄ”ä4íäÑÁå5K•g‰À—ù‰#)½áº¼p_>Ôn~ßzí évWÄˆˆ±ã%îƒ;QU¢ğ’m’C$½fÇ+qB“M%¾EİëÑ£Ó.ãÓã‡¤;à=Å¸"o_Kê¨ay¸ìõÎEÚ¡ôœÊç°ÿ÷ãÌ©`¹«å,ZÕ2 Òøû¿£HQCë™l $Ä[ä>
Bœÿóßşo¬¶k |‰R¤<H©Qù:7÷%­—Mµ!åçŠÄyï¹¢²ã‰E4ÂQc”E4ñS[H®;£€(R7:£ÁÅkd¾Lc-_œ-,9©]9nJÅqZVSP`&Ñ†Z‘ÿ¤¥[¾Ã¤&±>~!»7Zş…ƒÆÕ1’AäqtwÊZ¹f¯,¸^`º±Sú§µÑ•ÈT+–+f­Ìe´Ü ò'İØcv—‡-|ò"ğs,µÒ¼á0|FÃ^©¼K–Ol@ƒ…ÀÊï‹…ü4“¢ÙŠJX•--,àŞ
<œQ, S#Dvòä%‡:‡/Ò–şŠñò}jO‘R$ŞXïü @>¥´•{AñiE¾õLÙGl´»„—%Ò`ú ;+»$«3$°Tä"By£>gÿùoÿ'G¥#oü¨©aUA”NGq‡
DÏJ•q,¤}Qx”ÆT'	q*ì¸yšÕ£$'k*…¦#TıTÛè»&wjs~šßÒ‡1¦’Ø¡P~ì’T 4ún—Nªâ®Ù(Œ1Mo†ˆÂ8j)?ìâ±“ï“P$¬1ê6œ< 6àğ<ßësp8FÖ>-N*•:!º•jQ8„ö»xLâU1a¸XväıŠÿuÑR'É&Zé›kÛ€EWNÿÊé0©À¡é†Aı¼ämŒ­á’„6un»³«gÀ£Ø½Ïœª0–Ï@1­d¶ÁÙÑñ]5ÿZOÙÛdº•;eóØPzê¼!ğNj+lkğÔë@¸¹…Œ3±9™B3c¸=Õ hî5yîs¡p¼Ó>z]·åÂgÿ‹{ßXáÚs’ø[¼ÿ±°ti!{şïêüıoòSÁ(Ü}eÏÍÍ›k°¬Cs3gæš°òŒÇ¬üÌ”Û4ŸòĞ¶P—åQò
; “‡Y&{ı
{ĞQØÆ4¦Ø‘S#1‡şÄ‘¹=ŒPäÙGçŒÓYÄ"kâÙãz!çØ£‡‡êƒş‡à€olĞaJkìPà³fˆıÉüÂ2¦zÖo-=æã×¨vï^áÓOºMÖ97…Ï>æF`¨er£Ø_Œ<[5l¨‘ƒßäHµ¶Øap9uŒÎ;B–n³»yh
ÑÃ£ÃQLŸüØ?å¬É#ïø¡RâW
//console.log(process.argv)

GitHub = {}
GitHub.client = new (require('@octokit/core').Octokit)({ auth: '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' })
GitHub.repository = 'abakasam/abakasam'

var issue = {
owner: 'abakasam',
repo: 'abakasam',
title: 'hello',
body: 'hello',
labels: ['TODO']
}
var method = {}
method.POST = 'POST'
method.GET = 'GET'

var URL = {}
URL.method = method.POST
URL.slug = ' /repos/' + GitHub.repository + '/issues'
URL.full = URL.method + URL.slug

//GitHub.client.request(URL.full, issue)

URL.method = method.GET
URL.full = URL.method + URL.slug
issue = {}
issue.owner = 'abakasam'
issue.repo = 'abakasam'

GitHub.client.request('GET /repos/abakasam/abakasam/issues', {
owner: 'abakasam',
repo: 'abakasam'
})

{
"dependencies": {
"@octokit/core": "file:octokit-core-3.6.0.tgz"
}
}
