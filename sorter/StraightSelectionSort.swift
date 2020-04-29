//単純選択ソート
// 一番小さいものを全検索して最初に持ってくる
open class StraightSelectionSort : BaseSorter {
    public override func executeSort(){
        for ii in 0 ... (dataArray.count-2) { 
            var min = dataArray[ii]
            var swapIndex = ii
            for jj in (ii+1) ... (dataArray.count-1) {
                if compare(dataArray[jj], min) {
                    min = dataArray[jj]
                    swapIndex = jj
                }
            }
            swapDump(ii, swapIndex)
        }
    }
}