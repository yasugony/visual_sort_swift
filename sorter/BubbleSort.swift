//バブルソート
//最後の添字jから順に隣どうして比較してjの方が小さかったら交換する
//これを繰り返す
open class BubbleSort : BaseSorter {
    public override func executeSort() {
        for ii in 0 ... dataArray.count - 2 {
            for jj in stride(from:dataArray.count - 1,to:ii, by:-1) {
                if compare(dataArray[jj] , dataArray[jj-1]) {
                    swapDump(jj,jj - 1)
                }
            }
        }
    }
}