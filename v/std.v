[let reverse [unit cons reverse $me &parent &. true] map pop].

[abs unit [java.lang.Math abs] concat java].
[acos unit [java.lang.Math acos] concat java].
[sqrt >string unit [java.lang.Double new] concat java unit [java.lang.Math sqrt] concat java].
[pred 1 -].
[succ 1 +].

[dup [a : a a] view].
[dupd [dup] dip].
[pop [a :] view].
[popd [pop] dip].
[swap [a b : b a] view].
[swapd [swap] dip].
[lroll [[a *rest] : [*rest a]] view].
[rroll [[*rest a] : [a *rest]] view].


[cons [a [*rest] : [a *rest]] view].
[unit [] cons].
[concat [[*a] [*b] : [*a *b]] view].
[dip [a b : [b i a]] view i].
[x dup i].
[id [a : a] view].

[uncons [[a *rest] : a [*rest]] view].
[first [[a *rest] : a] view].
[rest [[a *rest] : [*rest]] view].

[zero? dup >decimal 0.0 =].
[empty? dup size zero? swap pop].
[null? number? [zero?] [empty?] ifte].
[small? [list?] [dup size swap pop zero? swap 1 = or] [zero? swap 1 = or] ifte].

[leaf? list? not].

[max [a b : [[a b >] [a] [b] ifte]] view i].
[min [a b : [[a b <] [a] [b] ifte]] view i].


[all map true [and] fold].
[all& map& true [and] fold].
[some map false [or] fold].
[some& map& false [or] fold].


[xor [a b : a b a b] view or [and not] dip and].


