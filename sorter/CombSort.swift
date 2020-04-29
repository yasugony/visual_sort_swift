//コームソート
//ギャップ値を設けて離れた要素を少しずつ入れ替えていく
open class CombSort : BaseSorter {
    public override func executeSort() {
        var gap = dataArray.count
        let f = 1.3 //伸縮率

        var isSwap = false 
        while isSwap || gap > 1 {
            isSwap = false 
            gap = Int(Double(gap)/f)

            if gap == 0 {
                gap = 1
            } else if gap == 9 || gap == 10 { //gap が 9 or 10の時は11として方が効率がよくなるらしい
                gap = 11
            }

            var ii = 0
            while ii + gap < dataArray.count {
                //ギャップの差がある分だけ比較していく
                if compare(dataArray[ii + gap], dataArray[ii]) {
                    swapDump(ii, ii + gap)
                    isSwap = true
                }
                ii += 1
            }
        }
    }
}