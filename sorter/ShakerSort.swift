//シェーカーソート
//双方向からバブルソートをしていくようなイメージ
open class ShakerSort : BaseSorter {
   public override func executeSort() {
        var head = 0
        var tail = dataArray.count - 1
        var temp = head
        while head < tail {
            for ii in head ... tail - 1 {
                if compare(dataArray[ii + 1], dataArray[ii]) {
                    swapDump(ii + 1, ii)
                    temp = ii
                }
            }
            tail = temp

            for ii in stride(from:tail, to:head, by:-1) {
                if compare(dataArray[ii], dataArray[ii - 1]) {
                    swapDump(ii, ii - 1)
                    temp = ii
                }
            }
            head = temp
        }
    }
}