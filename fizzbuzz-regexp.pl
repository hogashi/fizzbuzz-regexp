use strict;
use warnings;
use utf8;

my $from = $ARGV[0];
my $to = $ARGV[1];

die 'from required' unless $from;
die 'to required' unless $to;

for my $i ($from .. $to) {
    # どの順で適用しても大丈夫なようにそれぞれ独立に書いている
    # TODO: まだおかしい場合がある

    # 3の倍数 かつ 5の倍数ではない
    # - 最後が0と5以外で,桁の合計が3の倍数
    $i =~ s/^
        (
            [0369]
            |
            [147][0369]*[258]
            |
            [258][0369]*[147]
            |
            ([147][0369]*){2}[147]
            |
            ([258][0369]*){2}[258]
            |
            ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[258])
        )*
        (
            [369]
            |
            [147][0369]*[28]
            |
            [258][0369]*[147]
            |
            ([147][0369]*){2}[147]
            |
            ([258][0369]*){2}[28]
            |
            ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[28])
        )
        $/Fizz/x;
    # 3の倍数ではない かつ 5の倍数
    # - 最後が5のとき
    #   - まず「桁を全部足すと3の倍数」な桁セットがあるか, 何もない
    #   - その次に「桁を全部足してから3で割った余りが2」な桁セットがあるか, 何もない
    #     - つまり「桁を全部足してから3で割った余りが1」な桁セットがない
    #   - その次に「桁を全部足すと3の倍数」な桁セットがあるか, 何もない
    #   - 最後は5
    # - 最後が0のとき
    #   - まず「桁を全部足すと3の倍数」な桁セットがあるか, 何もない
    #   - その次に「桁を全部足してから3で割った余りが1」か「桁を全部足してから3で割った余りが2」な桁セットがある
    #   - その次に「桁を全部足すと3の倍数」な桁セットがあるか, 何もない
    #   - 最後は0
    $i =~ s/^
        (
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                ([147][0369]*){2}[147]
                |
                ([258][0369]*){2}[258]
                |
                ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[258])
            )*
            (
                [258]
                |
                [147][0369]*[147]
            )?
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                ([147][0369]*){2}[147]
                |
                ([258][0369]*){2}[258]
                |
                ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[258])
            )*
            5
            |
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                ([147][0369]*){2}[147]
                |
                ([258][0369]*){2}[258]
                |
                ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[258])
            )*
            (
                [147]
                |
                [258]
                |
                [147][0369]*[147]
                |
                [258][0369]*[258]
            )
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                ([147][0369]*){2}[147]
                |
                ([258][0369]*){2}[258]
                |
                ([147][0369]*[147]|[258])([0369]*[258][0369]*[147])*[0369]*([147]|[258][0369]*[258])
            )*
            0
        )
        $/Buzz/x;
    # 3の倍数 かつ 5の倍数
    # - 最後が0のとき
    #   - それまでの桁を全部足すと3の倍数
    # - 最後が5のとき
    #   - 頭にいくらでも3の倍数があってよい
    #   - その次に「桁を全部足してから3で割った余りが1」な桁セットがある
    #   - その次に「桁を全部足すと3の倍数」な桁セットがある
    #   - 最後は5
    $i =~ s/^
        (
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                [147][0369]*[147]{2}
                |
                [147]{2}[0369]*[147]
                |
                [258][0369]*[258]{2}
                |
                [147]{3}
                |
                [258]{3}
            )*
            0
            |
            [0369]*
            (
                [147]
                |
                [258][0369]*[258]
            )
            (
                [0369]
                |
                [147][0369]*[258]
                |
                [258][0369]*[147]
                |
                [147][0369]*[147]{2}
                |
                [147]{2}[0369]*[147]
                |
                [258][0369]*[258]{2}
                |
                [147]{3}
                |
                [258]{3}
            )*
            5
        )
        $/FizzBuzz/x;
    print $i . qq(\n);
}
